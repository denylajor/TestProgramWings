<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class Transaksi extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transaksi', function (Blueprint $table) {
            $table->id();
            $table->foreignId('id_barang')->constrained('master_barang', 'id_barang')->onUpdate('cascade')->onDelete('cascade');
            $table->foreignId('id_jenis_transaksi')->constrained('jenis_transaksi', 'id_jenis_transaksi')->onUpdate('cascade')->onDelete('cascade');
            $table->string('no_transaksi')->nullable();
            $table->date('tanggal_transaksi')->nullable();
            $table->integer('jumlah_barang')->default(0);
            $table->decimal('harga_satuan', 20, 2);
            $table->integer('approval')->default(0);
            $table->string('keterangan')->nullable();
            $table->timestamps();
            $table->string('created_by')->nullable();
            $table->string('updated_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transaksi');
    }
}
