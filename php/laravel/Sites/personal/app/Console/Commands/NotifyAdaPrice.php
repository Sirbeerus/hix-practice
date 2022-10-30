<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Http;

class NotifyAdaPrice extends Command
{
    protected $signature = 'ada';

    protected $description = 'Current price of ADA';
    
    public function handle()
    {
        $prices = Http::get('https://pool.pm/total.json')->json();

        if ($prices['ADAUSD'] < 0.25 || $prices['ADAUSD'] > 0.75) {
            $title = 'Cardano Price Alert';
            $phrase = 'Cardano Price is: ' . $prices['ADAUSD'];

            $cmd = sprintf(
                'osascript -e \'display notification "%s" with title "ADA Price Movement"\'',
                $phrase,
                $title
            );

            shell_exec($cmd);
        }
    }
}
