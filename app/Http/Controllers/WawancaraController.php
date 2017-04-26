<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\pendaftar;
use App\pendidikan;
use App\wawancara;
use App\penguji;
use App\menilai;
use DB;

class WawancaraController extends Controller
{
    public function wawancara()
	{
		$wawancara=Wawancara::all()->sortBy('nilai_wawancara');
		// $pendaftar=Pendaftar::whereNotNull('id_wawancara')->get();
		$pendaftar=Pendaftar::all();
		$pendidikan=Pendidikan::all();
		$menilai=Menilai::all();
		$penguji=Penguji::all();
	    return view('proses.wawancara',['penguji' => $penguji, 'pendidikan' => $pendidikan, 'wawancara' => $wawancara, 'menilai' => $menilai, 'pendaftar' => $pendaftar]);
	}
	public function comment(Request $request)
	{
		$id = DB::table('Menilai')->insertGetId(
		    ['id_wawancara' => $request->wawan, 'nim_penguji' => 1, 'comment' => $request->comment, 'nilai' => $request->nilai]
		);

		$price = DB::table('Menilai')->avg('nilai');

	    Wawancara::where('id_wawancara', $request->wawan)
		  ->update(['nilai_wawancara' => $price]);

		return back();
	}
	public function diterima(Request $request)
	{
		// BELUM
	}
}
