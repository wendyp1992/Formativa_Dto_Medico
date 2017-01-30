-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 30-01-2017 a las 00:22:08
-- Versión del servidor: 5.7.17-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.13-0ubuntu0.16.04.1

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
  `hb_alcohol` bit(1) DEFAULT NULL,
  `hb_tabaco` bit(1) DEFAULT NULL,
  `hb_malaAliment` bit(1) DEFAULT NULL,
  `hb_vidaSedent` bit(1) DEFAULT NULL,
  `alg_cardiaca` bit(1) DEFAULT NULL,
  `alg_respiratoria` bit(1) DEFAULT NULL,
  `alg_quirurgica` bit(1) DEFAULT NULL,
  `alg_traumatolog` bit(1) DEFAULT NULL,
  `cancer` bit(1) DEFAULT NULL,
  `diabetes` bit(1) DEFAULT NULL,
  `hipertension` bit(1) DEFAULT NULL,
  `tuberculosis` bit(1) DEFAULT NULL,
  `id_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Estructura de tabla para la tabla `cita_agendada`
--

CREATE TABLE `cita_agendada` (
  `id_citaAgendada` int(11) NOT NULL,
  `fecha_agendada` date DEFAULT NULL,
  `hora_agendada` time DEFAULT NULL,
  `observaciones_agen` varchar(40) DEFAULT NULL,
  `id_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `id_doctor` int(11) NOT NULL,
  `id_cita` int(11) NOT NULL,
  `presion_baja` int(11) DEFAULT NULL,
  `temperatura` int(11) DEFAULT NULL,
  `peso` int(11) DEFAULT NULL,
  `frc_cardiaca` int(11) DEFAULT NULL,
  `revision_fisica` text,
  `sintomas` text,
  `diagnostico_exFisicos` text,
  `diagnostico` text,
  `fecha_cita` date DEFAULT NULL,
  `tratamiento_sm` text,
  `presion_alta` int(11) DEFAULT NULL,
  `id_paciente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependiente`
--

