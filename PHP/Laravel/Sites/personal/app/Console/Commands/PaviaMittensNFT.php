<?php

namespace App\Console\Commands;

use Illuminate\Support\Facades\Http;
use Illuminate\Console\Command;

class PaviaMittensNFT extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'yeet';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $response = Http::get('https://api.opencnft.io/1/policy/ad6290066292cfeef7376cd575e5d8367833ab3d8b2ac53d26ae4ecc/floor_price')->json();

        $floor = $response['floor_price'] / 1000000;
        
        if ($floor > 200) {
            $phrase = 'ZombitNFT floor price is: ' . $floor;
        
            $cmd = sprintf(
                'osascript -e \'display notification "%s" with title "Zombit Floor has moved up!"\'',
                $phrase
            );
        
            shell_exec($cmd);
        }
    }
}
