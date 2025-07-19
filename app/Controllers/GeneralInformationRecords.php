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
                $registros_crudos = $this->form->showGeneralInformation(session('id_users'));

                $registros = [];
                foreach ($registros_crudos as $row) {
                    $id = $row->id_datos_generales;

                    if (!isset($registros[$id])) {
                        $registros[$id] = $row;
                        $registros[$id]->parentescos = [];
                    }

                    $nombreCompleto = trim("{$row->nombre_parentesco} {$row->apellido_parentesco}");
                    $registros[$id]->parentescos[] = [
                        'id_parentesco' => $row->id_datos_parentesco,
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


    public function getRelationShipId()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getRelationShipId", $routes)) {
                $relationship = $this->generalInformationRelationship->getRelationShipId($this->request->getPost('id_datos_parentesco'));
                echo json_encode($relationship);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function deleteGeneralInformationRecord()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/deleteGeneralInformationRecord", $routes)) {

                $idDatosGenerales = $this->request->getPost('id_datos_generales');

                // 1. Obtener todos los id de parentescos
                $relationShipIdObjects = $this->generalInformationRelationship->getParentescosByDatosGeneralesId($idDatosGenerales);
                $relationShipIdArray = array_map(function ($item) {
                    return $item->id_datos_parentesco;
                }, $relationShipIdObjects);

                // 2. Cambiar el estado del id de datos generales a 0 
                $this->generalInformationRelationship->desactivarDatosGenerales($idDatosGenerales);

                // 3. Cambiar los estados de parentescos a 0
                if (!empty($relationShipIdArray)) {
                    $this->generalInformationRelationship->desactivarParentescos($relationShipIdArray);
                }

                // 4. Cambiar los estados de datos_generales_parentesco a 0
                $this->generalInformationRelationship->desactivarGeneralesParentescos($idDatosGenerales);

                //echo json_encode(['status' => 'ok']);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }
}
