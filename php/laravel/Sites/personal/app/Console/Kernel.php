<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)

    {   $schedule->command    (NotifyAdaPrice::class)         ->everyThirtyMinutes();

        $schedule->command(ViralNFT::class)->everyThirtyMinutes();

        $schedule->command(RatsDAOnft::class)
        ->everyThirtyMinutes();

        $schedule->command(WorldsWithinNFT::class)->everyThirtyMinutes();

        $schedule->command(ZombieChainsNFT::class)->everyThirtyMinutes();

        $schedule->command(VeggiematesNFT::class)->everyThirtyMinutes();

        $schedule->command(PaviaNFT::class)->everyThirtyMinutes();

        $schedule->command(DeepVision::class)->everyThirtyMinutes();

        $schedule->command(AcronymDAOnft::class)->everyThirtyMinutes();

        $schedule->command(PaviaMittensNFT::class)->everyThirtyMinutes();


        $schedule->command(ClayNationOriginalNFT::class)->everyThirtyMinutes();

 // $schedule->command('inspire')->hourly();
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
