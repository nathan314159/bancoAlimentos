<?php

namespace App\Models;

use CodeIgniter\Model;

class DatosGenerales extends Model
{
    protected $table            = 'tbl_datos_generales';
    protected $primaryKey       = 'id_datos_generales ';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;
    protected $allowedFields    = [
        "id_users",
        "datos_provincia",
        "datos_canton",
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
        "datos_plan_celular"
    ];

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

    // public function findUser($userName)
    // {
    //     $db = \Config\Database::connect();

    //     $builder = $db->table("tbl_datos_generales");

    //     $builder->select([
    //    "id_users",
    //     "datos_provincia",
    //     "datos_canton",
    //     "datos_parroquias",
    //     "datos_comunidades",
    //     "datos_barrios",
    //     "datos_tipo_viviendas",
    //     "datos_techos",
    //     "datos_paredes",
    //     "datos_pisos",
    //     "datos_cuarto",
    //     "datos_combustibles_cocina",
    //     "datos_servicios_higienicos",
    //     "datos_viviendas",
    //     "datos_pago_vivienda",
    //     "datos_agua",
    //     "datos_pago_agua",
    //     "datos_pago_luz",
    //     "datos_cantidad_luz",
    //     "datos_internet",
    //     "datos_pago_internet",
    //     "datos_tv_cable",
    //     "datos_tv_pago",
    //     "datos_eliminacion_basura",
    //     "datos_lugares_mayor_frecuencia_viveres",
    //     "datos_gastos_viveres_alimentacion",
    //     "datos_medio_transporte",
    //     "datos_estado_transporte",
    //     "datos_servicios_higienicos",
    //     "datos_terrenos",
    //     "datos_celular",
    //     "datos_cantidad_celulare",
    //     "datos_plan_celular"
    //     ]);
    //     $builder->where('users_nombreUsuario', $userName);
    //     print_r($builder);
    //     $query = $builder->get();

    //     return $query->getRowArray(); // Return a single user as an associative array
    // }
}
