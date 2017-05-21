<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\pendidikan;
use DB;

class PendidikanController extends Controller
{
    public function pendidikan()
	{
		$pendidikan=Pendidikan::all()->sortBy('universitas');
	    return view('manajemen.pendidikan',['pendidikan' => $pendidikan]);
	}
    public function update(Request $request)
	{
	    Pendidikan::where('id_pendidikan', $request->pendid)
	      ->update(['universitas' => $request->univ, 'fakultas' => $request->fak, 'jurusan' => $request->jur, 'alamat_jurusan' => $request->alamat, 'telp_jurusan' => $request->telp]);

	    return redirect('/pendidikan')->with('status1', 'Berhasil Mengupdate Data');
	}
    public function delete(Request $request)
	{
        $user=Pendidikan::where('id_pendidikan','=', $request->pendidhap)->delete();
        return back()->with('status', 'Data Berhasil Terhapus!');
	}
    public function tambah(Request $request)
	{
        $pend = new Pendidikan;
        $id_pend=DB::selectOne("SELECT uuid() as AUTO_INCREMENT;");
        $pend->id_pendidikan=$id_pend->AUTO_INCREMENT;
        $pend->universitas = $request->univ;
        $pend->fakultas = $request->fak;
        $pend->jurusan = $request->jur;
        $pend->alamat_jurusan = $request->alamat;
        $pend->telp_jurusan = $request->telp;
        $pend->save();

        return redirect('/pendidikan')->with('status2', 'Berhasil Menambah Data');
	}

    public function tambahuniv(Request $request)
    {
        $pend = new Pendidikan;
        $id_pend=DB::selectOne("SELECT uuid() as AUTO_INCREMENT;");
        $pend->id_pendidikan=$id_pend->AUTO_INCREMENT;
        $pend->universitas = $request->univ;
        $pend->fakultas = $request->fak;
        $pend->jurusan = $request->jur;
        //$pend->alamat_jurusan = $request->alamat;
        //$pend->telp_jurusan = $request->telp;
        $pend->save();

        return redirect('/daftar')->with('status2', 'Berhasil Menambah Data');
    }
}
