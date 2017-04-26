<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
	{
	    return view('monitor');
	}
    public function pendaftar()
	{
	    return view('manajemen.pendaftar');
	}
}
