<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class VStock extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        DB::statement("DROP VIEW v_stock");
        DB::statement("CREATE VIEW `wings`.`v_stock` AS SELECT
                        a.id_stock,
                        a.id_barang,
                        b.nama_barang,
                        a.jumlah_stock,
                        a.harga_satuan,
                        a.created_at,
                        a.created_by,
                        a.updated_at,
                        a.updated_by
                        FROM
                        stock AS a
                        INNER JOIN master_barang as b ON a.id_barang = b.id_barang 
                    ");
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        DB::statement("DROP VIEW IF EXISTS `inv`.`v_stock`");
    }
}
