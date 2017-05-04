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
    return view('welcome');
});

Route::get('login', function () {
    return view('login');
});


// MENU MANAJEMEN
Route::get('home', 'HomeController@index');

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

Route::get('penerima', 'WawancaraController@penerima');
Route::post('diterima', 'WawancaraController@diterima');
Route::post('diterima/reset', 'WawancaraController@reset');
