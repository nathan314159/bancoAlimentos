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
        "datos_observacion",
        "datos_resultado",
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

    // public function showGeneralInformation()
    // {
    //     $db = \Config\Database::connect();

    //     $builder = $db->table('tbl_datos_generales dg');
    //     $builder->select("
    //         dg.id_datos_generales,
    //         dg.id_users,
    //         dg.datos_provincia,
    //         dg.datos_canton,
    //         dg.datos_tipo_parroquias,
    //         dg.datos_parroquias,
    //         dg.datos_comunidades,
    //         dg.datos_barrios,
    //         dg.datos_tipo_viviendas,
    //         dg.datos_techos,
    //         dg.datos_paredes,
    //         dg.datos_pisos,
    //         dg.datos_cuarto,
    //         dg.datos_combustibles_cocina,
    //         dg.datos_servicios_higienicos,
    //         dg.datos_viviendas,
    //         dg.datos_pago_vivienda,
    //         dg.datos_agua,
    //         dg.datos_pago_agua,
    //         dg.datos_pago_luz,
    //         dg.datos_cantidad_luz,
    //         dg.datos_internet,
    //         dg.datos_pago_internet,
    //         dg.datos_tv_cable,
    //         dg.datos_tv_pago,
    //         dg.datos_eliminacion_basura,
    //         dg.datos_lugares_mayor_frecuencia_viveres,
    //         dg.datos_gastos_viveres_alimentacion,
    //         dg.datos_medio_transporte,
    //         dg.datos_estado_transporte,
    //         dg.datos_terrenos,
    //         dg.datos_celular,
    //         dg.datos_cantidad_celulare,
    //         dg.datos_plan_celular,

    //         dp.id_datos_parentesco AS id_datos_parentesco,
    //         dp.datos_parentesco_nombres AS nombre_parentesco,
    //         dp.datos_parentesco_apellidos AS apellido_parentesco,
    //         dp.datos_parentesco_parentesco AS parentesco
    //     ");
    //     $builder->join('tbl_datos_generales_parentesco dgp', 'dgp.id_datos_generales = dg.id_datos_generales');
    //     $builder->join('tbl_datos_parentesco dp', 'dp.id_datos_parentesco = dgp.id_datos_parentescos');
    //     $builder->where('datos_estado', 1);

    //     return $builder->get()->getResult();
    // }

    // select de parentesco

    public function showGeneralInformation($idUser)
    {
        $db = \Config\Database::connect();

        $builder = $db->table('tbl_datos_generales dg');
        $builder->select("
            dg.id_datos_generales,
            dg.id_users,

            provincia.itc_nombre AS nombre_provincia,
            parroquia.itc_nombre AS nombre_parroquia,
            tipo_vivienda.itc_nombre AS nombre_tipo_vivienda,
            techo.itc_nombre AS nombre_techo,
            pared.itc_nombre AS nombre_pared,
            piso.itc_nombre AS nombre_piso,
            vivienda.itc_nombre AS nombre_vivienda,
            combustible.itc_nombre AS nombre_combustible,
            servicios.itc_nombre AS nombre_servicios,
            eliminacion.itc_nombre AS nombre_eliminacion_basura,
            frecuencia.itc_nombre AS nombre_frecuencia_viveres,

            dg.datos_parroquias,
            dg.datos_tipo_parroquias,
            dg.datos_canton,
            dg.datos_comunidades,
            dg.datos_barrios,
            dg.datos_cuarto,
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
            dg.datos_gastos_viveres_alimentacion,
            dg.datos_medio_transporte,
            dg.datos_estado_transporte,
            dg.datos_terrenos,
            dg.datos_celular,
            dg.datos_cantidad_celulare,
            dg.datos_plan_celular,
            dg.datos_observacion,
            dg.datos_resultado,
            dg.datos_created_at,

            dp.id_datos_parentesco AS id_datos_parentesco,
            dp.datos_parentesco_nombres AS nombre_parentesco,
            dp.datos_parentesco_apellidos AS apellido_parentesco,
            dp.datos_parentesco_parentesco AS parentesco,
            dp.datos_parentesco_documento,
            dp.datos_parentesco_celular_telf,
            dp.datos_parentesco_etnia,
            dp.datos_parentesco_genero,
            dp.datos_parentesco_nivel_educacion,
            dp.datos_parentesco_fecha_de_nacimiento,
            dp.datos_parentesco_edad,
            dp.datos_parentesco_estado_civil,
            dp.datos_parentesco_discapacidad,
            dp.datos_parentesco_enfermedad_catastrofica,
            dp.datos_parentesco_trabaja,
            dp.datos_parentesco_ocupacion,
            dp.datos_parentesco_ingreso_mensual
        ");

        // JOINs con tbl_item_catalogo usando alias para cada campo relacionado
        $builder->join('tbl_item_catalogo provincia', 'provincia.id_item = dg.datos_provincia', 'left');
        $builder->join('tbl_item_catalogo canton', 'canton.id_item = dg.datos_canton', 'left');
        $builder->join('tbl_item_catalogo parroquia', 'parroquia.id_item = dg.datos_parroquias', 'left');
        $builder->join('tbl_item_catalogo tipo_vivienda', 'tipo_vivienda.id_item = dg.datos_tipo_viviendas', 'left');
        $builder->join('tbl_item_catalogo techo', 'techo.id_item = dg.datos_techos', 'left');
        $builder->join('tbl_item_catalogo pared', 'pared.id_item = dg.datos_paredes', 'left');
        $builder->join('tbl_item_catalogo piso', 'piso.id_item = dg.datos_pisos', 'left');
        $builder->join('tbl_item_catalogo vivienda', 'vivienda.id_item = dg.datos_viviendas', 'left');
        $builder->join('tbl_item_catalogo combustible', 'combustible.id_item = dg.datos_combustibles_cocina', 'left');
        $builder->join('tbl_item_catalogo servicios', 'servicios.id_item = dg.datos_servicios_higienicos', 'left');
        $builder->join('tbl_item_catalogo eliminacion', 'eliminacion.id_item = dg.datos_eliminacion_basura', 'left');
        $builder->join('tbl_item_catalogo frecuencia', 'frecuencia.id_item = dg.datos_lugares_mayor_frecuencia_viveres', 'left');

        // JOINs para parentesco
        $builder->join('tbl_datos_generales_parentesco dgp', 'dgp.id_datos_generales = dg.id_datos_generales');
        $builder->join('tbl_datos_parentesco dp', 'dp.id_datos_parentesco = dgp.id_datos_parentescos');

        $builder->where('id_users', $idUser);
        $builder->where('datos_estado', 1);

        return $builder->get()->getResult();
    }

    public function showGeneralInformationDates($idUser, $fechaDesde = null, $fechaHasta = null)
{
    $db = \Config\Database::connect();

    $builder = $db->table('tbl_datos_generales dg');
    $builder->select("
        dg.id_datos_generales,
        dg.id_users,

        provincia.itc_nombre AS nombre_provincia,
        parroquia.itc_nombre AS nombre_parroquia,
        tipo_vivienda.itc_nombre AS nombre_tipo_vivienda,
        techo.itc_nombre AS nombre_techo,
        pared.itc_nombre AS nombre_pared,
        piso.itc_nombre AS nombre_piso,
        vivienda.itc_nombre AS nombre_vivienda,
        combustible.itc_nombre AS nombre_combustible,
        servicios.itc_nombre AS nombre_servicios,
        eliminacion.itc_nombre AS nombre_eliminacion_basura,
        frecuencia.itc_nombre AS nombre_frecuencia_viveres,

        dg.datos_parroquias,
        dg.datos_tipo_parroquias,
        dg.datos_canton,
        dg.datos_comunidades,
        dg.datos_barrios,
        dg.datos_cuarto,
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
        dg.datos_gastos_viveres_alimentacion,
        dg.datos_medio_transporte,
        dg.datos_estado_transporte,
        dg.datos_terrenos,
        dg.datos_celular,
        dg.datos_cantidad_celulare,
        dg.datos_plan_celular,
        dg.datos_observacion,
        dg.datos_resultado,
        dg.datos_created_at,

        dp.id_datos_parentesco AS id_datos_parentesco,
        dp.datos_parentesco_nombres AS nombre_parentesco,
        dp.datos_parentesco_apellidos AS apellido_parentesco,
        dp.datos_parentesco_parentesco AS parentesco,
        dp.datos_parentesco_documento,
        dp.datos_parentesco_celular_telf,
        dp.datos_parentesco_etnia,
        dp.datos_parentesco_genero,
        dp.datos_parentesco_nivel_educacion,
        dp.datos_parentesco_fecha_de_nacimiento,
        dp.datos_parentesco_edad,
        dp.datos_parentesco_estado_civil,
        dp.datos_parentesco_discapacidad,
        dp.datos_parentesco_enfermedad_catastrofica,
        dp.datos_parentesco_trabaja,
        dp.datos_parentesco_ocupacion,
        dp.datos_parentesco_ingreso_mensual
    ");

    // JOINs con catálogos
    $builder->join('tbl_item_catalogo provincia', 'provincia.id_item = dg.datos_provincia', 'left');
    $builder->join('tbl_item_catalogo canton', 'canton.id_item = dg.datos_canton', 'left');
    $builder->join('tbl_item_catalogo parroquia', 'parroquia.id_item = dg.datos_parroquias', 'left');
    $builder->join('tbl_item_catalogo tipo_vivienda', 'tipo_vivienda.id_item = dg.datos_tipo_viviendas', 'left');
    $builder->join('tbl_item_catalogo techo', 'techo.id_item = dg.datos_techos', 'left');
    $builder->join('tbl_item_catalogo pared', 'pared.id_item = dg.datos_paredes', 'left');
    $builder->join('tbl_item_catalogo piso', 'piso.id_item = dg.datos_pisos', 'left');
    $builder->join('tbl_item_catalogo vivienda', 'vivienda.id_item = dg.datos_viviendas', 'left');
    $builder->join('tbl_item_catalogo combustible', 'combustible.id_item = dg.datos_combustibles_cocina', 'left');
    $builder->join('tbl_item_catalogo servicios', 'servicios.id_item = dg.datos_servicios_higienicos', 'left');
    $builder->join('tbl_item_catalogo eliminacion', 'eliminacion.id_item = dg.datos_eliminacion_basura', 'left');
    $builder->join('tbl_item_catalogo frecuencia', 'frecuencia.id_item = dg.datos_lugares_mayor_frecuencia_viveres', 'left');

    // JOINs de parentesco
    $builder->join('tbl_datos_generales_parentesco dgp', 'dgp.id_datos_generales = dg.id_datos_generales');
    $builder->join('tbl_datos_parentesco dp', 'dp.id_datos_parentesco = dgp.id_datos_parentescos');

    $builder->where('dg.id_users', $idUser);
    $builder->where('dg.datos_estado', 1);

    if ($fechaDesde && $fechaHasta) {
        $builder->where('dg.datos_created_at >=', $fechaDesde . ' 00:00:00');
        $builder->where('dg.datos_created_at <=', $fechaHasta . ' 23:59:59');
    }

    return $builder->get()->getResult();
}


    public function getPrimerParentescoByDatosGeneralesId($idDatosGenerales)
    {
        $db = \Config\Database::connect();

        $builder = $db->table('tbl_datos_generales_parentesco dgp');
        $builder->select('dp.*'); // Selecciona todos los campos del parentesco
        $builder->join('tbl_datos_parentesco dp', 'dp.id_datos_parentesco = dgp.id_datos_parentescos');
        $builder->where('dgp.id_datos_generales', $idDatosGenerales);
        $builder->where('dgp.datos_generales_parentesco_estado', 1);
        $builder->limit(1); // Solo un resultado

        return $builder->get()->getRow(); // Devuelve solo una fila (objeto)
    }
}
