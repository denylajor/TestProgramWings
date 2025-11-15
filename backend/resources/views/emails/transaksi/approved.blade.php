@component('mail::message')
    # Transaksi Disetujui ✅

    Halo {{ $transaksi->user->name ?? 'User' }},

    Transaksi Anda telah **disetujui** dengan rincian berikut:

    **No Transaksi:** {{ $transaksi->no_transaksi }}
    **Barang:** {{ $transaksi->nama_barang }}
    **Jumlah:** {{ $transaksi->jumlah_barang }}
    **Harga Satuan:** Rp {{ number_format($transaksi->harga_satuan, 0, ',', '.') }}
    **Total Harga:** Rp {{ number_format($transaksi->jumlah_barang * $transaksi->harga_satuan, 0, ',', '.') }}

    {{-- @component('mail::button', ['url' => url('/transaksi/' . $transaksi->id)])
        Lihat Detail Transaksi
    @endcomponent --}}

    Terima kasih telah menggunakan layanan kami.<br>
    {{ config('mail.from.name') }}
@endcomponent
