<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Penguji extends Model
{
    protected $table = 'penguji';
    protected $primaryKey = 'nim_penguji';
    public $timestamps = false;
    public $incrementing = false;

    public function menilai()
    {
        return $this->hasMany('App\Menilai','nim_penguji');
    }
}
