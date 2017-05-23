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
		// dd($penguji);	
	    return view('proses.wawancara',['penguji' => $penguji, 'pendidikan' => $pendidikan, 'wawancara' => $wawancara, 'menilai' => $menilai, 'pendaftar' => $pendaftar]);
	}
	public function comment(Request $request)
	{
		$id = DB::table('Menilai')->insertGetId(
		    ['id_wawancara' => $request->wawan, 'nim_penguji' => $request->pewawancara, 'comment' => $request->comment, 'nilai' => $request->nilai]
		);

		$price = Menilai::where('id_wawancara', $request->wawan)->avg('nilai');

	    Wawancara::where('id_wawancara', $request->wawan)
		  ->update(['nilai_wawancara' => $price]);

		return back();
	}
	public function tanggal(Request $request)
	{
		$tang = $request->tanggal;
		$bul = $request->bulan;
		$tah = $request->tahun;
		$jam = $request->jam;
		$men = $request->menit;
		$arr1 = array($jam,$men);
		$tot1 = join(":",$arr1);
		$arr = array($tah,$tot1);
		$tot = join(" Pukul ",$arr);
		$arr2 = array($tang,$bul,$tot);
		$tot2 = join(" ",$arr2);
		// dd($tot2);
		$masuk = Wawancara::where('id_wawancara', $request->idi)
			->update(['waktu_wawancara' => $tot2]);
		// dd($masuk);

		return back();
	}
	public function diterima(Request $request)
	{
	    Wawancara::where('id_wawancara', $request->idpend)
		  ->update(['status' => 1]);

        return back();
	}
	public function reset(Request $request)
	{
	    Wawancara::where('id_wawancara', $request->pendidhap)
		  ->update(['status' => 0]);
		Menilai::where('id_wawancara', $request->pendidhap)->delete();
	    Wawancara::where('id_wawancara', $request->pendidhap)
		  ->update(['nilai_wawancara' => 0]);

        return back();
	}
	public function penerima(Request $request)
	{
		$wawancara=Wawancara::where('status','=',1)->get();
		// $pendaftar=Pendaftar::whereNotNull('id_wawancara')->get();
		$pendaftar=Pendaftar::all();
		$pendidikan=Pendidikan::all();
		$menilai=Menilai::all();
		$penguji=Penguji::all();
	    return view('proses.diterima',['penguji' => $penguji, 'pendidikan' => $pendidikan, 'wawancara' => $wawancara, 'menilai' => $menilai, 'pendaftar' => $pendaftar]);
	}
}
