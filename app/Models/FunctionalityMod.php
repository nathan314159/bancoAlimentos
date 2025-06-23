<?php

namespace App\Models;

use CodeIgniter\Model;

class FunctionalityMod extends Model
{
    protected $table            = 'tbl_funcionalidad';
    protected $primaryKey       = 'id_funcionalidad';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;

    protected $allowedFields    = [
        'funcionalidad_nombre_funcion',
        'funcionalidad_url',
        'funcionalidad_estado'
    ];

    protected bool $allowEmptyInserts = false;

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'funcionalidad_created_at';
    protected $updatedField  = 'funcionalidad_created_at';
}
