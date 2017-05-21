<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\wawancara;
use App\pendaftar;
use DB;


class PengumumanController extends Controller
{
    public function index()
	{
	    return view('pengumuman.pengumuman');
	}

	public function cek(Request $request)
	{

		//return view('pengumuman.hasil');


		// $status = DB::table('wawancara w')
  //           ->join('pendaftar p', 'w.id_pendaftar', '=', 'p.id_pendaftar')
  //           ->select('w.status', 'p.nama', 'p.nim')
  //           ->where('p.nim', '=', '$request->nim')
  //           ->get();
		//$pend = new pendaftar();
		$nim = $request->nim;
		//$status = DB::select('SELECT p.nama, p.nim from pendaftar p, wawancara w WHERE w.status = 1 and p.id_pendaftar = w.id_pendaftar and p.nim ='.$nim)[0];
		$status = DB::select('SELECT w.status from pendaftar p, wawancara w WHERE p.id_pendaftar = w.id_pendaftar and p.nim ='.$nim)[0];

            //dd($status);


            //var_dump($status->status);

            if ($status->status == 0) {
            	//dd(9+70);
            	$this->data['detail'] = DB::select('SELECT p.nama, p.nim from pendaftar p, wawancara w WHERE p.id_pendaftar = w.id_pendaftar and p.					nim ='.$nim);
            	$this->data['selamat'] = 'SELAMAT, KAMU LOLOS SELEKSI BERKAS';
            	$this->data['lkmm'] = 'Latihan Keterampilan Manajemen Mahasiswa - Tingkat Lanjut (LKMM-TL)';
            	$this->data['tanggal'] = '17 April 2017';
            	//var_dump($this->data['nama']);

            	return view('pengumuman.hasilberkas', $this->data);
            }
            else
            {
            	//dd(6+4);

            	$this->data['detail'] = DB::select('SELECT p.nama, p.nim from pendaftar p, wawancara w WHERE p.id_pendaftar = w.id_pendaftar and p.					nim ='.$nim);
            	$this->data['selamat'] = 'SELAMAT, KAMU LOLOS SELEKSI WAWANCARA';
            	$this->data['lkmm'] = 'Latihan Keterampilan Manajemen Mahasiswa - Tingkat Lanjut (LKMM-TL)';
            	$this->data['tanggal'] = '23-27 April 2017';
            	return view('pengumuman.hasilwawancara', $this->data);
            }

            
        //return view('proses.diterima',['penguji' => $penguji, 'pendidikan' => $pendidikan, 'wawancara' => $wawancara, 'menilai' => $menilai, 'pendaftar' => $pendaftar]);
            
   	}
}
