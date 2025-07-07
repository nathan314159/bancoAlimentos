<?php

namespace App\Models;

use CodeIgniter\Model;

class GeneralInformationRelationshipMod extends Model
{
    protected $table            = 'tbl_datos_generales_parentesco';
    protected $primaryKey       = 'id_datos_generales_parentesco';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;

    protected $allowedFields    = [
        'id_datos_parentescos',
        'id_datos_generales',
        'datos_generales_parentesco_estado'
    ];

    protected bool $allowEmptyInserts = false;

    // No timestamps
    protected $useTimestamps = false;
}
