<?php

namespace App\Console\Commands;

use Illuminate\Support\Facades\Http;
use Illuminate\Console\Command;

class AcronymDAOnft extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'word';

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
        $response = Http::get('https://api.opencnft.io/1/policy/e2ed73b580344b69642683be7e807de1221462174c806d25164f72c4/floor_price')->json();

        $floor = $response['floor_price'] / 1000000;
        
        if ($floor > 200) {
            $phrase = 'AcronymDAOnft floor price is: ' . $floor;
        
            $cmd = sprintf(
                'osascript -e \'display notification "%s" with title "acronym Floor has moved up."\'',
                $phrase
            );
        
            shell_exec($cmd);
        }
            } 
    }

