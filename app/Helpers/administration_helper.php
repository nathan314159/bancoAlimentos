<?php

//Control session
function sessionVariables($user)
{
    $vardata = [
        'id_users' => $user[0]->id_users,
        'users_nombre' => $user[0]->users_nombre,
        'users_apellido' => $user[0]->users_apellido,
        'users_nombreUsuario' => $user[0]->users_nombreUsuario,
        'users_email' => $user[0]->users_email,
        'users_genero' => $user[0]->users_genero,
        'id_rol' => $user[0]->id_rol,
        'rol_nombre' => $user[0]->rol_nombre,
        'login' => true
    ];

    return $vardata;
}

//Redirect user rol
function redirectUser($routes)
{
    if (strcmp($routes[0]->rol_nombre, "Administrador") === 0) {
        principalPage();
    }else if (strcmp($routes[0]->rol_nombre, "Empleado") === 0) {
        principalPage();
    }
}

//Principal page for rol
function principalPage()
{
    header("Location: " . base_url(). "formGeneralInformation");
    exit;
}

//Verify access route for rol user
function accessController($currentRoute, $availableRoutes)
{
    $verified = 0;
    foreach ($availableRoutes as $route) {
        if (strcmp($route['funcionalidad_url'], $currentRoute) === 0 && $verified == 0) {
            $verified = 1;
        }
    }

    if ($verified == 0) {
        return false;
    } else {
        return true;
    }
}
