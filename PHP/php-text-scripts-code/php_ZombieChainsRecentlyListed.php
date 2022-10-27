<?php

namespace App\Console\Commands;

use App\JpgStore;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Storage;

class RecentlyListedZombiesCommand extends Command
{
    protected $signature = 'jpg:zombies';

    protected $description = 'Watch for recently listed zombies';

    protected int $ttl = 3; // minutes

    protected int $maxPrice = 100; // ada

    protected int $maxRank = 3000;

    public function handle()
    {
        $this->listings('Zombie Hunter', '320bb921e517c8111e309b2822633da6c9af346ca4e18b79a94864b3');
        $this->listings('Zombie Chains', '96580bbc4fe27ac0d127db3f8a0dc698c58d303d8cae870f5771f336');
    }

    public function listings($project_name, $policy_id = null)
    {
        $phrase = [];

        $newTokens = $this->jpg_store($policy_id);
        if ($newTokens->isNotEmpty()) {
            $phrase[] = $newTokens->implode(PHP_EOL);
        }

        //$newTokens = $this->cnft_tools($policy_id);
        //if ($newTokens->isNotEmpty()) {
        //    $phrase[] = $newTokens->implode(PHP_EOL);
        //}

        if ($phrase) {
            notice(implode(PHP_EOL, $phrase), $project_name);
        }
    }

    public function jpg_store($policy_id)
    {
        $listings = Cache::remember('jpgstore.listings.'.$policy_id, 90, function () use (
            $policy_id
        ) {
            $listings = JpgStore::listings($policy_id);
            if ($listings) {
                Storage::put('jpgstore/'.$policy_id.'.listings.json', json_encode($listings));
            }

            return $listings;
        });

        $ranks = ranks($policy_id);

        return collect($listings)
            ->transform(function ($token) use ($ranks) {
                $token['listed_at'] = carbon($token['listed_at'])->toDateTimeString();
                $token['rank']      = $ranks->search($token['display_name']);
                $token['price_ada'] = $token['price_lovelace'] / 1000000;

                return $token;
            })
            ->filter(function ($token) {
                return carbon($token['listed_at'])->lt(now());
            })
            ->filter(function ($token) {
                return carbon($token['listed_at'])->gt(now()->subMinutes($this->ttl));
            })
            ->filter(function ($token) {
                return $token['price_ada'] < $this->maxPrice;
            })
            ->filter(function ($token) {
                return $token['rank'] < $this->maxRank;
            })
            ->sortBy('rank')
            ->transform(function ($token) {
                return sprintf(
                    '%s::$%d::R%d',
                    preg_replace('/\D+/', '', $token['display_name']),
                    $token['price_ada'],
                    $token['rank'],
                );
            });
    }

    public function cnft_tools($policy_id)
    {
        //Cache::forget();
        $listings = Cache::remember('cnft.tools.'.$policy_id, 90, function () use ($policy_id) {
            $listings = Http::get('https://cnft.tools/api/external/'.$policy_id)->json();
            if ($listings) {
                Storage::put('cnfttools/'.$policy_id.'.json', json_encode($listings));
            }

            return $listings;
        });

        $ranks = ranks($policy_id);

        return collect($listings)
            ->filter(function ($token) {
                return $token['listingDate'] !== 'x';
            })
            ->filter(function ($token) {
                return $token['price'] !== 'x';
            })
            ->filter(function ($token) {
                return carbon()->createFromTimestamp($token['listingDate'] / 1000)->gt(now()->subMinutes($this->ttl));
            })
            ->transform(function ($token) use ($ranks) {
                $token['rank']      = $ranks->search($token['name']);
                $token['price_ada'] = $token['price'] / 1000000;

                return $token;
            })
            ->filter(function ($token) {
                return $token['price_ada'] < $this->maxPrice;
            })
            ->filter(function ($token) {
                return $token['rank'] < $this->maxRank;
            })
            ->transform(function ($token) use ($ranks) {
                return sprintf(
                    '%s::$%d::R%d::RR%d',
                    preg_replace('/\D+/', '', $token['assetName']),
                    $token['price_ada'],
                    $token['rank'],
                    $token['rarityRank'],
                );
            });
    }
}
