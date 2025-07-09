-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2025 a las 21:21:36
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
  `cat_nombre` varchar(25) DEFAULT NULL,
  `ca_estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_catalogo`
--

INSERT INTO `tbl_catalogo` (`id_catalogo`, `cat_codigo`, `cat_nombre`, `ca_estado`) VALUES
(18, 'PROV', 'Provincias', 1),
(19, 'CANT', 'Cantones', 1),
(20, 'PARR', 'Parroquias', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_datos_generales`
--

CREATE TABLE `tbl_datos_generales` (
  `id_datos_generales` int(11) NOT NULL,
  `id_users` int(11) NOT NULL,
  `datos_provincia` int(11) DEFAULT NULL,
  `datos_canton` int(11) DEFAULT NULL,
  `datos_parroquias` int(11) DEFAULT NULL,
  `datos_comunidades` int(11) DEFAULT NULL,
  `datos_barrios` int(11) DEFAULT NULL,
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
  `datos_medio_transporte` int(11) DEFAULT NULL,
  `datos_estado_transporte` int(11) DEFAULT NULL,
  `datos_terrenos` tinyint(1) DEFAULT NULL,
  `datos_celular` tinyint(1) DEFAULT NULL,
  `datos_cantidad_celulare` int(11) DEFAULT NULL,
  `datos_plan_celular` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `tbl_datos_generales`
--

INSERT INTO `tbl_datos_generales` (`id_datos_generales`, `id_users`, `datos_provincia`, `datos_canton`, `datos_parroquias`, `datos_comunidades`, `datos_barrios`, `datos_tipo_viviendas`, `datos_techos`, `datos_paredes`, `datos_pisos`, `datos_cuarto`, `datos_combustibles_cocina`, `datos_servicios_higienicos`, `datos_viviendas`, `datos_pago_vivienda`, `datos_agua`, `datos_pago_agua`, `datos_pago_luz`, `datos_cantidad_luz`, `datos_internet`, `datos_pago_internet`, `datos_tv_cable`, `datos_tv_pago`, `datos_eliminacion_basura`, `datos_lugares_mayor_frecuencia_viveres`, `datos_gastos_viveres_alimentacion`, `datos_medio_transporte`, `datos_estado_transporte`, `datos_terrenos`, `datos_celular`, `datos_cantidad_celulare`, `datos_plan_celular`) VALUES
(2, 3, 0, 0, 12344, 12344, 12344, 12344, 12344, 12344, 12344, 12344, 12344, 12344, 12344, 12344, 127, 12344, 127, 12344, 127, 12344, 127, 12344, 12344, 12344, 12344, 12344, 12344, 127, 127, 12344, 127),
(3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
(4, 3, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_datos_generales_parentesco`
--

CREATE TABLE `tbl_datos_generales_parentesco` (
  `id_datos_generales_parentesco` int(11) NOT NULL,
  `id_datos_parentescos` int(11) NOT NULL,
  `id_datos_generales` int(11) NOT NULL,
  `datos_generales_parentesco_estado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
  `datos_parentesco_genero` varchar(25) DEFAULT NULL,
  `datos_parentesco_nivel_educacion` int(11) DEFAULT NULL,
  `datos_parentesco_fecha_de_nacimiento` date DEFAULT NULL,
  `datos_parentesco_edad` int(11) DEFAULT NULL,
  `datos_parentesco_parentesco` varchar(25) DEFAULT NULL,
  `datos_parentesco_atendida` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

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
(6, 'Obtener parroquias', '/getParishes', 1, '2025-06-30 16:26:25');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_item_catalogo`
--

CREATE TABLE `tbl_item_catalogo` (
  `id_item` int(11) NOT NULL,
  `itc_codigo` varchar(25) DEFAULT NULL,
  `itc_nombre` varchar(25) DEFAULT NULL,
  `itc_descripcion` varchar(150) DEFAULT NULL,
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
(167, 'PARR-MO-RURAL', 'La Paz', 'Parroquia rural de Montúfar', 1, 20);

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
(12, 2, 6);

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
  `users_genero` tinyint(1) NOT NULL,
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
(2, 'jonathan', 'jonathan', 'arboleda', '1725417331', 'jarboleda@gmail.com', '0998098630', '2025-06-07', 1, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-15 18:19:02'),
(3, 'nathan', 'njarboleda', 'arboleda', '1725417999', 'jnaarboleda@gmail.com', '0998098630', '2025-06-20', 1, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-15 18:54:47'),
(4, 'Fernando', 'fernando@gmail.com', 'asdasda', '1002003001', 'fer@mail.com', '90020030022', '0000-00-00', 0, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 10:25:07'),
(5, 'Juan', 'juanf', 'Fadfsdfsdf', '1002003002', 'juanf@gmail.com', '09002003003', '0000-00-00', 0, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 10:44:59'),
(6, 'Juan', 'juan2', '2', '1002003004', 'juan2@mail.com', '09002003005', '0000-00-00', 0, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 10:55:50'),
(7, 'juan', 'juan3', 'fsdfsdfsdf', '1002003006', 'juan4@mail.com', '1002003006', '0000-00-00', 0, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 10:58:17'),
(8, 'juan', 'juan5', 'sdfsdfsdf', '1002003007', 'juan5@mail.com', '9002003007', '0000-00-00', 0, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 11:00:09'),
(9, 'juan6', 'juan6', 'asdasd', '1002003008', 'juan6@mail.com', '09002003008', '0000-00-00', 0, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 11:02:38'),
(10, 'juan6', 'juan7', 'asdasd', '1002003008', 'juan7@mail.com', '09002003008', '2025-06-17', 0, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-23 11:05:16'),
(11, '', 'jarboleda@gmail.com', '', '', '', '', '0000-00-00', 0, '1234', 1, NULL, NULL, NULL, NULL, '2025-06-28 17:43:13'),
(12, 'Juan', 'jperez2', 'Perez', '1002003001', 'jperez2@gmail.com', '0900200312', '2025-06-17', 0, 'contra@#123z', 1, NULL, NULL, NULL, NULL, '2025-06-28 18:58:34'),
(13, 'Juan', 'jperez3', 'Perez', '1002003001', 'jarboleda@gmail.com', '0900200312', '2025-06-26', 0, 'contra@#123z', 1, NULL, NULL, NULL, NULL, '2025-06-28 19:37:00'),
(14, 'Juan', 'jperez3', 'Perez', '1002003001', 'jarboleda@gmail.com', '0900200312', '2025-06-26', 0, 'contra@#123z', 1, NULL, NULL, NULL, NULL, '2025-06-28 19:37:00'),
(15, 'Juan', 'jperez4', 'Perez', '1002003009', 'jperez4@gmail.com', '0900200312', '2025-06-28', 0, 'contra@#123z', 1, NULL, NULL, NULL, NULL, '2025-06-28 19:39:33'),
(16, 'Juan', 'jperez5', 'Perez', '100200310', 'jperez5@mail.com', '0900200312', '2025-06-28', 0, '$2y$10$K6Ze/osP64RFoCzoMGEjWO9FgCfOjgRUMfxXqitBvnCjgNxYzD1na', 1, NULL, NULL, NULL, NULL, '2025-06-28 19:43:02');

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
(1, 2, 1, 1, '2025-06-15 22:40:09'),
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
(14, 16, 2, 1, '2025-06-29 00:43:02');

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
  MODIFY `id_catalogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `tbl_datos_generales`
--
ALTER TABLE `tbl_datos_generales`
  MODIFY `id_datos_generales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_funcionalidad`
--
ALTER TABLE `tbl_funcionalidad`
  MODIFY `id_funcionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tbl_item_catalogo`
--
ALTER TABLE `tbl_item_catalogo`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_rol_access`
--
ALTER TABLE `tbl_rol_access`
  MODIFY `id_principal_rol_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `tbl_user_rol`
--
ALTER TABLE `tbl_user_rol`
  MODIFY `id_users_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

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
