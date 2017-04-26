<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menilai extends Model
{
    protected $table = 'menilai';
    protected $primaryKey = 'id_nilai';
    public $timestamps = false;
    public $incrementing = false;

    public function penguji()
    {
        return $this->belongsTo('App\Penguji','nim_penguji');
    }

    public function wawancara()
    {
        return $this->belongsTo('App\Wawancara', 'id_wawancara');
    }
}
