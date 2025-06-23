<?php

namespace App\Controllers;

use App\Models\UsersMod;
use App\Models\RolAccessMod;
use App\Models\UserRolMod;

class Principal extends BaseController
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


    public function index()
    {
        echo "<script>if (window.history.replaceState) { // verificamos disponibilidad
			window.history.replaceState(null, null, window.location.href);
		}</script>";
        if ($this->session->has('id_users')) {
            principalPage();
        } else {
            echo view('login/body.php');
        }
    }

    public function createAccountView()
    {
        echo "<script>if (window.history.replaceState) { // verificamos disponibilidad
			window.history.replaceState(null, null, window.location.href);
		}</script>";
        if ($this->session->has('id_users')) {
        } else {
            echo view('register/body.php');
        }
    }

    // Basic function for validation login (this will work with javascript)
    public function verifyUser()
    {
        try {
            $user = $this->users->where([
                'users_email' => $this->request->getPost('users_email'),
                'users_contrasenia' => $this->request->getPost('users_contrasenia'),
                'users_estado' => 1
            ])->first();

            echo $user != null ? 1 : 0;
        } catch (\Exception $e) {
            echo 'Error en verifyUser: ' . $e->getMessage(); //Indica el mensaje exacto de error
        }
    }


    // Basic function for enter user to the system
    public function enterUser()
    {
        $user = $this->users->where(['users_email' => $this->request->getPost('users_email'), 'users_contrasenia' => $this->request->getPost('users_contrasenia')])->first();
        print_r($user);
        if ($user != null) {
            $this->session->set(sessionVariables($this->users->searchSessionVariables($user['id_users'])));
            redirectUser($this->users->searchRolUser($user['id_users']));
        } else {
            echo "<script>if (window.history.replaceState) { // verificamos disponibilidad
                window.history.replaceState(null, null, window.location.href);
            }</script>";

            echo view('login/body.php');
        }
    }

    public function logout()
    {
        echo "<script>if (window.history.replaceState) { // verificamos disponibilidad
			window.history.replaceState(null, null, window.location.href);
		}</script>";
        if ($this->session->has('id_users')) {
            $routes = $this->rol_access->getUrlsByRolId(session('id_rol'));
            if (accessController("/logout", $routes)) {
                session_destroy();
                echo "<script>if (window.history.replaceState) { // verificamos disponibilidad
                    window.history.replaceState(null, null, window.location.href);
                }</script>";

                echo view('login/body.php');
            } else {
                redirectUser($this->users->searchRolUser(session('id_users')));
            }
        } else {

            echo view('login/body.php');
        }
    }

    public function demoMain()
    {
        echo 'welcome ' . session('rol_nombre');
    }

    public function insertUser(){
        $user = [
            'users_nombre'        => $this->request->getPost("users_nombre"),
            'users_nombreUsuario' => $this->request->getPost("users_nombreUsuario"),
            'users_apellido'      => $this->request->getPost("users_apellido"),
            'users_cedula'        => $this->request->getPost("users_cedula"),
            'users_fecha_de_nacimiento'        => $this->request->getPost("users_fecha_de_nacimiento"),
            'users_email'         => $this->request->getPost("users_email"),
            'users_telefono'      => $this->request->getPost("users_telefono"),
            'users_contrasenia'   => $this->request->getPost("users_contrasenia"),
        ];

        $this->user_rol->insertUserRolDefault($this->users->registerUser($user));
    }


}
