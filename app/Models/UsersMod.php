<?php

namespace App\Models;

use CodeIgniter\Model;
use CodeIgniter\Database\RawSql;

class UsersMod extends Model
{
    protected $table            = 'tbl_users';
    protected $primaryKey       = 'id_users';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ["users_nombre", "users_nombreUsuario", "users_apellido", "users_cedula", "users_email", "users_telefono", "users_estado", "users_activation_token", "users_reset_token", "users_reset_token_expires_at"];

    protected bool $allowEmptyInserts = false;
    // protected bool $updateOnlyChanged = true;

    // protected array $casts = [];
    // protected array $castHandlers = [];

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'users_created_at';
    protected $updatedField  = 'users_updated_at';
    // protected $deletedField  = 'deleted_at';


    public function searchSessionVariables($idUsuario)
    {
        return $this->db->table('tbl_user_rol ur')
            ->select('u.id_users, u.users_nombre, u.users_apellido, u.users_cedula, u.users_email, u.users_genero, u.users_nombreUsuario, r.id_rol, r.rol_nombre')
            ->join('tbl_users u', 'u.id_users = ur.id_users')
            ->join('tbl_rol r', 'r.id_rol = ur.id_rol')
            ->where('ur.id_users', $idUsuario)
            ->limit(1)
            ->get()
            ->getResult();
    }



    public function searchRolUser($id_users)
    {
        return $this->db->table('tbl_user_rol ur')
            ->select('r.id_rol, r.rol_nombre')
            ->join('tbl_rol r', 'r.id_rol = ur.id_rol')
            ->where('ur.id_users', $id_users)
            ->limit(1)
            ->get()
            ->getResult();
    }




    public function insertUsuario($data)
    {
        // Cargar el helper de base de datos
        $db = \Config\Database::connect();

        // Construir la consulta de inserción
        $builder = $db->table('tbl_users');

        // Ejecutar la inserción
        $builder->insert($data);

        // Retornar el ID del último registro insertado
        return $db->insertID();
    }

    public function findUser($userName)
    {
        $db = \Config\Database::connect();

        $builder = $db->table("tbl_users");

        $builder->select([
            'users_nombre',
            'users_nombreUsuario',
            'users_apellido',
            'users_cedula',
            'users_email',
            'users_telefono',
            'users_contrasenia'
        ]);
        $builder->where('users_nombreUsuario', $userName);
        print_r($builder);
        $query = $builder->get();

        return $query->getRowArray(); // Return a single user as an associative array
    }

    public function registerUser($userInfo)
    {
        $db = \Config\Database::connect();
        $builder = $db->table("tbl_users");

        $data = [
            'users_nombre'        => $userInfo['users_nombre'],
            'users_nombreUsuario' => $userInfo['users_nombreUsuario'],
            'users_apellido'      => $userInfo['users_apellido'],
            'users_cedula'        => $userInfo['users_cedula'],
            'users_fecha_de_nacimiento'        => $userInfo['users_fecha_de_nacimiento'],
            'users_email'         => $userInfo['users_email'],
            'users_telefono'      => $userInfo['users_telefono'],
            'users_contrasenia'   => $userInfo['users_contrasenia'],
            'users_estado'        => 1,
        ];

        if ($builder->insert($data)) {
            return $db->insertID(); // Devuelve el ID insertado
        } else {
            return false; // O puedes devolver $db->error() si deseas saber qué falló
        }
    }

    public function searchUserPorfile($idUsuario)
    {
        return $this->db->table('tbl_user_rol ur')
            ->select('
            u.id_users,
            u.users_nombre,
            u.users_apellido,
            u.users_cedula,
            u.users_email,
            u.users_genero,
            u.users_nombreUsuario,
            u.users_telefono,
            u.users_fecha_de_nacimiento,
            u.users_estado,
            r.id_rol,
            r.rol_nombre
        ')
            ->join('tbl_users u', 'u.id_users = ur.id_users')
            ->join('tbl_rol r', 'r.id_rol = ur.id_rol')
            ->where('ur.id_users', $idUsuario)
            ->limit(1)
            ->get()
            ->getResult();
    }

    // nueva funcion update el usuario
    // nueva funcion update para la clave
}
