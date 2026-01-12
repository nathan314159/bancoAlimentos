-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 12, 2026 at 06:50 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `badi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_catalogo`
--

CREATE TABLE `tbl_catalogo` (
  `id_catalogo` int(11) NOT NULL,
  `cat_codigo` varchar(25) DEFAULT NULL,
  `cat_nombre` varchar(250) DEFAULT NULL,
  `ca_estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_catalogo`
--

INSERT INTO `tbl_catalogo` (`id_catalogo`, `cat_codigo`, `cat_nombre`, `ca_estado`) VALUES
(18, 'PROV', 'Provincias', 1),
(19, 'CANT', 'Cantones', 1),
(20, 'PARR', 'Parroquias', 1),
(22, 'TIPOVIVIENDA', 'Tipo de vivienda', 1),
(23, 'TIPOTECHO', 'Tipo de techos', 1),
(24, 'TIPOPARED', 'Tipo de pared', 1),
(25, 'TIPOPISO', 'Tipo de piso', 1),
(26, 'COMB-COCINA', 'Combustible cocina', 1),
(27, 'SERV-HIG', 'Servicios higiénicos', 1),
(28, 'ALOJAMIENTO', 'Vivienda o alojamiento', 1),
(29, 'SERV-AGUA', 'Servicio de agua', 1),
(30, 'ELM-BAS', 'Eliminación de basura', 1),
(31, 'LUG-FREC-COMPRA', 'Lugares frecuentes de compra', 1),
(32, 'TIP-VEHICULOS', 'Tipo de vehículos', 1),
(33, 'EST-TRANSPORTE', 'Estados de tranporte', 1),
(34, 'ETNIA', 'Etnias', 1),
(35, 'GENERO', 'Lista de géneros', 1),
(36, 'NIV-EDU', 'Nivel de educación', 1),
(37, 'EST-CIV', 'Estado civil', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datos_generales`
--

CREATE TABLE `tbl_datos_generales` (
  `id_datos_generales` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `datos_parentesco_id` tinyint(4) DEFAULT NULL,
  `datos_provincia` int(11) DEFAULT NULL,
  `datos_canton` varchar(250) DEFAULT NULL,
  `datos_tipo_parroquias` varchar(100) DEFAULT NULL,
  `datos_parroquias` int(11) DEFAULT NULL,
  `datos_comunidades` varchar(500) DEFAULT NULL,
  `datos_barrios` varchar(500) DEFAULT NULL,
  `datos_tipo_viviendas` int(11) DEFAULT NULL,
  `datos_techos` int(11) DEFAULT NULL,
  `datos_paredes` int(11) DEFAULT NULL,
  `datos_pisos` int(11) DEFAULT NULL,
  `datos_cuarto` int(11) DEFAULT NULL,
  `datos_combustibles_cocina` int(11) DEFAULT NULL,
  `datos_servicios_higienicos` int(11) DEFAULT NULL,
  `datos_viviendas` int(11) DEFAULT NULL,
  `datos_pago_vivienda` int(11) DEFAULT NULL,
  `datos_agua` int(11) DEFAULT NULL,
  `datos_pago_agua` decimal(10,0) DEFAULT NULL,
  `datos_pago_luz` tinyint(1) DEFAULT NULL,
  `datos_cantidad_luz` decimal(10,0) DEFAULT NULL,
  `datos_internet` tinyint(1) DEFAULT NULL,
  `datos_pago_internet` decimal(10,0) DEFAULT NULL,
  `datos_tv_cable` tinyint(1) DEFAULT NULL,
  `datos_tv_pago` decimal(10,0) DEFAULT NULL,
  `datos_eliminacion_basura` int(11) DEFAULT NULL,
  `datos_lugares_mayor_frecuencia_viveres` int(11) DEFAULT NULL,
  `datos_gastos_viveres_alimentacion` int(11) DEFAULT NULL,
  `datos_medio_transporte` varchar(1000) DEFAULT NULL,
  `datos_estado_transporte` varchar(1000) DEFAULT NULL,
  `datos_terrenos` tinyint(1) DEFAULT NULL,
  `datos_celular` tinyint(1) DEFAULT NULL,
  `datos_cantidad_celulare` int(11) DEFAULT NULL,
  `datos_plan_celular` tinyint(1) DEFAULT NULL,
  `datos_observacion` varchar(1000) DEFAULT NULL,
  `datos_resultado` varchar(250) DEFAULT NULL,
  `datos_resultado_sistema` varchar(250) DEFAULT NULL,
  `datos_estado` tinyint(4) DEFAULT 1,
  `datos_consentimiento` tinyint(1) DEFAULT 1,
  `datos_created_at` datetime DEFAULT current_timestamp(),
  `datos_updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_datos_generales`
--

INSERT INTO `tbl_datos_generales` (`id_datos_generales`, `id_users`, `datos_parentesco_id`, `datos_provincia`, `datos_canton`, `datos_tipo_parroquias`, `datos_parroquias`, `datos_comunidades`, `datos_barrios`, `datos_tipo_viviendas`, `datos_techos`, `datos_paredes`, `datos_pisos`, `datos_cuarto`, `datos_combustibles_cocina`, `datos_servicios_higienicos`, `datos_viviendas`, `datos_pago_vivienda`, `datos_agua`, `datos_pago_agua`, `datos_pago_luz`, `datos_cantidad_luz`, `datos_internet`, `datos_pago_internet`, `datos_tv_cable`, `datos_tv_pago`, `datos_eliminacion_basura`, `datos_lugares_mayor_frecuencia_viveres`, `datos_gastos_viveres_alimentacion`, `datos_medio_transporte`, `datos_estado_transporte`, `datos_terrenos`, `datos_celular`, `datos_cantidad_celulare`, `datos_plan_celular`, `datos_observacion`, `datos_resultado`, `datos_resultado_sistema`, `datos_estado`, `datos_consentimiento`, `datos_created_at`, `datos_updated_at`) VALUES
(10, 3, NULL, NULL, NULL, NULL, NULL, 'Esto es una prueba ', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'Moto', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-02 10:09:43', '2025-07-02 10:09:43'),
(11, 16, 0, 3, '0', 'urbano', 99, '123', '123', 169, 172, 176, 181, 0, 187, 191, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Malo', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:01:19', '2025-07-07 11:01:19'),
(12, 16, 0, 3, '0', 'urbano', 99, '123', '123', 169, 172, 176, 181, 0, 187, 191, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Malo', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:02:43', '2025-07-07 11:02:43'),
(13, 16, 0, 3, '0', 'urbano', 100, '123', '123', 168, 172, 176, 181, 0, 187, 192, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:07:04', '2025-07-07 11:07:04'),
(14, 16, 0, 2, '0', 'urbano', 141, 'asd', 'asd', 168, 172, 176, 181, 0, 187, 192, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:09:15', '2025-07-07 11:09:15'),
(15, 16, 0, 2, '0', 'urbano', 141, 'asd', 'asd', 168, 172, 176, 181, 0, 187, 192, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:11:19', '2025-07-07 11:11:19'),
(16, 16, 0, 2, '0', 'urbano', 141, '123', '123', 169, 172, 176, 181, 0, 187, 194, 197, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 227, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:13:00', '2025-07-07 11:13:00'),
(17, 16, NULL, 3, '0', 'urbano', 100, 'asd', 'asd', 169, 172, 176, 181, 0, 187, 191, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:15:38', '2025-07-07 11:15:38'),
(18, 16, NULL, 3, '0', 'urbano', 127, 'sdf', 'sdf', 168, 172, 176, 181, 0, 188, 191, 199, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:33:08', '2025-07-07 11:33:08'),
(19, 16, NULL, 3, '0', 'urbano', 127, 'sdf', 'sdf', 168, 172, 176, 181, 0, 188, 191, 199, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:36:18', '2025-07-07 11:36:18'),
(20, 16, 8, 3, '0', 'urbano', 127, 'sdf', 'sdf', 168, 172, 176, 181, 0, 188, 191, 199, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:37:53', '2025-07-07 11:37:53'),
(21, 16, 10, 2, '0', 'urbano', 141, 'Campo 1', 'Barrio 1', 169, 172, 176, 181, 4, 187, 192, 200, 150, 127, 23, 13, 123, 0, 45, 0, 18, 217, 222, 500, 'Carro/Moto', 'Bueno/Regular', 0, 0, 2, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:41:24', '2025-07-07 11:41:24'),
(22, 16, 12, 2, '0', 'urbano', 141, '123', '123', 168, 172, 176, 181, 0, 189, 191, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:45:45', '2025-07-07 11:45:45'),
(23, 16, 13, 2, '0', 'urbano', 141, '123', '123', 168, 172, 176, 181, 12, 187, 191, 200, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 227, 0, 'Carro/Carro/Pasola a gasolina/Pasola a gasolina', 'Bueno/Bueno/Bueno/Regular', 0, 0, 0, 0, '', NULL, NULL, 1, 0, '2025-07-07 11:57:19', '2025-07-07 11:57:19'),
(24, 16, 0, 2, '0', 'urbano', 141, 'dfg', 'dfg', 168, 172, 176, 182, 0, 187, 191, 199, 0, 127, 0, 0, 0, 0, 0, 0, 0, 218, 222, 0, 'Carro/Carro/Carro', 'Bueno/Bueno/Bueno', 0, 0, 0, 0, '', NULL, NULL, 0, 0, '2025-07-07 12:06:26', '2025-07-07 12:06:26'),
(25, 17, 15, 2, '0', 'urbano', 155, '123', '123', 170, 173, 177, 182, 12, 187, 191, 196, 12, 127, 12, 12, 12, 0, 12, 0, 12, 217, 227, 12, 'Ninguno', 'Ninguno', 0, 0, 2, 0, '', NULL, NULL, 0, 0, '2025-07-18 22:37:32', '2025-07-18 22:37:32'),
(26, 17, 16, 2, 'Espejo', 'urbano', 155, '123', '123', 168, 173, 176, 181, 12, 187, 191, 196, 12, 127, 12, 12, 12, 0, 12, 0, 12, 217, 222, 12, 'Ninguno', 'Ninguno', 0, 0, 12, 0, '', NULL, NULL, 0, 0, '2025-07-18 22:55:15', '2025-07-18 22:55:15'),
(27, 17, 17, 3, 'Antonio Ante', 'urbano', 127, '12', '12', 168, 172, 176, 181, 12, 187, 191, 196, 12, 127, 12, 12, 12, 0, 0, 0, 0, 217, 222, 12, 'Ninguno', 'Ninguno', 0, 0, 12, 0, 'Observaciones de prueba .......', NULL, NULL, 0, 0, '2025-07-18 23:06:17', '2025-07-18 23:06:17'),
(28, 17, 18, 2, 'Tulcán', 'urbano', 141, '111', '1111', 169, 173, 176, 182, 111, 187, 191, 197, 11, 127, 11, 11, 11, 0, 11, 0, 11, 217, 222, 11, 'Ninguno', 'Ninguno', 0, 0, 0, 0, '- Obs 1\r\n- Obs 2\r\n- Obs 3\r\n- Obs 4', NULL, NULL, 0, 0, '2025-07-18 23:08:45', '2025-07-18 23:08:45'),
(29, 17, 19, 2, 'Tulcán', 'urbano', 141, '123', '123', 168, 172, 176, 181, 12, 188, 194, 196, 12, 127, 12, 12, 12, 0, 0, 0, 0, 217, 222, 0, 'Ninguno', 'Ninguno', 0, 0, 12, 0, 'dfsdfsdfsdf', NULL, NULL, 0, 0, '2025-07-18 23:11:52', '2025-07-18 23:11:52'),
(30, 17, 20, 2, 'Tulcán', 'rural', 143, 'sdfsdfsdf', 'sdfsdfsdfsdffsd', 168, 172, 176, 181, 2, 188, 192, 196, 450, 127, 21, 21, 21, 0, 21, 0, 21, 220, 227, 100, 'Carro', 'Malo', 0, 0, 2, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', NULL, 1, 0, '2025-07-19 12:12:32', '2025-07-19 12:12:32'),
(31, 17, 21, 3, 'Ibarra', 'urbano', 101, 'sdfsdf', 'sdfsdf', 168, 172, 176, 181, 2, 187, 191, 197, 2, 127, 2, 2, 2, 0, 2, 0, 2, 218, 226, 2, 'Ninguno', 'Ninguno', 0, 0, 2, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', NULL, 1, 0, '2025-07-19 15:28:25', '2025-07-19 15:28:25'),
(32, 17, 23, 2, 'Tulcán', 'urbano', 141, 'sdfsdf', 'sdfsdf', 168, 173, 176, 181, 2, 187, 191, 196, 45, 127, 5, 5, 5, 0, 5, 0, 5, 217, 222, 5, 'Ninguno', 'Ninguno', 0, 0, 2, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', NULL, 1, 0, '2025-07-21 11:14:50', '2025-07-21 11:14:50'),
(33, 18, 25, 2, 'Bolívar', 'urbano', 150, 'Comunidad Ejemplo', 'Barrio ejemplo', 169, 172, 176, 182, 2, 188, 191, 197, 90, 127, 12, 12, 12, 0, 12, 0, 12, 217, 223, 12, 'Ninguno', 'Ninguno', 0, 0, 2, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', NULL, 1, 0, '2025-07-21 11:27:40', '2025-07-21 11:27:40'),
(34, 20, 27, 3, 'Cotacachi', 'urbano', 121, 'Comunidad 1', 'Barrio 1', 168, 172, 176, 181, 3, 187, 191, 198, 23, 127, 12, 12, 20, 0, 0, 0, 0, 218, 225, 500, 'Ninguno', 'Ninguno', 0, 0, 3, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', NULL, 1, 0, '2025-07-21 16:33:10', '2025-07-21 16:33:10'),
(35, 16, 28, 3, 'Ibarra', 'urbano', 100, 'Comunidad 1', 'Barrio 1', 168, 172, 176, 185, 2, 187, 191, 196, 0, 127, 12, 3, 0, 0, 12, 0, 5, 217, 223, 40, 'Carro/Moto', 'Malo/Regular', 0, 0, 0, 0, 'sdfghjkl', 'No aprobado', NULL, 1, 0, '2025-08-12 19:20:37', '2025-08-12 19:20:37'),
(36, 18, 30, 2, 'Tulcán', 'urbano', 141, 'fdfdfd', '12344', 168, 173, 177, 181, 2, 187, 191, 196, 222, 127, 22, 22, 2, 0, 22, 0, 22, 217, 226, 22, 'Carro', 'Malo', 0, 0, 0, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', NULL, 1, 0, '2025-08-14 16:37:26', '2025-08-14 16:37:26'),
(37, 18, 32, 3, 'Ibarra', 'urbano', 102, 'fdfdfd', '12344', 169, 172, 177, 181, 2, 188, 191, 196, 120, 127, 22, 22, 2, 0, 22, 0, 2, 217, 222, 123, 'Pasola a gasolina', 'Malo', 0, 0, 0, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', NULL, 1, 0, '2025-08-14 19:00:48', '2025-08-14 19:00:48'),
(38, 23, 33, 3, 'Ibarra', 'urbano', 103, 'fdfdfd', '12344', 168, 173, 177, 181, 2, 187, 191, 196, 55, 127, 4, 12, 0, 0, 12, 0, 0, 217, 223, 100, 'Carro', 'Regular', 0, 0, 1, 0, 'la ', 'No aprobado', NULL, 1, 0, '2025-08-26 11:24:45', '2025-08-26 11:24:45'),
(39, 23, 35, 3, 'Ibarra', 'urbano', 101, '12344', '12344', 168, 172, 176, 181, 2, 190, 194, 197, 22, 127, 33, 11, 11, 0, 12, 0, 12, 219, 223, 2, 'Carro', 'Regular', 0, 0, 2, 0, 'Los gastos no exceden al ingreso mensual y se detectan vehículos con estado regular o bueno', 'Aprobado', NULL, 1, 0, '2025-08-26 11:50:09', '2025-08-26 11:50:09'),
(40, 18, 37, 2, 'Bolívar', 'urbano', 150, '12344', '12344', 169, 172, 176, 182, 22, 187, 191, 200, 2, 127, 2, 2, 2, 0, 0, 0, 0, 218, 225, 222, 'Moto/Moto/Moto/Moto', 'Regular/Regular/Regular/Regular', 0, 0, 0, 0, 'Los gastos exceden al ingreso mensual y se detectan vehículos con estado regular o bueno', 'No aprobado', NULL, 1, 0, '2025-09-10 12:52:51', '2025-09-10 12:52:51'),
(41, 18, 38, 2, 'Tulcán', 'urbano', 141, '12344', '12344', 168, 172, 177, 182, 2, 188, 194, 197, 2, 127, 2, 2, 2, 0, 2, 0, 0, 218, 222, 22, 'Carro', 'Bueno', 0, 0, 2, 0, 'Los gastos no exceden al ingreso mensual y se detectan vehículos con estado regular o bueno', 'No aprobado', NULL, 1, 0, '2025-09-10 13:03:02', '2025-09-10 13:03:02'),
(42, 18, 39, 3, 'Antonio Ante', 'rural', 128, '12344', '12344', 168, 172, 176, 181, 2, 187, 194, 200, 2, 127, 2, 2, 2, 0, 0, 0, 0, 221, 228, 2, 'Carro', 'Regular', 0, 0, 0, 0, 'Los gastos no exceden al ingreso mensual y se detectan vehículos con estado regular o bueno', 'No aprobado', NULL, 1, 0, '2025-09-11 15:52:20', '2025-09-11 15:52:20'),
(43, 18, 40, 2, 'Tulcán', 'urbano', 141, 'fdfdfd', '12344', 168, 172, 176, 181, 2, 187, 191, 200, 2, 127, 2, 2, 2, 0, 2, 0, 2, 217, 227, 2, 'Ninguno', 'Ninguno', 0, 0, 3, 0, 'Los gastos no exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'No aprobado', NULL, 1, 1, '2025-09-29 20:08:45', '2025-09-29 20:08:45'),
(44, 18, 41, 2, 'Bolívar', 'urbano', 150, '1', '22', 168, 172, 176, 181, 2, 187, 194, 196, 2, 127, 2, 2, 2, 0, 2, 0, 2, 217, 224, 2, 'Carro', 'Bueno', 0, 0, 2, 0, 'Los gastos exceden al ingreso mensual y se detectan vehículos con estado regular o bueno', 'No aprobado', NULL, 1, 1, '2025-09-29 20:11:02', '2025-09-29 20:11:02'),
(45, 18, 42, 3, 'Ibarra', 'urbano', 102, '12344', '2', 169, 172, 176, 181, 2, 187, 191, 196, 22, 127, 2, 2, 2, 0, 2, 0, 2, 217, 225, 2222, 'Ninguno', 'Ninguno', 0, 0, 2, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', NULL, 1, 1, '2025-10-14 13:56:39', '2025-10-14 13:56:39'),
(46, 18, 46, 2, 'Tulcán', 'urbano', 141, '12344', '2', 168, 172, 176, 181, 22, 189, 191, 196, 2, 127, 2, 2, 2, 0, 0, 0, 2, 217, 222, 222, 'Ninguno', 'Ninguno', 0, 0, 0, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', 'Pendiente', 1, 1, '2025-10-21 14:00:27', '2025-10-21 14:00:27'),
(47, 18, 47, 3, 'Antonio Ante', 'urbano', 127, '12344', '2', 168, 172, 176, 181, 2, 188, 191, 196, 2, 127, 2, 2, 2, 0, 22, 0, 2, 219, 227, 222, 'Ninguno', 'Ninguno', 0, 0, 0, 0, 'Los gastos no exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'No aprobado', 'Pendiente', 1, 1, '2025-10-21 14:18:32', '2025-10-21 14:18:32'),
(48, 18, 48, 3, 'Antonio Ante', 'rural', 130, '1', '1', 169, 173, 177, 181, 2, 187, 192, 198, 222, 127, 22, 2, 2, 0, 0, 0, 0, 218, 224, 222, 'Ninguno', 'Ninguno', 0, 0, 2, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', 'Pendiente', 1, 1, '2025-10-21 14:27:33', '2025-10-21 14:27:33'),
(49, 18, 49, 2, 'Montúfar', 'rural', 166, '1', '1', 168, 172, 176, 181, 2, 188, 191, 197, 2, 127, 2, 2, 2, 0, 0, 0, 0, 217, 223, 222, 'Ninguno', 'Ninguno', 0, 0, 0, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', 'Pendiente', 1, 1, '2025-10-21 14:31:24', '2025-10-21 14:31:24'),
(50, 18, 50, 2, 'Tulcán', 'urbano', 141, '12344', 'dfdfdf', 168, 172, 176, 182, 2, 187, 191, 196, 2, 127, 2, 2, 2, 0, 2, 0, 0, 220, 222, 222, 'Ninguno', 'Ninguno', 0, 0, 0, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', 'Pendiente', 1, 1, '2025-10-21 21:20:50', '2025-10-21 21:20:50'),
(51, 18, 51, 2, 'Bolívar', 'urbano', 150, '12344', 'dfdfdf', 168, 172, 176, 181, 1, 189, 193, 197, 1, 127, 1, 1, 1, 0, 1, 0, 0, 221, 225, 1111, 'Ninguno', 'Ninguno', 0, 0, 0, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', 'Aprobado', 1, 1, '2025-10-21 21:22:24', '2025-10-21 21:22:24'),
(52, 18, 52, 3, 'Ibarra', 'rural', 109, '12344', 'dfdfdf', 170, 173, 177, 183, 1, 188, 191, 200, 1, 127, 1, 1, 1, 0, 0, 0, 0, 221, 228, 111, 'Ninguno', 'Ninguno', 0, 0, 0, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'No aprobado', 'Aprobado', 1, 1, '2025-10-21 21:24:42', '2025-10-21 21:24:42'),
(53, 18, 53, 2, '10', '20', 141, 'ddd', 'ddd', 169, 172, 177, 184, 2, 188, 195, 197, 2, 127, 2, 2, 2, 0, 0, 0, 0, 218, 225, 2, 'Moto o pasola eléctrica', 'Regular', 0, 0, 0, 0, '2dd', NULL, 'Sincronizado', 1, 1, '2026-01-01 14:08:10', '2026-01-01 14:08:10'),
(54, 18, 54, 3, '4', '20', 100, '77', '777', 169, 173, 179, 184, 7, 190, 195, 199, 7, 127, 7, 7, 7, 0, 0, 0, 0, 220, 227, 7, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 0, '7', NULL, 'Sincronizado', 1, 1, '2026-01-01 17:02:36', '2026-01-01 17:02:36'),
(55, 18, 55, 3, '4', '20', 100, '77', '777', 169, 173, 179, 184, 7, 190, 195, 199, 7, 127, 7, 7, 7, 0, 0, 0, 0, 220, 227, 7, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 0, '7', NULL, 'Sincronizado', 1, 1, '2026-01-01 17:02:38', '2026-01-01 17:02:38'),
(56, 18, 56, 2, '10', '20', 141, 'f', 'f', 171, 175, 179, 184, 0, 187, 191, 200, 4, 127, 4, 4, 4, 0, 0, 0, 0, 221, 227, 4, 'Ninguno', 'Malo', 1, 0, 0, 0, '4', NULL, 'Sincronizado', 1, 1, '2026-01-01 17:02:39', '2026-01-01 17:02:39'),
(57, 18, 57, 2, '10', '20', 141, '3', '3', 169, 173, 177, 181, 3, 189, 194, 201, 3, 127, 3, 3, 3, 1, 3, 0, 0, 220, 227, 3, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 1, '3333333333333333333333333333333333333333333', NULL, 'Sincronizado', 1, 1, '2026-01-01 17:02:40', '2026-01-01 17:02:40'),
(58, 18, 58, 2, '10', '20', 142, '4', '4', 169, 173, 177, 181, 4, 188, 191, 199, 4, 127, 4, 4, 4, 0, 0, 0, 0, 219, 228, 4, 'Moto', 'Regular', 0, 1, 4, 0, '4444444', NULL, 'Sincronizado', 1, 1, '2026-01-01 17:11:38', '2026-01-01 17:11:38'),
(59, 16, NULL, 3, '5', '20', 129, '2', '2', 168, 172, 179, 185, 2, 187, 194, 199, 2, 127, 2, 2, 2, 0, 0, 0, 0, 220, 227, 2, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 1, '2', NULL, 'Sincronizado', 1, 1, '2026-01-01 17:18:18', '2026-01-01 17:18:18'),
(60, 16, 59, 3, '5', '20', 129, '2', '2', 168, 172, 179, 185, 2, 187, 194, 199, 2, 127, 2, 2, 2, 0, 0, 0, 0, 220, 227, 2, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 1, '2', NULL, 'Sincronizado', 1, 1, '2026-01-01 17:19:35', '2026-01-01 17:19:35'),
(61, 16, 60, 2, '10', '20', 148, 'hshs', 'qjjajs', 169, 173, 179, 185, 2, 188, 192, 197, 6464, 127, 66, 9, 2, 0, 0, 1, 6, 218, 222, 5, '', '', 1, 1, 0, 0, 'hsys', NULL, 'Sincronizado', 1, 1, '2026-01-01 17:37:10', '2026-01-01 17:37:10'),
(62, 16, 61, 2, '10', '20', 141, 'j', 'j', 170, 175, 179, 185, 8, 187, 192, 199, 8, 127, 8, 8, 8, 0, 0, 0, 0, 218, 227, 8, 'Moto', 'Regular', 1, 0, 0, 0, '8', NULL, 'Sincronizado', 1, 1, '2026-01-01 17:54:54', '2026-01-01 17:54:54'),
(63, 16, 62, 3, '4', '20', 99, '44', '44', 169, 172, 176, 184, 4, 187, 191, 196, 44, 127, 4, 4, 4, 1, 4, 1, 666, 217, 227, 45, 'Moto/Moto', 'Malo/Malo', 1, 1, 3, 1, '33333', NULL, 'Sincronizado', 1, 1, '2026-01-01 18:40:33', '2026-01-01 18:40:33'),
(64, 16, 63, 3, '4', '20', 99, '44', '44', 169, 172, 176, 184, 4, 187, 191, 196, 44, 127, 4, 4, 4, 1, 4, 1, 666, 217, 227, 45, 'Moto/Moto', 'Malo/Malo', 1, 1, 3, 1, '33333', NULL, 'Sincronizado', 1, 1, '2026-01-01 18:40:34', '2026-01-01 18:40:34'),
(65, 16, 64, 3, '4', '20', 99, '44', '44', 169, 172, 176, 184, 4, 187, 191, 196, 44, 127, 4, 4, 4, 1, 4, 1, 666, 217, 227, 45, 'Moto/Moto', 'Malo/Malo', 1, 1, 3, 1, '33333', NULL, 'Sincronizado', 1, 1, '2026-01-01 18:40:34', '2026-01-01 18:40:34'),
(66, 16, 65, 2, '10', '20', 141, 'd', 'd', 169, 175, 179, 186, 3, 189, 195, 197, 3, 127, 3, 3, 3, 0, 0, 0, 0, 219, 226, 3, 'Carro', 'Regular', 0, 1, 3, 0, '3333', NULL, 'Sincronizado', 1, 1, '2026-01-03 13:05:08', '2026-01-03 13:05:08'),
(67, 16, 66, 2, '11', '20', 150, 'f', 'f', 169, 172, 177, 181, 3, 187, 191, 197, 3, 127, 3, 3, 3, 0, 0, 0, 0, 219, 227, 3, 'Pasola a gasolina', 'Bueno', 0, 0, 0, 0, 'Los gastos exceden al ingreso mensual y se detectan vehículos con estado regular o bueno', NULL, 'Sincronizado', 1, 1, '2026-01-03 13:14:35', '2026-01-03 13:14:35'),
(68, 16, 67, 2, '10', '20', 141, 'dd', 'd', 168, 172, 176, 181, 2, 188, 191, 196, 2, 127, 2, 2, 2, 1, 22, 1, 2, 218, 222, 222, 'Carro', 'Bueno', 1, 1, 2, 0, 'Los gastos exceden al ingreso mensual y se detectan vehículos con estado regular o bueno', NULL, 'Sincronizado', 1, 1, '2026-01-03 13:40:50', '2026-01-03 13:40:50'),
(69, 16, 68, 2, '10', '20', 141, '100200310', '100200310', 168, 172, 179, 185, 2, 190, 194, 199, 20, 127, 20, 20, 2, 1, 10, 0, 0, 220, 227, 100, 'Moto', 'Regular', 0, 0, 0, 0, '', NULL, 'Sincronizado', 1, 1, '2026-01-03 15:00:46', '2026-01-03 15:00:46'),
(70, 16, 69, 2, '10', '20', 141, '100200310', '100200310', 168, 172, 179, 185, 2, 190, 194, 199, 20, 127, 20, 20, 2, 1, 10, 0, 0, 220, 227, 100, 'Moto', 'Regular', 0, 0, 0, 0, '', NULL, 'Sincronizado', 1, 1, '2026-01-04 09:44:51', '2026-01-04 09:44:51'),
(71, 16, 70, 2, '10', '20', 141, '100200310', '100200310', 168, 172, 179, 185, 2, 190, 194, 199, 20, 127, 20, 20, 2, 1, 10, 0, 0, 220, 227, 100, 'Moto', 'Regular', 0, 0, 0, 0, '', NULL, 'Sincronizado', 1, 1, '2026-01-04 10:09:00', '2026-01-04 10:09:00'),
(72, 16, 71, 3, '4', '20', 100, '100200310', '100200310', 168, 172, 179, 185, 3, 187, 191, 200, 44, 127, 44, 44, 4, 0, 0, 0, 0, 217, 227, 44, 'Moto', 'Regular', 0, 0, 0, 0, '', NULL, 'Sincronizado', 1, 1, '2026-01-04 10:09:01', '2026-01-04 10:09:01'),
(73, 16, 72, 3, '4', '20', 99, '100200310', '100200310', 168, 172, 179, 185, 2, 188, 193, 199, 22, 127, 2, 2, 2, 0, 0, 0, 0, 220, 227, 22, 'Moto o pasola eléctrica', 'Regular', 0, 0, 0, 1, '2222wdsdsddssd', NULL, 'Sincronizado', 1, 1, '2026-01-04 10:09:04', '2026-01-04 10:09:04'),
(74, 16, 73, 3, '6', '20', 122, 'vfvff', 'vff', 168, 172, 178, 185, 2, 187, 191, 199, 3, 127, 3, 3, 3, 0, 0, 0, 0, 220, 227, 3, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 0, '33333', NULL, 'Sincronizado', 1, 1, '2026-01-04 10:09:05', '2026-01-04 10:09:05'),
(75, 16, 74, 3, '6', '20', 122, 'vfvff', 'vff', 168, 172, 178, 185, 2, 187, 191, 199, 3, 127, 3, 3, 3, 0, 0, 0, 0, 220, 227, 3, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 0, '33333', NULL, 'Sincronizado', 1, 1, '2026-01-04 10:19:34', '2026-01-04 10:19:34'),
(76, 16, 75, 2, '10', '20', 142, '100200310', '100200310', 169, 172, 179, 185, 2, 188, 191, 198, 2, 127, 2, 2, 2, 0, 0, 0, 0, 218, 227, 22, 'Ninguno', 'Ninguno', 0, 1, 0, 0, 'qqqqqq', NULL, 'Sincronizado', 1, 1, '2026-01-04 11:48:15', '2026-01-04 11:48:15'),
(77, 16, 76, 2, '10', '20', 142, 'dd', 'dd', 171, 174, 179, 184, 4, 189, 194, 199, 4, 127, 3, 3, 3, 0, 0, 0, 0, 220, 227, 3, 'Moto o pasola eléctrica', 'Ninguno', 0, 0, 0, 1, '33333', NULL, 'Sincronizado', 1, 1, '2026-01-04 12:15:21', '2026-01-04 12:15:21'),
(78, 16, 77, 2, '10', NULL, 141, '333', '33', 168, 172, 176, 181, 0, 189, 194, 200, 3, 127, 3, 3, 3, 0, 0, 0, 0, 219, 226, 3, 'Moto o pasola eléctrica', 'Malo', 1, 0, 0, 0, '333', NULL, 'Sincronizado', 1, 1, '2026-01-04 21:04:04', '2026-01-04 21:04:04'),
(79, 16, 78, 3, '4', NULL, 99, 'hhh', 'hh', 170, 174, 179, 185, 6, 189, 194, 199, 6, 127, 6, 6, 6, 0, 0, 0, 0, 219, 227, 6, 'Ninguno', 'Malo', 0, 0, 0, 0, '666', NULL, 'Sincronizado', 1, 1, '2026-01-04 21:06:50', '2026-01-04 21:06:50'),
(80, 16, 79, 2, '10', NULL, 141, 'ggg', 'ggg', 168, 172, 178, 185, 4, 188, 192, 196, 4, 127, 4, 4, 4, 0, 0, 0, 0, 220, 227, 4, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 0, '4g', NULL, 'Sincronizado', 1, 1, '2026-01-04 21:27:04', '2026-01-04 21:27:04'),
(81, 16, 80, 3, '4', NULL, 99, 'ccc', 'ccc', 168, 172, 176, 182, 3, 189, 194, 199, 3, 127, 3, 3, 3, 0, 0, 0, 0, 219, 227, 3, 'Moto o pasola eléctrica', 'Malo', 1, 1, 3, 1, 'ccccc', NULL, 'Sincronizado', 1, 1, '2026-01-04 21:36:03', '2026-01-04 21:36:03'),
(82, 16, 81, 3, '5', NULL, 129, 'gg', 'gg', 168, 172, 180, 185, 4, 188, 192, 200, 4, 127, 4, 4, 4, 1, 4, 1, 4, 221, 226, 4, 'Moto o pasola eléctrica', 'Malo', 1, 1, 4, 0, '4g4g', NULL, 'Sincronizado', 1, 1, '2026-01-04 21:44:23', '2026-01-04 21:44:23'),
(83, 16, 82, 2, '11', NULL, 150, '44', '4', 168, 172, 178, 185, 4, 188, 194, 201, 4, 127, 4, 4, 4, 0, 0, 0, 0, 218, 227, 44, 'Moto', 'Bueno', 0, 0, 0, 0, '444', NULL, 'Sincronizado', 1, 1, '2026-01-04 21:51:13', '2026-01-04 21:51:13'),
(84, 16, 83, 3, '5', NULL, 127, 'dd', 'dd', 168, 172, 177, 185, 2, 188, 193, 199, 2, 127, 2, 2, 2, 0, 0, 0, 0, 220, 226, 2, 'Moto', 'Regular', 0, 0, 0, 0, '22', NULL, 'Sincronizado', 1, 1, '2026-01-04 21:55:59', '2026-01-04 21:55:59'),
(85, 16, 84, 2, '10', NULL, 141, 's', 's', 169, 172, 179, 186, 2, 188, 191, 200, 2, 127, 2, 2, 2, 0, 0, 0, 0, 218, 226, 2, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 0, 'ss', NULL, 'Sincronizado', 1, 1, '2026-01-04 21:59:12', '2026-01-04 21:59:12'),
(86, 16, 85, 2, '10', NULL, 141, 'ggg', 'ggg', 168, 172, 176, 181, 4, 189, 195, 200, 4, 127, 4, 4, 0, 0, 0, 0, 0, 220, 227, 4, 'Carro', 'Bueno', 0, 0, 0, 0, 'sdfdsfdsf', NULL, 'Sincronizado', 1, 1, '2026-01-05 12:24:05', '2026-01-05 12:24:05'),
(87, 16, 86, 2, '10', NULL, 142, 'dd', 'dd', 171, 174, 179, 185, 3, 187, 191, 201, 3, 127, 3, 3, 3, 0, 0, 0, 0, 220, 227, 3, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 0, '333', NULL, 'Sincronizado', 1, 1, '2026-01-05 12:42:25', '2026-01-05 12:42:25'),
(88, 16, 87, 2, '10', 'Urbano', 141, '100200310', '100200310', 169, 172, 179, 185, 3, 187, 191, 200, 3, 127, 333, 3, 0, 1, 333, 1, 55, 218, 225, 3, 'Ninguno', 'Bueno', 0, 0, 0, 0, 'dfdfgerdggfdggr', NULL, 'Sincronizado', 1, 1, '2026-01-05 12:51:05', '2026-01-05 12:51:05'),
(89, 16, 88, 2, 'Tulcán', 'Urbano', 141, 'ffff', 'ffff', 168, 172, 179, 185, 3, 188, 193, 200, 3, 127, 3, 3, 3, 0, 0, 1, 3, 218, 226, 3, 'Pasola a gasolina', 'Malo', 1, 1, 3, 0, '333', NULL, 'Sincronizado', 1, 1, '2026-01-05 13:12:26', '2026-01-05 13:12:26'),
(90, 16, 89, 2, 'Tulcán', 'Urbano', 141, 'ffff', 'ffff', 168, 172, 179, 185, 3, 188, 193, 200, 3, 127, 3, 3, 3, 0, 0, 1, 3, 218, 226, 3, 'Pasola a gasolina', 'Malo', 1, 1, 3, 0, '333', NULL, 'Sincronizado', 1, 1, '2026-01-05 13:59:30', '2026-01-05 13:59:30'),
(91, 16, 90, 3, '4', 'Rural', 104, 'ggg', 'gg', 169, 172, 176, 182, 4, 188, 192, 196, 4, 127, 4, 4, 4, 0, 0, 1, 4, 217, 222, 4, 'Carro', 'Bueno', 0, 0, 0, 0, '4ggg', NULL, 'Sincronizado', 1, 1, '2026-01-05 14:02:20', '2026-01-05 14:02:20'),
(92, 16, 91, 2, 'Bolívar', 'rural', 151, '4', 'r', 168, 172, 176, 181, 4, 187, 191, 200, 4, 127, 4, 4, 4, 0, 4, 0, 0, 217, 226, 4, 'Carro', 'Bueno', 0, 0, 0, 0, 'rrr', 'No aprobado', 'No aprobado', 1, 1, '2026-01-05 20:48:02', '2026-01-05 20:48:02'),
(93, 16, 92, 2, '10', 'Urbano', 141, 'ff', 'f', 169, 174, 179, 185, 4, 188, 192, 197, 4, 127, 4, 4, 4, 0, 0, 0, 0, 220, 228, 44, 'Moto o pasola eléctrica', 'Malo', 0, 0, 0, 0, 'ffff', NULL, 'Sincronizado', 1, 1, '2026-01-05 21:28:30', '2026-01-05 21:28:30'),
(94, 16, 93, 2, '11', 'Urbano', 150, 'ggg', 'ggg', 170, 174, 178, 184, 555, 189, 194, 200, 5, 127, 5, 5, 5, 0, 0, 0, 0, 220, 227, 5, 'Carro', 'Bueno', 0, 0, 0, 1, '3333', NULL, 'Sincronizado', 1, 1, '2026-01-06 22:40:16', '2026-01-06 22:40:16'),
(95, 16, 94, 2, '11', 'Urbano', 150, 'ggg', 'ggg', 170, 174, 178, 184, 555, 189, 194, 200, 5, 127, 5, 5, 5, 0, 0, 0, 0, 220, 227, 5, 'Carro', 'Bueno', 0, 0, 0, 1, '3333', NULL, NULL, 1, 1, '2026-01-06 23:09:34', '2026-01-06 23:09:34'),
(96, 16, 95, 2, '10', 'Urbano', 141, 'dfgskjfgh', 'dfuhafiuy', 168, 172, 176, 181, 2, 187, 191, 200, 2, 127, 2, 2, 2, 0, 0, 0, 0, 220, 227, 33, 'Moto o pasola eléctrica', 'Malo', 1, 0, 0, 0, 'desfrtrgr', NULL, NULL, 1, 1, '2026-01-06 23:17:16', '2026-01-06 23:17:16'),
(97, 16, 96, 2, 'Tulcán', 'Urbano', 141, 'dfgskjfgh', 'dfuhafiuy', 168, 172, 176, 181, 2, 187, 191, 200, 2, 127, 2, 2, 2, 0, 0, 0, 0, 220, 227, 33, 'Moto o pasola eléctrica', 'Malo', 1, 0, 0, 0, 'desfrtrgr', NULL, NULL, 1, 1, '2026-01-06 23:26:14', '2026-01-06 23:26:14'),
(98, 16, 97, 2, 'Tulcán', 'Urbano', 141, 'dfgskjfgh', 'dfuhafiuy', 168, 172, 176, 181, 2, 187, 191, 200, 2, 205, 2, 2, 2, 0, 0, 0, 0, 220, 227, 33, 'Moto o pasola eléctrica', 'Malo', 1, 0, 0, 0, 'desfrtrgr', NULL, NULL, 1, 1, '2026-01-06 23:41:37', '2026-01-06 23:41:37'),
(99, 16, 98, 2, 'Tulcán', 'Urbano', 141, 'dfgskjfgh', 'dfuhafiuy', 168, 172, 176, 181, 2, 187, 191, 200, 2, 205, 2, 2, 2, 0, 0, 0, 0, 220, 227, 33, 'Moto o pasola eléctrica', 'Malo', 1, 0, 0, 0, 'desfrtrgr', NULL, NULL, 1, 1, '2026-01-07 00:07:08', '2026-01-07 00:07:08'),
(100, 16, 99, 2, 'Tulcán', 'Urbano', 141, 'dfgskjfgh', 'dfuhafiuy', 168, 172, 176, 181, 2, 187, 191, 200, 2, 205, 2, 2, 2, 0, 0, 0, 0, 220, 227, 33, 'Moto o pasola eléctrica', 'Malo', 1, 0, 0, 0, 'desfrtrgr', NULL, NULL, 1, 1, '2026-01-07 00:08:48', '2026-01-07 00:08:48'),
(101, 16, 100, 2, 'Tulcán', 'Urbano', 141, 'dfgskjfgh', 'dfuhafiuy', 168, 172, 176, 181, 2, 187, 191, 200, 2, 205, 2, 2, 2, 0, 0, 0, 0, 220, 227, 33, 'Moto o pasola eléctrica', 'Malo', 1, 0, 0, 0, 'desfrtrgr', NULL, NULL, 1, 1, '2026-01-07 00:12:47', '2026-01-07 00:12:47'),
(102, 16, 101, 2, 'Tulcán', 'Urbano', 141, 'dfgskjfgh', 'dfuhafiuy', 168, 172, 176, 181, 2, 187, 191, 200, 2, 205, 2, 2, 2, 0, 0, 0, 0, 220, 227, 33, 'Moto o pasola eléctrica', 'Malo', 1, 0, 0, 0, 'desfrtrgr', NULL, NULL, 1, 1, '2026-01-07 00:13:17', '2026-01-07 00:13:17'),
(103, 16, 102, 2, 'Otavalo', 'rural', 31, 'dfdf', '3', 102, 106, 110, 115, 4, 121, 125, 133, 4, 138, 4, 4, 4, 0, 0, 0, 0, 141, 150, 4, 'Carro', 'Bueno', 0, 0, 0, 0, 'Los gastos no exceden al ingreso mensual y se detectan vehículos con estado regular o bueno', 'No aprobado', 'No aprobado', 1, 1, '2026-01-12 12:48:25', '2026-01-12 12:48:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datos_generales_parentesco`
--

CREATE TABLE `tbl_datos_generales_parentesco` (
  `id_datos_generales_parentesco` int(11) NOT NULL,
  `id_datos_parentescos` int(11) NOT NULL,
  `id_datos_generales` int(11) NOT NULL,
  `datos_generales_parentesco_estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_datos_generales_parentesco`
--

INSERT INTO `tbl_datos_generales_parentesco` (`id_datos_generales_parentesco`, `id_datos_parentescos`, `id_datos_generales`, `datos_generales_parentesco_estado`) VALUES
(1, 3, 10, 1),
(3, 5, 18, 1),
(4, 6, 19, 1),
(5, 7, 19, 1),
(6, 8, 20, 1),
(7, 9, 20, 1),
(8, 10, 21, 1),
(9, 11, 21, 1),
(10, 12, 22, 1),
(11, 13, 23, 1),
(12, 14, 24, 0),
(13, 15, 25, 0),
(14, 16, 26, 0),
(15, 17, 27, 0),
(16, 18, 28, 0),
(17, 19, 29, 0),
(18, 20, 30, 1),
(19, 21, 31, 1),
(20, 22, 31, 1),
(21, 23, 32, 1),
(22, 24, 32, 1),
(23, 25, 33, 1),
(24, 26, 33, 1),
(25, 27, 34, 1),
(26, 28, 35, 1),
(27, 29, 35, 1),
(28, 30, 36, 1),
(29, 31, 36, 1),
(30, 32, 37, 1),
(31, 33, 38, 1),
(32, 34, 38, 1),
(33, 35, 39, 1),
(34, 36, 39, 1),
(35, 37, 40, 1),
(36, 38, 41, 1),
(37, 39, 42, 1),
(38, 40, 43, 1),
(39, 41, 44, 1),
(40, 42, 45, 1),
(41, 43, 45, 1),
(42, 44, 45, 1),
(43, 45, 45, 1),
(44, 46, 46, 1),
(45, 47, 47, 1),
(46, 48, 48, 1),
(47, 49, 49, 1),
(48, 50, 50, 1),
(49, 51, 51, 1),
(50, 52, 52, 1),
(51, 53, 53, 1),
(52, 54, 54, 1),
(53, 55, 55, 1),
(54, 56, 56, 1),
(55, 57, 57, 1),
(56, 58, 58, 1),
(57, 59, 60, 1),
(58, 60, 61, 1),
(59, 61, 62, 1),
(60, 62, 63, 1),
(61, 63, 64, 1),
(62, 64, 65, 1),
(63, 65, 66, 1),
(64, 66, 67, 1),
(65, 67, 68, 1),
(66, 68, 69, 1),
(67, 69, 70, 1),
(68, 70, 71, 1),
(69, 71, 72, 1),
(70, 72, 73, 1),
(71, 73, 74, 1),
(72, 74, 75, 1),
(73, 75, 76, 1),
(74, 76, 77, 1),
(75, 77, 78, 1),
(76, 78, 79, 1),
(77, 79, 80, 1),
(78, 80, 81, 1),
(79, 81, 82, 1),
(80, 82, 83, 1),
(81, 83, 84, 1),
(82, 84, 85, 1),
(83, 85, 86, 1),
(84, 86, 87, 1),
(85, 87, 88, 1),
(86, 88, 89, 1),
(87, 89, 90, 1),
(88, 90, 91, 1),
(89, 91, 92, 1),
(90, 92, 93, 1),
(91, 93, 94, 1),
(92, 94, 95, 1),
(93, 95, 96, 1),
(94, 96, 97, 1),
(95, 97, 98, 1),
(96, 98, 99, 1),
(97, 99, 100, 1),
(98, 100, 101, 1),
(99, 101, 102, 1),
(100, 102, 103, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_datos_parentesco`
--

CREATE TABLE `tbl_datos_parentesco` (
  `id_datos_parentesco` int(11) NOT NULL,
  `datos_parentesco_nombres` varchar(25) DEFAULT NULL,
  `datos_parentesco_apellidos` varchar(25) DEFAULT NULL,
  `datos_parentesco_documento` varchar(25) DEFAULT NULL,
  `datos_parentesco_celular_telf` varchar(25) DEFAULT NULL,
  `datos_parentesco_etnia` int(11) DEFAULT NULL,
  `datos_parentesco_genero` int(11) DEFAULT NULL,
  `datos_parentesco_nivel_educacion` int(11) DEFAULT NULL,
  `datos_parentesco_fecha_de_nacimiento` date DEFAULT NULL,
  `datos_parentesco_edad` int(11) DEFAULT NULL,
  `datos_parentesco_estado_civil` int(11) DEFAULT NULL,
  `datos_parentesco_discapacidad` int(11) DEFAULT NULL,
  `datos_parentesco_enfermedad_catastrofica` varchar(500) DEFAULT NULL,
  `datos_parentesco_trabaja` varchar(25) DEFAULT NULL,
  `datos_parentesco_ocupacion` varchar(500) DEFAULT NULL,
  `datos_parentesco_ingreso_mensual` decimal(10,2) DEFAULT NULL,
  `datos_parentesco_parentesco` varchar(25) DEFAULT NULL,
  `datos_parentesco_estado` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_datos_parentesco`
--

INSERT INTO `tbl_datos_parentesco` (`id_datos_parentesco`, `datos_parentesco_nombres`, `datos_parentesco_apellidos`, `datos_parentesco_documento`, `datos_parentesco_celular_telf`, `datos_parentesco_etnia`, `datos_parentesco_genero`, `datos_parentesco_nivel_educacion`, `datos_parentesco_fecha_de_nacimiento`, `datos_parentesco_edad`, `datos_parentesco_estado_civil`, `datos_parentesco_discapacidad`, `datos_parentesco_enfermedad_catastrofica`, `datos_parentesco_trabaja`, `datos_parentesco_ocupacion`, `datos_parentesco_ingreso_mensual`, `datos_parentesco_parentesco`, `datos_parentesco_estado`) VALUES
(3, '123', '123', '123', '123', 236, 242, 246, '2025-07-02', 123, 251, 1, '123', 'Sí', '123', 123.00, '123', 1),
(4, '123', '123', '123', '123', 236, 243, 247, '2025-07-10', 12, 251, 1, '123', 'Sí', '123', 123.00, '123', 1),
(5, 'fdfg', 'dfgdfg', '123', '123', 236, 242, 246, '2025-07-10', 123, 251, 1, '123', 'Sí', '123', 123.00, 'Hijo', 1),
(6, 'fdfg', 'dfgdfg', '123', '123', 236, 242, 246, '2025-07-10', 123, 251, 1, '123', 'Sí', '123', 123.00, 'Hijo', 1),
(7, '123', '123', '123', '123', 236, 242, 246, '2025-07-11', 123, 251, 1, '123', 'Sí', '123', 123.00, 'Madre', 1),
(8, 'fdfg', 'dfgdfg', '123', '123', 236, 242, 246, '2025-07-10', 123, 251, 1, '123', 'Sí', '123', 123.00, 'Hijo', 1),
(9, '123', '123', '123', '123', 236, 242, 246, '2025-07-11', 123, 251, 1, '123', 'Sí', '123', 123.00, 'Madre', 1),
(10, 'Nathan', 'Arboleda', '1002003015', '0902003015', 236, 242, 246, '2025-07-02', 23, 251, 2, 'Ninguna', 'No', 'Ninguna', 400.23, 'Hijo', 1),
(11, 'Andrés', 'Arboleda', '10020030016', '09002003016', 237, 242, 246, '2025-07-09', 34, 252, 2, 'Ninguna', 'No', 'Ninguna', 500.17, 'Primo', 1),
(12, '123', '123', '123', '123', 236, 242, 246, '2025-07-05', 123, 251, 1, '123', 'Sí', '13', 123.00, 'Hijo', 1),
(13, 'asd', 'asd', '123', '123', 236, 242, 246, '2025-07-04', 12, 252, 1, '123', 'Sí', '123', 123.00, '123', 1),
(14, 'asd', 'asd', '123', '123', 237, 242, 246, '2025-07-10', 12, 252, 1, '12', 'Sí', '12', 12.00, '123', 0),
(15, 'sdfsdf', 'sdfsdf', '123', '123', 236, 242, 246, '2025-07-15', 12, 251, 1, '123', 'Sí', '123', 123.00, '123', 0),
(16, 'asd', 'asd', '123', '123', 237, 242, 246, '2025-07-11', 12, 251, 1, '12', 'Sí', '12', 12.00, '12', 0),
(17, 'asd', 'asd', '123', '123', 236, 242, 247, '2025-07-09', 12, 251, 1, '12', 'Sí', '12', 12.00, '12', 0),
(18, '1111', '111', '111', '111', 236, 242, 246, '2025-07-07', 111, 251, 1, '11', 'Sí', '111', 111.00, '11', 0),
(19, '123', '123', '123', '123', 236, 242, 246, '2025-07-16', 12, 251, 1, '12', 'Sí', '12', 12.00, '12', 0),
(20, 'Juan', 'Andrade', '1002003040', '0900200340', 237, 242, 247, '2025-07-22', 21, 251, 2, 'Ninguna', 'Sí', 'Albañil', 340.00, 'Padre', 1),
(21, 'Carlos', 'Perez', '100200350', '0900200350', 236, 242, 247, '2025-07-03', 23, 251, 2, 'Ninguna', 'No', 'Ninguna', 0.00, 'Hijo', 1),
(22, 'Diana', 'Perez', '100200351', '0900200351', 236, 243, 248, '2025-07-19', 33, 252, 2, 'Ninguna', 'No', 'Ninguna', 0.00, 'Prima', 1),
(23, 'Juan', 'HHHHHH', '123', '123', 236, 242, 247, '2025-07-10', 12, 252, 2, 'Ninguna', 'No', 'Ninguna', 50.00, 'Padre', 1),
(24, 'Hernan', 'HHHHHH', '123123', '12123', 236, 242, 247, '2025-07-16', 12, 251, 2, 'Ninguna', 'No', 'Ninguna', 0.00, 'Hijo', 1),
(25, 'Juan', 'Guevara', '100200370', '0900200370', 236, 242, 248, '2025-07-01', 27, 252, 2, 'Ninguna', 'No', 'Ninguna', 100.00, 'Padre', 1),
(26, 'Estela', 'Ruiz', '100200371', '0900200371', 236, 243, 247, '2025-07-08', 24, 252, 2, 'Ninguna', 'No', 'Ninguna', 2.00, 'Esposa', 1),
(27, 'Juan', 'Paredes', '100200391', '0900200391', 236, 242, 246, '2025-07-23', 24, 251, 2, 'Ninguna', 'Sí', 'Albañil', 300.00, 'Padre', 1),
(28, 'nathan', 'arboeda', '1234567', '1234567', 236, 242, 249, '2025-08-28', 22, 251, 2, 'Ninguna', 'Sí', 'dfghjkl', 379.00, 'hijo', 1),
(29, 'fer', 'arias', '1234567', '123456', 236, 242, 249, '2025-08-22', 23, 251, 2, 'Ninguna', 'Sí', 'policia', 450.00, 'padre', 1),
(30, 'jose', 'cuervo', '123', '123445667', 240, 242, 248, '2025-08-28', 23, 251, 1, 'ew', 'Sí', 'wert', 123.00, 'hijo', 1),
(31, 'fernanda', 'cuervo', '123456', '123445667', 240, 243, 248, '2025-08-07', 33, 251, 2, 'Ninguna', 'Sí', '32', 234.00, 'madre', 1),
(32, 'jose', 'cuervo', '1234567890', '123445667', 237, 242, 246, '2025-08-22', 12, 252, 1, 'veria', 'Sí', 'wertyu', 123.00, 'madre', 1),
(33, 'fabiloy', 'valente', '12345689', '0998098630', 236, 243, 247, '2025-08-20', 34, 252, 2, 'Ninguna', 'Sí', 'sdfghj', 320.00, 'madre', 1),
(34, 'jose', 'cuervo', '12345678', '123445667', 238, 242, 247, '2025-08-15', 33, 251, 1, 'dddd', 'Sí', 'wert', 23.00, 'hijo', 1),
(35, 'ronald', 'dy', '1005164095', '0998098630', 236, 242, 247, '2025-08-14', 18, 251, 2, 'Ninguna', 'Sí', 'Ninguna', 470.00, 'madre', 1),
(36, 'jose', 'cuervo', '3456789', '123445667', 237, 242, 247, '2025-08-22', 6, 253, 2, 'Ninguna', 'No', 'Ninguna', 44.00, 'hijo', 1),
(37, 'nathan', 'arboleda', '1234567', '0998098630', 236, 242, 246, '2025-09-05', 1, 251, 1, 'fds', 'No', 'Ninguna', 23.00, 'hijo', 1),
(38, 'jose', 'cuervo', '12345678987654321', '123445667', 236, 242, 247, '2025-10-03', 11, 254, 1, '1111', 'No', 'Ninguna', 111.00, 'primo', 1),
(39, 'jose', 'cuervo', '2345678', '123445667', 240, 243, 246, '2025-09-05', 12345, 251, 1, 'gay', 'Sí', 'Ninguna', 123.00, 'hijo', 1),
(40, 'nathan', 'arboleda', '1234567', '0998098630', 240, 242, 246, '2025-09-19', 1, 251, 1, '1ss', 'Sí', 'ss', 12.00, 'hijo', 1),
(41, 'nathanddddddddd', 'arboleda', '12345678', '0998098630', 240, 242, 246, '2025-09-25', 12, 251, 0, 'Ninguna', 'Sí', 'Ninguna', 2.00, 'hijo', 1),
(42, 'nathanqwertyuil', 'arboleda', '1722417332', '0998098630', 236, 242, 246, '2025-10-07', 1, 252, 0, 'Ninguna', 'No', 'Ninguna', 111.00, 'hijo', 1),
(43, 'nathanxxx', 'arboleda', '17224173321', '0998098630', 236, 242, 246, '2025-10-07', 1, 251, 0, 'Ninguna', 'No', 'Ninguna', 111.00, 'hijo', 1),
(44, 'nathan', 'arboleda', '1722417332', '0998098630', 236, 242, 247, '2025-10-07', 1, 252, 1, 'Ninguna', 'No', 'Ninguna', 111.00, 'hijo', 1),
(45, 'nathan', 'arboleda', '17224173321', '0998098630', 236, 243, 247, '2025-10-07', 1, 254, 0, 'Ninguna', 'Sí', 'Ninguna', 111.00, 'hijo', 1),
(46, 'chaepirito', 'colorado', '12345', '0998098630', 236, 242, 246, '2025-10-20', 22, 252, 1, '222', 'No', 'Ninguna', 22.00, 'hijo', 1),
(47, 'doctor chapatin', 'chespirito', '666', '123445667', 239, 244, 247, '2025-10-05', 1234, 251, 1, '12345', 'Sí', '2345', 12345.00, 'hijo', 1),
(48, 'Clark', 'ken ', '1722417332', '0923445667', 239, 245, 249, '2025-10-07', 31415, 251, 1, 'Ninguna', 'Sí', 'Ninguna', 123.00, '1234', 1),
(49, 'batman', 'bad', '1234567', '123445667', 236, 242, 246, '2025-10-14', 1234, 252, 1, '1234', 'No', 'Ninguna', 11.00, 'hijo', 1),
(50, 'general', 'agustus', '222', '123445667', 236, 242, 246, '2025-10-20', 222, 251, 1, '2', 'Sí', '22', 2.00, 'hijo', 1),
(51, 'bolivar man', 'caballo', '1234', '0999123432', 240, 242, 246, '2025-10-24', 2, 251, 2, 'Ninguna', 'No', 'Ninguna', 11.00, 'hijo', 1),
(52, 'imbabura man', 'mmm', '1234', '0994857574', 239, 243, 247, '2025-10-08', 111, 252, 1, 'Ninguna', 'No', 'Ninguna', 11.00, 'hijo', 1),
(53, 'nathabn', 'arb', '123456', '12345', 239, 242, 249, '2026-01-01', 2, 252, 0, '2', 'Sí', 'dd', 222.00, 'ddd', 1),
(54, 'jjj', 'jjj', 'jjj', '7777', 240, 244, 248, '2026-01-01', 77, 254, 0, '', 'No', '', 7.00, 'j', 1),
(55, 'jjj', 'jjj', 'jjj', '7777', 240, 244, 248, '2026-01-01', 77, 254, 0, '', 'No', '', 7.00, 'j', 1),
(56, 'ccc', 'cccc', '444', '444', 240, 244, 249, '2026-01-01', 4, 254, 0, '', 'No', '', 4.00, '4', 1),
(57, 'ddd', 'ddd', 'ddd', '333', 236, 242, 249, '2026-01-01', 3, 254, 0, '', 'No', '', 3.00, '3', 1),
(58, 'zxzxzzx', 'ngnggngnng', 'zxzxxz', '444', 239, 244, 248, '2026-01-01', 444, 254, 0, '', 'No', '', 4.00, '4', 1),
(59, 'usuario: jperez5@mail.com', 'ddd', 'ddd', '333', 238, 243, 249, '2026-01-01', 2, 253, 0, '', 'Sí', 'eee', 22.00, '22', 1),
(60, 'jajs', 'hshshs', '12333', '234', 237, 243, 246, '2026-01-01', 2, 252, 0, '', 'No', '', 11.00, 'jaja', 1),
(61, 'uuuuu', 'uuuuuu', 'uuu', '8888', 237, 242, 246, '2026-01-01', 88, 254, 0, '', 'No', '', 8.00, 'j', 1),
(62, 'naa', 'nnnn', '444', '4', 240, 244, 249, '2026-01-01', 444, 254, 0, '', 'No', '', 4.00, 'g', 1),
(63, 'naa', 'nnnn', '444', '4', 240, 244, 249, '2026-01-01', 444, 254, 0, '', 'No', '', 4.00, 'g', 1),
(64, 'naa', 'nnnn', '444', '4', 240, 244, 249, '2026-01-01', 444, 254, 0, '', 'No', '', 4.00, 'g', 1),
(65, 'dd', 'dd', 'dd', '3', 240, 243, 248, '2026-01-30', 3, 255, 0, '', 'No', '', 3.00, '3', 1),
(66, 'nathaaaf100200310', '100200310', '100200310', '100200310', 240, 242, 246, '2026-01-03', 100200310, 253, 0, '', 'Sí', '100200310', 10.00, '100200310', 1),
(67, '100200310', 'Nathan', '100200310', '12345', 240, 244, 249, '2026-01-03', 222, 251, 0, '2', 'Sí', '2', 2.00, '2', 1),
(68, '100200310', '100200310', '100200310', '100200310', 240, 244, 249, '2026-01-03', 100200310, 255, 0, '', 'No', '', 10.00, 'ff', 1),
(69, '100200310', '100200310', '100200310', '100200310', 240, 244, 249, '2026-01-03', 100200310, 255, 0, '', 'No', '', 10.00, 'ff', 1),
(70, '100200310', '100200310', '100200310', '100200310', 240, 244, 249, '2026-01-03', 100200310, 255, 0, '', 'No', '', 10.00, 'ff', 1),
(71, 'nathan', 'dd', '100200310', '100200310', 236, 242, 246, '2026-01-03', 100200310, 253, 0, '', 'No', '', 33.00, 'vvv', 1),
(72, 'bnathan', 'arbols', '100200310', '100200310', 239, 244, 249, '2026-01-04', 33, 254, 0, '', 'No', '', 23.00, 'baba', 1),
(73, 'naghtah', 'hgffgf', '100200310', '100200310', 236, 242, 246, '2026-01-04', 3, 252, 0, '', 'Sí', 'hola', 33.00, 'hjijo', 1),
(74, 'naghtah', 'hgffgf', '100200310', '100200310', 236, 242, 246, '2026-01-04', 3, 252, 0, '', 'Sí', 'hola', 33.00, 'hjijo', 1),
(75, 'frfrfrgg', 'grgfgrgr', '100200310', '100200310', 240, 244, 248, '2026-01-04', 3, 253, 0, '', 'No', '', 33333.00, 'pape', 1),
(76, 'natha', 'arvv', '100200310', '100200310', 240, 244, 249, '2026-01-04', 100200310, 255, 0, '', 'No', '', 33.00, '100200310', 1),
(77, 'uuuu', 'hhhhhh', '2343423', '34434234343', 239, 245, 246, '2026-01-04', 2, 251, 0, 'w', 'No', '', 22.00, 'ddd', 1),
(78, 'fdjhsdlkhjf', 'dsfdsaf', 'd444', '444', 240, 245, 249, '2026-01-04', 77, 254, 0, '', 'No', '', 7.00, '7h', 1),
(79, 'weraggg', 'rgrgrga', '4444', '444', 239, 244, 249, '2026-01-04', 4, 252, 0, '4', 'No', '', 4.00, '4', 1),
(80, 'ddd', 'ddd', '31232', '23213', 239, 244, 249, '2026-01-04', 3, 251, 0, '3', 'No', '', 3.00, '3', 1),
(81, 'rgrgrgr', 'grgrgr', 'rggrgr', '4444', 239, 243, 249, '2026-01-04', 4, 254, 0, '', 'No', '', 4.00, '4', 1),
(82, 'wrgrgf', 'rgrgr', '444', '4444', 239, 243, 249, '2026-01-04', 4, 253, 0, '', 'No', '', 4.00, 'ggg', 1),
(83, 'ss', 'ss', 'ss', '222', 239, 245, 249, '2026-01-04', 22, 251, 0, '', 'No', '', 2.00, 'ddd', 1),
(84, 'sss', 'ss', 's', '2', 239, 242, 246, '2026-01-04', 2, 254, 0, '', 'No', '', 2.00, 's', 1),
(85, 'rfgrgr', 'grgrgr', 'rrrr', '222', 238, 245, 249, '2026-01-05', 4, 254, 0, '44', 'No', '', 44.00, 'gggg', 1),
(86, 'vsvvsv', 'dvdsds', '333', '33333', 240, 242, 249, '2026-01-05', 33, 254, 0, '', 'No', '', 33.00, 'dd', 1),
(87, 'nath', 'dsfas', '100200310', '100200310', 240, 243, 249, '2026-01-05', 100200310, 252, 0, '100200310', 'No', '', 100200.00, '333', 1),
(88, 'defwefe', 'fefewf', 'fwefe', '3333', 237, 242, 246, '2026-01-05', 3, 252, 0, '', 'No', '', 3.00, '333', 1),
(89, 'defwefe', 'fefewf', 'fwefe', '3333', 237, 242, 246, '2026-01-05', 3, 252, 0, '', 'No', '', 3.00, '333', 1),
(90, 'frgfr', 'rger', 'grg', '4555', 237, 242, 247, '2026-01-05', 444, 251, 0, '', 'No', '', 4.00, '44', 1),
(91, 'nathan', 'arboleda', '44444', '0998098630', 236, 242, 246, '2026-02-03', 44, 254, 2, 'Ninguna', 'No', 'Ninguna', 44.00, 'hijo', 1),
(92, 'dsfg', 'erererger', '44444', '4444', 240, 243, 249, '2026-01-05', 44, 252, 0, '', 'No', '', 4.00, 'fv', 1),
(93, 'gdfgfgfgf', 'gfgfgfgfgf', 'gfgfgfgf', '555', 236, 242, 246, '2026-01-06', 5, 251, 0, '', 'No', '', 55.00, 'ggg', 1),
(94, 'gdfgfgfgf', 'gfgfgfgfgf', 'gfgfgfgf', '555', 236, 242, 246, '2026-01-06', 5, 251, 0, '', 'No', '', 55.00, 'ggg', 1),
(95, 'nathana', 'fernando', 'eee', '4444', 240, 245, 249, '2026-01-06', 4444, 254, 0, '', 'No', '', 444.00, 'f44fer', 1),
(96, 'nathana', 'fernando', 'eee', '4444', 240, 245, 249, '2026-01-06', 4444, 254, 0, '', 'No', '', 444.00, 'f44fer', 1),
(97, 'nathana', 'fernando', 'eee', '4444', 240, 245, 249, '2026-01-06', 4444, 254, 0, '', 'No', '', 444.00, 'f44fer', 1),
(98, 'nathana', 'fernando', 'eee', '4444', 240, 245, 249, '2026-01-06', 4444, 254, 0, '', 'No', '', 444.00, 'f44fer', 1),
(99, 'nathana', 'fernando', 'eee', '4444', 240, 245, 249, '2026-01-06', 4444, 254, 0, '', 'No', '', 444.00, 'f44fer', 1),
(100, 'nathana', 'fernando', 'eee', '4444', 240, 245, 249, '2026-01-06', 4444, 254, 0, '', 'No', '', 444.00, 'f44fer', 1),
(101, 'nathana', 'fernando', 'eee', '4444', 240, 245, 249, '2026-01-06', 4444, 254, 0, '', 'No', '', 444.00, 'f44fer', 1),
(102, 'nathan', 'arboleda', '222222', '0998098630', 160, 166, 170, '2026-01-23', 33, 177, 2, 'Ninguna', 'Sí', 'gfdg', 300.00, 'hijo', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_funcionalidad`
--

CREATE TABLE `tbl_funcionalidad` (
  `id_funcionalidad` int(11) NOT NULL,
  `funcionalidad_nombre_funcion` varchar(500) DEFAULT NULL,
  `funcionalidad_url` varchar(500) DEFAULT NULL,
  `funcionalidad_estado` tinyint(1) DEFAULT NULL,
  `funcionalidad_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_funcionalidad`
--

INSERT INTO `tbl_funcionalidad` (`id_funcionalidad`, `funcionalidad_nombre_funcion`, `funcionalidad_url`, `funcionalidad_estado`, `funcionalidad_created_at`) VALUES
(1, 'Cerrar sesión', '/logout', 1, '2025-07-21 16:07:36'),
(2, 'Formulario de datos generales', '/formGeneralInformation', 1, '2025-07-21 16:07:36'),
(3, 'Obtener provincias', '/getProvinces', 1, '2025-07-21 16:07:36'),
(4, 'Obtener ciudades', '/getCities', 1, '2025-07-21 16:07:36'),
(5, 'Obtener parroquias', '/getParishes', 1, '2025-07-21 16:07:36'),
(6, 'Obtener tipos de vivienda', '/getTypesHousing', 1, '2025-07-21 16:07:36'),
(7, 'Obtener tipos de techo', '/getRoofTypes', 1, '2025-07-21 16:07:36'),
(8, 'Obtener tipos de pared', '/getWallTypes', 1, '2025-07-21 16:07:36'),
(9, 'Obtener tipos de piso', '/getFloorTypes', 1, '2025-07-21 16:07:36'),
(10, 'Obtener tipos de combustible cocina', '/getCookingFuel', 1, '2025-07-21 16:07:36'),
(11, 'Obtener servicios higiénicos', '/getHygienicService', 1, '2025-07-21 16:07:36'),
(12, 'Vivienda o alojamiento', '/getHousing', 1, '2025-07-21 16:07:36'),
(13, 'Obtener servicios de agua', '/getWaterServices', 1, '2025-07-21 16:07:36'),
(14, 'Obtener eliminación de basura', '/getGarbageRemoval', 1, '2025-07-21 16:07:36'),
(15, 'Obtener lugares frecuentes de compra', '/getFrequentShopPlaces', 1, '2025-07-21 16:07:36'),
(16, 'Obtener tipo de vehículos', '/getVehiclesTypes', 1, '2025-07-21 16:07:36'),
(17, 'Obtener estado de transporte', '/getTransportStatus', 1, '2025-07-21 16:07:36'),
(18, 'Insertar datos generales y parentesco', '/insertGeneralInformation', 1, '2025-07-21 16:07:36'),
(19, 'Obtener lista de etnias', '/getEthnicity', 1, '2025-07-21 16:07:36'),
(20, 'Obtener lista de géneros', '/getGenders', 1, '2025-07-21 16:07:36'),
(21, 'Obtener niveles de educación', '/getEducationLevel', 1, '2025-07-21 16:07:36'),
(22, 'Obtener lista de estado civil', '/getMaritalStatus', 1, '2025-07-21 16:07:36'),
(23, 'Datos registrados', '/informationRecords', 1, '2025-07-21 16:07:36'),
(24, 'Vista para modificar perfil personal', '/profile', 1, '2025-07-21 16:07:36'),
(25, 'Obtener parentescos', '/getRelationShipId', 1, '2025-07-21 16:07:36'),
(26, 'Dar de baja registro de información general con parentescos', '/deleteGeneralInformationRecord', 1, '2025-07-21 16:07:36'),
(27, 'Actualizar perfil', '/updateProfile', 1, '2025-07-21 16:07:36'),
(28, 'Actualizar contraseña', '/updateProfilePassword', 1, '2025-07-21 16:07:36'),
(29, 'Exportar excel', '/exportExcel', 1, '2025-07-21 16:07:36'),
(30, 'Actualizar rol de usuario', '/updateRolUser', 1, '2025-07-21 16:07:36'),
(31, 'Obtener documento de usuario', '/getDocument', 1, '2025-07-21 16:07:36'),
(32, 'Obtener roles', '/getRoles', 1, '2025-07-21 16:07:36');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item_catalogo`
--

CREATE TABLE `tbl_item_catalogo` (
  `id_item` int(11) NOT NULL,
  `itc_codigo` varchar(25) DEFAULT NULL,
  `itc_nombre` varchar(250) DEFAULT NULL,
  `itc_descripcion` varchar(250) DEFAULT NULL,
  `itc_estado` tinyint(1) DEFAULT NULL,
  `id_catalogo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_item_catalogo`
--

INSERT INTO `tbl_item_catalogo` (`id_item`, `itc_codigo`, `itc_nombre`, `itc_descripcion`, `itc_estado`, `id_catalogo`) VALUES
(1, 'CAR', 'Carchi', 'Provincia de Carchi', 1, 18),
(2, 'IMB', 'Imbabura', 'Provincia de Imbabura', 1, 18),
(3, 'IBARRA', 'Ibarra', 'Cantón de Imbabura', 1, 19),
(4, 'ANTON', 'Antonio Ante', 'Cantón de Imbabura', 1, 19),
(5, 'COTAC', 'Cotacachi', 'Cantón de Imbabura', 1, 19),
(6, 'OTAV', 'Otavalo', 'Cantón de Imbabura', 1, 19),
(7, 'PIMAM', 'Pimampiro', 'Cantón de Imbabura', 1, 19),
(8, 'URCU', 'Urcuquí', 'Cantón de Imbabura', 1, 19),
(9, 'TULCÁN', 'Tulcán', 'Cantón de Carchi', 1, 19),
(10, 'BOLÍVAR', 'Bolívar', 'Cantón de Carchi', 1, 19),
(11, 'ESPEJO', 'Espejo', 'Cantón de Carchi', 1, 19),
(12, 'MIRA', 'Mira', 'Cantón de Carchi', 1, 19),
(13, 'MONTÚFAR', 'Montúfar', 'Cantón de Carchi', 1, 19),
(14, 'SAN PEDRO DE HUACA', 'San Pedro de Huaca', 'Cantón de Carchi', 1, 19),
(15, 'PARR-IB-URB', 'Alpachaca', 'Parroquia urbana de Ibarra', 1, 20),
(16, 'PARR-IB-URB', 'Caranqui', 'Parroquia urbana de Ibarra', 1, 20),
(17, 'PARR-IB-URB', 'El Sagrario', 'Parroquia urbana de Ibarra', 1, 20),
(18, 'PARR-IB-URB', 'La Dolorosa de Priorato', 'Parroquia urbana de Ibarra', 1, 20),
(19, 'PARR-IB-URB', 'San Francisco', 'Parroquia urbana de Ibarra', 1, 20),
(20, 'PARR-IB-RURAL', 'Ambuquí', 'Parroquia rural de Ibarra', 1, 20),
(21, 'PARR-IB-RURAL', 'Angochagua', 'Parroquia rural de Ibarra', 1, 20),
(22, 'PARR-IB-RURAL', 'La Carolina', 'Parroquia rural de Ibarra', 1, 20),
(23, 'PARR-IB-RURAL', 'La Esperanza', 'Parroquia rural de Ibarra', 1, 20),
(24, 'PARR-IB-RURAL', 'Lita', 'Parroquia rural de Ibarra', 1, 20),
(25, 'PARR-IB-RURAL', 'Salinas', 'Parroquia rural de Ibarra', 1, 20),
(26, 'PARR-IB-RURAL', 'San Antonio de Ibarra', 'Parroquia rural de Ibarra', 1, 20),
(27, 'PARR-OT-URB', 'Otavalo', 'Parroquia urbana de Otavalo', 1, 20),
(28, 'PARR-OT-URB', 'San Pablo del Lago', 'Parroquia urbana de Otavalo', 1, 20),
(29, 'PARR-OT-URB', 'El Jordán', 'Parroquia urbana de Otavalo', 1, 20),
(30, 'PARR-OT-URB', 'San Luis', 'Parroquia urbana de Otavalo', 1, 20),
(31, 'PARR-OT-RURAL', 'Eugenio Espejo', 'Parroquia rural de Otavalo', 1, 20),
(32, 'PARR-OT-RURAL', 'González Suárez', 'Parroquia rural de Otavalo', 1, 20),
(33, 'PARR-OT-RURAL', 'San Rafael', 'Parroquia rural de Otavalo', 1, 20),
(34, 'PARR-OT-RURAL', 'San Juan de Ilumán', 'Parroquia rural de Otavalo', 1, 20),
(35, 'PARR-OT-RURAL', 'Dr. Miguel Egas Cabezas', 'Parroquia rural de Otavalo', 1, 20),
(36, 'PARR-OT-RURAL', 'San José de Quichinche', 'Parroquia rural de Otavalo', 1, 20),
(37, 'PARR-OT-RURAL', 'San Pedro de Pataquí', 'Parroquia rural de Otavalo', 1, 20),
(38, 'PARR-OT-RURAL', 'Selva Alegre', 'Parroquia rural de Otavalo', 1, 20),
(39, 'PARR-CO-URB', 'Cotacachi', 'Parroquia urbana de Cotacachi', 1, 20),
(40, 'PARR-CO-URB', 'San Francisco', 'Parroquia urbana de Cotacachi', 1, 20),
(41, 'PARR-CO-RURAL', 'García Moreno', 'Parroquia rural de Cotacachi', 1, 20),
(42, 'PARR-CO-RURAL', 'Quiroga', 'Parroquia rural de Cotacachi', 1, 20),
(43, 'PARR-CO-RURAL', 'Apuela', 'Parroquia rural de Cotacachi', 1, 20),
(44, 'PARR-CO-RURAL', 'Plaza Gutiérrez', 'Parroquia rural de Cotacachi', 1, 20),
(45, 'PARR-CO-RURAL', 'Vacas Galindo', 'Parroquia rural de Cotacachi', 1, 20),
(46, 'PARR-CO-RURAL', 'Sagrario', 'Parroquia rural de Cotacachi', 1, 20),
(47, 'PARR-CO-RURAL', 'Imantag', 'Parroquia rural de Cotacachi', 1, 20),
(48, 'PARR-CO-RURAL', 'Peñaherrera', 'Parroquia rural de Cotacachi', 1, 20),
(49, 'PARR-CO-RURAL', '6 de Julio de Cuellaje', 'Parroquia rural de Cotacachi', 1, 20),
(50, 'PARR-AA-URB', 'Atuntaqui', 'Parroquia urbana de Antonio Ante', 1, 20),
(51, 'PARR-AA-URB', 'Andrade Marín', 'Parroquia urbana de Antonio Ante', 1, 20),
(52, 'PARR-AA-RURAL', 'Imbaya', 'Parroquia rural de Antonio Ante', 1, 20),
(53, 'PARR-AA-RURAL', 'Natabuela', 'Parroquia rural de Antonio Ante', 1, 20),
(54, 'PARR-AA-RURAL', 'Chaltura', 'Parroquia rural de Antonio Ante', 1, 20),
(55, 'PARR-AA-RURAL', 'San Roque', 'Parroquia rural de Antonio Ante', 1, 20),
(56, 'PARR-PI-URB', 'Pimampiro', 'Parroquia urbana de Pimampiro', 1, 20),
(57, 'PARR-PI-RURAL', 'Chugá', 'Parroquia rural de Pimampiro', 1, 20),
(58, 'PARR-PI-RURAL', 'Mariano Acosta', 'Parroquia rural de Pimampiro', 1, 20),
(59, 'PARR-PI-RURAL', 'San Francisco de Sigsipam', 'Parroquia rural de Pimampiro', 1, 20),
(60, 'PARR-UR-URB', 'Urcuquí', 'Parroquia urbana de Urcuquí', 1, 20),
(61, 'PARR-UR-RURAL', 'Pablo Arenas', 'Parroquia rural de Urcuquí', 1, 20),
(62, 'PARR-UR-RURAL', 'San Blas', 'Parroquia rural de Urcuquí', 1, 20),
(63, 'PARR-UR-RURAL', 'Tumbabiro', 'Parroquia rural de Urcuquí', 1, 20),
(64, 'PARR-UR-RURAL', 'Buenos Aires', 'Parroquia rural de Urcuquí', 1, 20),
(65, 'PARR-UR-RURAL', 'Cahuasquí', 'Parroquia rural de Urcuquí', 1, 20),
(66, 'PARR-TU-URB', 'Tulcán', 'Parroquia urbana de Tulcán', 1, 20),
(67, 'PARR-TU-URB', 'González Suárez', 'Parroquia urbana de Tulcán', 1, 20),
(68, 'PARR-TU-RURAL', 'El Carmelo', 'Parroquia rural de Tulcán', 1, 20),
(69, 'PARR-TU-RURAL', 'El Chical', 'Parroquia rural de Tulcán', 1, 20),
(70, 'PARR-TU-RURAL', 'Julio Andrade', 'Parroquia rural de Tulcán', 1, 20),
(71, 'PARR-TU-RURAL', 'Santa Martha de Cuba', 'Parroquia rural de Tulcán', 1, 20),
(72, 'PARR-TU-RURAL', 'Maldonado', 'Parroquia rural de Tulcán', 1, 20),
(73, 'PARR-TU-RURAL', 'Pioter', 'Parroquia rural de Tulcán', 1, 20),
(74, 'PARR-TU-RURAL', 'Tufiño', 'Parroquia rural de Tulcán', 1, 20),
(75, 'PARR-TU-RURAL', 'Urbina', 'Parroquia rural de Tulcán', 1, 20),
(76, 'PARR-TU-RURAL', 'Tobar Donoso', 'Parroquia rural de Tulcán', 1, 20),
(77, 'PARR-BO-URB', 'Bolívar', 'Parroquia urbana de Bolívar', 1, 20),
(78, 'PARR-BO-RURAL', 'Garcia Moreno', 'Parroquia rural de Bolívar', 1, 20),
(79, 'PARR-BO-RURAL', 'Los Andes', 'Parroquia rural de Bolívar', 1, 20),
(80, 'PARR-BO-RURAL', 'Monte Olivo', 'Parroquia rural de Bolívar', 1, 20),
(81, 'PARR-BO-RURAL', 'San Vicente de Pusir', 'Parroquia rural de Bolívar', 1, 20),
(82, 'PARR-BO-RURAL', 'San Rafael', 'Parroquia rural de Bolívar', 1, 20),
(83, 'PARR-ES-URB', 'El Ángel', 'Parroquia urbana de Espejo', 1, 20),
(84, 'PARR-ES-URB', '27 de septiembre', 'Parroquia urbana de Espejo', 1, 20),
(85, 'PARR-ES-RURAL', 'La Libertad', 'Parroquia rural de Espejo', 1, 20),
(86, 'PARR-ES-RURAL', 'San Isidro', 'Parroquia rural de Espejo', 1, 20),
(87, 'PARR-ES-RURAL', 'El Goaltal', 'Parroquia rural de Espejo', 1, 20),
(88, 'PARR-MI-URB', 'Mira', 'Parroquia urbana de Mira', 1, 20),
(89, 'PARR-MI-RURAL', 'Concepción', 'Parroquia rural de Mira', 1, 20),
(90, 'PARR-MI-RURAL', 'Jacinto Jijón y Caamaño', 'Parroquia rural de Mira', 1, 20),
(91, 'PARR-MI-RURAL', 'Juan Montalvo', 'Parroquia rural de Mira', 1, 20),
(92, 'PARR-MO-URB', 'San Gabriel', 'Parroquia urbana de Montúfar', 1, 20),
(93, 'PARR-MO-URB', 'San José', 'Parroquia urbana de Montúfar', 1, 20),
(94, 'PARR-MO-URB', 'González Suárez', 'Parroquia urbana de Montúfar', 1, 20),
(95, 'PARR-MO-RURAL', 'Cristóbal Colón', 'Parroquia rural de Montúfar', 1, 20),
(96, 'PARR-MO-RURAL', 'Chitán de Navarretes', 'Parroquia rural de Montúfar', 1, 20),
(97, 'PARR-MO-RURAL', 'Fernández Salvador', 'Parroquia rural de Montúfar', 1, 20),
(98, 'PARR-MO-RURAL', 'La Paz', 'Parroquia rural de Montúfar', 1, 20),
(99, 'PARR-MO-RURAL', 'Piartal', 'Parroquia rural de Montúfar', 1, 20),
(100, 'PARR-HU-URB', 'San Pedro de Huaca', 'Parroquia urbana de San Pedro de Huaca', 1, 20),
(101, 'PARR-HU-RURAL', 'Mariscal Sucre', 'Parroquia rural de San Pedro de Huaca', 1, 20),
(102, 'VIVIENDA', 'Casa', 'Tipo de vivienda: Casa', 1, 22),
(103, 'VIVIENDA', 'Departamento', 'Tipo de vivienda: Departamento', 1, 22),
(104, 'VIVIENDA', 'Cuartos', 'Tipo de vivienda: Cuartos', 1, 22),
(105, 'VIVIENDA', 'Mediagua', 'Tipo de vivienda: Mediagua', 1, 22),
(106, 'TECHO', 'Losa', 'Tipo de techo: Losa', 1, 23),
(107, 'TECHO', 'Eternit', 'Tipo de techo: Eternit', 1, 23),
(108, 'TECHO', 'Zinc', 'Tipo de techo: Zinc', 1, 23),
(109, 'TECHO', 'Teja', 'Tipo de techo: Teja', 1, 23),
(110, 'PARED', 'Hormigón', 'Tipo de pared: Hormigón', 1, 24),
(111, 'PARED', 'Ladrillo', 'Tipo de pared: Ladrillo', 1, 24),
(112, 'PARED', 'Bloque', 'Tipo de pared: Bloque', 1, 24),
(113, 'PARED', 'Adobe', 'Tipo de pared: Adobe', 1, 24),
(114, 'PARED', 'Madera', 'Tipo de pared: Madera', 1, 24),
(115, 'PISO', 'Duela', 'Tipo de piso Duela', 1, 25),
(116, 'PISO', 'Hormigón', 'Tipo de piso Hormigón', 1, 25),
(117, 'PISO', 'Tabla', 'Tipo de piso Tabla', 1, 25),
(118, 'PISO', 'Céramica', 'Tipo de piso Céramica', 1, 25),
(119, 'PISO', 'Tierra', 'Tipo de piso Tierra', 1, 25),
(120, 'PISO', 'Ladrillo', 'Tipo de piso Ladrillo', 1, 25),
(121, 'COMB-COCINA', 'Gas', 'Combustible de cocina: Gas', 1, 26),
(122, 'COMB-COCINA', 'Electricidad', 'Combustible de cocina: Electricidad', 1, 26),
(123, 'COMB-COCINA', 'Leña', 'Combustible de cocina: Leña', 1, 26),
(124, 'COMB-COCINA', 'No cocina', 'No utiliza cocina', 1, 26),
(125, 'SERV-HIG', 'Alcantarillado', 'Servicio higiénico: Alcantarillado', 1, 27),
(126, 'SERV-HIG', 'Pozo séptico', 'Servicio higiénico: Pozo séptico', 1, 27),
(127, 'SERV-HIG', 'Pozo ciego', 'Servicio higiénico: Pozo ciego', 1, 27),
(128, 'SERV-HIG', 'Letrina', 'Servicio higiénico: Letrina', 1, 27),
(129, 'SERV-HIG', 'No tiene', 'No cuenta con servicio higiénico', 1, 27),
(130, 'ALOJAMIENTO', 'Propia y esta pagada', 'Vivienda propia totalmente pagada', 1, 28),
(131, 'ALOJAMIENTO', 'Propia (regalada, heredad', 'Vivienda propia por herencia, regalo o posesión', 1, 28),
(132, 'ALOJAMIENTO', 'Prestada', 'Vivienda prestada por familiares u otros', 1, 28),
(133, 'ALOJAMIENTO', 'Propia y esta pagadando', 'Vivienda propia en proceso de pago', 1, 28),
(134, 'ALOJAMIENTO', 'Arrienda', 'Vivienda alquilada', 1, 28),
(135, 'ALOJAMIENTO', 'Anticresis', 'Vivienda bajo contrato de anticresis', 1, 28),
(136, 'SERV-AGUA', 'Red Pública', 'Abastecimiento de agua mediante red pública', 1, 29),
(137, 'SERV-AGUA', 'Pozo', 'Abastecimiento de agua mediante pozo propio o comunitario', 1, 29),
(138, 'SERV-AGUA', 'Río o vertiente, acequia ', 'Agua proveniente de fuentes naturales como ríos, vertientes, acequias o canales', 1, 29),
(139, 'SERV-AGUA', 'Carro repartidor', 'Abastecimiento de agua mediante reparto en carro', 1, 29),
(140, 'SERV-AGUA', 'Otros', 'Otro tipo de abastecimiento de agua no especificado', 1, 29),
(141, 'ELM-BAS', 'Carro recolector', 'Eliminación de basura mediante carro recolector municipal o privado', 1, 30),
(142, 'ELM-BAS', 'Lo botan a la calle, quebrada o rio', 'La basura es arrojada a lugares inadecuados como calles, quebradas o ríos', 1, 30),
(143, 'ELM-BAS', 'La queman', 'La basura es eliminada quemándola', 1, 30),
(144, 'ELM-BAS', 'Reciclan/entierran', 'Reciclaje o entierro de la basura en el terreno', 1, 30),
(145, 'ELM-BAS', 'Composta', 'La basura orgánica es convertida en compostaje', 1, 30),
(146, 'LUG-FREC-COMPRA', 'Supermercado', 'Compras frecuentes en supermercados grandes o cadenas comerciales', 1, 31),
(147, 'LUG-FREC-COMPRA', 'Mercados', 'Compras frecuentes en mercados municipales o populares', 1, 31),
(148, 'LUG-FREC-COMPRA', 'Ferias', 'Compras frecuentes en ferias ocasionales o ambulantes', 1, 31),
(149, 'LUG-FREC-COMPRA', 'Micromercados', 'Compras frecuentes en minimercados o locales pequeños', 1, 31),
(150, 'LUG-FREC-COMPRA', 'Tienda del barrio', 'Compras frecuentes en tiendas pequeñas del vecindario', 1, 31),
(151, 'LUG-FREC-COMPRA', 'Trueques', 'Intercambio de productos mediante trueques', 1, 31),
(152, 'LUG-FREC-COMPRA', 'Otros', 'Otros lugares no especificados donde se realizan compras', 1, 31),
(153, 'TIP-VEHICULOS', 'Carro', 'Vehículo tipo automóvil con motor de combustión o eléctrico', 1, 32),
(154, 'TIP-VEHICULOS', 'Moto', 'Motocicleta de combustión interna', 1, 32),
(155, 'TIP-VEHICULOS', 'Pasola a gasolina', 'Scooter o pasola que funciona con gasolina', 1, 32),
(156, 'TIP-VEHICULOS', 'Moto o pasola eléctrica', 'Vehículo de dos ruedas impulsado por energía eléctrica', 1, 32),
(157, 'EST-TRANSPORTE', 'Bueno', 'Estado del medio de transporte: bueno', 1, 33),
(158, 'EST-TRANSPORTE', 'Regular', 'Estado del medio de transporte: regular', 1, 33),
(159, 'EST-TRANSPORTE', 'Malo', 'Estado del medio de transporte: malo', 1, 33),
(160, 'ETNIA', 'Mestizo', 'Mestizo', 1, 34),
(161, 'ETNIA', 'Afroecuatoriano', 'Afroecuatoriano', 1, 34),
(162, 'ETNIA', 'Indígena', 'Indígena', 1, 34),
(163, 'ETNIA', 'Montubio', 'Montubio', 1, 34),
(164, 'ETNIA', 'Blanco', 'Blanco', 1, 34),
(165, 'ETNIA', 'Otro', 'Otro', 1, 34),
(166, 'GENERO', 'Masculino', 'Masculino', 1, 35),
(167, 'GENERO', 'Femenino', 'Femenino', 1, 35),
(168, 'GENERO', 'Otro', 'Otro', 1, 35),
(169, 'GENERO', 'Prefiero no decirlo', 'Prefiero no decirlo', 1, 35),
(170, 'NIV_EDUC', 'Primaria', 'Primaria', 1, 36),
(171, 'NIV_EDUC', 'Secundaria', 'Secundaria', 1, 36),
(172, 'NIV_EDUC', 'Bachillerato', 'Bachillerato', 1, 36),
(173, 'NIV_EDUC', 'Universitaria', 'Universitaria', 1, 36),
(174, 'NIV_EDUC', 'Ninguna', 'Ninguna', 1, 36),
(175, 'EST-CIV', 'Soltero/a', 'Soltero/a', 1, 37),
(176, 'EST-CIV', 'Casado/a', 'Casado/a', 1, 37),
(177, 'EST-CIV', 'Unión libre', 'Unión libre', 1, 37),
(178, 'EST-CIV', 'Separado/a', 'Separado/a', 1, 37),
(179, 'EST-CIV', 'Viudo/a', 'Viudo/a', 1, 37),
(180, 'TIP-VEHICULOS', 'Ninguno', 'Ninguno', 1, 32),
(181, 'EST-TRANSPORTE', 'Ninguno', 'Ninguno', 1, 33);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rol`
--

CREATE TABLE `tbl_rol` (
  `id_rol` int(11) NOT NULL,
  `rol_nombre` varchar(25) DEFAULT NULL,
  `rol_estado` tinyint(1) DEFAULT NULL,
  `rol_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_rol`
--

INSERT INTO `tbl_rol` (`id_rol`, `rol_nombre`, `rol_estado`, `rol_created_at`) VALUES
(1, 'Administrador', 1, '2025-06-15 22:39:11'),
(2, 'Empleado', 1, '2025-06-15 22:39:11'),
(3, 'Gestión Operativa', 1, '2025-07-21 16:12:02'),
(4, 'Gestión Social', 1, '2025-07-21 16:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rol_access`
--

CREATE TABLE `tbl_rol_access` (
  `id_principal_rol_access` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_funcionalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_rol_access`
--

INSERT INTO `tbl_rol_access` (`id_principal_rol_access`, `id_rol`, `id_funcionalidad`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 2, 1),
(34, 2, 2),
(35, 2, 3),
(36, 2, 4),
(37, 2, 5),
(38, 2, 6),
(39, 2, 7),
(40, 2, 8),
(41, 2, 9),
(42, 2, 10),
(43, 2, 11),
(44, 2, 12),
(45, 2, 13),
(46, 2, 14),
(47, 2, 15),
(48, 2, 16),
(49, 2, 17),
(50, 2, 18),
(51, 2, 19),
(52, 2, 20),
(53, 2, 21),
(54, 2, 22),
(55, 2, 23),
(56, 2, 24),
(57, 2, 25),
(58, 2, 26),
(59, 2, 27),
(60, 2, 28),
(61, 2, 29),
(62, 3, 1),
(63, 3, 2),
(64, 3, 3),
(65, 3, 4),
(66, 3, 5),
(67, 3, 6),
(68, 3, 7),
(69, 3, 8),
(70, 3, 9),
(71, 3, 10),
(72, 3, 11),
(73, 3, 12),
(74, 3, 13),
(75, 3, 14),
(76, 3, 15),
(77, 3, 16),
(78, 3, 17),
(79, 3, 18),
(80, 3, 19),
(81, 3, 20),
(82, 3, 21),
(83, 3, 22),
(84, 3, 23),
(85, 3, 24),
(86, 3, 25),
(87, 3, 26),
(88, 3, 27),
(89, 3, 28),
(90, 3, 29),
(91, 4, 1),
(92, 4, 2),
(93, 4, 3),
(94, 4, 4),
(95, 4, 5),
(96, 4, 6),
(97, 4, 7),
(98, 4, 8),
(99, 4, 9),
(100, 4, 10),
(101, 4, 11),
(102, 4, 12),
(103, 4, 13),
(104, 4, 14),
(105, 4, 15),
(106, 4, 16),
(107, 4, 17),
(108, 4, 18),
(109, 4, 19),
(110, 4, 20),
(111, 4, 21),
(112, 4, 22),
(113, 4, 23),
(114, 4, 24),
(115, 4, 25),
(116, 4, 26),
(117, 4, 27),
(118, 4, 28),
(119, 4, 29);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id_users` int(11) NOT NULL,
  `users_nombre` varchar(25) DEFAULT NULL,
  `users_nombreUsuario` varchar(100) NOT NULL,
  `users_apellido` varchar(25) DEFAULT NULL,
  `users_cedula` varchar(25) DEFAULT NULL,
  `users_email` varchar(100) DEFAULT NULL,
  `users_telefono` varchar(25) DEFAULT NULL,
  `users_fecha_de_nacimiento` date NOT NULL,
  `users_genero` varchar(100) DEFAULT NULL,
  `users_contrasenia` varchar(100) NOT NULL,
  `users_estado` tinyint(1) DEFAULT NULL,
  `users_activation_token` varchar(100) DEFAULT NULL,
  `users_reset_token` varchar(80) DEFAULT NULL,
  `users_reset_token_expires_at` datetime DEFAULT NULL,
  `users_updated_at` datetime DEFAULT NULL,
  `users_created_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_users`
--

INSERT INTO `tbl_users` (`id_users`, `users_nombre`, `users_nombreUsuario`, `users_apellido`, `users_cedula`, `users_email`, `users_telefono`, `users_fecha_de_nacimiento`, `users_genero`, `users_contrasenia`, `users_estado`, `users_activation_token`, `users_reset_token`, `users_reset_token_expires_at`, `users_updated_at`, `users_created_at`) VALUES
(2, 'jonathan', 'jonathan', 'arboleda', '1725417331', 'jarboleda@gmail.com', '0998098630', '2025-06-07', '1', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-15 18:19:02'),
(3, 'nathan', 'njarboleda', 'arboleda', '1725417999', 'jnaarboleda@gmail.com', '0998098630', '2025-06-20', '1', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-15 18:54:47'),
(4, 'Fernando', 'fernando@gmail.com', 'asdasda', '1002003001', 'fer@mail.com', '90020030022', '0000-00-00', '0', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 10:25:07'),
(5, 'Juan', 'juanf', 'Fadfsdfsdf', '1002003002', 'juanf@gmail.com', '09002003003', '0000-00-00', '0', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 10:44:59'),
(6, 'Juan', 'juan2', '2', '1002003004', 'juan2@mail.com', '09002003005', '0000-00-00', '0', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 10:55:50'),
(7, 'juan', 'juan3', 'fsdfsdfsdf', '1002003006', 'juan4@mail.com', '1002003006', '0000-00-00', '0', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 10:58:17'),
(8, 'juan', 'juan5', 'sdfsdfsdf', '1002003007', 'juan5@mail.com', '9002003007', '0000-00-00', '0', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 11:00:09'),
(9, 'juan6', 'juan6', 'asdasd', '1002003008', 'juan6@mail.com', '09002003008', '0000-00-00', '0', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 11:02:38'),
(10, 'juan6', 'juan7', 'asdasd', '1002003008', 'juan7@mail.com', '09002003008', '2025-06-17', '0', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 11:05:16'),
(11, '', 'jarboleda@gmail.com', '', '', '', '', '0000-00-00', '0', '1234', 1, NULL, NULL, NULL, NULL, '2025-06-28 17:43:13'),
(12, 'Juan', 'jperez2', 'Perez', '1002003001', 'jperez2@gmail.com', '0900200312', '2025-06-17', '0', 'contra@#123z', 1, NULL, NULL, NULL, NULL, '2025-06-28 18:58:34'),
(13, 'Juan', 'jperez3', 'Perez', '1002003001', 'jarboleda@gmail.com', '0900200312', '2025-06-26', '0', 'contra@#123z', 1, NULL, NULL, NULL, NULL, '2025-06-28 19:37:00'),
(14, 'Juan', 'jperez3', 'Perez', '1002003001', 'jarboleda@gmail.com', '0900200312', '2025-06-26', '0', 'contra@#123z', 1, NULL, NULL, NULL, NULL, '2025-06-28 19:37:00'),
(15, 'Juan', 'jperez4', 'Perez', '1002003009', 'jperez4@gmail.com', '0900200312', '2025-06-28', '0', 'contra@#123z', 1, NULL, NULL, NULL, NULL, '2025-06-28 19:39:33'),
(16, 'Juan', 'jperez5', 'Perez', '100200310', 'jperez5@mail.com', '0900200312', '2025-06-28', 'Masculino', '$2y$10$K6Ze/osP64RFoCzoMGEjWO9FgCfOjgRUMfxXqitBvnCjgNxYzD1na', 1, NULL, NULL, NULL, NULL, '2025-07-08 22:23:02'),
(17, 'John', 'johndoe', 'Doe', '1002003020', 'johndoe@mail.com', '090200133', '2025-07-10', 'Masculino', '$2y$10$v3Aao1kYOwywJjx6dBfFCur9wOOWZKfD6u9yM9MOauuXxajneG4Vm', 1, NULL, NULL, NULL, '2025-07-15 20:55:07', '2025-07-19 19:53:54'),
(18, 'Gina', 'gpalma', 'Palma', '100200360', 'gpalma@mail.com', '0900200361', '2025-07-01', 'Femenino', '$2y$10$rCkOuAv5sPa/PgkDPixWK.uvenAJV76puztT5/Y08KM9tq1arLTEe', 1, NULL, NULL, NULL, '2025-07-21 16:30:27', '2025-07-21 11:30:27'),
(19, 'Juan', 'juanA', 'AAAAAA', '100200380', 'juanA@mail.com', '0900200382', '2025-07-03', 'Masculino', '$2y$10$AXD2LgobuKvu25uCskoPaOr57HH1wke5KRG32cZVxsCNONMtUewOG', 1, NULL, NULL, NULL, '2025-07-21 16:33:46', '2025-07-21 11:33:46'),
(20, 'Usuario', 'usuApe', 'Apellido', '100200390', 'usuApe@mail.com', '0900200390', '2025-07-12', 'Masculino', '$2y$10$bSGE4ittoPbu8K4o5cPe/eLtSiA7xvC2kiAiFiCHudj8MZ.nGCBP.', 1, NULL, NULL, NULL, '2025-07-21 21:39:48', '2025-07-21 16:39:48'),
(21, 'jose', 'gpalma@mail.com', 'cuervo', '1722417331', 'njarboleda@pucesi.edu.ec', '123445667', '2025-08-05', 'Masculino', '$2y$10$3yWQPXcG44lwCMjtbJQtyOOZh9iKxIApj4..gJMZhZHZT9FVWQ6nu', 1, NULL, NULL, NULL, NULL, '2025-08-14 18:54:40'),
(22, 'fabiloy', 'f@mail.com', 'valente', '1234', 'f@mail.com', '0998098630', '2025-08-21', 'Femenino', '$2y$10$/qo7aN/i4nz24sa6.strf.I0javiU/IMlHxIL6TBJ.rGoAiFEoQYy', 1, NULL, NULL, NULL, NULL, '2025-08-26 11:15:02'),
(23, 'fabiloy', 'Fvalente@mail.com', 'valente', '1751969053', 'Fvalente@mail.com', '0998098630', '2025-08-12', 'Femenino', '$2y$10$VQm7eS1IlOH0y0Sl8RYY2OWYQhAdRcq/4YYFFMKvjnagVnPgg3N7m', 1, NULL, NULL, NULL, NULL, '2025-08-26 11:17:25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_rol`
--

CREATE TABLE `tbl_user_rol` (
  `id_users_rol` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `user_rol_estado` tinyint(1) DEFAULT NULL,
  `user_rol_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbl_user_rol`
--

INSERT INTO `tbl_user_rol` (`id_users_rol`, `id_users`, `id_rol`, `user_rol_estado`, `user_rol_created_at`) VALUES
(1, 2, 1, 1, '2025-07-20 01:59:50'),
(2, 3, 2, 1, '2025-06-16 00:00:12'),
(3, 5, 2, 1, '2025-06-23 15:44:59'),
(4, 6, 2, 1, '2025-06-23 15:55:50'),
(5, 7, 2, 1, '2025-06-23 15:58:17'),
(6, 8, 2, 1, '2025-06-23 16:00:09'),
(7, 9, 2, 1, '2025-06-23 16:02:38'),
(8, 10, 2, 1, '2025-06-23 16:05:16'),
(9, 11, 2, 1, '2025-06-28 22:43:13'),
(10, 12, 2, 1, '2025-06-28 23:58:34'),
(11, 13, 2, 1, '2025-06-29 00:37:00'),
(12, 14, 2, 1, '2025-06-29 00:37:00'),
(13, 15, 2, 1, '2025-06-29 00:39:33'),
(14, 16, 2, 1, '2025-06-29 00:43:02'),
(15, 17, 1, 1, '2025-07-14 16:36:11'),
(16, 18, 3, 1, '2025-07-21 16:22:59'),
(17, 19, 2, 1, '2025-07-21 16:33:26'),
(18, 20, 4, 1, '2025-07-21 21:46:46'),
(19, 21, 2, 1, '2025-08-14 23:54:40'),
(20, 22, 2, 1, '2025-08-26 16:15:02'),
(21, 23, 2, 1, '2025-08-26 16:17:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_catalogo`
--
ALTER TABLE `tbl_catalogo`
  ADD PRIMARY KEY (`id_catalogo`);

--
-- Indexes for table `tbl_datos_generales`
--
ALTER TABLE `tbl_datos_generales`
  ADD PRIMARY KEY (`id_datos_generales`),
  ADD KEY `id_users` (`id_users`);

--
-- Indexes for table `tbl_datos_generales_parentesco`
--
ALTER TABLE `tbl_datos_generales_parentesco`
  ADD PRIMARY KEY (`id_datos_generales_parentesco`),
  ADD KEY `id_datos_parentescos` (`id_datos_parentescos`),
  ADD KEY `id_datos_generales` (`id_datos_generales`);

--
-- Indexes for table `tbl_datos_parentesco`
--
ALTER TABLE `tbl_datos_parentesco`
  ADD PRIMARY KEY (`id_datos_parentesco`);

--
-- Indexes for table `tbl_funcionalidad`
--
ALTER TABLE `tbl_funcionalidad`
  ADD PRIMARY KEY (`id_funcionalidad`);

--
-- Indexes for table `tbl_item_catalogo`
--
ALTER TABLE `tbl_item_catalogo`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_catalogo` (`id_catalogo`);

--
-- Indexes for table `tbl_rol`
--
ALTER TABLE `tbl_rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `tbl_rol_access`
--
ALTER TABLE `tbl_rol_access`
  ADD PRIMARY KEY (`id_principal_rol_access`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_funcionalidad` (`id_funcionalidad`);

--
-- Indexes for table `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id_users`);

--
-- Indexes for table `tbl_user_rol`
--
ALTER TABLE `tbl_user_rol`
  ADD PRIMARY KEY (`id_users_rol`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_catalogo`
--
ALTER TABLE `tbl_catalogo`
  MODIFY `id_catalogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `tbl_datos_generales`
--
ALTER TABLE `tbl_datos_generales`
  MODIFY `id_datos_generales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `tbl_datos_generales_parentesco`
--
ALTER TABLE `tbl_datos_generales_parentesco`
  MODIFY `id_datos_generales_parentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `tbl_datos_parentesco`
--
ALTER TABLE `tbl_datos_parentesco`
  MODIFY `id_datos_parentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `tbl_funcionalidad`
--
ALTER TABLE `tbl_funcionalidad`
  MODIFY `id_funcionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tbl_item_catalogo`
--
ALTER TABLE `tbl_item_catalogo`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT for table `tbl_rol`
--
ALTER TABLE `tbl_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_rol_access`
--
ALTER TABLE `tbl_rol_access`
  MODIFY `id_principal_rol_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=120;

--
-- AUTO_INCREMENT for table `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `tbl_user_rol`
--
ALTER TABLE `tbl_user_rol`
  MODIFY `id_users_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_datos_generales`
--
ALTER TABLE `tbl_datos_generales`
  ADD CONSTRAINT `tbl_datos_generales_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id_users`);

--
-- Constraints for table `tbl_datos_generales_parentesco`
--
ALTER TABLE `tbl_datos_generales_parentesco`
  ADD CONSTRAINT `tbl_datos_generales_parentesco_ibfk_1` FOREIGN KEY (`id_datos_parentescos`) REFERENCES `tbl_datos_parentesco` (`id_datos_parentesco`),
  ADD CONSTRAINT `tbl_datos_generales_parentesco_ibfk_2` FOREIGN KEY (`id_datos_generales`) REFERENCES `tbl_datos_generales` (`id_datos_generales`);

--
-- Constraints for table `tbl_item_catalogo`
--
ALTER TABLE `tbl_item_catalogo`
  ADD CONSTRAINT `tbl_item_catalogo_ibfk_1` FOREIGN KEY (`id_catalogo`) REFERENCES `tbl_catalogo` (`id_catalogo`);

--
-- Constraints for table `tbl_rol_access`
--
ALTER TABLE `tbl_rol_access`
  ADD CONSTRAINT `tbl_rol_access_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`),
  ADD CONSTRAINT `tbl_rol_access_ibfk_2` FOREIGN KEY (`id_funcionalidad`) REFERENCES `tbl_funcionalidad` (`id_funcionalidad`);

--
-- Constraints for table `tbl_user_rol`
--
ALTER TABLE `tbl_user_rol`
  ADD CONSTRAINT `tbl_user_rol_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id_users`),
  ADD CONSTRAINT `tbl_user_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
