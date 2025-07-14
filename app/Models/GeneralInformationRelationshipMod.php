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

    public function getRelationshipId($idParentesco)
    {
        $db = \Config\Database::connect();

        $builder = $db->table('tbl_datos_parentesco dp');
        $builder->select("
        dp.id_datos_parentesco,
        dp.datos_parentesco_nombres,
        dp.datos_parentesco_apellidos,
        dp.datos_parentesco_documento,
        dp.datos_parentesco_celular_telf,
        dp.datos_parentesco_fecha_de_nacimiento,
        dp.datos_parentesco_edad,
        dp.datos_parentesco_enfermedad_catastrofica,
        dp.datos_parentesco_trabaja,
        dp.datos_parentesco_ocupacion,
        dp.datos_parentesco_ingreso_mensual,
        dp.datos_parentesco_parentesco,

        e.itc_nombre AS etnia,
        g.itc_nombre AS genero,
        n.itc_nombre AS nivel_educacion,
        ec.itc_nombre AS estado_civil,
        d.itc_nombre AS discapacidad
    ");
        $builder->join('tbl_item_catalogo e', 'e.id_item = dp.datos_parentesco_etnia', 'left');
        $builder->join('tbl_item_catalogo g', 'g.id_item = dp.datos_parentesco_genero', 'left');
        $builder->join('tbl_item_catalogo n', 'n.id_item = dp.datos_parentesco_nivel_educacion', 'left');
        $builder->join('tbl_item_catalogo ec', 'ec.id_item = dp.datos_parentesco_estado_civil', 'left');
        $builder->join('tbl_item_catalogo d', 'd.id_item = dp.datos_parentesco_discapacidad', 'left');

        $builder->where('dp.id_datos_parentesco', $idParentesco);
        $builder->limit(1);

        return $builder->get()->getRow(); // Solo uno
    }

    //Proceso para actualizar

    //1.Obtener todos los id de parentescos
    public function getParentescosByDatosGeneralesId($idDatosGenerales)
    {
        $db = \Config\Database::connect();

        $builder = $db->table('tbl_datos_generales_parentesco dgp');
        $builder->select('dp.id_datos_parentesco');
        $builder->join('tbl_datos_parentesco dp', 'dp.id_datos_parentesco = dgp.id_datos_parentescos');
        $builder->where('dgp.id_datos_generales', $idDatosGenerales);
        $builder->where('dgp.datos_generales_parentesco_estado', 1); // Opcional: si usas estado activo

        return $builder->get()->getResult(); // Devuelve lista de objetos con los IDs
    }

    //2. Cambiar el estado del id de datos generales a 0 
    public function desactivarDatosGenerales($idDatosGenerales)
    {
        $db = \Config\Database::connect();

        return $db->table('tbl_datos_generales')
            ->where('id_datos_generales', $idDatosGenerales)
            ->update(['datos_estado' => 0]);
    }

    //3. Cambiar los estados de parentescos a 0
    public function desactivarParentescos(array $ids)
    {
        $db = \Config\Database::connect();

        return $db->table('tbl_datos_parentesco')
            ->whereIn('id_datos_parentesco', $ids)
            ->update(['datos_parentesco_estado' => 0]);
    }

    //4. Cambiar los estados de datos_generales_parentesco a 0
    public function desactivarGeneralesParentescos($idDatosGenerales)
    {
        $db = \Config\Database::connect();

        return $db->table('tbl_datos_generales_parentesco')
            ->where('id_datos_generales', $idDatosGenerales)
            ->update(['datos_generales_parentesco_estado' => 0]);
    }
}
