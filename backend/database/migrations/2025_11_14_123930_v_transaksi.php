<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class VTransaksi extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("DROP VIEW v_transaksi");
        DB::statement("CREATE VIEW `wings`.`v_transaksi` AS SELECT
                        a.id,
                        c.jenis_transaksi,
                        a.no_transaksi,
                        a.tanggal_transaksi,
                        a.jumlah_barang,
                        a.harga_satuan,
                        a.approval,
                        a.keterangan,
                        a.created_at,
                        a.created_by,
                        a.updated_at,
                        a.updated_by
                        FROM
                        transaksi AS a
                        INNER JOIN master_barang as b ON a.id_barang = b.id_barang
                        INNER JOIN jenis_transaksi as c ON a.id_jenis_transaksi = c.id_jenis_transaksi 
                    ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement("DROP VIEW IF EXISTS `inv`.`v_transaksi`");
    }
}
