<?php

namespace App\Http\Controllers;

use App\Helpers\HelpMe;
use App\JenisTransaksi;
use Illuminate\Http\Request;

class JenisTransaksiController extends Controller
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

    public function noTransaksi($id)
    {
        try {
            $noTrans = $id == 1 ?  HelpMe::noTransMasuk($id) : HelpMe::noTransKeluar($id);
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Success Mendapatkan Data . .',
                'data' => $noTrans,
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'responseCode' => "500",
                'responseMessage' => 'Gagal Mendapatkan Data . .',
            ], 500);
        }
    }

    public function show()
    {
        try {
            $getTransaksi = JenisTransaksi::all();
            return response()->json([
                'responseCode' => 200,
                'responseMessage' => 'Success Mendapatkan Data . .',
                'data' => $getTransaksi,
            ], 200);
        } catch (\Exception $e) {
            return response()->json([
                'responseCode' => "500",
                'responseMessage' => 'Gagal Mendapatkan Data . .',
            ], 500);
        }
    }
}
