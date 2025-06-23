<?php

namespace App\Models;

use CodeIgniter\Model;

class RolMod extends Model
{
    protected $table            = 'tbl_rol';
    protected $primaryKey       = 'id_rol';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['rol_nombre', 'rol_estado'];

    protected bool $allowEmptyInserts = false;

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'rol_created_at';
    protected $updatedField  = 'rol_created_at'; 

    // protected $deletedField  = 'deleted_at';
}
