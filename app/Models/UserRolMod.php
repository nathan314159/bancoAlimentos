<?php

namespace App\Models;

use CodeIgniter\Model;

class UserRolMod extends Model
{
    protected $table            = 'tbl_user_rol';
    protected $primaryKey       = 'id_users_rol';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ['id_users', 'id_rol', 'user_rol_estado'];

    protected bool $allowEmptyInserts = false;

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'user_rol_created_at';
    protected $updatedField  = 'user_rol_created_at';

    public function insertUserRolDefault($idUser){
        $db = \Config\Database::connect();
        $builder = $db->table("tbl_user_rol");

        $data = [
            'id_users'        => $idUser,
            'id_rol' => 2,
            'user_rol_estado'      => 1
        ];

        return $builder->insert($data); // Devuelve true o false
    }

}
