<?php

namespace App\Http\Controllers;

use App\Jobs\NotifyTransaksiApproved;
use App\stock as AppStock;
use App\transaksi;
use App\vTransaksi;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class TransaksiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $retrieveData = $request->all();
            $data = [
                'id_barang' => $retrieveData['barang'],
                'id_jenis_transaksi' => $retrieveData['jenisTransaksi'],
                'no_transaksi' => $retrieveData['noTransaksi'],
                'tanggal_transaksi' => $retrieveData['tglTransaksi'],
                'jumlah_barang' => $retrieveData['jumlahBarang'],
                'harga_satuan' => $retrieveData['hargaSatuan'],
                'keterangan' => $retrieveData['keterangan'],
                'created_by' => $retrieveData['username'],
                'created_at' => now()
            ];

            transaksi::insert($data);
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Success Simpan Data . .',
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'responseCode' => 500,
                'responseMessage' => 'Gagal Simpan Data . .'
            ], 500);
        }
    }

    public function getTransaksi()
    {
        $transRes = vTransaksi::OrderBy('id', 'DESC')->get();
        return response()->json([
            'responseCode' => 200,
            'responseMessage' => 'Success Mendapatkan Data . .',
            'data' => $transRes
        ], 200);
    }

    public function approveTransaksi(Request $request, $id)
    {
        try {
            DB::beginTransaction();
            $getTrans = Transaksi::where(['id' => $id])->first();
            if (!$getTrans) {
                return response()->json([
                    'responseCode' => 404,
                    'responseMessage' => 'Transaksi tidak ditemukan'
                ], 404);
            }
            $getStock = AppStock::where('id_barang', $getTrans->id_barang)->first();
            $username = auth()->user()->username;

            if (!$getStock) {
                // STOCK KOSONG
                if ($getTrans->id_jenis_transaksi == 1) { // MASUK
                    $tambahStock = AppStock::create([
                        'id_barang' => $getTrans->id_barang,
                        'jumlah_stock' => $getTrans->jumlah_barang,
                        'harga_satuan' => $getTrans->harga_satuan,
                        'created_at' => now(),
                        'created_by' => $username
                    ]);
                } elseif ($getTrans->id_jenis_transaksi == 2) { // KELUAR
                    return response()->json([
                        'responseCode' => 400,
                        'responseMessage' => 'Stock Kosong!'
                    ], 400);
                }
            } else {
                //STOCK ADA
                if ($getTrans->id_jenis_transaksi == 1) { // MASUK
                    if ($getStock->jumlah_stock == 0) { //KALO QTY HABIS
                        $dataStock = [
                            'jumlah_stock' => $getStock->jumlah_stock + $getTrans->jumlah_barang,
                            'harga_satuan' => $getTrans->harga_satuan
                        ];

                        $getStock->update($dataStock);
                    } elseif ($getStock->harga_satuan != $getTrans->harga_satuan) { //KALO BEDA HARGA
                        $tambahStock = AppStock::create([
                            'id_barang' => $getTrans->id_barang,
                            'jumlah_stock' => $getTrans->jumlah_barang,
                            'harga_satuan' => $getTrans->harga_satuan,
                            'created_at' => now(),
                            'created_by' => $username
                        ]);
                    } else {
                        $dataStock = [
                            'jumlah_stock' => $getStock->jumlah_stock + $getTrans->jumlah_barang,
                            'harga_satuan' => $getTrans->harga_satuan
                        ];

                        $getStock->update($dataStock);
                    }
                } elseif ($getTrans->id_jenis_transaksi == 2) { // KELUAR
                    if ($getStock->jumlah_stock < $getTrans->jumlah_barang) {
                        return response()->json([
                            'responseCode' => 400,
                            'responseMessage' => 'Stock tidak cukup!'
                        ], 400);
                    } elseif ($getStock->harga_satuan != $getTrans->harga_satuan) {
                        return response()->json([
                            'responseCode' => 400,
                            'responseMessage' => 'Harga Barang Tersebut Tidak Ada !'
                        ], 400);
                    } else {
                        $dataStock = [
                            'jumlah_stock' => $getStock->jumlah_stock - $getTrans->jumlah_barang,
                            'harga_satuan' => $getTrans->harga_satuan
                        ];

                        $getStock->update($dataStock);
                    }
                }
            }

            $dataTrans = [
                'approval' => 1,
                'updated_by' => $username,
                'updated_at' => now()
            ];
            $getTrans->update($dataTrans);

            DB::commit();
            dispatch(new NotifyTransaksiApproved($getTrans));
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Success approve Transaksi',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json([
                'responseCode' => 500,
                'responseMessage' => 'Gagal Approve Transaksi . .' . $e->getMessage()
            ], 500);
        }
    }

    public function tolakTransaksi(Request $request, $id)
    {
        try {
            $tolak = transaksi::where(['id' => $id])->update(['approval' => 2, 'updated_by' => auth()->user()->username, 'updated_at' => now()]);
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Success Tolak Transaksi . .',
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'responseCode' => 500,
                'responseMessage' => 'Gagal Tolak Transaksi . .'
            ], 500);
        }
    }

    public function deleteTransaksi($id)
    {
        try {
            $delete = transaksi::where(['id' => $id])->delete();
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Success Delete Data . .',
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'responseCode' => 500,
                'responseMessage' => 'Gagal Delete Data . .'
            ], 500);
        }
    }

    public function barangMasuk()
    {
        $transRes = DB::select("SELECT SUM(jumlah_barang) as total FROM transaksi WHERE id_jenis_transaksi = 1");
        return response()->json([
            'responseCode' => 200,
            'responseMessage' => 'Success Mendapatkan Data . .',
            'data' => $transRes[0]->total
        ], 200);
    }


    public function barangKeluar()
    {
        $transRes = DB::select("SELECT SUM(jumlah_barang) as total FROM transaksi WHERE id_jenis_transaksi = 2");
        return response()->json([
            'responseCode' => 200,
            'responseMessage' => 'Success Mendapatkan Data . .',
            'data' => $transRes[0]->total
        ], 200);
    }

    public function blmApprove()
    {
        $transRes = DB::select("SELECT COUNT(*) as total FROM transaksi WHERE approval = 0");
        return response()->json([
            'responseCode' => 200,
            'responseMessage' => 'Success Mendapatkan Data . .',
            'data' => $transRes[0]->total
        ], 200);
    }
}
