<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PII_Data extends Model
{
    protected $table = 'pii_data';
    protected $guarded = [];
    protected $casts = [
        'pii_uuid' => 'string',
        'created_at' => 'datetime:Y-m-d H:i:s',
        'updated_at' => 'datetime:Y-m-d H:i:s'
    ];
}
