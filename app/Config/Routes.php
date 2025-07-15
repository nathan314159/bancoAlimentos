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

//Routes for users - main
$routes->get('/createAccountView', 'Principal::createAccountView');
$routes->post('/registerUser', 'Principal::registerUser');
$routes->post('/findUserMail', 'Principal::findUserMail');
$routes->post('/updateProfile', 'Users::updateProfile');
$routes->post('/updateProfilePassword', 'Users::updateProfilePassword');

//Routes for form general information 
$routes->get('/formGeneralInformation', 'GeneralInformation::formGeneralInformation');
$routes->post('/insertGeneralInformation', 'GeneralInformation::insertGeneralInformation');
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
$routes->get('/getTransportStatus', 'GeneralInformation::getTransportStatus');
$routes->get('/getEthnicity', 'GeneralInformation::getEthnicity');
$routes->get('/getGenders', 'GeneralInformation::getGenders');
$routes->get('/getEducationLevel', 'GeneralInformation::getEducationLevel');
$routes->get('/getMaritalStatus', 'GeneralInformation::getMaritalStatus');

//Routes for general information records
$routes->get('/informationRecords', 'GeneralInformationRecords::informationRecords');
$routes->post('/getRelationShipId', 'GeneralInformationRecords::getRelationShipId');
$routes->post('/deleteGeneralInformationRecord', 'GeneralInformationRecords::deleteGeneralInformationRecord');

//Routes for profile
$routes->get('/profile', 'Users::profile');