CREATE TABLE `dependiente` (
  `cedula` varchar(10) DEFAULT NULL,
  `fecha_regDependiente` date DEFAULT NULL,
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `fecha_nac` varchar(40) DEFAULT NULL,
  `estado_civil` varchar(40) DEFAULT NULL,
  `id_paciente` int(11) NOT NULL,
  `cedula_trab` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `dependiente`
--

INSERT INTO `dependiente` (`cedula`, `fecha_regDependiente`, `nombres`, `apellidos`, `fecha_nac`, `estado_civil`, `id_paciente`, `cedula_trab`) VALUES
('0802468991', '2017-01-23', 'Alexander', 'Caicedo', '2017-01-12', 'Soltero', 1, '0803968098'),
('0801628355', '2017-01-23', 'Alexander', 'Caicedo', '2017-01-13', 'Soltero', 3, '0803968098'),
('0850035684', '2017-01-23', 'David', 'Hurtado', '2017-01-19', 'Soltero', 6, '0803968098');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `nombres` varchar(40) DEFAULT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `mobil` varchar(10) DEFAULT NULL,
  `id_user` int(11) NOT NULL
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
(1, 'Rayos x', 'Tomografia'),
(2, 'Rayos x', 'Radiografia'),
(3, 'Rayos x', 'Ecografia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `examen_historia_clinica`
--

CREATE TABLE `examen_historia_clinica` (
  `IdExamenHistoria` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `idTiposExamen` text NOT NULL,
  `indicacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `examen_historia_clinica`
--

INSERT INTO `examen_historia_clinica` (`IdExamenHistoria`, `id_paciente`, `idTiposExamen`, `indicacion`) VALUES
(1, 1, '2,3', 'Diagnostico: (Síndrome de fatiga crónica hipertension y diabetes).\r\n\r\n1)      Bebida liquida vitaminada tres veces al día (poner marca o tipo)\r\n2)      Bentónico marca (poner la marca y/o substancia activa)\r\n3)      Insulina inyectable, de tipo (poner tipo) (aplicar una inyección de un cm después de medir el azúcar) una vez al día\r\n\r\nNo consumir alimentos altos en almidones y azucares durante una semana, y realizar actividad física ligera.'),
(2, 1, '1,2,3', 'Tomar 1 tableta oralmente a la 9 y 21 Hrs. diariamente por 30 días \r\nPara ansiedad.');

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
  `fecha_caduc` datetime DEFAULT NULL,
  `cantidad_med` int(11) DEFAULT NULL,
  `fecha_regMedic` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`id_medicamento`, `codigo_med`, `nombre_med`, `tipo_med`, `descripcion`, `fecha_caduc`, `cantidad_med`, `fecha_regMedic`) VALUES
(1, '100', 'PENICILINA ', 'ANTIBIOTICOS', 'PENICILINA G CRISTALINA (como sal sódica o potásica) Base 1,000.000 UI\r\npolvo para inyección 5 ml Frasco', NULL, 100, '2017-01-20'),
(2, '200', 'AMPICILINA + SULBACTAM 1.5 g', 'ANTIBIOTICOS', 'AMPICILINA + SULBACTAM 1.5 g (1g ampicilina (sódica) + 0.5 g sulbactan\r\nsódico) polvo para inyección Fco.', NULL, 50, '2017-01-20'),
(3, '300', 'AMOXICILINA ( anhidra ) 250mg/5ml ', 'ANTIBIOTICOS', 'AMOXICILINA ( anhidra ) 250mg/5ml polvo para suspensión oral Fco 100 ml.', NULL, 20, '2017-01-19'),
(4, '301', 'SEVOFLURANO 100 %', 'ANESTESICOS', 'SEVOFLURANO 100 % v/v solución inhalante Fco. 250 ml. (uso exclusivo en\r\nanestesiología)', NULL, 40, '2017-01-19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migration`
--

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1472563998),
('m140209_132017_init', 1472564003),
('m140403_174025_create_account_table', 1472564005),
('m140504_113157_update_tables', 1472564011),
('m140504_130429_create_token_table', 1472564014),
('m140506_102106_rbac_init', 1472564521),
('m140830_171933_fix_ip_field', 1472564015),
('m140830_172703_change_account_table_name', 1472564016),
('m141222_110026_update_ip_field', 1472564016),
('m141222_135246_alter_username_length', 1472564017),
('m150614_103145_update_social_account_table', 1472564020),
('m150623_212711_fix_username_notnull', 1472564021),
('m150626_000001_create_audit_entry', 1472702894),
('m150626_000002_create_audit_data', 1472702895),
('m150626_000003_create_audit_error', 1472702896),
('m150626_000004_create_audit_trail', 1472702898),
('m150626_000005_create_audit_javascript', 1472702900),
('m150626_000006_create_audit_mail', 1472702901),
('m150714_000001_alter_audit_data', 1472702902),
('m151218_234654_add_timezone_to_profile', 1472564022),
('m160929_103127_add_last_login_at_to_user_table', 1485189997);

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
(1, '0803968098', 'Trabajador', '2017-01-23', ''),
(2, '0802468991', 'Dependiente', '2017-01-22', NULL),
(4, '0801628355', 'Dependiente', '2017-01-22', NULL),
(6, '0850035684', 'Dependiente', '2017-01-23', NULL),
(7, '', 'Dependiente', '2017-01-28', NULL);

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
(3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
  `status` int(11) DEFAULT NULL,
  `last_login_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `status`, `last_login_at`) VALUES
(1, 'superadmin', 'superadmin@gmail.com', '$2y$12$rQ3kv0tMJm9oyBJB18/pJOJ54PTqSTdYEP/ZsZ0I16VBmEOUbhugC', '3RKcjLUns0L5O-yfxik3XzT8LK3HLwZ4', 1472566181, NULL, NULL, '::1', 1472564609, 1472564609, 0, 10, 1485730818),
(3, 'prueba', 'prueba@correo.com', '$2y$12$zXCELKfNCLRTjMvfQ4/Ys.47npnDiieLbveXBIAvge4HbAm.i95fO', 'mBZ8wDIZ3RrTsEinMvQtPuL1WmFklJ-g', 1485700742, NULL, NULL, '127.0.0.1', 1485700741, 1485700741, 0, NULL, NULL);

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
-- Indices de la tabla `cita_agendada`
--
ALTER TABLE `cita_agendada`
  ADD PRIMARY KEY (`id_citaAgendada`,`id_paciente`),
  ADD KEY `paciente_cita_agendada` (`id_paciente`);

--
-- Indices de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  ADD PRIMARY KEY (`id_cita`);

--
-- Indices de la tabla `dependiente`
--
ALTER TABLE `dependiente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `cedula` (`cedula`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id_user`);

--
-- Indices de la tabla `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`idExamen`);

--
-- Indices de la tabla `examen_historia_clinica`
--
ALTER TABLE `examen_historia_clinica`
  ADD PRIMARY KEY (`IdExamenHistoria`);

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
-- AUTO_INCREMENT de la tabla `audit_data`
--
ALTER TABLE `audit_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12791;
--
-- AUTO_INCREMENT de la tabla `audit_entry`
--
ALTER TABLE `audit_entry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3346;
--
-- AUTO_INCREMENT de la tabla `audit_error`
--
ALTER TABLE `audit_error`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
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
-- AUTO_INCREMENT de la tabla `cita_agendada`
--
ALTER TABLE `cita_agendada`
  MODIFY `id_citaAgendada` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `dependiente`
--
ALTER TABLE `dependiente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `idExamen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `examen_historia_clinica`
--
ALTER TABLE `examen_historia_clinica`
  MODIFY `IdExamenHistoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
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
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `social_account`
--
ALTER TABLE `social_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `antecedentes`
--
ALTER TABLE `antecedentes`
  ADD CONSTRAINT `historia_clinica_antecedentes` FOREIGN KEY (`id_paciente`) REFERENCES `historia_clinica` (`id_paciente`);

--
-- Filtros para la tabla `audit_data`
--
ALTER TABLE `audit_data`
  ADD CONSTRAINT `fk_audit_data_entry_id` FOREIGN KEY (`entry_id`) REFERENCES `audit_entry` (`id`);

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
-- Filtros para la tabla `cita_agendada`
--
ALTER TABLE `cita_agendada`
  ADD CONSTRAINT `paciente_cita_agendada` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

--
-- Filtros para la tabla `dependiente`
--
ALTER TABLE `dependiente`
  ADD CONSTRAINT `Eliminar` FOREIGN KEY (`cedula`) REFERENCES `paciente` (`cedula`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `historia_clinica`
--
ALTER TABLE `historia_clinica`
  ADD CONSTRAINT `paciente_historia_clinica` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`);

--
-- Filtros para la tabla `receta_detalle`
--
ALTER TABLE `receta_detalle`
  ADD CONSTRAINT `cita_medica_receta_detalle` FOREIGN KEY (`id_cita`) REFERENCES `cita_medica` (`id_cita`),
  ADD CONSTRAINT `medicamentos_receta_detalle` FOREIGN KEY (`id_medicamento`) REFERENCES `medicamentos` (`id_medicamento`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
