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
$routes->get('/getProvinces', 'GeneralInformation::getProvinces');
$routes->get('/getCities', 'GeneralInformation::getCities');
$routes->get('/getParishes', 'GeneralInformation::getParishes');
$routes->get('/getTypesHousing', 'GeneralInformation::getTypesHousing');
$routes->get('/getRoofTypes', 'GeneralInformation::getRoofTypes');
$routes->get('/getWallTypes', 'GeneralInformation::getWallTypes');
$routes->get('/getFloorTypes', 'GeneralInformation::getFloorTypes');
$routes->get('/getCookingFuel', 'GeneralInformation::getCookingFuel');
$routes->get('/getHygienicServices', 'GeneralInformation::getHygienicServices');
$routes->get('/getHousing', 'GeneralInformation::getHousing');
$routes->get('/getWaterServices', 'GeneralInformation::getWaterServices');
$routes->get('/getGarbageRemoval', 'GeneralInformation::getGarbageRemoval');
$routes->get('/getFrequentShopPlaces', 'GeneralInformation::getFrequentShopPlaces');
$routes->get('/getVehiclesTypes', 'GeneralInformation::getVehiclesTypes');
$routes->get('/getTransportStatus', 'GeneralInformation::getTransportStatus');