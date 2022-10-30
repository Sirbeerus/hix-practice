<?php
namespace App\Console\Commands;

use Illuminate\Support\Facades\Http;
use Illuminate\Console\Command;

class ViralNFT extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'garywisdom';

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
	$response = Http::get('https://api.opencnft.io/1/policy/a51b52822dc9fec24c00a110d3ef509b799b06436872714ca4d4a942/floor_price')->json();

$floor = $response['floor_price'] / 1000000;

if ($floor > 15) {
    $phrase = 'ViralNFT floor price is: ' . $floor;

    $cmd = sprintf(
        'osascript -e \'display notification "%s" with title "Floor has moved up."\'',
        $phrase
    );

    shell_exec($cmd);
}
    }
}
