<?php

namespace App\Models;

use CodeIgniter\Model;

class CatalogMod extends Model
{
    protected $table            = 'tbl_catalogo';
    protected $primaryKey       = 'id_catalogo';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;

    protected $allowedFields    = [
        'cat_codigo',
        'cat_nombre',
        'ca_estado'
    ];

    protected bool $allowEmptyInserts = false;

    // Dates
    protected $useTimestamps = false;
}
