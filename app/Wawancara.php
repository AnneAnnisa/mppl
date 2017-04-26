<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Wawancara extends Model
{
    protected $table = 'wawancara';
    protected $primaryKey = 'id_wawancara';
    public $timestamps = false;
    public $incrementing = false;

    public function pendaftar()
    {
        return $this->belongsTo('App\Pendaftar','id_pendaftar', 'id_pendaftar');
    }
    public function menilai()
    {
        return $this->hasMany('App\Menilai','id_wawancara');
    }
}
