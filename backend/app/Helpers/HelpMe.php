<?php

namespace App\Helpers;

use App\transaksi;

class HelpMe
{
    public static function romawiBulan($bulan)
    {
        switch ($bulan) {
            case 1:
                return "I";
                break;
            case 2:
                return "II";
                break;
            case 3:
                return "III";
                break;
            case 4:
                return "IV";
                break;
            case 5:
                return "V";
                break;
            case 6:
                return "VI";
                break;
            case 7:
                return "VII";
                break;
            case 8:
                return "VIII";
                break;
            case 9:
                return "IX";
                break;
            case 10:
                return "X";
                break;
            case 11:
                return "XI";
                break;
            case 12:
                return "XII";
                break;

            default:
                return "Bulan tidak diketahui!";
                break;
        }
    }

    public static function noTransMasuk($id)
    {
        $getTrans = transaksi::where(['id_jenis_transaksi' => $id])->orderBy('id', 'DESC')->limit(1)->get();
        $countNoTrans = $getTrans->count();
        if ($countNoTrans <> 0) {
            $noTrans = intval(substr($getTrans[0]->no_transaksi, 5, 1)) + 1;
        } else {
            $noTrans = 1;
        }
        $kodemax = str_pad($noTrans, 6, "0", STR_PAD_LEFT);
        $fixnoTrans = $kodemax . "/BARANGMASUK/WINGS/" . HelpMe::romawiBulan(date('n')) . '/' . date('Y');

        return $fixnoTrans;
    }

    public static function noTransKeluar($id)
    {
        $getTrans = transaksi::where(['id_jenis_transaksi' => $id])->orderBy('id', 'DESC')->limit(1)->get();
        $countNoTrans = $getTrans->count();
        if ($countNoTrans <> 0) {
            $noTrans = intval(substr($getTrans[0]->no_transaksi, 5, 1)) + 1;
        } else {
            $noTrans = 1;
        }
        $kodemax = str_pad($noTrans, 6, "0", STR_PAD_LEFT);
        $fixnoTrans = $kodemax . "/BARANGKELUAR/WINGS/" . HelpMe::romawiBulan(date('n')) . '/' . date('Y');

        return $fixnoTrans;
    }
}
