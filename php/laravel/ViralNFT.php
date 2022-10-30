<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;

class ViralNFT extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'notify:viral';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'ViralNFT floor price notifier';

    protected static string $apiviral1 = 'https://api.opencnft.io/1/policy/a51b52822dc9fec24c00a110d3ef509b799b06436872714ca4d4a942/floor_price';
    protected static string $apiviral2 = 'https://api.opencnft.io/1/policy/f8bf038a43c3bb42e1c327c347a8ca47351353cf7a00459f86c0b302/floor_price';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $floor = Http::get(self::$apiviral1)->json();
        $price = $floor['price'] / 1000000;
        if ($price < 7) {
            $this->notice('ViralNFT price is '.$price);
        }

        $floor = Http::get(self::$apiviral2)->json();
        $price = $floor['price'] / 1000000;
        if ($price < 7) {
            $this->notice('SuperVirus price is '.$price);
        }

        return 0;
    }

    protected function notice($message)
    {
        $cmd = sprintf('osascript -e \'display notification "%s" with title "Viral Alert!"\'', $message);
        shell_exec($cmd);
    }
}
