<?php

namespace App\Models;

use CodeIgniter\Model;

class Users extends Model
{
    protected $table            = 'tbl_users';
    protected $primaryKey       = 'id_users';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = ["users_nombre", "users_apellido", "users_cedula", "users_email", "users_telefono", "users_estado", "users_activation_token", "users_reset_token", "users_reset_token_expires_at"];

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
}
