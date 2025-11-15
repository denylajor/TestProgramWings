<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\transaksi;

class TransaksiApprovedMail extends Mailable
{
    use Queueable, SerializesModels;

    public $transaksi;

    public function __construct($transaksi)
    {
        $this->transaksi = $transaksi;
    }

    public function build()
    {
        // return $this->subject('Transaksi Disetujui')
        //     ->markdown('emails.transaksi.approved');
        return $this->from(config('mail.from.address'), config('mail.from.name'))
            ->subject('Transaksi Disetujui')
            ->markdown('emails.transaksi.approved');
    }
}
