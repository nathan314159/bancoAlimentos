<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */
//Routes for main page
$routes->get('/', 'Principal::index');
$routes->get('/demoMain', 'Principal::demoMain'); //Delete this route when the system is finished

//Routes for login and verify user
$routes->post('/verifyUser', 'Principal::verifyUser');
$routes->post('/enterUser', 'Principal::enterUser');
$routes->get('/logout', 'Principal::logout');

//Routes for create users - main
$routes->get('/createAccountView', 'Principal::createAccountView');
$routes->post('/registerUser', 'Principal::registerUser');
$routes->post('/findUserMail', 'Principal::findUserMail');

//Routes for form general information 
$routes->get('/formGeneralInformation', 'GeneralInformation::formGeneralInformation');
$routes->post('/insertDatosGenerales', 'GeneralInformation::create');

