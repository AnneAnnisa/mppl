<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\penguji;
use DB;

class PengujiController extends Controller
{
    public function penguji()
	{
		$penguji=Penguji::all()->sortBy('nama_penguji');
	    return view('manajemen.penguji',['penguji' => $penguji]);
	}
    public function tambah(Request $request)
	{
        $pend = new Penguji;
        // if(Penguji::where('nim_penguji','=', $request->nim))
        // {
	       //  return redirect('/penguji')->with('status', 'NIM Penguji Sudah Terdaftar');
        // }
        $pend->nim_penguji=$request->nimubah;
        $pend->nama_penguji = $request->nama;
        $pend->telp_penguji = $request->telp;
        $pend->status_penguji = $request->stat;
        $pend->save();
        return redirect('/penguji')->with('status2', 'Berhasil Menambah Data');
	}
    public function update(Request $request)
	{
	    Penguji::where('nim_penguji', $request->nim)
	      ->update(['nama_penguji' => $request->nama, 'nim_penguji' => $request->nimubah, 'telp_penguji' => $request->telp, 'status_penguji' => $request->stat]);

	    return redirect('/penguji')->with('status1', 'Berhasil Mengupdate Data');
	}
    public function delete(Request $request)
	{
        $user=Penguji::where('nim_penguji','=', $request->pendidhap)->delete();
        return back()->with('status', 'Data Berhasil Terhapus!');
	}
}
