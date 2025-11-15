<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class stock extends Model
{
    protected $table = 'stock';
    protected $primaryKey = 'id_stock';
    protected $guarded = [''];
}
