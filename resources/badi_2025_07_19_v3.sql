-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-07-2025 a las 18:01:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `badi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_catalogo`
--

CREATE TABLE `tbl_catalogo` (
  `id_catalogo` int(11) NOT NULL,
  `cat_codigo` varchar(25) DEFAULT NULL,
  `cat_nombre` varchar(250) DEFAULT NULL,
  `ca_estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_catalogo`
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
-- Estructura de tabla para la tabla `tbl_datos_generales`
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
  `datos_agua` tinyint(1) DEFAULT NULL,
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
  `datos_estado` tinyint(4) DEFAULT 1,
  `datos_created_at` datetime DEFAULT current_timestamp(),
  `datos_updated_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_datos_generales`
--

INSERT INTO `tbl_datos_generales` (`id_datos_generales`, `id_users`, `datos_parentesco_id`, `datos_provincia`, `datos_canton`, `datos_tipo_parroquias`, `datos_parroquias`, `datos_comunidades`, `datos_barrios`, `datos_tipo_viviendas`, `datos_techos`, `datos_paredes`, `datos_pisos`, `datos_cuarto`, `datos_combustibles_cocina`, `datos_servicios_higienicos`, `datos_viviendas`, `datos_pago_vivienda`, `datos_agua`, `datos_pago_agua`, `datos_pago_luz`, `datos_cantidad_luz`, `datos_internet`, `datos_pago_internet`, `datos_tv_cable`, `datos_tv_pago`, `datos_eliminacion_basura`, `datos_lugares_mayor_frecuencia_viveres`, `datos_gastos_viveres_alimentacion`, `datos_medio_transporte`, `datos_estado_transporte`, `datos_terrenos`, `datos_celular`, `datos_cantidad_celulare`, `datos_plan_celular`, `datos_observacion`, `datos_resultado`, `datos_estado`, `datos_created_at`, `datos_updated_at`) VALUES
(10, 3, NULL, NULL, NULL, NULL, NULL, 'Esto es una prueba ', '', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, 0, NULL, 0, 0, 0, 0, 0, 0, 0, NULL, NULL, 0, 'Moto', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-02 10:09:43', '2025-07-02 10:09:43'),
(11, 16, 0, 3, '0', 'urbano', 99, '123', '123', 169, 172, 176, 181, 0, 187, 191, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Malo', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:01:19', '2025-07-07 11:01:19'),
(12, 16, 0, 3, '0', 'urbano', 99, '123', '123', 169, 172, 176, 181, 0, 187, 191, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Malo', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:02:43', '2025-07-07 11:02:43'),
(13, 16, 0, 3, '0', 'urbano', 100, '123', '123', 168, 172, 176, 181, 0, 187, 192, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:07:04', '2025-07-07 11:07:04'),
(14, 16, 0, 2, '0', 'urbano', 141, 'asd', 'asd', 168, 172, 176, 181, 0, 187, 192, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:09:15', '2025-07-07 11:09:15'),
(15, 16, 0, 2, '0', 'urbano', 141, 'asd', 'asd', 168, 172, 176, 181, 0, 187, 192, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:11:19', '2025-07-07 11:11:19'),
(16, 16, 0, 2, '0', 'urbano', 141, '123', '123', 169, 172, 176, 181, 0, 187, 194, 197, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 227, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:13:00', '2025-07-07 11:13:00'),
(17, 16, NULL, 3, '0', 'urbano', 100, 'asd', 'asd', 169, 172, 176, 181, 0, 187, 191, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:15:38', '2025-07-07 11:15:38'),
(18, 16, NULL, 3, '0', 'urbano', 127, 'sdf', 'sdf', 168, 172, 176, 181, 0, 188, 191, 199, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:33:08', '2025-07-07 11:33:08'),
(19, 16, NULL, 3, '0', 'urbano', 127, 'sdf', 'sdf', 168, 172, 176, 181, 0, 188, 191, 199, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:36:18', '2025-07-07 11:36:18'),
(20, 16, 8, 3, '0', 'urbano', 127, 'sdf', 'sdf', 168, 172, 176, 181, 0, 188, 191, 199, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 226, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:37:53', '2025-07-07 11:37:53'),
(21, 16, 10, 2, '0', 'urbano', 141, 'Campo 1', 'Barrio 1', 169, 172, 176, 181, 4, 187, 192, 200, 150, 127, 23, 13, 123, 0, 45, 0, 18, 217, 222, 500, 'Carro/Moto', 'Bueno/Regular', 0, 0, 2, 0, '', NULL, 1, '2025-07-07 11:41:24', '2025-07-07 11:41:24'),
(22, 16, 12, 2, '0', 'urbano', 141, '123', '123', 168, 172, 176, 181, 0, 189, 191, 196, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 222, 0, 'Carro', 'Bueno', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:45:45', '2025-07-07 11:45:45'),
(23, 16, 13, 2, '0', 'urbano', 141, '123', '123', 168, 172, 176, 181, 12, 187, 191, 200, 0, 127, 0, 0, 0, 0, 0, 0, 0, 217, 227, 0, 'Carro/Carro/Pasola a gasolina/Pasola a gasolina', 'Bueno/Bueno/Bueno/Regular', 0, 0, 0, 0, '', NULL, 1, '2025-07-07 11:57:19', '2025-07-07 11:57:19'),
(24, 16, 0, 2, '0', 'urbano', 141, 'dfg', 'dfg', 168, 172, 176, 182, 0, 187, 191, 199, 0, 127, 0, 0, 0, 0, 0, 0, 0, 218, 222, 0, 'Carro/Carro/Carro', 'Bueno/Bueno/Bueno', 0, 0, 0, 0, '', NULL, 0, '2025-07-07 12:06:26', '2025-07-07 12:06:26'),
(25, 17, 15, 2, '0', 'urbano', 155, '123', '123', 170, 173, 177, 182, 12, 187, 191, 196, 12, 127, 12, 12, 12, 0, 12, 0, 12, 217, 227, 12, 'Ninguno', 'Ninguno', 0, 0, 2, 0, '', NULL, 0, '2025-07-18 22:37:32', '2025-07-18 22:37:32'),
(26, 17, 16, 2, 'Espejo', 'urbano', 155, '123', '123', 168, 173, 176, 181, 12, 187, 191, 196, 12, 127, 12, 12, 12, 0, 12, 0, 12, 217, 222, 12, 'Ninguno', 'Ninguno', 0, 0, 12, 0, '', NULL, 0, '2025-07-18 22:55:15', '2025-07-18 22:55:15'),
(27, 17, 17, 3, 'Antonio Ante', 'urbano', 127, '12', '12', 168, 172, 176, 181, 12, 187, 191, 196, 12, 127, 12, 12, 12, 0, 0, 0, 0, 217, 222, 12, 'Ninguno', 'Ninguno', 0, 0, 12, 0, 'Observaciones de prueba .......', NULL, 1, '2025-07-18 23:06:17', '2025-07-18 23:06:17'),
(28, 17, 18, 2, 'Tulcán', 'urbano', 141, '111', '1111', 169, 173, 176, 182, 111, 187, 191, 197, 11, 127, 11, 11, 11, 0, 11, 0, 11, 217, 222, 11, 'Ninguno', 'Ninguno', 0, 0, 0, 0, '- Obs 1\r\n- Obs 2\r\n- Obs 3\r\n- Obs 4', NULL, 0, '2025-07-18 23:08:45', '2025-07-18 23:08:45'),
(29, 17, 19, 2, 'Tulcán', 'urbano', 141, '123', '123', 168, 172, 176, 181, 12, 188, 194, 196, 12, 127, 12, 12, 12, 0, 0, 0, 0, 217, 222, 0, 'Ninguno', 'Ninguno', 0, 0, 12, 0, 'dfsdfsdfsdf', NULL, 1, '2025-07-18 23:11:52', '2025-07-18 23:11:52'),
(30, 17, 20, 2, 'Tulcán', 'rural', 143, 'sdfsdfsdf', 'sdfsdfsdfsdffsd', 168, 172, 176, 181, 2, 188, 192, 196, 450, 127, 21, 21, 21, 0, 21, 0, 21, 220, 227, 100, 'Carro', 'Malo', 0, 0, 2, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', 1, '2025-07-19 12:12:32', '2025-07-19 12:12:32'),
(31, 17, 21, 3, 'Ibarra', 'urbano', 101, 'sdfsdf', 'sdfsdf', 168, 172, 176, 181, 2, 187, 191, 197, 2, 127, 2, 2, 2, 0, 2, 0, 2, 218, 226, 2, 'Ninguno', 'Ninguno', 0, 0, 2, 0, 'Los gastos exceden al ingreso mensual y no se detectan vehículos con estado regular o bueno', 'Aprobado', 1, '2025-07-19 15:28:25', '2025-07-19 15:28:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_datos_generales_parentesco`
--

CREATE TABLE `tbl_datos_generales_parentesco` (
  `id_datos_generales_parentesco` int(11) NOT NULL,
  `id_datos_parentescos` int(11) NOT NULL,
  `id_datos_generales` int(11) NOT NULL,
  `datos_generales_parentesco_estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_datos_generales_parentesco`
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
(15, 17, 27, 1),
(16, 18, 28, 0),
(17, 19, 29, 1),
(18, 20, 30, 1),
(19, 21, 31, 1),
(20, 22, 31, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_datos_parentesco`
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
-- Volcado de datos para la tabla `tbl_datos_parentesco`
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
(17, 'asd', 'asd', '123', '123', 236, 242, 247, '2025-07-09', 12, 251, 1, '12', 'Sí', '12', 12.00, '12', 1),
(18, '1111', '111', '111', '111', 236, 242, 246, '2025-07-07', 111, 251, 1, '11', 'Sí', '111', 111.00, '11', 0),
(19, '123', '123', '123', '123', 236, 242, 246, '2025-07-16', 12, 251, 1, '12', 'Sí', '12', 12.00, '12', 1),
(20, 'Juan', 'Andrade', '1002003040', '0900200340', 237, 242, 247, '2025-07-22', 21, 251, 2, 'Ninguna', 'Sí', 'Albañil', 340.00, 'Padre', 1),
(21, 'Carlos', 'Perez', '100200350', '0900200350', 236, 242, 247, '2025-07-03', 23, 251, 2, 'Ninguna', 'No', 'Ninguna', 0.00, 'Hijo', 1),
(22, 'Diana', 'Perez', '100200351', '0900200351', 236, 243, 248, '2025-07-19', 33, 252, 2, 'Ninguna', 'No', 'Ninguna', 0.00, 'Prima', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_funcionalidad`
--

CREATE TABLE `tbl_funcionalidad` (
  `id_funcionalidad` int(11) NOT NULL,
  `funcionalidad_nombre_funcion` varchar(500) DEFAULT NULL,
  `funcionalidad_url` varchar(500) DEFAULT NULL,
  `funcionalidad_estado` tinyint(1) DEFAULT NULL,
  `funcionalidad_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_funcionalidad`
--

INSERT INTO `tbl_funcionalidad` (`id_funcionalidad`, `funcionalidad_nombre_funcion`, `funcionalidad_url`, `funcionalidad_estado`, `funcionalidad_created_at`) VALUES
(1, 'Close session', '/logout', 1, '2025-06-16 00:27:52'),
(3, 'Formulario de datos generales', '/formGeneralInformation', 1, '2025-06-28 22:35:21'),
(4, 'Obtener provincias', '/getProvinces', 1, '2025-06-30 15:27:31'),
(5, 'Obtener ciudades', '/getCities', 1, '2025-06-30 15:57:03'),
(6, 'Obtener parroquias', '/getParishes', 1, '2025-06-30 16:26:25'),
(7, 'Obtener tipos de vivienda', '/getTypesHousing', 1, '2025-07-02 01:22:31'),
(8, 'Obtener tipos de techo', '/getRoofTypes', 1, '2025-07-02 01:37:09'),
(9, 'Obtener tipos de pared', '/getWallTypes', 1, '2025-07-02 02:33:46'),
(10, 'Obtener tipos de piso', '/getFloorTypes', 1, '2025-07-02 02:51:13'),
(11, 'Obtener tipos de combustible cocina', '/getCookingFuel', 1, '2025-07-02 02:59:04'),
(12, 'Obtener servicios higiénicos', '/getHygienicService', 1, '2025-07-02 03:02:13'),
(13, 'Vivienda o alojamiento', '/getHousing', 1, '2025-07-02 03:08:41'),
(14, 'Obtener servicios de agua', '/getWaterServices', 1, '2025-07-02 03:13:08'),
(15, 'Obtener eliminación de basura', '/getGarbageRemoval', 1, '2025-07-02 03:25:18'),
(16, 'Obtener lugares frecuentes de compra', '/getFrequentShopPlaces', 1, '2025-07-02 03:33:46'),
(17, 'Obtener tipo de vehículos', '/getVehiclesTypes', 1, '2025-07-02 03:44:53'),
(18, 'Obtener estado de transporte', '/getTransportStatus', 1, '2025-07-02 03:51:44'),
(19, 'Insertar datos generales y parentesco', '/insertGeneralInformation', 1, '2025-07-02 15:07:53'),
(20, 'Obtener lista de etnias', '/getEthnicity', 1, '2025-07-07 14:24:18'),
(21, 'Obtener lista de géneros', '/getGenders', 1, '2025-07-07 14:31:18'),
(22, 'Obtener niveles de educación', '/getEducationLevel', 1, '2025-07-07 14:45:36'),
(23, 'Obtener lista de estado civil', '/getMaritalStatus', 1, '2025-07-07 14:53:26'),
(24, 'Datos registrados', '/informationRecords', 1, '2025-07-07 19:29:39'),
(25, 'Vista para modificar perfil personal', '/profile', 1, '2025-07-09 02:52:33'),
(26, 'Obtener parentescos', '/getRelationShipId', 1, '2025-07-14 16:02:56'),
(27, 'Dar de baja registro de información general con parentescos', '/deleteGeneralInformationRecord', 1, '2025-07-14 16:31:11'),
(28, 'Actualizar perfil', '/updateProfile', 1, '2025-07-15 20:22:42'),
(29, 'Actualizar contraseña', '/updateProfilePassword', 1, '2025-07-15 20:40:13'),
(30, 'Exportar excel', '/exportExcel', 1, '2025-07-20 01:02:55'),
(31, 'Actualizar rol de usuario', '/updateRolUser', 1, '2025-07-20 01:03:43'),
(32, 'Obtener documento de usuario', '/getDocument', 1, '2025-07-20 01:33:39'),
(33, 'Obtener roles', '/getRoles', 1, '2025-07-20 01:38:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_item_catalogo`
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
-- Volcado de datos para la tabla `tbl_item_catalogo`
--

INSERT INTO `tbl_item_catalogo` (`id_item`, `itc_codigo`, `itc_nombre`, `itc_descripcion`, `itc_estado`, `id_catalogo`) VALUES
(2, 'CAR', 'Carchi', 'Provincia de Carchi', 1, 18),
(3, 'IMB', 'Imbabura', 'Provincia de Imbabura', 1, 18),
(4, 'IBARRA', 'Ibarra', 'Cantón de Imbabura', 1, 19),
(5, 'ANTON', 'Antonio Ante', 'Cantón de Imbabura', 1, 19),
(6, 'COTAC', 'Cotacachi', 'Cantón de Imbabura', 1, 19),
(7, 'OTAV', 'Otavalo', 'Cantón de Imbabura', 1, 19),
(8, 'PIMAM', 'Pimampiro', 'Cantón de Imbabura', 1, 19),
(9, 'URCU', 'Urcuquí', 'Cantón de Imbabura', 1, 19),
(10, 'TULCÁN', 'Tulcán', 'Cantón de Carchi', 1, 19),
(11, 'BOLÍVAR', 'Bolívar', 'Cantón de Carchi', 1, 19),
(12, 'ESPEJO', 'Espejo', 'Cantón de Carchi', 1, 19),
(13, 'MIRA', 'Mira', 'Cantón de Carchi', 1, 19),
(14, 'MONTÚFAR', 'Montúfar', 'Cantón de Carchi', 1, 19),
(99, 'PARR-IB-URB', 'Alpachaca', 'Parroquia urbana de Ibarra', 1, 20),
(100, 'PARR-IB-URB', 'Caranqui', 'Parroquia urbana de Ibarra', 1, 20),
(101, 'PARR-IB-URB', 'El Sagrario', 'Parroquia urbana de Ibarra', 1, 20),
(102, 'PARR-IB-URB', 'La Dolorosa de Priorato', 'Parroquia urbana de Ibarra', 1, 20),
(103, 'PARR-IB-URB', 'San Francisco', 'Parroquia urbana de Ibarra', 1, 20),
(104, 'PARR-IB-RURAL', 'Ambuquí', 'Parroquia rural de Ibarra', 1, 20),
(105, 'PARR-IB-RURAL', 'Angochagua', 'Parroquia rural de Ibarra', 1, 20),
(106, 'PARR-IB-RURAL', 'La Carolina', 'Parroquia rural de Ibarra', 1, 20),
(107, 'PARR-IB-RURAL', 'La Esperanza', 'Parroquia rural de Ibarra', 1, 20),
(108, 'PARR-IB-RURAL', 'Lita', 'Parroquia rural de Ibarra', 1, 20),
(109, 'PARR-IB-RURAL', 'Salinas', 'Parroquia rural de Ibarra', 1, 20),
(110, 'PARR-IB-RURAL', 'San Antonio de Ibarra', 'Parroquia rural de Ibarra', 1, 20),
(111, 'PARR-OT-URB', 'Otavalo', 'Parroquia urbana de Otavalo', 1, 20),
(112, 'PARR-OT-URB', 'San Pablo del Lago', 'Parroquia urbana de Otavalo', 1, 20),
(113, 'PARR-OT-RURAL', 'Eugenio Espejo', 'Parroquia rural de Otavalo', 1, 20),
(114, 'PARR-OT-RURAL', 'González Suárez', 'Parroquia rural de Otavalo', 1, 20),
(115, 'PARR-OT-RURAL', 'San Rafael', 'Parroquia rural de Otavalo', 1, 20),
(116, 'PARR-OT-RURAL', 'San Juan de Ilumán', 'Parroquia rural de Otavalo', 1, 20),
(117, 'PARR-OT-RURAL', 'Dr. Miguel Egas Cabezas', 'Parroquia rural de Otavalo', 1, 20),
(118, 'PARR-OT-RURAL', 'San José de Quichinche', 'Parroquia rural de Otavalo', 1, 20),
(119, 'PARR-OT-RURAL', 'San Pedro de Pataquí', 'Parroquia rural de Otavalo', 1, 20),
(120, 'PARR-OT-RURAL', 'Selva Alegre', 'Parroquia rural de Otavalo', 1, 20),
(121, 'PARR-CO-URB', 'Cotacachi', 'Parroquia urbana de Cotacachi', 1, 20),
(122, 'PARR-CO-RURAL', 'García Moreno', 'Parroquia rural de Cotacachi', 1, 20),
(123, 'PARR-CO-RURAL', 'Quiroga', 'Parroquia rural de Cotacachi', 1, 20),
(124, 'PARR-CO-RURAL', 'Apuela', 'Parroquia rural de Cotacachi', 1, 20),
(125, 'PARR-CO-RURAL', 'Plaza Gutiérrez', 'Parroquia rural de Cotacachi', 1, 20),
(126, 'PARR-CO-RURAL', 'Vacas Galindo', 'Parroquia rural de Cotacachi', 1, 20),
(127, 'PARR-AA-URB', 'Atuntaqui', 'Parroquia urbana de Antonio Ante', 1, 20),
(128, 'PARR-AA-RURAL', 'Andrade Marín', 'Parroquia rural de Antonio Ante', 1, 20),
(129, 'PARR-AA-RURAL', 'Imbaya', 'Parroquia rural de Antonio Ante', 1, 20),
(130, 'PARR-AA-RURAL', 'Natatbela', 'Parroquia rural de Antonio Ante', 1, 20),
(131, 'PARR-AA-RURAL', 'Chaltura', 'Parroquia rural de Antonio Ante', 1, 20),
(132, 'PARR-AA-RURAL', 'San Roque', 'Parroquia rural de Antonio Ante', 1, 20),
(133, 'PARR-PI-URB', 'Pimampiro', 'Parroquia urbana de Pimampiro', 1, 20),
(134, 'PARR-PI-RURAL', 'Chugá', 'Parroquia rural de Pimampiro', 1, 20),
(135, 'PARR-PI-RURAL', 'Mariano Acosta', 'Parroquia rural de Pimampiro', 1, 20),
(136, 'PARR-PI-RURAL', 'San Francisco de Sigsipam', 'Parroquia rural de Pimampiro', 1, 20),
(137, 'PARR-UR-URB', 'Urcuquí', 'Parroquia urbana de Urcuquí', 1, 20),
(138, 'PARR-UR-RURAL', 'Pablo Arenas', 'Parroquia rural de Urcuquí', 1, 20),
(139, 'PARR-UR-RURAL', 'San Blas', 'Parroquia rural de Urcuquí', 1, 20),
(140, 'PARR-UR-RURAL', 'Tahuando', 'Parroquia rural de Urcuquí', 1, 20),
(141, 'PARR-TU-URB', 'Tulcán', 'Parroquia urbana de Tulcán', 1, 20),
(142, 'PARR-TU-RURAL', 'El Carmelo', 'Parroquia rural de Tulcán', 1, 20),
(143, 'PARR-TU-RURAL', 'Huaca', 'Parroquia rural de Tulcán', 1, 20),
(144, 'PARR-TU-RURAL', 'Julio Andrade', 'Parroquia rural de Tulcán', 1, 20),
(145, 'PARR-TU-RURAL', 'La Libertad', 'Parroquia rural de Tulcán', 1, 20),
(146, 'PARR-TU-RURAL', 'Maldonado', 'Parroquia rural de Tulcán', 1, 20),
(147, 'PARR-TU-RURAL', 'Pioter', 'Parroquia rural de Tulcán', 1, 20),
(148, 'PARR-TU-RURAL', 'Tufiño', 'Parroquia rural de Tulcán', 1, 20),
(149, 'PARR-TU-RURAL', 'Urbanización Nueva Loja', 'Parroquia rural de Tulcán', 1, 20),
(150, 'PARR-BO-URB', 'Bolívar', 'Parroquia urbana de Bolívar', 1, 20),
(151, 'PARR-BO-RURAL', 'Garcia Moreno', 'Parroquia rural de Bolívar', 1, 20),
(152, 'PARR-BO-RURAL', 'Los Andes', 'Parroquia rural de Bolívar', 1, 20),
(153, 'PARR-BO-RURAL', 'Monte Olivo', 'Parroquia rural de Bolívar', 1, 20),
(154, 'PARR-BO-RURAL', 'San Vicente de Pusir', 'Parroquia rural de Bolívar', 1, 20),
(155, 'PARR-ES-URB', 'El Ángel', 'Parroquia urbana de Espejo', 1, 20),
(156, 'PARR-ES-RURAL', 'La Libertad', 'Parroquia rural de Espejo', 1, 20),
(157, 'PARR-ES-RURAL', 'San Isidro', 'Parroquia rural de Espejo', 1, 20),
(158, 'PARR-ES-RURAL', 'El Goaltal', 'Parroquia rural de Espejo', 1, 20),
(159, 'PARR-MI-URB', 'Mira', 'Parroquia urbana de Mira', 1, 20),
(160, 'PARR-MI-RURAL', 'Concepción', 'Parroquia rural de Mira', 1, 20),
(161, 'PARR-MI-RURAL', 'Jacinto Jijón y Caamaño', 'Parroquia rural de Mira', 1, 20),
(162, 'PARR-MI-RURAL', 'Juan Montalvo', 'Parroquia rural de Mira', 1, 20),
(163, 'PARR-MO-URB', 'San Gabriel', 'Parroquia urbana de Montúfar', 1, 20),
(164, 'PARR-MO-RURAL', 'Cristóbal Colón', 'Parroquia rural de Montúfar', 1, 20),
(165, 'PARR-MO-RURAL', 'Chitán de Navarretes', 'Parroquia rural de Montúfar', 1, 20),
(166, 'PARR-MO-RURAL', 'Fernández Salvador', 'Parroquia rural de Montúfar', 1, 20),
(167, 'PARR-MO-RURAL', 'La Paz', 'Parroquia rural de Montúfar', 1, 20),
(168, 'VIVIENDA', 'Casa', 'Tipo de vivienda: Casa', 1, 22),
(169, 'VIVIENDA', 'Departamento', 'Tipo de vivienda: Departamento', 1, 22),
(170, 'VIVIENDA', 'Cuartos', 'Tipo de vivienda: Cuartos', 1, 22),
(171, 'VIVIENDA', 'Mediagua', 'Tipo de vivienda: Mediagua', 1, 22),
(172, 'TECHO', 'Losa', 'Tipo de techo: Losa', 1, 23),
(173, 'TECHO', 'Eternit', 'Tipo de techo: Eternit', 1, 23),
(174, 'TECHO', 'Zinc', 'Tipo de techo: Zinc', 1, 23),
(175, 'TECHO', 'Teja', 'Tipo de techo: Teja', 1, 23),
(176, 'PARED', 'Hormigón', 'Tipo de pared: Hormigón', 1, 24),
(177, 'PARED', 'Ladrillo', 'Tipo de pared: Ladrillo', 1, 24),
(178, 'PARED', 'Bloque', 'Tipo de pared: Bloque', 1, 24),
(179, 'PARED', 'Adobe', 'Tipo de pared: Adobe', 1, 24),
(180, 'PARED', 'Madera', 'Tipo de pared: Madera', 1, 24),
(181, 'PISO', 'Duela', 'Tipo de piso Duela', 1, 25),
(182, 'PISO', 'Hormigón', 'Tipo de piso Hormigón', 1, 25),
(183, 'PISO', 'Tabla', 'Tipo de piso Tabla', 1, 25),
(184, 'PISO', 'Céramica', 'Tipo de piso Céramica', 1, 25),
(185, 'PISO', 'Tierra', 'Tipo de piso Tierra', 1, 25),
(186, 'PISO', 'Ladrillo', 'Tipo de piso Ladrillo', 1, 25),
(187, 'COMB-COCINA', 'Gas', 'Combustible de cocina: Gas', 1, 26),
(188, 'COMB-COCINA', 'Electricidad', 'Combustible de cocina: Electricidad', 1, 26),
(189, 'COMB-COCINA', 'Leña', 'Combustible de cocina: Leña', 1, 26),
(190, 'COMB-COCINA', 'No cocina', 'No utiliza cocina', 1, 26),
(191, 'SERV-HIG', 'Alcantarillado', 'Servicio higiénico: Alcantarillado', 1, 27),
(192, 'SERV-HIG', 'Pozo séptico', 'Servicio higiénico: Pozo séptico', 1, 27),
(193, 'SERV-HIG', 'Pozo ciego', 'Servicio higiénico: Pozo ciego', 1, 27),
(194, 'SERV-HIG', 'Letrina', 'Servicio higiénico: Letrina', 1, 27),
(195, 'SERV-HIG', 'No tiene', 'No cuenta con servicio higiénico', 1, 27),
(196, 'ALOJAMIENTO', 'Propia y esta pagada', 'Vivienda propia totalmente pagada', 1, 28),
(197, 'ALOJAMIENTO', 'Propia (regalada, heredad', 'Vivienda propia por herencia, regalo o posesión', 1, 28),
(198, 'ALOJAMIENTO', 'Prestada', 'Vivienda prestada por familiares u otros', 1, 28),
(199, 'ALOJAMIENTO', 'Propia y esta pagadando', 'Vivienda propia en proceso de pago', 1, 28),
(200, 'ALOJAMIENTO', 'Arrienda', 'Vivienda alquilada', 1, 28),
(201, 'ALOJAMIENTO', 'Anticresis', 'Vivienda bajo contrato de anticresis', 1, 28),
(202, 'SERV-AGUA', 'Red Pública', 'Abastecimiento de agua mediante red pública', 1, 29),
(203, 'SERV-AGUA', 'Pozo', 'Abastecimiento de agua mediante pozo propio o comunitario', 1, 29),
(204, 'SERV-AGUA', 'Río o vertiente, acequia ', 'Agua proveniente de fuentes naturales como ríos, vertientes, acequias o canales', 1, 29),
(205, 'SERV-AGUA', 'Carro repartidor', 'Abastecimiento de agua mediante reparto en carro', 1, 29),
(206, 'SERV-AGUA', 'Otros', 'Otro tipo de abastecimiento de agua no especificado', 1, 29),
(217, 'ELM-BAS', 'Carro recolector', 'Eliminación de basura mediante carro recolector municipal o privado', 1, 30),
(218, 'ELM-BAS', 'Lo botan a la calle, quebrada o rio', 'La basura es arrojada a lugares inadecuados como calles, quebradas o ríos', 1, 30),
(219, 'ELM-BAS', 'La queman', 'La basura es eliminada quemándola', 1, 30),
(220, 'ELM-BAS', 'Reciclan/entierran', 'Reciclaje o entierro de la basura en el terreno', 1, 30),
(221, 'ELM-BAS', 'Composta', 'La basura orgánica es convertida en compostaje', 1, 30),
(222, 'LUG-FREC-COMPRA', 'Supermercado', 'Compras frecuentes en supermercados grandes o cadenas comerciales', 1, 31),
(223, 'LUG-FREC-COMPRA', 'Mercados', 'Compras frecuentes en mercados municipales o populares', 1, 31),
(224, 'LUG-FREC-COMPRA', 'Ferias', 'Compras frecuentes en ferias ocasionales o ambulantes', 1, 31),
(225, 'LUG-FREC-COMPRA', 'Micromercados', 'Compras frecuentes en minimercados o locales pequeños', 1, 31),
(226, 'LUG-FREC-COMPRA', 'Tienda del barrio', 'Compras frecuentes en tiendas pequeñas del vecindario', 1, 31),
(227, 'LUG-FREC-COMPRA', 'Trueques', 'Intercambio de productos mediante trueques', 1, 31),
(228, 'LUG-FREC-COMPRA', 'Otros', 'Otros lugares no especificados donde se realizan compras', 1, 31),
(229, 'TIP-VEHICULOS', 'Carro', 'Vehículo tipo automóvil con motor de combustión o eléctrico', 1, 32),
(230, 'TIP-VEHICULOS', 'Moto', 'Motocicleta de combustión interna', 1, 32),
(231, 'TIP-VEHICULOS', 'Pasola a gasolina', 'Scooter o pasola que funciona con gasolina', 1, 32),
(232, 'TIP-VEHICULOS', 'Moto o pasola eléctrica', 'Vehículo de dos ruedas impulsado por energía eléctrica', 1, 32),
(233, 'EST-TRANSPORTE', 'Bueno', 'Estado del medio de transporte: bueno', 1, 33),
(234, 'EST-TRANSPORTE', 'Regular', 'Estado del medio de transporte: regular', 1, 33),
(235, 'EST-TRANSPORTE', 'Malo', 'Estado del medio de transporte: malo', 1, 33),
(236, 'ETNIA', 'Mestizo', 'Mestizo', 1, 34),
(237, 'ETNIA', 'Afroecuatoriano', 'Afroecuatoriano', 1, 34),
(238, 'ETNIA', 'Indígena', 'Indígena', 1, 34),
(239, 'ETNIA', 'Montubio', 'Montubio', 1, 34),
(240, 'ETNIA', 'Blanco', 'Blanco', 1, 34),
(241, 'ETNIA', 'Otro', 'Otro', 1, 34),
(242, 'GENERO', 'Masculino', 'Masculino', 1, 35),
(243, 'GENERO', 'Femenino', 'Femenino', 1, 35),
(244, 'GENERO', 'Otro', 'Otro', 1, 35),
(245, 'GENERO', 'Prefiero no decirlo', 'Prefiero no decirlo', 1, 35),
(246, 'NIV_EDUC', 'Primaria', 'Primaria', 1, 36),
(247, 'NIV_EDUC', 'Secundaria', 'Secundaria', 1, 36),
(248, 'NIV_EDUC', 'Bachillerato', 'Bachillerato', 1, 36),
(249, 'NIV_EDUC', 'Universitaria', 'Universitaria', 1, 36),
(250, 'NIV_EDUC', 'Ninguna', 'Ninguna', 1, 36),
(251, 'EST-CIV', 'Soltero/a', 'Soltero/a', 1, 37),
(252, 'EST-CIV', 'Casado/a', 'Casado/a', 1, 37),
(253, 'EST-CIV', 'Unión libre', 'Unión libre', 1, 37),
(254, 'EST-CIV', 'Separado/a', 'Separado/a', 1, 37),
(255, 'EST-CIV', 'Viudo/a', 'Viudo/a', 1, 37),
(258, 'TIP-VEHICULOS', 'Ninguno', 'Ninguno', 1, 32),
(259, 'EST-TRANSPORTE', 'Ninguno', 'Ninguno', 1, 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol`
--

CREATE TABLE `tbl_rol` (
  `id_rol` int(11) NOT NULL,
  `rol_nombre` varchar(25) DEFAULT NULL,
  `rol_estado` tinyint(1) DEFAULT NULL,
  `rol_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_rol`
--

INSERT INTO `tbl_rol` (`id_rol`, `rol_nombre`, `rol_estado`, `rol_created_at`) VALUES
(1, 'Administrador', 1, '2025-06-15 22:39:11'),
(2, 'Empleado', 1, '2025-06-15 22:39:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_rol_access`
--

CREATE TABLE `tbl_rol_access` (
  `id_principal_rol_access` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `id_funcionalidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_rol_access`
--

INSERT INTO `tbl_rol_access` (`id_principal_rol_access`, `id_rol`, `id_funcionalidad`) VALUES
(3, 1, 1),
(4, 2, 1),
(5, 1, 3),
(6, 2, 3),
(7, 1, 4),
(8, 2, 4),
(9, 1, 5),
(10, 2, 5),
(11, 1, 6),
(12, 2, 6),
(13, 1, 7),
(14, 2, 7),
(15, 1, 8),
(16, 2, 8),
(17, 1, 9),
(18, 2, 9),
(19, 1, 10),
(20, 2, 10),
(21, 1, 11),
(22, 2, 11),
(23, 1, 12),
(24, 2, 12),
(25, 1, 13),
(26, 2, 13),
(27, 1, 14),
(28, 2, 14),
(29, 1, 15),
(30, 2, 15),
(31, 1, 16),
(32, 2, 16),
(33, 1, 17),
(34, 2, 17),
(35, 1, 18),
(36, 2, 18),
(37, 1, 19),
(38, 2, 19),
(39, 1, 20),
(40, 2, 20),
(41, 1, 21),
(42, 2, 21),
(43, 1, 22),
(44, 2, 22),
(45, 1, 23),
(46, 2, 23),
(47, 1, 24),
(48, 2, 24),
(49, 1, 25),
(50, 2, 25),
(51, 1, 26),
(52, 2, 26),
(53, 1, 27),
(54, 1, 28),
(55, 2, 28),
(56, 1, 29),
(57, 2, 29),
(58, 1, 30),
(59, 2, 30),
(60, 1, 31),
(61, 1, 32),
(62, 1, 33);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_users`
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
-- Volcado de datos para la tabla `tbl_users`
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
(17, 'John', 'johndoe', 'Doe', '1002003020', 'johndoe@mail.com', '090200133', '2025-07-10', 'Masculino', '$2y$10$v3Aao1kYOwywJjx6dBfFCur9wOOWZKfD6u9yM9MOauuXxajneG4Vm', 1, NULL, NULL, NULL, '2025-07-15 20:55:07', '2025-07-19 19:53:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_user_rol`
--

CREATE TABLE `tbl_user_rol` (
  `id_users_rol` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `user_rol_estado` tinyint(1) DEFAULT NULL,
  `user_rol_created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_user_rol`
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
(15, 17, 1, 1, '2025-07-14 16:36:11');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_catalogo`
--
ALTER TABLE `tbl_catalogo`
  ADD PRIMARY KEY (`id_catalogo`);

--
-- Indices de la tabla `tbl_datos_generales`
--
ALTER TABLE `tbl_datos_generales`
  ADD PRIMARY KEY (`id_datos_generales`),
  ADD KEY `id_users` (`id_users`);

--
-- Indices de la tabla `tbl_datos_generales_parentesco`
--
ALTER TABLE `tbl_datos_generales_parentesco`
  ADD PRIMARY KEY (`id_datos_generales_parentesco`),
  ADD KEY `id_datos_parentescos` (`id_datos_parentescos`),
  ADD KEY `id_datos_generales` (`id_datos_generales`);

--
-- Indices de la tabla `tbl_datos_parentesco`
--
ALTER TABLE `tbl_datos_parentesco`
  ADD PRIMARY KEY (`id_datos_parentesco`);

--
-- Indices de la tabla `tbl_funcionalidad`
--
ALTER TABLE `tbl_funcionalidad`
  ADD PRIMARY KEY (`id_funcionalidad`);

--
-- Indices de la tabla `tbl_item_catalogo`
--
ALTER TABLE `tbl_item_catalogo`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_catalogo` (`id_catalogo`);

--
-- Indices de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tbl_rol_access`
--
ALTER TABLE `tbl_rol_access`
  ADD PRIMARY KEY (`id_principal_rol_access`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_funcionalidad` (`id_funcionalidad`);

--
-- Indices de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id_users`);

--
-- Indices de la tabla `tbl_user_rol`
--
ALTER TABLE `tbl_user_rol`
  ADD PRIMARY KEY (`id_users_rol`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_catalogo`
--
ALTER TABLE `tbl_catalogo`
  MODIFY `id_catalogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `tbl_datos_generales`
--
ALTER TABLE `tbl_datos_generales`
  MODIFY `id_datos_generales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT de la tabla `tbl_datos_generales_parentesco`
--
ALTER TABLE `tbl_datos_generales_parentesco`
  MODIFY `id_datos_generales_parentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `tbl_datos_parentesco`
--
ALTER TABLE `tbl_datos_parentesco`
  MODIFY `id_datos_parentesco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `tbl_funcionalidad`
--
ALTER TABLE `tbl_funcionalidad`
  MODIFY `id_funcionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `tbl_item_catalogo`
--
ALTER TABLE `tbl_item_catalogo`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=260;

--
-- AUTO_INCREMENT de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_rol_access`
--
ALTER TABLE `tbl_rol_access`
  MODIFY `id_principal_rol_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tbl_user_rol`
--
ALTER TABLE `tbl_user_rol`
  MODIFY `id_users_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_datos_generales`
--
ALTER TABLE `tbl_datos_generales`
  ADD CONSTRAINT `tbl_datos_generales_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id_users`);

--
-- Filtros para la tabla `tbl_datos_generales_parentesco`
--
ALTER TABLE `tbl_datos_generales_parentesco`
  ADD CONSTRAINT `tbl_datos_generales_parentesco_ibfk_1` FOREIGN KEY (`id_datos_parentescos`) REFERENCES `tbl_datos_parentesco` (`id_datos_parentesco`),
  ADD CONSTRAINT `tbl_datos_generales_parentesco_ibfk_2` FOREIGN KEY (`id_datos_generales`) REFERENCES `tbl_datos_generales` (`id_datos_generales`);

--
-- Filtros para la tabla `tbl_item_catalogo`
--
ALTER TABLE `tbl_item_catalogo`
  ADD CONSTRAINT `tbl_item_catalogo_ibfk_1` FOREIGN KEY (`id_catalogo`) REFERENCES `tbl_catalogo` (`id_catalogo`);

--
-- Filtros para la tabla `tbl_rol_access`
--
ALTER TABLE `tbl_rol_access`
  ADD CONSTRAINT `tbl_rol_access_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`),
  ADD CONSTRAINT `tbl_rol_access_ibfk_2` FOREIGN KEY (`id_funcionalidad`) REFERENCES `tbl_funcionalidad` (`id_funcionalidad`);

--
-- Filtros para la tabla `tbl_user_rol`
--
ALTER TABLE `tbl_user_rol`
  ADD CONSTRAINT `tbl_user_rol_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `tbl_users` (`id_users`),
  ADD CONSTRAINT `tbl_user_rol_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `tbl_rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
