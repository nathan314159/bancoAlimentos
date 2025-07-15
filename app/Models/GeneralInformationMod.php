<?php

namespace App\Models;

use CodeIgniter\Model;

class GeneralInformationMod extends Model
{
    protected $table            = 'tbl_datos_generales';
    protected $primaryKey       = 'id_datos_generales ';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        "id_users",
        "datos_parentesco_id",
        "datos_provincia",
        "datos_canton",
        "datos_tipo_parroquias",
        "datos_parroquias",
        "datos_comunidades",
        "datos_barrios",
        "datos_tipo_viviendas",
        "datos_techos",
        "datos_paredes",
        "datos_pisos",
        "datos_cuarto",
        "datos_combustibles_cocina",
        "datos_servicios_higienicos",
        "datos_viviendas",
        "datos_pago_vivienda",
        "datos_agua",
        "datos_pago_agua",
        "datos_pago_luz",
        "datos_cantidad_luz",
        "datos_internet",
        "datos_pago_internet",
        "datos_tv_cable",
        "datos_tv_pago",
        "datos_eliminacion_basura",
        "datos_lugares_mayor_frecuencia_viveres",
        "datos_gastos_viveres_alimentacion",
        "datos_medio_transporte",
        "datos_estado_transporte",
        "datos_servicios_higienicos",
        "datos_terrenos",
        "datos_celular",
        "datos_cantidad_celulare",
        "datos_plan_celular",
        "datos_estado"
    ];

    protected bool $allowEmptyInserts = false;
    // protected bool $updateOnlyChanged = true;
    // protected array $casts = [];
    // protected array $castHandlers = [];

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'datos_created_at';
    protected $updatedField  = 'datos_updated_at';
    // protected $deletedField  = 'deleted_at';

    public function insertUsuario($data)
    {
        // Cargar el helper de base de datos
        $db = \Config\Database::connect();

        // Construir la consulta de inserción
        $builder = $db->table('tbl_datos_generales');

        // Ejecutar la inserción
        $builder->insert($data);

        // Retornar el ID del último registro insertado
        return $db->insertID();
    }

    public function updateUsuario($id, $data)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('tbl_datos_generales');
        return $builder->where('id_datos_generales', $id)->update($data);
    }

    // select de general information y join con tabla parentesco

public function showGeneralInformation()
{
    $db = \Config\Database::connect();

    $builder = $db->table('tbl_datos_generales dg');
    $builder->select("
        dg.id_datos_generales,
        dg.id_users,
        dg.datos_provincia,
        dg.datos_canton,
        dg.datos_tipo_parroquias,
        dg.datos_parroquias,
        dg.datos_comunidades,
        dg.datos_barrios,
        dg.datos_tipo_viviendas,
        dg.datos_techos,
        dg.datos_paredes,
        dg.datos_pisos,
        dg.datos_cuarto,
        dg.datos_combustibles_cocina,
        dg.datos_servicios_higienicos,
        dg.datos_viviendas,
        dg.datos_pago_vivienda,
        dg.datos_agua,
        dg.datos_pago_agua,
        dg.datos_pago_luz,
        dg.datos_cantidad_luz,
        dg.datos_internet,
        dg.datos_pago_internet,
        dg.datos_tv_cable,
        dg.datos_tv_pago,
        dg.datos_eliminacion_basura,
        dg.datos_lugares_mayor_frecuencia_viveres,
        dg.datos_gastos_viveres_alimentacion,
        dg.datos_medio_transporte,
        dg.datos_estado_transporte,
        dg.datos_terrenos,
        dg.datos_celular,
        dg.datos_cantidad_celulare,
        dg.datos_plan_celular,

        dp.id_datos_parentesco AS id_datos_parentesco,
        dp.datos_parentesco_nombres AS nombre_parentesco,
        dp.datos_parentesco_apellidos AS apellido_parentesco,
        dp.datos_parentesco_parentesco AS parentesco
    ");
    $builder->join('tbl_datos_generales_parentesco dgp', 'dgp.id_datos_generales = dg.id_datos_generales');
    $builder->join('tbl_datos_parentesco dp', 'dp.id_datos_parentesco = dgp.id_datos_parentescos');
    $builder->where('datos_estado', 1);

    return $builder->get()->getResult();
}

    // select de parentesco
}
