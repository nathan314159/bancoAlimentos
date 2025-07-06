<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\GeneralInformationMod;
use App\Models\UsersMod;
use App\Models\RolAccessMod;
use App\Models\UserRolMod;
use App\Models\ItemCatalogMod;

class GeneralInformation extends BaseController
{
    protected $form;
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
        $this->item_catalog = new ItemCatalogMod();
    }

    public function formGeneralInformation()
    {
        echo "<script>if (window.history.replaceState) { // verificamos disponibilidad
			window.history.replaceState(null, null, window.location.href);
		}</script>";
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/formGeneralInformation", $routes)) {
                $arrayFunction = ['function' => 'formulario'];
                echo view("layout/header");
                echo view("layout/aside", $arrayFunction);
                echo view("generalInformation/body");
                echo view("layout/footer");
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function insertGeneralInformation()
    {



        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/insertGeneralInformation", $routes)) {
                // Obtener arrays de transporte
                $mediosTransporte = $this->request->getPost('datos_medio_transporte') ?? [];
                $estadosTransporte = $this->request->getPost('datos_estado_transporte') ?? [];

                // Convertir arrays en cadenas separadas por "/"
                $mediosTransporteStr = is_array($mediosTransporte) ? implode('/', $mediosTransporte) : '';
                $estadosTransporteStr = is_array($estadosTransporte) ? implode('/', $estadosTransporte) : '';

                $userData = [
                    'id_users' => 3,
                    'datos_provincia' => $this->request->getPost('datos_provincia'),
                    'datos_canton' => $this->request->getPost('datos_canton'),
                    'datos_parroquias' => $this->request->getPost('datos_parroquias'),
                    'datos_tipo_parroquias' => $this->request->getPost('datos_tipo_parroquias'),
                    'datos_comunidades' => $this->request->getPost('datos_comunidades'),
                    'datos_barrios' => $this->request->getPost('datos_barrios'),
                    'datos_tipo_viviendas' => $this->request->getPost('datos_tipo_viviendas'),
                    'datos_techos' => $this->request->getPost('datos_techos'),
                    'datos_paredes' => $this->request->getPost('datos_paredes'),
                    'datos_pisos' => $this->request->getPost('datos_pisos'),
                    'datos_cuarto' => $this->request->getPost('datos_cuarto'),
                    'datos_combustibles_cocina' => $this->request->getPost('datos_combustibles_cocina'),
                    'datos_servicios_higienicos' => $this->request->getPost('datos_servicios_higienicos'),
                    'datos_viviendas' => $this->request->getPost('datos_viviendas'),
                    'datos_pago_vivienda' => $this->request->getPost('datos_pago_vivienda'),
                    'datos_agua' => $this->request->getPost('datos_agua'),
                    'datos_pago_agua' => $this->request->getPost('datos_pago_agua'),
                    'datos_pago_luz' => $this->request->getPost('datos_pago_luz'),
                    'datos_cantidad_luz' => $this->request->getPost('datos_cantidad_luz'),
                    'datos_internet' => $this->request->getPost('datos_internet'),
                    'datos_pago_internet' => $this->request->getPost('datos_pago_internet'),
                    'datos_tv_cable' => $this->request->getPost('datos_tv_cable'),
                    'datos_tv_pago' => $this->request->getPost('datos_tv_pago'),
                    'datos_eliminacion_basura' => $this->request->getPost('datos_eliminacion_basura'),
                    'datos_lugares_mayor_frecuencia_viveres' => $this->request->getPost('datos_lugares_mayor_frecuencia_viveres'),
                    'datos_gastos_viveres_alimentacion' => $this->request->getPost('datos_gastos_viveres_alimentacion'),

                    // Convertidos a string
                    'datos_medio_transporte' => $mediosTransporteStr,
                    'datos_estado_transporte' => $estadosTransporteStr,

                    'datos_terrenos' => $this->request->getPost('datos_terrenos'),
                    'datos_celular' => $this->request->getPost('datos_celular'),
                    'datos_cantidad_celulare' => $this->request->getPost('datos_cantidad_celulare'),
                    'datos_plan_celular' => $this->request->getPost('datos_plan_celular'),
                ];

                $this->form->insertUsuario($userData);

                redirectUser($this->users->searchRolUser(session('id_users')));
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }



    public function getProvinces()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getProvinces", $routes)) {
                $provinces = $this->item_catalog->obtainActiveSelect('PROV');
                echo json_encode($provinces);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getCities()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getCities", $routes)) {
                $cities = $this->item_catalog->obtainActiveSelect('CANT');
                echo json_encode($cities);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getParishes()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getCities", $routes)) {
                $parishes = $this->item_catalog->obtainActiveSelect('PARR');
                echo json_encode($parishes);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }


    public function getTypesHousing()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getTypesHousing", $routes)) {
                $typesHousing = $this->item_catalog->obtainActiveSelect('TIPOVIVIENDA');
                echo json_encode($typesHousing);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getRoofTypes()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getRoofTypes", $routes)) {
                $roofTypes = $this->item_catalog->obtainActiveSelect('TIPOTECHO');
                echo json_encode($roofTypes);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getWallTypes()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getWallTypes", $routes)) {
                $wallTypes = $this->item_catalog->obtainActiveSelect('TIPOPARED');
                echo json_encode($wallTypes);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getFloorTypes()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getFloorTypes", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('TIPOPISO');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getCookingFuel()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getCookingFuel", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('COMB-COCINA');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getHygienicServices()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getHygienicService", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('SERV-HIG');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getHousing()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getHousing", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('ALOJAMIENTO');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getWaterServices()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getWaterServices", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('SERV-AGUA');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getGarbageRemoval()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getGarbageRemoval", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('ELM-BAS');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getFrequentShopPlaces()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getFrequentShopPlaces", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('LUG-FREC-COMPRA');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getVehiclesTypes()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getVehiclesTypes", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('TIP-VEHICULOS');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getTransportStatus()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getTransportStatus", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('EST-TRANSPORTE');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }
}
