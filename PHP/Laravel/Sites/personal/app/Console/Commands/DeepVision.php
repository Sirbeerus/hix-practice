<?php

namespace App\Console\Commands;

use Illuminate\Support\Facades\Http;
use Illuminate\Console\Command;

class DeepVision extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'vision';

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
        $response = Http::get('https://api.opencnft.io/1/policy/28a9ffc30a5f4e18315fc6c5d192c349efb5b259bccb40b703999de9/floor_price')->json();

$floor = $response['floor_price'] / 1000000;

if ($floor > 55) {
    $phrase = 'DeepVision floor price is: ' . $floor;

    $cmd = sprintf(
        'osascript -e \'display notification "%s" with title "Alert!"\'',
        $phrase
    );

    shell_exec($cmd);
}
    }
}    

