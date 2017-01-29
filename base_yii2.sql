-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-01-2017 a las 03:34:42
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_yii2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `antecedentes`
--

CREATE TABLE `antecedentes` (
  `id_paciente` int(11) NOT NULL,
  `alergica` varchar(100) DEFAULT NULL,
  `respiratoria` varchar(100) DEFAULT NULL,
  `traumatologica` varchar(100) DEFAULT NULL,
  `cardiaca` varchar(100) DEFAULT NULL,
  `quirurgica` varchar(100) DEFAULT NULL,
  `familiar_tipo` varchar(50) DEFAULT NULL,
  `enfermedad_familiar` varchar(50) DEFAULT NULL,
  `tabaco` bit(1) DEFAULT NULL,
  `alcohol` bit(1) DEFAULT NULL,
  `alimentacion` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `antecedentes`
--

INSERT INTO `antecedentes` (`id_paciente`, `alergica`, `respiratoria`, `traumatologica`, `cardiaca`, `quirurgica`, `familiar_tipo`, `enfermedad_familiar`, `tabaco`, `alcohol`, `alimentacion`) VALUES
(1, '', 'Asma', '', '', '', 'mama', 'Diabetes', b'1', b'1', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_data`
--

CREATE TABLE `audit_data` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `data` blob,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_entry`
--

CREATE TABLE `audit_entry` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `duration` float DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `request_method` varchar(16) DEFAULT NULL,
  `ajax` int(1) NOT NULL DEFAULT '0',
  `route` varchar(255) DEFAULT NULL,
  `memory_max` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `audit_entry`
--

INSERT INTO `audit_entry` (`id`, `created`, `user_id`, `duration`, `ip`, `request_method`, `ajax`, `route`, `memory_max`) VALUES
(1400, '2016-12-18 10:57:18', 1, 0.586384, '::1', 'GET', 0, NULL, 6128960),
(1401, '2016-12-18 11:22:31', 1, 4.5473, '::1', 'GET', 0, NULL, 6129104),
(1402, '2016-12-18 11:22:41', 1, 0.431406, '::1', 'GET', 0, NULL, 6129224),
(1403, '2016-12-18 11:22:48', 1, 0.265368, '::1', 'GET', 0, NULL, 6129480),
(1405, '2016-12-18 11:23:01', 1, 0.271664, '::1', 'GET', 0, NULL, 6129504),
(1406, '2016-12-18 11:23:06', 1, 0.290119, '::1', 'GET', 0, NULL, 6129224),
(1409, '2016-12-18 11:23:23', 1, 0.358348, '::1', 'GET', 0, NULL, 6129224),
(1410, '2016-12-18 11:23:32', 1, 0.310442, '::1', 'GET', 0, NULL, 6129480),
(1411, '2016-12-18 11:23:35', 1, 0.288868, '::1', 'GET', 0, NULL, 6129480),
(1412, '2016-12-18 11:23:46', 1, 0.323527, '::1', 'GET', 0, NULL, 6129480),
(1413, '2016-12-18 11:24:18', 1, 0.347457, '::1', 'GET', 0, NULL, 6129480),
(1425, '2016-12-18 11:34:23', 1, 0.244173, '::1', 'GET', 0, NULL, 6129880),
(1426, '2016-12-18 11:34:33', 1, 0.375263, '::1', 'GET', 0, NULL, 6130168),
(1434, '2016-12-18 11:35:02', 1, 0.369673, '::1', 'GET', 0, NULL, 6129456),
(1444, '2016-12-18 11:38:46', 1, 0.406895, '::1', 'GET', 0, NULL, 6130216),
(2376, '2017-01-10 09:23:09', 0, 0.561853, '::1', 'GET', 0, NULL, 5729600),
(2392, '2017-01-10 09:31:41', 0, 0.384708, '::1', 'GET', 0, NULL, 6043472),
(2532, '2017-01-16 20:23:27', 1, 0.996439, '::1', 'GET', 0, NULL, 6358824),
(2546, '2017-01-16 22:59:03', 1, 0.282235, '::1', 'GET', 0, NULL, 5863744),
(2624, '2017-01-17 12:03:55', 1, 0.503876, '::1', 'GET', 0, NULL, 6174920);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_error`
--

CREATE TABLE `audit_error` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `message` text NOT NULL,
  `code` int(11) DEFAULT '0',
  `file` varchar(512) DEFAULT NULL,
  `line` int(11) DEFAULT NULL,
  `trace` blob,
  `hash` varchar(32) DEFAULT NULL,
  `emailed` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_javascript`
--

CREATE TABLE `audit_javascript` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `type` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `origin` varchar(512) DEFAULT NULL,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_mail`
--

CREATE TABLE `audit_mail` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `successful` int(11) NOT NULL,
  `from` varchar(255) DEFAULT NULL,
  `to` varchar(255) DEFAULT NULL,
  `reply` varchar(255) DEFAULT NULL,
  `cc` varchar(255) DEFAULT NULL,
  `bcc` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `text` blob,
  `html` blob,
  `data` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL,
  `entry_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `model_id` varchar(255) NOT NULL,
  `field` varchar(255) DEFAULT NULL,
  `old_value` text,
  `new_value` text,
  `created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `audit_trail`
--

INSERT INTO `audit_trail` (`id`, `entry_id`, `user_id`, `action`, `model`, `model_id`, `field`, `old_value`, `new_value`, `created`) VALUES
(1, 296, 2, 'UPDATE', 'app\\models\\Post', '1', 'post', 'EXAMEN FINAl', 'EXAMEN FINAL', '2016-09-01 11:17:13'),
(2, 333, 2, 'CREATE', 'app\\models\\Post', '2', 'id', '', '2', '2016-09-01 13:01:09'),
(3, 333, 2, 'CREATE', 'app\\models\\Post', '2', 'post', '', 'NADA', '2016-09-01 13:01:09'),
(4, 333, 2, 'CREATE', 'app\\models\\Post', '2', 'usuario', '', '1', '2016-09-01 13:01:09'),
(5, 333, 2, 'CREATE', 'app\\models\\Post', '2', 'fecha', '', '2016-09-01', '2016-09-01 13:01:09'),
(6, 375, 2, 'DELETE', 'app\\models\\Post', '2', NULL, NULL, NULL, '2016-09-01 13:03:24'),
(7, 1667, 1, 'DELETE', 'dektrium\\user\\models\\User', '2', NULL, NULL, NULL, '2017-01-05 18:29:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_assignment`
--

CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('admin', '1', 1472570397),
('user', '2', 1472774935);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item`
--

CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('admin', 1, 'Aministra', NULL, NULL, 1472566840, 1472566840),
('user', 1, 'Usuario de actividades', NULL, NULL, 1472774913, 1472774913);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_item_child`
--

CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_rule`
--

CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `certificado_medico`
--

CREATE TABLE `certificado_medico` (
  `id` int(11) NOT NULL,
  `identificacion_persona` varchar(10) DEFAULT NULL,
  `tipo_certificado` varchar(11) DEFAULT NULL,
  `detalle` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `doctor` varchar(20) NOT NULL,
  `id_cita` int(11) NOT NULL,
  `temperatura` double DEFAULT NULL,
  `peso` double DEFAULT NULL,
  `frc_cardiaca` varchar(40) DEFAULT NULL,
  `revision_fisica` text,
  `sintomas` text,
  `diagnostico_exFisicos` text,
  `diagnostico` text,
  `id_paciente` int(11) NOT NULL,
  `fecha_cita` date DEFAULT NULL,
  `tratamiento_sm` text,
  `presion_arterial` varchar(30) DEFAULT NULL,
  `tipo_atencion` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependiente`
--

CREATE TABLE `dependiente` (
  `cedula` varchar(10) NOT NULL,
  `fecha_regDependiente` date DEFAULT NULL,
  `nombres` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `fecha_nac` varchar(40) DEFAULT NULL,
  `estado_civil` varchar(40) DEFAULT NULL,
  `id_paciente` int(11) NOT NULL,
  `cedula_trab` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen`
--

CREATE TABLE `examen` (
  `idExamen` int(11) NOT NULL,
  `categoria` varchar(40) DEFAULT NULL,
  `nom_examen` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `examen`
--

INSERT INTO `examen` (`idExamen`, `categoria`, `nom_examen`) VALUES
(1, 'Imagenología', 'Tomografía'),
(2, 'Hematología', 'Biometria Hematica Completa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_historia_clinica`
--

CREATE TABLE `examen_historia_clinica` (
  `idExamen` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `indicaciones` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historia_clinica`
--

CREATE TABLE `historia_clinica` (
  `num_historia` varchar(10) DEFAULT NULL,
  `tipo_sangre` varchar(5) DEFAULT NULL,
  `fecha_regHistoria` date DEFAULT NULL,
  `id_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `historia_clinica`
--

INSERT INTO `historia_clinica` (`num_historia`, `tipo_sangre`, `fecha_regHistoria`, `id_paciente`) VALUES
('0803926806', 'AB-', '2017-01-28', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `usuario` varchar(250) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `acceso` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `usuario`, `ip`, `acceso`) VALUES
(1, 'test', '::1', '0'),
(2, 'test', '::1', '0'),
(3, 'superadmin', '::1', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

CREATE TABLE `medicamentos` (
  `id_medicamento` int(11) NOT NULL,
  `codigo_med` varchar(40) DEFAULT NULL,
  `nombre_med` varchar(40) DEFAULT NULL,
  `tipo_med` varchar(40) DEFAULT NULL,
  `descripcion` text,
  `fecha_caduc` date DEFAULT NULL,
  `cantidad_med` int(11) DEFAULT NULL,
  `fecha_regMedic` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamento`, `codigo_med`, `nombre_med`, `tipo_med`, `descripcion`, `fecha_caduc`, `cantidad_med`, `fecha_regMedic`) VALUES
(1, '100', 'PENICILINA ', 'ANTIBIOTICOS', 'PENICILINA G CRISTALINA (como sal sódica o potásica) Base 1,000.000 UI\r\npolvo para inyección 5 ml Frasco', '0000-00-00', 100, '2017-01-20'),
(2, '200', 'AMPICILINA + SULBACTAM 1.5 g', 'ANTIBIOTICOS', 'AMPICILINA + SULBACTAM 1.5 g (1g ampicilina (sódica) + 0.5 g sulbactan\r\nsódico) polvo para inyección Fco.', '0000-00-00', 50, '2017-01-20');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `tipo_paciente` varchar(40) DEFAULT NULL,
  `fecha_regPaciente` date DEFAULT NULL,
  `num_matricula` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `cedula`, `tipo_paciente`, `fecha_regPaciente`, `num_matricula`) VALUES
(1, '0803926806', 'Estudiante', '2017-01-28', '9817');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `profile`
--

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, '', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', 'America/Guayaquil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta_detalle`
--

CREATE TABLE `receta_detalle` (
  `id_cita` int(11) NOT NULL,
  `id_medicamento` int(11) NOT NULL,
  `cantidad_med` int(11) NOT NULL,
  `indicaciones` text NOT NULL,
  `observacion` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportepacientes`
--

CREATE TABLE `reportepacientes` (
  `idreporte` int(11) NOT NULL,
  `fechainicio` date NOT NULL,
  `fechafin` date NOT NULL,
  `fechaRegistro` date NOT NULL,
  `reporte` varchar(240) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `social_account`
--

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `token`
--

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `token`
--

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`) VALUES
(1, '_Vww4DGJIMM-5emZOhFvVeurnUb3C5WR', 1472564610, 0),
(2, 'eB8RHzL_ziHUzkvGnJDR56ACl0TEWaHK', 1472566993, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `status`) VALUES
(1, 'superadmin', 'superadmin@gmail.com', '$2y$12$rQ3kv0tMJm9oyBJB18/pJOJ54PTqSTdYEP/ZsZ0I16VBmEOUbhugC', '3RKcjLUns0L5O-yfxik3XzT8LK3HLwZ4', 1472566181, NULL, NULL, '::1', 1472564609, 1472564609, 0, 10);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `antecedentes`
--
ALTER TABLE `antecedentes`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `audit_data`
--
ALTER TABLE `audit_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_data_entry_id` (`entry_id`);

--
-- Indices de la tabla `audit_entry`
--
ALTER TABLE `audit_entry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_route` (`route`);

--
-- Indices de la tabla `audit_error`
--
ALTER TABLE `audit_error`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_error_entry_id` (`entry_id`),
  ADD KEY `idx_file` (`file`(180)),
  ADD KEY `idx_emailed` (`emailed`);

--
-- Indices de la tabla `audit_javascript`
--
ALTER TABLE `audit_javascript`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_javascript_entry_id` (`entry_id`);

--
-- Indices de la tabla `audit_mail`
--
ALTER TABLE `audit_mail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_mail_entry_id` (`entry_id`);

--
-- Indices de la tabla `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_audit_trail_entry_id` (`entry_id`),
  ADD KEY `idx_audit_user_id` (`user_id`),
  ADD KEY `idx_audit_trail_field` (`model`,`model_id`,`field`),
  ADD KEY `idx_audit_trail_action` (`action`);

--
-- Indices de la tabla `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD PRIMARY KEY (`item_name`,`user_id`);

--
-- Indices de la tabla `auth_item`
--
ALTER TABLE `auth_item`
  ADD PRIMARY KEY (`name`),
  ADD KEY `rule_name` (`rule_name`),
  ADD KEY `idx-auth_item-type` (`type`);

--
-- Indices de la tabla `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD PRIMARY KEY (`parent`,`child`),
  ADD KEY `child` (`child`);

--
-- Indices de la tabla `auth_rule`
--
ALTER TABLE `auth_rule`
  ADD PRIMARY KEY (`name`);

--
-- Indices de la tabla `certificado_medico`
--
ALTER TABLE `certificado_medico`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`id_cita`,`id_paciente`),
  ADD KEY `paciente_cita_medica` (`id_paciente`);

--
-- Indices de la tabla `dependiente`
--
ALTER TABLE `dependiente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`idExamen`);

--
-- Indices de la tabla `examen_historia_clinica`
--
ALTER TABLE `examen_historia_clinica`
  ADD PRIMARY KEY (`idExamen`,`id_paciente`),
  ADD KEY `historia_clinica_examen_historia_clinica` (`id_paciente`);

--
-- Indices de la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD PRIMARY KEY (`id_paciente`);

--
-- Indices de la tabla `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`id_medicamento`);

--
-- Indices de la tabla `migration`
--
ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);

--
-- Indices de la tabla `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `receta_detalle`
--
ALTER TABLE `receta_detalle`
  ADD PRIMARY KEY (`id_cita`,`id_medicamento`),
  ADD KEY `medicamentos_receta_detalle` (`id_medicamento`);

--
-- Indices de la tabla `reportepacientes`
--
ALTER TABLE `reportepacientes`
  ADD PRIMARY KEY (`idreporte`);

--
-- Indices de la tabla `social_account`
--
ALTER TABLE `social_account`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_unique` (`provider`,`client_id`),
  ADD UNIQUE KEY `account_unique_code` (`code`),
  ADD KEY `fk_user_account` (`user_id`);

--
-- Indices de la tabla `token`
--
ALTER TABLE `token`
  ADD UNIQUE KEY `token_unique` (`user_id`,`code`,`type`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_unique_email` (`email`),
  ADD UNIQUE KEY `user_unique_username` (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `audit_entry`
--
ALTER TABLE `audit_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5756;
--
-- AUTO_INCREMENT de la tabla `audit_error`
--
ALTER TABLE `audit_error`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=870;
--
-- AUTO_INCREMENT de la tabla `audit_javascript`
--
ALTER TABLE `audit_javascript`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `audit_mail`
--
ALTER TABLE `audit_mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `certificado_medico`
--
ALTER TABLE `certificado_medico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `idExamen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `reportepacientes`
--
ALTER TABLE `reportepacientes`
  MODIFY `idreporte` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `antecedentes`
--
ALTER TABLE `antecedentes`
  ADD CONSTRAINT `historia_clinica_antecedentes` FOREIGN KEY (`id_paciente`) REFERENCES `historia_clinica` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `audit_data`
--
ALTER TABLE `audit_data`
  ADD CONSTRAINT `audit_data_ibfk_1` FOREIGN KEY (`entry_id`) REFERENCES `audit_data` (`id`);

--
-- Filtros para la tabla `audit_error`
--
ALTER TABLE `audit_error`
  ADD CONSTRAINT `fk_audit_error_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`);

--
-- Filtros para la tabla `audit_javascript`
--
ALTER TABLE `audit_javascript`
  ADD CONSTRAINT `fk_audit_javascript_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`);

--
-- Filtros para la tabla `audit_mail`
--
ALTER TABLE `audit_mail`
  ADD CONSTRAINT `fk_audit_mail_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`);

--
-- Filtros para la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD CONSTRAINT `paciente_cita_medica` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

--
-- Filtros para la tabla `examen_historia_clinica`
--
ALTER TABLE `examen_historia_clinica`
  ADD CONSTRAINT `examen_examen_historia_clinica` FOREIGN KEY (`idExamen`) REFERENCES `examen` (`idExamen`),
  ADD CONSTRAINT `historia_clinica_examen_historia_clinica` FOREIGN KEY (`id_paciente`) REFERENCES `historia_clinica` (`id_paciente`);

--
-- Filtros para la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD CONSTRAINT `paciente_historia_clinica` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `receta_detalle`
--
ALTER TABLE `receta_detalle`
  ADD CONSTRAINT `cita_medica_receta_detalle` FOREIGN KEY (`id_cita`) REFERENCES `cita_medica` (`id_cita`),
  ADD CONSTRAINT `medicamentos_receta_detalle` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
