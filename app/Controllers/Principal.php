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
            $user = $this->users
                ->where('users_email', $this->request->getPost('users_email'))
                ->where('users_estado', 1)
                ->first();

            if ($user && password_verify($this->request->getPost('users_contrasenia'), $user['users_contrasenia'])) {
                echo 1;
            } else {
                echo 0;
            }
        } catch (\Exception $e) {
            echo 'Error en verifyUser: ' . $e->getMessage();
        }
    }



    // Basic function for enter user to the system
    public function enterUser()
    {
        $email = $this->request->getPost('users_email');
        $password = $this->request->getPost('users_contrasenia');

        // Search email
        $user = $this->users
            ->where('users_email', $email)
            ->first();

        // Verify user and password
        if ($user && password_verify($password, $user['users_contrasenia'])) {
            // Success login: Enter user
            $this->session->set(
                sessionVariables(
                    $this->users->searchSessionVariables($user['id_users'])
                )
            );

            redirectUser($this->users->searchRolUser($user['id_users']));
        } else {
            // Failed login: clean browsing history and return to login
            echo "<script>
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }
            </script>";

            echo view('login/body.php');
        }
    }


    //Function for close session
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


    //Find repeated mail when create account
    public function findUserMail()
    {
        try {
            $user = $this->users
                ->where('users_email', $this->request->getPost('users_email'))
                ->orWhere('users_cedula', $this->request->getPost('users_cedula'))
                ->first();

            echo $user != null ? 0 : 1;
        } catch (\Exception $e) {
            echo 'Error en verifyUser: ' . $e->getMessage(); //Indica el mensaje exacto de error
        }
    }

    // Register user
    public function registerUser()
    {
        $user = [
            'users_nombre'              => $this->request->getPost("users_nombre"),
            'users_nombreUsuario'       => $this->request->getPost("users_nombreUsuario"),
            'users_apellido'            => $this->request->getPost("users_apellido"),
            'users_cedula'              => $this->request->getPost("users_cedula"),
            'users_fecha_de_nacimiento' => $this->request->getPost("users_fecha_de_nacimiento"),
            'users_email'               => $this->request->getPost("users_email"),
            'users_telefono'            => $this->request->getPost("users_telefono"),
            'users_contrasenia'         => password_hash($this->request->getPost("users_contrasenia"), PASSWORD_DEFAULT), // store the hashed password
        ];

        $this->user_rol->insertUserRolDefault($this->users->registerUser($user));

        principalPage();
    }
}
