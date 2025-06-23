<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\GeneralInformationMod;
use App\Models\UsersMod;
use App\Models\RolAccessMod;
use App\Models\UserRolMod;

class GeneralInformation extends BaseController
{
    protected $form;
    protected $users;
    protected $rol_access;
    protected $user_rol;


    public function __construct()
    {
        $this->session = \Config\Services::session();
        $this->users = new UsersMod();
        $this->rol_access = new RolAccessMod();
        $this->user_rol = new UserRolMod();
        $this->form = new GeneralInformationMod();
    }

    public function formGeneralInformation()
    {
        echo "<script>if (window.history.replaceState) { // verificamos disponibilidad
			window.history.replaceState(null, null, window.location.href);
		}</script>";
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/formGeneralInformation", $routes)) {
                echo view('generalInformation/body');
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function create()
    {
        $userData = [
            'id_users' => 3,
            'datos_provincia'        => $this->request->getPost('datos_provincia'),
            'datos_canton'      => $this->request->getPost('datos_canton'),
            'datos_parroquias'         => $this->request->getPost('datos_parroquias'),
            'datos_comunidades'        => $this->request->getPost('datos_comunidades'),
            'datos_barrios'      => $this->request->getPost('datos_barrios'),
            'datos_tipo_viviendas' => $this->request->getPost('datos_tipo_viviendas'),
            'datos_techos'        => $this->request->getPost('datos_techos'),
            'datos_paredes' => $this->request->getPost('datos_paredes'),
            'datos_pisos'        => $this->request->getPost('datos_pisos'),
            'datos_cuarto'      => $this->request->getPost('datos_cuarto'),
            'datos_combustibles_cocina'         => $this->request->getPost('datos_combustibles_cocina'),
            'datos_servicios_higienicos'        => $this->request->getPost('datos_servicios_higienicos'),
            'datos_barrios'      => $this->request->getPost('datos_barrios'),
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
            'datos_medio_transporte' => $this->request->getPost('datos_medio_transporte'),
            'datos_estado_transporte' => $this->request->getPost('datos_estado_transporte'),
            'datos_servicios_higienicos' => $this->request->getPost('datos_servicios_higienicos'),
            'datos_terrenos' => $this->request->getPost('datos_terrenos'),
            'datos_celular' => $this->request->getPost('datos_celular'),
            'datos_cantidad_celulare' => $this->request->getPost('datos_cantidad_celulare'),
            'datos_plan_celular' => $this->request->getPost('datos_plan_celular'),
        ];
        $this->form->insertUsuario($userData);
    }
}
