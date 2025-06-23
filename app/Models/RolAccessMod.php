<?php

namespace App\Models;

use CodeIgniter\Model;

class RolAccessMod extends Model
{
    protected $table            = 'tbl_rol_access';
    protected $primaryKey       = 'id_principal_rol_access';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;

    protected $allowedFields    = [
        'id_rol',
        'id_funcionalidad'
    ];

    protected bool $allowEmptyInserts = false;

    // Fechas (opcional si luego agregas created_at, updated_at)
    protected $useTimestamps = false;
    // protected $createdField  = 'created_at';
    // protected $updatedField  = 'updated_at';

    public function getUrlsByRolId($id_rol)
    {
        return $this->db->table('tbl_rol_access ra')
            ->select('f.funcionalidad_url')
            ->join('tbl_funcionalidad f', 'f.id_funcionalidad = ra.id_funcionalidad')
            ->where('ra.id_rol', $id_rol)
            ->where('f.funcionalidad_estado', 1) // opcional: solo activas
            ->get()
            ->getResultArray();
    }
}
