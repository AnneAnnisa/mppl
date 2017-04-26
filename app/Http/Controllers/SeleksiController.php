<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\pendaftar;
use App\pendidikan;
use App\wawancara;
use DB;

class SeleksiController extends Controller
{
    public function seleksi()
	{
		$pendaftar=Pendaftar::all()->sortBy('nim');
		$pendidikan=Pendidikan::all();
		$wawancara=Wawancara::all();
	    return view('proses.seleksi',['pendaftar' => $pendaftar, 'pendidikan' => $pendidikan, 'wawancara' => $wawancara]);
	}
    public function delete(Request $request)
	{
        $user=Pendaftar::where('id_pendaftar','=', $request->pendidhap)->delete();
        return back()->with('status', 'Data Berhasil Terhapus!');
	}
	public function reset(Request $request)
	{
   		$wawan=Wawancara::where('id_wawancara','=',$request->pendidhap)->delete();
        return back();
	}
	public function lolos(Request $request)
	{
		$id = DB::table('Wawancara')->insertGetId(
		    ['id_pendaftar' => $request->idpend, 'status' => 0]
		);

	    Pendaftar::where('id_pendaftar', $request->idpend)
		  ->update(['id_wawancara' => $id]);

        return back();
   	}
	public function gagal(Request $request)
	{
		$id = DB::table('Wawancara')->insertGetId(
		    ['id_pendaftar' => $request->idpend, 'status' => 99]
		);

	    Pendaftar::where('id_pendaftar', $request->idpend)
		  ->update(['id_wawancara' => $id]);

        return back();
	}
}
