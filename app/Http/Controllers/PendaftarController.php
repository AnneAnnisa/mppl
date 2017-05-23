<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\pendaftar;
use App\pendidikan;
use App\wawancara;
use DB;

class PendaftarController extends Controller
{
    public function pendaftar()
	{
		$penguji=Pendaftar::all()->sortBy('nim');
		$pendidikan=Pendidikan::all();
		$wawancara=Wawancara::all();
	    return view('manajemen.pendaftar',['penguji' => $penguji, 'pendidikan' => $pendidikan, 'wawancara' => $wawancara]);
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

	public function daftarpeserta($value='')
	{
		$pendidikan=Pendidikan::all();
		//$wawancara=Wawancara::all();
	    //return view('manajemen.pendaftar',['penguji' => $penguji, 'pendidikan' => $pendidikan, 'wawancara' => $wawancara]);
	
		return view('peserta.daftar', ['pendidikan' => $pendidikan,]);
	}
	

	public function tambah(Request $request)
	{
        $peserta = new Pendaftar;
        //$id_peserta=DB::selectOne("SELECT uuid() as AUTO_INCREMENT;");
        //$peserta->id_pendaftar=$id_peserta->AUTO_INCREMENT;
        $peserta->nim = $request->nim;
        $peserta->nama = $request->nama;
        $peserta->email = $request->email;
        $peserta->id_pendidikan = $request->kampus;
        $peserta->alamat = $request->alamat;
        $peserta->telp = $request->telepon;
        $peserta->alasan = $request->motivasi;

        $cv = $request->file('cv');
        $filenamecv = $cv->getClientOriginalName();
        $request->file('cv')->move("cv/", $filenamecv);

        $image = $request->file('foto');
        $filenamefoto = $image->getClientOriginalName();
        $request->file('foto')->move("image/", $filenamefoto);

        $peserta->path_foto = $filenamefoto;
        $peserta->path_cv = $filenamecv;
        $peserta->save();

        return redirect('/daftar');
	}

	public function tambahuniv($value='')
	{
		//$pendidikan=Pendidikan::all();
		//$wawancara=Wawancara::all();
	    //return view('manajemen.pendaftar',['penguji' => $penguji, 'pendidikan' => $pendidikan, 'wawancara' => $wawancara]);
	
		return view('pendidikan.tambah');
	}
}
