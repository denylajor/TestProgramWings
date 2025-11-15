<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\JenisTransaksiController;
use App\Http\Controllers\MasterBarangController;
use App\Http\Controllers\StockController;
use App\Http\Controllers\TransaksiController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);

    Route::middleware('role:Admin|User')->group(function () {
        Route::get('getTransaksi', [TransaksiController::class, 'getTransaksi']);
        Route::get('getStock', [StockController::class, 'show']);
    });

    Route::middleware('role:Admin')->group(function () {
        Route::patch('approveTransaksi/{id}', [TransaksiController::class, 'approveTransaksi']);
        
    });

    Route::middleware('role:User')->group(function () {
        Route::get('jenisTransaksi', [JenisTransaksiController::class, 'show']);
        Route::get('jenisTransaksi/noTransaksi/{id}', [JenisTransaksiController::class, 'noTransaksi']);
        Route::get('masterBarang', [MasterBarangController::class, 'show']);
        Route::post('simpanPengajuan', [TransaksiController::class, 'store']);
        // Route::get('getTransaksi', [TransaksiController::class, 'getTransaksi']);
        Route::delete('deleteTransaksi/{id}', [TransaksiController::class, 'deleteTransaksi']);
    });
});
