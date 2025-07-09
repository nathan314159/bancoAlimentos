<?php

namespace App\Controllers;

use App\Models\UsersMod;
use App\Models\RolAccessMod;
use App\Models\UserRolMod;

class Users extends BaseController
{
    protected $users;
    protected $rol_access;
    protected $user_rol;

    public $session = null;

    public function __construct()
    {
        $this->session = \Config\Services::session();
        $this->users = new UsersMod();
        $this->rol_access = new RolAccessMod();
        $this->user_rol = new UserRolMod();
    }

    public function profile()
    {
        echo "<script>if (window.history.replaceState) { // verificamos disponibilidad
			window.history.replaceState(null, null, window.location.href);
		}</script>";
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/profile", $routes)) {
                $arrayFunction = ['function' => 'modificar perfil'];
                $actualUser = $this->users->searchUserPorfile(session('id_users'));
                
                echo view("layout/header");
                echo view("layout/aside", $arrayFunction);
                echo view("profile/body", ['user' => $actualUser[0]]);
                echo view("layout/footer", $arrayFunction);
                
                //print_r($actualUser);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    // funcion con post una para actualizar el perfil
    // otra para actualizar contraseña
    
}
