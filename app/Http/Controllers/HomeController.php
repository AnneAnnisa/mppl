<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\pendaftar;
use App\pendidikan;
use App\wawancara;
use App\penguji;
use Session;
use DB;

class HomeController extends Controller
{
    public function index()
	{
		$pendaftar = DB::table('pendaftar')->count();
		$belumAA = DB::table('pendaftar')
            ->join('wawancara', 'pendaftar.id_pendaftar', '=', 'wawancara.id_pendaftar')
            ->count();
		// $belum = DB::select('select count(*) from pendaftar, wawancara where pendaftar.id_pendaftar = wawancara.id_pendaftar');
		// dd($belum);
		$waw=Wawancara::count();
		$wawancara=Wawancara::where('status', 0)->count();
		$diterima=Wawancara::where('status', 1)->count();

		$belum = $pendaftar-$belumAA;

	    return view('monitor', ['pendaftar' => $pendaftar, 'belum' => $belum, 'wawancara' => $wawancara, 'diterima' => $diterima]);
	}
    public function pendaftar()
	{
	    return view('manajemen.pendaftar');
	}
	public function loglog(Request $req)
	{
		// if($req->passs == $req->userr)
		// {
	        $email = $req->userr;
	        $user = Penguji::where('nim_penguji', $req->passs)->first();
	        // echo "1";
	        if($user->telp_penguji==$email)
	        {
	        	$datauser = array('nim_penguji' => $user['nim_penguji'], 'nama_penguji' => $user['nama_penguji'], 'status_penguji' => $user['status_penguji'] );
	        	session(['user' => $datauser]);
	        	return redirect('/home');
	        }
	        else{
	        	return redirect('/login');
	        }
		// }
	}
    public function logout(Request $req){
	    Session::flush();
	    return Redirect('/');
    }
}
