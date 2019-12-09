<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Kickstarter extends Model
{
    protected $table = 'kickstarter';
    protected $primaryKey = 'ID';
    protected $keyType = 'string';
    protected $guarded = [];

    public $incrementing = false;
    public $timestamps = false;
}
