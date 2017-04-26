<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pendaftar extends Model
{
    protected $table = 'pendaftar';
    protected $primaryKey = 'id_pendaftar';
    public $timestamps = false;
    public $incrementing = false;

    public function pendidikan()
    {
        return $this->belongsTo('App\Pendidikan','id_pendidikan');
    }

    public function wawancara()
    {
        return $this->hasOne('App\Wawancara', 'id_wawancara', 'id_wawancara');
    }
}
