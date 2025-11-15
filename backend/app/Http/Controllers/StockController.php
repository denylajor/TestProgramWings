<?php

namespace App\Http\Controllers;

use App\vStock;
use Illuminate\Http\Request;

class StockController extends Controller
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
    public function show()
    {
        $getStock = vStock::OrderBy('nama_barang', 'ASC')->get();
        return response()->json([
            'responseCode' => 200,
            'responseMessage' => 'Success Mendapatkan Data . .',
            'data' => $getStock
        ], 200);
    }
}
