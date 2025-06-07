<?php

namespace App\Controllers\login;

use App\Models\Users;
use App\Controllers\BaseController;


class LoginController extends BaseController
{
    protected $users;

    public function __construct()
    {
        $this->users = new Users();
    }

    public function loginView()
    {
        echo view('layout/header.php');
        echo view('login/body.php');
    }

    public function verifyUser()
    {
        helper(['form']);

        $username = $this->request->getPost('users_nombreUsuario');
        $password = $this->request->getPost('users_contrasenia');
        var_dump($username);
        var_dump($password);
        $user = $this->users->findUser($username);

        if (!$user) {
            echo "El usuario no existe";
            return;
        }

        if (password_verify($password, $user['users_contrasenia'])) {
            echo "Existe y contraseña válida";
            // session()->set('usuario', $user); // optional session
        } else {
            echo "Contraseña incorrecta";
        }
    }
}
