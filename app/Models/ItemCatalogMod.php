<?php

namespace App\Models;

use CodeIgniter\Model;

class ItemCatalogMod extends Model
{
    protected $table            = 'tbl_item_catalogo';
    protected $primaryKey       = 'id_item';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = true;

    protected $allowedFields    = [
        'itc_codigo',
        'itc_nombre',
        'itc_descripcion',
        'itc_estado',
        'id_catalogo'
    ];

    protected bool $allowEmptyInserts = false;

    // Dates
    protected $useTimestamps = false;


    public function obtainActiveSelect($itemCatalogCode)
    {
        return $this->select('
            tbl_item_catalogo.id_item,
            tbl_item_catalogo.itc_codigo,
            tbl_item_catalogo.itc_nombre,
            tbl_item_catalogo.itc_descripcion,
            tbl_item_catalogo.itc_estado,
            tbl_catalogo.id_catalogo,
            tbl_catalogo.cat_codigo,
            tbl_catalogo.cat_nombre
        ')
            ->join('tbl_catalogo', 'tbl_catalogo.id_catalogo = tbl_item_catalogo.id_catalogo')
            ->where('tbl_catalogo.cat_codigo', $itemCatalogCode)
            ->where('tbl_catalogo.ca_estado', 1)
            ->where('tbl_item_catalogo.itc_estado', 1)
            ->findAll();
    }
}
