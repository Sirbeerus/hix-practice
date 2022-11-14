<?php

namespace App\Console\Commands;

use Illuminate\Support\Facades\Http;
use Illuminate\Console\Command;

class ClayNationOriginalNFT extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'clay';

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
        $response = Http::get('https://api.opencnft.io/1/policy/40fa2aa67258b4ce7b5782f74831d46a84c59a0ff0c28262fab21728/floor_price')->json();

        $floor = $response['floor_price'] / 1000000;
        
        if ($floor > 5000) {
            $phrase = 'ClayNationOriginalNFT floor price is: ' . $floor;
        
            $cmd = sprintf(
                'osascript -e \'display notification "%s" with title "ClayNation Floor has moved up!"\'',
                $phrase
            );
        
            shell_exec($cmd);
        }
    }
}
