<?php

namespace App\Models;

use CodeIgniter\Model;

class RelationshipMod extends Model
{
    protected $table            = 'tbl_datos_parentesco';
    protected $primaryKey       = 'id_datos_parentesco';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;

    protected $allowedFields    = [
        'datos_parentesco_nombres',
        'datos_parentesco_apellidos',
        'datos_parentesco_documento',
        'datos_parentesco_celular_telf',
        'datos_parentesco_etnia',
        'datos_parentesco_genero',
        'datos_parentesco_nivel_educacion',
        'datos_parentesco_fecha_de_nacimiento',
        'datos_parentesco_edad',
        'datos_parentesco_estado_civil',
        'datos_parentesco_discapacidad',
        'datos_parentesco_enfermedad_catastrofica',
        'datos_parentesco_trabaja',
        'datos_parentesco_ocupacion',
        'datos_parentesco_ingreso_mensual',
        'datos_parentesco_parentesco',
        'datos_parentesco_estado'
    ];

    protected bool $allowEmptyInserts = false;

    // No timestamps en esta tabla (si los usas, cámbialo a true)
    protected $useTimestamps = false;

    public function insertReturnId($data)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('tbl_datos_parentesco');
        $builder->insert($data);
        return $db->insertID();
    }
}
