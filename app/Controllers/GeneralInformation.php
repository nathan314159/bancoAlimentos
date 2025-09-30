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

class GeneralInformation extends BaseController
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
                echo view("layout/footer", $arrayFunction);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    /*public function insertGeneralInformation()
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
    */

    public function insertGeneralInformation()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/insertGeneralInformation", $routes)) {
                // -------------------------------
                // Obtener arrays de transporte
                // -------------------------------
                $mediosTransporte = $this->request->getPost('datos_medio_transporte') ?? [];
                $estadosTransporte = $this->request->getPost('datos_estado_transporte') ?? [];

                $mediosTransporteStr = is_array($mediosTransporte) ? implode('/', $mediosTransporte) : '';
                $estadosTransporteStr = is_array($estadosTransporte) ? implode('/', $estadosTransporte) : '';
                $consentimiento = $this->request->getPost('datos_consentimiento');

                // -------------------------------
                // Insertar datos generales
                // -------------------------------
                $userData = [
                    'id_users' => session('id_users'),
                    'datos_provincia' => $this->request->getPost('datos_provincia'),
                    'datos_canton' => $this->request->getPost('datos_canton'),
                    'datos_parroquias' => $this->request->getPost('datos_parroquias'),
                    'datos_tipo_parroquias' => $this->request->getPost('datos_tipo_parroquia'),
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
                    'datos_medio_transporte' => $mediosTransporteStr,
                    'datos_estado_transporte' => $estadosTransporteStr,
                    'datos_terrenos' => $this->request->getPost('datos_terrenos'),
                    'datos_celular' => $this->request->getPost('datos_celular'),
                    'datos_cantidad_celulare' => $this->request->getPost('datos_cantidad_celulare'),
                    'datos_plan_celular' => $this->request->getPost('datos_plan_celular'),
                    'datos_observacion' => $this->request->getPost('datos_observacion'),
                    'datos_resultado' => $this->request->getPost('datos_resultado'),
                    'datos_consentimiento' => $consentimiento,
                    'datos_parentesco_id' => null, // se actualizará luego
                ];
// dd($this->request->getPost());

                $idGeneral = $this->form->insertUsuario($userData); // ← Debes tener este método

                // -------------------------------
                // Insertar parentescos
                // -------------------------------
                $nombres = $this->request->getPost('parentesco_nombres') ?? [];
                $apellidos = $this->request->getPost('parentesco_apellidos') ?? [];
                $documentos = $this->request->getPost('parentesco_documento') ?? [];
                $telefonos = $this->request->getPost('parentesco_telefono') ?? [];
                $etnias = $this->request->getPost('parentesco_etnia') ?? [];
                $generos = $this->request->getPost('parentesco_genero') ?? [];
                $educacion = $this->request->getPost('parentesco_nivel_educacion') ?? [];
                $nacimientos = $this->request->getPost('parentesco_nacimiento') ?? [];
                $edades = $this->request->getPost('parentesco_edad') ?? [];
                $estado_civil = $this->request->getPost('parentesco_estado_civil') ?? [];
                $discapacidad = $this->request->getPost('parentesco_discapacidad') ?? [];
                $enfermedad = $this->request->getPost('parentesco_enfermedad') ?? [];
                $trabaja = $this->request->getPost('parentesco_trabaja') ?? [];
                $ocupacion = $this->request->getPost('parentesco_ocupacion') ?? [];
                $ingreso = $this->request->getPost('parentesco_ingreso') ?? [];
                $parentescos = $this->request->getPost('parentesco_parentesco') ?? [];

                $primerIdParentesco = null;

                for ($i = 0; $i < count($nombres); $i++) {
                    $relData = [
                        'datos_parentesco_nombres' => $nombres[$i],
                        'datos_parentesco_apellidos' => $apellidos[$i],
                        'datos_parentesco_documento' => $documentos[$i],
                        'datos_parentesco_celular_telf' => $telefonos[$i],
                        'datos_parentesco_etnia' => $etnias[$i],
                        'datos_parentesco_genero' => $generos[$i],
                        'datos_parentesco_nivel_educacion' => $educacion[$i],
                        'datos_parentesco_fecha_de_nacimiento' => $nacimientos[$i],
                        'datos_parentesco_edad' => $edades[$i],
                        'datos_parentesco_estado_civil' => $estado_civil[$i],
                        'datos_parentesco_discapacidad' => $discapacidad[$i],
                        'datos_parentesco_enfermedad_catastrofica' => $enfermedad[$i],
                        'datos_parentesco_trabaja' => $trabaja[$i],
                        'datos_parentesco_ocupacion' => $ocupacion[$i],
                        'datos_parentesco_ingreso_mensual' => $ingreso[$i],
                        'datos_parentesco_parentesco' => $parentescos[$i],
                    ];

                    $idRelacion = $this->relationship->insertReturnId($relData);

                    if ($i == 0) {
                        $primerIdParentesco = $idRelacion;
                    }

                    $this->generalInformationRelationship->insert([
                        'id_datos_generales' => $idGeneral,
                        'id_datos_parentescos' => $idRelacion,
                    ]);
                }

                // -------------------------------
                // Actualizar registro general con primer ID de parentesco
                // -------------------------------
                if ($primerIdParentesco !== null) {
                    $this->form->updateUsuario($idGeneral, [
                        'datos_parentesco_id' => $primerIdParentesco
                    ]);
                }

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

    public function getEthnicity()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getEthnicity", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('ETNIA');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getGenders()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getEthnicity", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('GENERO');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getEducationLevel()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getEthnicity", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('NIV-EDU');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getMaritalStatus()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getEthnicity", $routes)) {
                $itemSelected = $this->item_catalog->obtainActiveSelect('EST-CIV');
                echo json_encode($itemSelected);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }
}
