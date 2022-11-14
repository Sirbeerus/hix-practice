<?php

namespace App\Console\Commands;

use Illuminate\Support\Facades\Http;
use Illuminate\Console\Command;

class RatsDAOnft extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'rats';

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

    $response = Http::get('https://api.opencnft.io/1/policy/ca5fc915496a771109b98c4a2b76e32c21a8229f3332398cb8babcd7/floor_price')->json();

    $floor = $response['floor_price'] / 1000000;
    
    if ( $floor < 25 || $floor > 200 ) {
        $phrase = 'RatsDAOnft floor price is: ' . $floor;
    
        $cmd = sprintf(
            'osascript -e \'display notification "%s" with title "ratsNFT Floor has moved!"\'',
            $phrase
        );
    
        shell_exec($cmd);
    }

    }
}