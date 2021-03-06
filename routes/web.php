<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('landingpage');
});

Route::get('login', function () {
    return view('login2');
});

// Route::get('daftar', function () {
//     return view('peserta.daftar');
// });

Route::get('daftar', 'PendaftarController@daftarpeserta');
Route::post('pendaftaran/tambah', 'PendaftarController@tambah');

Route::get('tambahuniv', 'PendaftarController@tambahuniv');
Route::post('tambahuniv/tambah', 'PendidikanController@tambahuniv');

Route::get('lihatpengumuman', 'PengumumanController@index');
Route::post('lihatpengumuman/cek', 'PengumumanController@cek');



// MENU MANAJEMEN
Route::get('home', 'HomeController@index');
Route::post('loginBack', 'HomeController@loglog');
Route::get('logout', 'HomeController@logout');
Route::get('landing', 'LandingController@index');

Route::get('pendidikan', 'PendidikanController@pendidikan');
Route::post('pendidikan/update', 'PendidikanController@update');
Route::post('pendidikan/hapus', 'PendidikanController@delete');
Route::post('pendidikan/tambah', 'PendidikanController@tambah');

Route::get('penguji', 'PengujiController@penguji');
Route::post('penguji/update', 'PengujiController@update');
Route::post('penguji/hapus', 'PengujiController@delete');
Route::post('penguji/tambah', 'PengujiController@tambah');

Route::get('pendaftar', 'PendaftarController@pendaftar');
Route::post('pendaftar/hapus', 'PendaftarController@delete');

Route::get('seleksi', 'SeleksiController@seleksi');
Route::post('seleksi/hapus', 'SeleksiController@delete');
Route::post('seleksi/reset', 'SeleksiController@reset');
Route::post('seleksi/lolos', 'SeleksiController@lolos');
Route::post('seleksi/gagal', 'SeleksiController@gagal');

Route::get('wawancara', 'WawancaraController@wawancara');
Route::post('wawancara/reset', 'WawancaraController@reset');
Route::post('wawancara/lolos', 'WawancaraController@lolos');
Route::post('wawancara/gagal', 'WawancaraController@gagal');
Route::post('submitComment', 'WawancaraController@comment');
Route::post('submitTanggal', 'WawancaraController@tanggal');

Route::get('penerima', 'WawancaraController@penerima');
Route::post('diterima', 'WawancaraController@diterima');
Route::post('diterima/reset', 'WawancaraController@reset');
