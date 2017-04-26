<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pendidikan extends Model
{
    protected $table = 'pendidikan';
    protected $primaryKey = 'id_pendidikan';
    public $timestamps = false;
    public $incrementing = false;
    
    public function pendaftar()
    {
        return $this->hasMany('App\Pendaftar','id_pendidikan');
    }
}
