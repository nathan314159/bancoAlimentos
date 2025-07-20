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
    public function updateProfile()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/updateProfile", $routes)) {
                $this->users->actualizarContacto(session('id_users'), $this->request->getPost("users_email"), $this->request->getPost("users_telefono"));
                session_destroy();
                principalPage();
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    // otra para actualizar contraseña
    public function updateProfilePassword()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/updateProfilePassword", $routes)) {
                $this->users->actualizarContrasenia(session('id_users'), password_hash($this->request->getPost("users_contrasenia"), PASSWORD_DEFAULT));
                session_destroy();
                principalPage();
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getDocument()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getDocument", $routes)) {
                $document = $this->users->searchUserDocument($this->request->getPost('document'));
                echo json_encode($document);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function getRoles()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/getRoles", $routes)) {
                $roles = $this->users->searchAllRoles();
                echo json_encode($roles);
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }

    public function updateRolUser()
    {
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/updateRolUser", $routes)) {
                $this->users->actualizarRolUsuario($this->request->getPost("id_users"), $this->request->getPost("nuevo_rol"));
                header("Location: " . base_url(). "profile");
                exit;
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {
            echo view('login/body.php');
        }
    }
}
