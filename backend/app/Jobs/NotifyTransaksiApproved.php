<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use App\Mail\TransaksiApprovedMail;
use App\transaksi;
use App\vTransaksi;
use Illuminate\Support\Facades\Log;

class NotifyTransaksiApproved implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $transaksi;

    public function __construct(transaksi $transaksi)
    {
        $this->transaksi = $transaksi;
    }

    public function handle()
    {
        $transaksi = vTransaksi::find($this->transaksi->id);
        try {
            // $telegramToken = env('TELEGRAM_BOT_TOKEN');
            // $chatId = env('TELEGRAM_CHAT_ID');
            $telegramToken = config('services.telegram.bot_token');
            $chatId = config('services.telegram.chat_id');
            $totalHarga = $transaksi->jumlah_barang * $transaksi->harga_satuan;
            $message = "No Transaksi {$transaksi->no_transaksi} Berhasil di-Approve.\nBarang: {$transaksi->nama_barang}\nJumlah: {$transaksi->jumlah_barang}\nTotal Harga: {$totalHarga}";

            $client = new \GuzzleHttp\Client();
            $client->post("https://api.telegram.org/bot{$telegramToken}/sendMessage", [
                'form_params' => [
                    'chat_id' => $chatId,
                    'text' => $message,
                ]
            ]);
        } catch (\Exception $e) {
            Log::error("chat id : " . $chatId);
        }

        try {
            // $userEmail = $this->transaksi->user->email ?? 'default@email.com';
            $userEmail = 'denylazor11@gmail.com';
            Mail::to($userEmail)->send(new TransaksiApprovedMail($transaksi));
        } catch (\Exception $e) {
            Log::error("Gagal kirim email: " . $e->getMessage());
        }
    }
}
