<?php

namespace App\Controllers\register;

use App\Controllers\BaseController;
use App\Models\Users;

class RegisterController extends BaseController
{

    protected $users;

    public function __construct()
    {
        $this->users = new Users();
    }

    public function index()
    {
        //return view('register/signup');
        echo view('layout/header.php');
        echo view('register/body.php');
    }

    public function create()
    {
        helper(['form']);

        $rules = [
            'nombreUsuario'   => 'required|max_length[100]|is_unique[tbl_users.users_nombreUsuario]',
            'nombre'          => 'required|max_length[25]',
            'apellido'        => 'required|max_length[25]',
            'email'           => 'required|valid_email|max_length[100]|is_unique[tbl_users.users_email]',
            'cedula'          => 'required|max_length[25]|is_unique[tbl_users.users_cedula]',
            'telefono'        => 'required|max_length[25]',
            'fechaNacimiento' => 'required',
            'genero'          => 'required|in_list[1,2,3]',
            'password'        => 'required|min_length[6]',
            'repassword'      => 'required|matches[password]',
        ];

        if (!$this->validate($rules)) {
            log_message('debug', 'Validation failed. Errors: ' . $this->validator->listErrors());

            return redirect()->back()->withInput()->with("errors", $this->validator->listErrors());
        }

        $userData = [
            'users_nombreUsuario' => $this->request->getPost('nombreUsuario'),
            'users_nombre'        => $this->request->getPost('nombre'),
            'users_apellido'      => $this->request->getPost('apellido'),
            'users_email'         => $this->request->getPost('email'),
            'users_cedula'        => $this->request->getPost('cedula'),
            'users_telefono'      => $this->request->getPost('telefono'),
            'users_fecha_de_nacimiento' => $this->request->getPost('fechaNacimiento'),
            'users_genero'        => $this->request->getPost('genero'),
            'users_contrasenia'      => password_hash($this->request->getPost('password'), PASSWORD_DEFAULT),
        ];

        $this->users->insertUsuario($userData);
    }
}
