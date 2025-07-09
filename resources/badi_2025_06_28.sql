-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-06-2025 a las 06:19:41
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
(1, 'PROV', 'Provincias', 1),
(2, 'CANT-IMBABURA', 'Cantones de Imbabura', 1),
(3, 'CANT-CARCHI', 'Cantones de Carchi', 1),
(4, 'PARROQ-IMB', 'Parroquias Imbabura', 1),
(5, 'PARROQ-CAR', 'Parroquias Carchi', 1),
(6, 'TIPO_VIV', 'Tipo de Vivienda', 1),
(7, 'TECHO', 'Techo', 1),
(8, 'PAREDES', 'Paredes', 1),
(9, 'PISO', 'Piso', 1),
(10, 'COMBUSTIBLE', 'Combustible para cocinar', 1),
(11, 'HIGIENICO', 'Servicio Higiénico', 1),
(12, 'TENENCIA', 'Vivienda (tenencia)', 1),
(13, 'AGUA', 'Agua', 1),
(14, 'BASURA', 'Eliminación de basura', 1),
(15, 'COMPRAVIVERES', 'Frecuencia de compra de v', 1),
(16, 'TRANSPORTE', 'Medio de transporte', 1),
(17, 'ESTADO_TRANSP', 'Estado del transporte', 1);

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
(3, 'Formulario de datos generales', '/formGeneralInformation', 1, '2025-06-28 22:35:21');

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
(1, 'PAR-IBA-URB-1', 'Caranqui', 'Parroquia urbana del cantón Ibarra (Imbabura)', 1, 4),
(2, 'PAR-IBA-URB-2', 'San Francisco', 'Parroquia urbana del cantón Ibarra (Imbabura)', 1, 4),
(3, 'PAR-IBA-URB-3', 'El Sagrario', 'Parroquia urbana del cantón Ibarra (Imbabura)', 1, 4),
(4, 'PAR-IBA-URB-4', 'Alpachaca', 'Parroquia urbana del cantón Ibarra (Imbabura)', 1, 4),
(5, 'PAR-IBA-URB-5', 'La Dolorosa del Priorato', 'Parroquia urbana del cantón Ibarra (Imbabura)', 1, 4),
(6, 'PAR-IBA-RUR-1', 'Ambuquí', 'Parroquia rural del cantón Ibarra (Imbabura)', 1, 4),
(7, 'PAR-IBA-RUR-2', 'Angochagua', 'Parroquia rural del cantón Ibarra (Imbabura)', 1, 4),
(8, 'PAR-IBA-RUR-3', 'Carolina', 'Parroquia rural del cantón Ibarra (Imbabura)', 1, 4),
(9, 'PAR-IBA-RUR-4', 'La Esperanza', 'Parroquia rural del cantón Ibarra (Imbabura)', 1, 4),
(10, 'PAR-IBA-RUR-5', 'Lita', 'Parroquia rural del cantón Ibarra (Imbabura)', 1, 4),
(11, 'PAR-IBA-RUR-6', 'Salinas', 'Parroquia rural del cantón Ibarra (Imbabura)', 1, 4),
(12, 'PAR-IBA-RUR-7', 'San Antonio de Ibarra', 'Parroquia rural del cantón Ibarra (Imbabura)', 1, 4),
(13, 'PAR-OTA-URB-1', 'San Luis', 'Parroquia urbana del cantón Otavalo (Imbabura)', 1, 4),
(14, 'PAR-OTA-URB-2', 'El Jordán', 'Parroquia urbana del cantón Otavalo (Imbabura)', 1, 4),
(15, 'PAR-OTA-RUR-1', 'Eugenio Espejo (Calpaquí)', 'Parroquia rural del cantón Otavalo (Imbabura)', 1, 4),
(16, 'PAR-OTA-RUR-2', 'González Suárez', 'Parroquia rural del cantón Otavalo (Imbabura)', 1, 4),
(17, 'PAR-OTA-RUR-3', 'San Pablo del Lago', 'Parroquia rural del cantón Otavalo (Imbabura)', 1, 4),
(18, 'PAR-OTA-RUR-4', 'San Rafael de la Laguna', 'Parroquia rural del cantón Otavalo (Imbabura)', 1, 4),
(19, 'PAR-OTA-RUR-5', 'San Juan de Ilumán', 'Parroquia rural del cantón Otavalo (Imbabura)', 1, 4),
(20, 'PAR-OTA-RUR-6', 'Dr. Miguel Egas Cabezas (', 'Parroquia rural del cantón Otavalo (Imbabura)', 1, 4),
(21, 'PAR-OTA-RUR-7', 'San José de Quichinche', 'Parroquia rural del cantón Otavalo (Imbabura)', 1, 4),
(22, 'PAR-OTA-RUR-8', 'San Pedro de Pataquí', 'Parroquia rural del cantón Otavalo (Imbabura)', 1, 4),
(23, 'PAR-OTA-RUR-9', 'Selva Alegre (San Miguel ', 'Parroquia rural del cantón Otavalo (Imbabura)', 1, 4),
(24, 'PAR-COT-URB-1', 'El Sagrario', 'Parroquia urbana del cantón Cotacachi (Imbabura)', 1, 4),
(25, 'PAR-COT-URB-2', 'San Francisco', 'Parroquia urbana del cantón Cotacachi (Imbabura)', 1, 4),
(26, 'PAR-COT-RUR-1', '6 de Julio de Cuellaje', 'Parroquia rural del cantón Cotacachi (Imbabura)', 1, 4),
(27, 'PAR-COT-RUR-2', 'Apuela', 'Parroquia rural del cantón Cotacachi (Imbabura)', 1, 4),
(28, 'PAR-COT-RUR-3', 'García Moreno (Llurimagua', 'Parroquia rural del cantón Cotacachi (Imbabura)', 1, 4),
(29, 'PAR-COT-RUR-4', 'Imantag', 'Parroquia rural del cantón Cotacachi (Imbabura)', 1, 4),
(30, 'PAR-COT-RUR-5', 'Peñaherrera', 'Parroquia rural del cantón Cotacachi (Imbabura)', 1, 4),
(31, 'PAR-COT-RUR-6', 'Plaza Gutiérrez (Calvario', 'Parroquia rural del cantón Cotacachi (Imbabura)', 1, 4),
(32, 'PAR-COT-RUR-7', 'Quiroga', 'Parroquia rural del cantón Cotacachi (Imbabura)', 1, 4),
(33, 'PAR-COT-RUR-8', 'Vacas Galindo (El Churo)', 'Parroquia rural del cantón Cotacachi (Imbabura)', 1, 4),
(34, 'PAR-ANT-URB-1', 'Atuntaqui', 'Parroquia urbana del cantón Antonio Ante (Imbabura)', 1, 4),
(35, 'PAR-ANT-URB-2', 'Andrade Marín', 'Parroquia urbana del cantón Antonio Ante (Imbabura)', 1, 4),
(36, 'PAR-ANT-RUR-1', 'Imbaya', 'Parroquia rural del cantón Antonio Ante (Imbabura)', 1, 4),
(37, 'PAR-ANT-RUR-2', 'Natabuela', 'Parroquia rural del cantón Antonio Ante (Imbabura)', 1, 4),
(38, 'PAR-ANT-RUR-3', 'Chaltura', 'Parroquia rural del cantón Antonio Ante (Imbabura)', 1, 4),
(39, 'PAR-ANT-RUR-4', 'San Roque', 'Parroquia rural del cantón Antonio Ante (Imbabura)', 1, 4),
(40, 'PAR-PIM-URB-1', 'Pimampiro (San Pedro de P', 'Parroquia urbana del cantón Pimampiro (Imbabura)', 1, 4),
(41, 'PAR-PIM-RUR-1', 'Chugá', 'Parroquia rural del cantón Pimampiro (Imbabura)', 1, 4),
(42, 'PAR-PIM-RUR-2', 'Mariano Acosta', 'Parroquia rural del cantón Pimampiro (Imbabura)', 1, 4),
(43, 'PAR-PIM-RUR-3', 'San Francisco de Sigsipam', 'Parroquia rural del cantón Pimampiro (Imbabura)', 1, 4),
(44, 'PAR-URC-URB-1', 'San Miguel de Urcuquí', 'Parroquia urbana del cantón San Miguel de Urcuquí (Imbabura)', 1, 4),
(45, 'PAR-URC-RUR-1', 'Cahuasquí', 'Parroquia rural del cantón San Miguel de Urcuquí (Imbabura)', 1, 4),
(46, 'PAR-URC-RUR-2', 'La Merced de Buenos Aires', 'Parroquia rural del cantón San Miguel de Urcuquí (Imbabura)', 1, 4),
(47, 'PAR-URC-RUR-3', 'Pablo Arenas', 'Parroquia rural del cantón San Miguel de Urcuquí (Imbabura)', 1, 4),
(48, 'PAR-URC-RUR-4', 'San Blas', 'Parroquia rural del cantón San Miguel de Urcuquí (Imbabura)', 1, 4),
(49, 'PAR-URC-RUR-5', 'Tumbabiro', 'Parroquia rural del cantón San Miguel de Urcuquí (Imbabura)', 1, 4),
(50, 'PROV-IMB', 'Imbabura', 'Provincia del Imbabura', 1, 1),
(51, 'PROV-CAR', 'Carchi', 'Provincia del Carchi', 1, 1),
(52, 'CANT-IBA', 'Ibarra', 'Cantón de la provincia de Imbabura', 1, 2),
(53, 'CANT-OTA', 'Otavalo', 'Cantón de la provincia de Imbabura', 1, 2),
(54, 'CANT-COT', 'Cotacachi', 'Cantón de la provincia de Imbabura', 1, 2),
(55, 'CANT-AAN', 'Antonio Ante', 'Cantón de la provincia de Imbabura', 1, 2),
(56, 'CANT-PIM', 'Pimampiro', 'Cantón de la provincia de Imbabura', 1, 2),
(57, 'CANT-URC', 'San Miguel de Urcuquí', 'Cantón de la provincia de Imbabura', 1, 2),
(58, 'CANT-TUL', 'Tulcán', 'Cantón de la provincia de Carchi', 1, 5),
(59, 'CANT-MON', 'Montúfar', 'Cantón de la provincia de Carchi', 1, 5),
(60, 'CANT-ESP', 'Espejo', 'Cantón de la provincia de Carchi', 1, 5),
(61, 'CANT-MIR', 'Mira', 'Cantón de la provincia de Carchi', 1, 5),
(62, 'CANT-BOL', 'Bolívar', 'Cantón de la provincia de Carchi', 1, 5),
(63, 'CANT-HUA', 'Huaca', 'Cantón de la provincia de Carchi', 1, 5),
(64, 'PAR-TUL-TUL', 'Tulcán', 'Parroquia urbana del cantón Tulcán', 1, 5),
(65, 'PAR-TUL-GSU', 'González Suárez', 'Parroquia urbana del cantón Tulcán', 1, 5),
(66, 'PAR-TUL-CAR', 'El Carmelo (Pun)', 'Parroquia rural del cantón Tulcán', 1, 5),
(67, 'PAR-TUL-JAN', 'Julio Andrade (La Orejuel', 'Parroquia rural del cantón Tulcán', 1, 5),
(68, 'PAR-TUL-MAL', 'Maldonado', 'Parroquia rural del cantón Tulcán', 1, 5),
(69, 'PAR-TUL-PIO', 'Pioter', 'Parroquia rural del cantón Tulcán', 1, 5),
(70, 'PAR-TUL-TOD', 'Tobar Donoso', 'Parroquia rural del cantón Tulcán', 1, 5),
(71, 'PAR-TUL-TUF', 'Tufiño', 'Parroquia rural del cantón Tulcán', 1, 5),
(72, 'PAR-TUL-URB', 'Urbina', 'Parroquia rural del cantón Tulcán', 1, 5),
(73, 'PAR-TUL-SMC', 'Santa Martha de Cuba', 'Parroquia rural del cantón Tulcán', 1, 5),
(74, 'PAR-TUL-CHI', 'El Chical', 'Parroquia rural del cantón Tulcán', 1, 5),
(75, 'PAR-MON-SGA', 'San Gabriel', 'Parroquia urbana del cantón Montúfar', 1, 5),
(76, 'PAR-MON-SJO', 'San José', 'Parroquia urbana del cantón Montúfar', 1, 5),
(77, 'PAR-MON-GSU', 'González Suárez', 'Parroquia urbana del cantón Montúfar', 1, 5),
(78, 'PAR-MON-CHI', 'Chitán de Navarrete', 'Parroquia rural del cantón Montúfar', 1, 5),
(79, 'PAR-MON-CCO', 'Cristóbal Colón', 'Parroquia rural del cantón Montúfar', 1, 5),
(80, 'PAR-MON-FSA', 'Fernández Salvado', 'Parroquia rural del cantón Montúfar', 1, 5),
(81, 'PAR-MON-PAZ', 'La Paz', 'Parroquia rural del cantón Montúfar', 1, 5),
(82, 'PAR-MON-PIA', 'Piartal', 'Parroquia rural del cantón Montúfar', 1, 5),
(83, 'PAR-ESP-ANG', 'El Ángel', 'Parroquia urbana del cantón Espejo', 1, 5),
(84, 'PAR-ESP-SEP', '27 de Septiembre', 'Parroquia urbana del cantón Espejo', 1, 5),
(85, 'PAR-ESP-GOA', 'El Goaltal', 'Parroquia rural del cantón Espejo', 1, 5),
(86, 'PAR-ESP-LIB', 'La Libertad', 'Parroquia rural del cantón Espejo', 1, 5),
(87, 'PAR-ESP-ISI', 'San Isidro', 'Parroquia rural del cantón Espejo', 1, 5),
(88, 'PAR-MIR-MIR', 'Mira', 'Parroquia urbana del cantón Mira', 1, 5),
(89, 'PAR-MIR-JMO', 'Juan Montalvo', 'Parroquia rural del cantón Mira', 1, 5),
(90, 'PAR-MIR-CON', 'La Concepción', 'Parroquia rural del cantón Mira', 1, 5),
(91, 'PAR-MIR-JJC', 'Jacinto Jijón y Caamaño', 'Parroquia rural del cantón Mira', 1, 5),
(92, 'PAR-BOL-BOL', 'Bolívar', 'Parroquia urbana del cantón Bolívar', 1, 5),
(93, 'PAR-BOL-GMO', 'García Moreno', 'Parroquia rural del cantón Bolívar', 1, 5),
(94, 'PAR-BOL-AND', 'Los Andes', 'Parroquia rural del cantón Bolívar', 1, 5),
(95, 'PAR-BOL-MOL', 'Monte Olivo', 'Parroquia rural del cantón Bolívar', 1, 5),
(96, 'PAR-BOL-SRA', 'San Rafael', 'Parroquia rural del cantón Bolívar', 1, 5),
(97, 'PAR-BOL-SVP', 'San Vicente de Pusi', 'Parroquia rural del cantón Bolívar', 1, 5),
(98, 'PAR-HUA-HUA', 'Huaca', 'Parroquia urbana del cantón San Pedro de Huaca', 1, 5),
(99, 'PAR-HUA-MSU', 'Mariscal Sucre', 'Parroquia rural del cantón San Pedro de Huaca', 1, 5),
(104, 'VIV-CAS', 'Casa', 'Tipo de vivienda: Casa', 1, 6),
(105, 'VIV-DEP', 'Departamento', 'Tipo de vivienda: Departamento', 1, 6),
(106, 'VIV-CUA', 'Cuartos', 'Tipo de vivienda: Cuartos', 1, 6),
(107, 'VIV-MED', 'Mediagua', 'Tipo de vivienda: Mediagua', 1, 6),
(167, 'VIV-CAS', 'Casa', 'Tipo de vivienda: Casa', 1, 6),
(168, 'VIV-DEP', 'Departamento', 'Tipo de vivienda: Departamento', 1, 6),
(169, 'VIV-CUA', 'Cuartos', 'Tipo de vivienda: Cuartos', 1, 6),
(170, 'VIV-MED', 'Mediagua', 'Tipo de vivienda: Mediagua', 1, 6),
(171, 'TEC-LOS', 'Losa', 'Tipo de techo: Losa', 1, 7),
(172, 'TEC-ETE', 'Eternit', 'Tipo de techo: Eternit', 1, 7),
(173, 'TEC-ZIN', 'Zinc', 'Tipo de techo: Zinc', 1, 7),
(174, 'TEC-TEJ', 'Teja', 'Tipo de techo: Teja', 1, 7),
(175, 'PAR-HOR', 'Hormigón', 'Tipo de pared: Hormigón', 1, 8),
(176, 'PAR-LAD', 'Ladrillo', 'Tipo de pared: Ladrillo', 1, 8),
(177, 'PAR-BLO', 'Bloque', 'Tipo de pared: Bloque', 1, 8),
(178, 'PAR-ADO', 'Adobe', 'Tipo de pared: Adobe', 1, 8),
(179, 'PAR-MAD', 'Madera', 'Tipo de pared: Madera', 1, 8),
(180, 'PIS-HOR', 'Hormigón', 'Tipo de piso: Hormigón', 1, 9),
(181, 'PIS-DUE', 'Duela', 'Tipo de piso: Duela', 1, 9),
(182, 'PIS-TAB', 'Tabla', 'Tipo de piso: Tabla', 1, 9),
(183, 'PIS-CER', 'Céramica', 'Tipo de piso: Céramica', 1, 9),
(184, 'PIS-TIE', 'Tierra', 'Tipo de piso: Tierra', 1, 9),
(185, 'PIS-LAD', 'Ladrillo', 'Tipo de piso: Ladrillo', 1, 9),
(186, 'COM-GAS', 'Gas', 'Combustible principal para cocinar: Gas', 1, 10),
(187, 'COM-ELE', 'Electricidad', 'Combustible principal para cocinar: Electricidad', 1, 10),
(188, 'COM-LEN', 'Leña', 'Combustible principal para cocinar: Leña', 1, 10),
(189, 'COM-NOC', 'No cocina', 'No utiliza cocina', 1, 10),
(190, 'HIG-ALC', 'Alcantarillado', 'Tipo de servicio higiénico: Alcantarillado', 1, 11),
(191, 'HIG-SEP', 'Pozo séptico', 'Tipo de servicio higiénico: Pozo séptico', 1, 11),
(192, 'HIG-CIE', 'Pozo ciego', 'Tipo de servicio higiénico: Pozo ciego', 1, 11),
(193, 'HIG-LET', 'Letrina', 'Tipo de servicio higiénico: Letrina', 1, 11),
(194, 'HIG-NOH', 'No tiene', 'No tiene servicio higiénico', 1, 11),
(195, 'TEN-PAG', 'Propia y esta pagada', 'Tenencia de vivienda: Propia y pagada', 1, 12),
(196, 'TEN-REG', 'Propia (regalada, heredad', 'Tenencia de vivienda: Propia heredada/regalada', 1, 12),
(197, 'TEN-PRE', 'Prestada', 'Tenencia de vivienda: Prestada', 1, 12),
(198, 'TEN-PAGD', 'Propia y está pagandose', 'Tenencia de vivienda: Propia en proceso de pago', 1, 12),
(199, 'TEN-ARR', 'Arrienda', 'Tenencia de vivienda: Arriendo', 1, 12),
(200, 'TEN-ANT', 'Anticresis', 'Tenencia de vivienda: Anticresis', 1, 12),
(201, 'AGU-RPU', 'Red Pública', 'Fuente de agua: Red pública', 1, 13),
(202, 'AGU-POZ', 'Pozo', 'Fuente de agua: Pozo', 1, 13),
(203, 'AGU-RIO', 'Río o vertiente', 'Fuente de agua: Río o vertiente', 1, 13),
(204, 'AGU-ACE', 'Acequia o canal', 'Fuente de agua: Acequia o canal', 1, 13),
(205, 'AGU-CAR', 'Carro repartidor', 'Fuente de agua: Carro repartidor', 1, 13),
(206, 'AGU-OTR', 'Otros', 'Fuente de agua: Otros', 1, 13),
(207, 'BAS-REC', 'Carro recolector', 'Forma de eliminar basura: Carro recolector', 1, 14),
(208, 'BAS-CAL', 'La botan a la calle, queb', 'Forma de eliminar basura: Calle/río', 1, 14),
(209, 'BAS-QUEM', 'La queman', 'Forma de eliminar basura: Quemada', 1, 14),
(210, 'BAS-RECIC', 'Reciclan/entierran', 'Forma de eliminar basura: Reciclan o entierran', 1, 14),
(211, 'BAS-COM', 'Composta', 'Forma de eliminar basura: Composta', 1, 14),
(212, 'VIV-SUP', 'Supermercado', 'Lugar de compra de víveres: Supermercado', 1, 15),
(213, 'VIV-MER', 'Mercados', 'Lugar de compra de víveres: Mercados', 1, 15),
(214, 'VIV-FER', 'Ferias', 'Lugar de compra de víveres: Ferias', 1, 15),
(215, 'VIV-MIC', 'Micromercados', 'Lugar de compra de víveres: Micromercados', 1, 15),
(216, 'VIV-TIE', 'Tienda del barrio', 'Lugar de compra de víveres: Tienda del barrio', 1, 15),
(217, 'VIV-TRU', 'Trueques', 'Lugar de compra de víveres: Trueques', 1, 15),
(218, 'VIV-OTR', 'Otros', 'Lugar de compra de víveres: Otros', 1, 15),
(219, 'TRA-CAR', 'Carro', 'Medio de transporte: Carro', 1, 16),
(220, 'TRA-MOT', 'Moto', 'Medio de transporte: Moto', 1, 16),
(221, 'TRA-PEL', 'Moto o pasola eléctrica', 'Medio de transporte: Moto eléctrica', 1, 16),
(222, 'TRA-PGL', 'Pasola a gasolina', 'Medio de transporte: Pasola a gasolina', 1, 16),
(223, 'EST-BUE', 'Bueno', 'Estado del transporte: Bueno', 1, 17),
(224, 'EST-REG', 'Regular', 'Estado del transporte: Regular', 1, 17),
(225, 'EST-MAL', 'Malo', 'Estado del transporte: Malo', 1, 17);

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
(6, 2, 3);

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
  MODIFY `id_catalogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tbl_datos_generales`
--
ALTER TABLE `tbl_datos_generales`
  MODIFY `id_datos_generales` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_funcionalidad`
--
ALTER TABLE `tbl_funcionalidad`
  MODIFY `id_funcionalidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_item_catalogo`
--
ALTER TABLE `tbl_item_catalogo`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT de la tabla `tbl_rol`
--
ALTER TABLE `tbl_rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_rol_access`
--
ALTER TABLE `tbl_rol_access`
  MODIFY `id_principal_rol_access` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
