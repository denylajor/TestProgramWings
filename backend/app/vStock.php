<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class vStock extends Model
{
    protected $table = 'v_stock';
    protected $primaryKey = 'id_stock';
    protected $guarded = [''];
}
