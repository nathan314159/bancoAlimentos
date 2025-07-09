<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\GeneralInformationMod;
use App\Models\RelationshipMod;
use App\Models\GeneralInformationRelationshipMod;
use App\Models\UsersMod;
use App\Models\RolAccessMod;
use App\Models\UserRolMod;
use App\Models\ItemCatalogMod;

class GeneralInformationRecords extends BaseController
{
    protected $form;
    protected $relationship;
    protected $generalInformationRelationship;
    protected $users;
    protected $rol_access;
    protected $user_rol;
    protected $item_catalog;


    public function __construct()
    {
        $this->session = \Config\Services::session();
        $this->users = new UsersMod();
        $this->rol_access = new RolAccessMod();
        $this->user_rol = new UserRolMod();
        $this->form = new GeneralInformationMod();
        $this->relationship = new RelationshipMod();
        $this->generalInformationRelationship = new GeneralInformationRelationshipMod();
        $this->item_catalog = new ItemCatalogMod();
    }

    public function informationRecords()
{
    echo "<script>if (window.history.replaceState) {
        window.history.replaceState(null, null, window.location.href);
    }</script>";

    if ($this->session->has('id_users')) {
        $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));

        if (accessController("/informationRecords", $routes)) {
            $arrayFunction = ['function' => 'datos registrados'];

            // ✅ Aquí transformamos los datos crudos en estructura agrupada
            $registros_crudos = $this->form->showGeneralInformation();

            $registros = [];
            foreach ($registros_crudos as $row) {
                $id = $row->id_datos_generales;

                if (!isset($registros[$id])) {
                    $registros[$id] = $row;
                    $registros[$id]->parentescos = [];
                }

                $nombreCompleto = trim("{$row->nombre_parentesco} {$row->apellido_parentesco}");
                $registros[$id]->parentescos[] = [
                    'nombre' => $nombreCompleto,
                    'tipo' => $row->parentesco
                ];
            }

            $data['registros'] = array_values($registros); // lista limpia

            // Vistas
            echo view("layout/header");
            echo view("layout/aside", $arrayFunction);
            echo view("generalInformationRecords/body", $data);
            echo view("layout/footer", $arrayFunction);

        } else {
            redirectUser($this->users->searchRolUser(session('id_users')));
        }
    } else {
        echo view('login/body.php');
    }
}

}