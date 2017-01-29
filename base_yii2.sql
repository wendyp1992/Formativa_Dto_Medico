-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-01-2017 a las 20:12:36
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
(2624, '2017-01-17 12:03:55', 1, 0.503876, '::1', 'GET', 0, NULL, 6174920),
(5756, '2017-01-28 21:43:58', 1, 26.6294, '::1', 'GET', 0, 'audit/entry/index', 10774488),
(5757, '2017-01-28 21:44:55', 1, 1.4107, '::1', 'GET', 0, 'site/index', 7026648),
(5758, '2017-01-28 21:45:01', 1, 0.774009, '::1', 'GET', 0, 'audit/trail/index', 8191296),
(5759, '2017-01-28 21:45:14', 1, 0.271272, '::1', 'GET', 0, 'site/index', 7026648),
(5760, '2017-01-28 21:45:17', 1, 10.6478, '::1', 'GET', 0, 'medicamentos/index', 9204616),
(5761, '2017-01-28 23:21:57', 0, 1.96273, '::1', 'GET', 0, 'site/index', 7006384),
(5762, '2017-01-28 23:22:02', 0, 0.503692, '::1', 'GET', 0, 'user/security/login', 7553168),
(5763, '2017-01-28 23:22:11', 1, 0.62499, '::1', 'POST', 0, 'user/security/login', 6364144),
(5764, '2017-01-28 23:22:13', 1, 0.735896, '::1', 'GET', 0, 'site/index', 7032160),
(5765, '2017-01-28 23:22:21', 1, 1.32915, '::1', 'GET', 0, 'certificado-medico/create', 7774256),
(5766, '2017-01-28 23:22:28', 1, 0.312007, '::1', 'GET', 0, 'site/index', 7034424),
(5767, '2017-01-28 23:23:48', 1, 0.261868, '::1', 'GET', 0, 'site/index', 7034632),
(5768, '2017-01-28 23:23:52', 1, 0.246488, '::1', 'GET', 0, 'certificado-medico/create', 7774256),
(5769, '2017-01-28 23:24:21', 1, 1.47388, '::1', 'GET', 0, 'site/index', 7115816),
(5770, '2017-01-28 23:24:26', 1, 1.20528, '::1', 'GET', 0, 'medicamentos/index', 9204208),
(5771, '2017-01-28 23:24:32', 1, 0.469261, '::1', 'GET', 0, 'logs/index', 6682952),
(5772, '2017-01-28 23:25:50', 1, 0.502117, '::1', 'GET', 0, 'logs/index', 9080472),
(5773, '2017-01-28 23:26:03', 1, 0.508304, '::1', 'GET', 0, 'audit/trail/index', 8191376),
(5774, '2017-01-28 23:26:06', 1, 0.474378, '::1', 'GET', 0, 'logs/index', 9080016),
(5775, '2017-01-28 23:26:09', 1, 2.156, '::1', 'GET', 0, 'audit/entry/index', 10875696),
(5776, '2017-01-28 23:26:14', 1, 0.302074, '::1', 'GET', 0, 'audit/mail/index', 7924920),
(5777, '2017-01-28 23:26:15', 1, 0.252046, '::1', 'GET', 0, 'audit/trail/index', 8191408),
(5778, '2017-01-28 23:26:17', 1, 0.437018, '::1', 'GET', 0, 'audit/javascript/index', 7908464),
(5779, '2017-01-28 23:26:18', 1, 0.40586, '::1', 'GET', 0, 'audit/error/index', 8121272),
(5780, '2017-01-28 23:26:25', 1, 0.312701, '::1', 'GET', 0, 'audit/entry/view', 7859352),
(5781, '2017-01-28 23:26:28', 1, 0.268997, '::1', 'GET', 0, 'audit/error/index', 8114880),
(5782, '2017-01-28 23:26:29', 1, 0.455272, '::1', 'GET', 0, 'audit/javascript/index', 7908464),
(5783, '2017-01-28 23:26:32', 1, 0.4197, '::1', 'GET', 0, 'audit/trail/index', 8191408),
(5784, '2017-01-28 23:26:34', 1, 0.397195, '::1', 'GET', 0, 'audit/mail/index', 7924920),
(5785, '2017-01-28 23:26:35', 1, 0.755111, '::1', 'GET', 0, 'audit/entry/index', 10862096),
(5786, '2017-01-28 23:26:38', 1, 0.253987, '::1', 'GET', 0, 'site/index', 7026296),
(5787, '2017-01-28 23:27:38', 1, 0.216531, '::1', 'GET', 0, 'site/index', 7028760),
(5788, '2017-01-28 23:27:44', 1, 0.535726, '::1', 'GET', 0, 'audit/entry/index', 10870736),
(5789, '2017-01-28 23:27:46', 1, 0.229985, '::1', 'GET', 0, 'site/index', 7028760),
(5790, '2017-01-29 00:02:56', 1, 6.57019, '::1', 'GET', 0, 'site/index', 7029344),
(5791, '2017-01-29 00:03:11', 1, 3.94463, '::1', 'GET', 0, 'medicamentos/index', 9204680),
(5792, '2017-01-29 00:03:18', 1, 1.00712, '::1', 'GET', 0, 'site/index', 7033232),
(5793, '2017-01-29 00:03:24', 1, 3.90649, '::1', 'GET', 0, 'certificado-medico/create', 7775400),
(5794, '2017-01-29 00:03:31', 1, 1.52934, '::1', 'GET', 0, 'reportepacientes/index', 8968448),
(5795, '2017-01-29 00:03:41', 1, 0.443256, '::1', 'GET', 0, 'examen-historia-clinica/index', 8974208),
(5796, '2017-01-29 00:03:43', 1, 0.298959, '::1', 'GET', 0, 'certificado-medico/create', 7774968),
(5797, '2017-01-29 00:03:52', 1, 0.398148, '::1', 'POST', 0, 'certificado-medico/create', 6182848),
(5798, '2017-01-29 00:03:54', 1, 4.00412, '::1', 'GET', 0, 'certificado-medico/reporte', 21106504),
(5799, '2017-01-29 00:04:14', 1, 0.473725, '::1', 'GET', 0, 'certificado-medico/index', 7957168),
(5800, '2017-01-29 00:05:16', 1, 0.477517, '::1', 'GET', 0, 'site/index', 7026648),
(5801, '2017-01-29 00:05:19', 1, 0.523867, '::1', 'GET', 0, 'medicamentos/index', 9204224),
(5802, '2017-01-29 00:05:23', 1, 1.58222, '::1', 'GET', 1, 'medicamentos/create', 7752856),
(5803, '2017-01-29 00:05:36', 1, 0.405594, '::1', 'POST', 1, 'medicamentos/create', 6622616),
(5804, '2017-01-29 00:05:36', 1, 0.345173, '::1', 'GET', 1, 'medicamentos/index', 9041712),
(5805, '2017-01-29 00:05:44', 1, 0.463682, '::1', 'POST', 1, 'medicamentos/delete', 6074552),
(5806, '2017-01-29 00:05:45', 1, 0.305277, '::1', 'GET', 1, 'medicamentos/index', 9038736),
(5807, '2017-01-29 11:19:41', 0, 4.38289, '::1', 'GET', 0, 'site/index', 7006384),
(5808, '2017-01-29 11:20:50', 0, 1.08235, '::1', 'GET', 0, 'gii/default/index', 7423568),
(5809, '2017-01-29 11:20:56', 0, 1.18888, '::1', 'GET', 0, 'gii/default/view', 8027416),
(5810, '2017-01-29 11:21:05', 0, 1.64128, '::1', 'POST', 0, 'gii/default/view', 8401344),
(5811, '2017-01-29 11:21:12', 0, 0.6948, '::1', 'POST', 0, 'gii/default/view', 8394816),
(5812, '2017-01-29 11:25:40', 0, 0.218492, '::1', 'GET', 0, 'gii/default/index', 7423160),
(5813, '2017-01-29 11:25:45', 0, 0.246796, '::1', 'GET', 0, 'site/index', 6919352),
(5814, '2017-01-29 11:25:47', 0, 0.643334, '::1', 'GET', 0, 'user/security/login', 7553192),
(5815, '2017-01-29 11:25:53', 1, 0.353907, '::1', 'POST', 0, 'user/security/login', 6364144),
(5816, '2017-01-29 11:25:54', 1, 0.406274, '::1', 'GET', 0, 'site/index', 7032160),
(5817, '2017-01-29 11:25:59', 1, 0.81029, '::1', 'GET', 0, 'cita-medica/create', 7985136),
(5818, '2017-01-29 11:26:30', 1, 0.349921, '::1', 'GET', 0, 'cita-medica/create', 8213568),
(5819, '2017-01-29 11:29:33', 1, 0.420099, '::1', 'GET', 0, 'cita-medica/create', 8194856),
(5820, '2017-01-29 11:30:55', 1, 0.339658, '::1', 'GET', 0, 'cita-medica/create', 8225040),
(5821, '2017-01-29 11:31:11', 1, 0.366598, '::1', 'GET', 0, 'cita-medica/create', 8226984),
(5822, '2017-01-29 11:34:10', 1, 0.229974, '::1', 'GET', 0, 'gii/default/index', 7552176),
(5823, '2017-01-29 11:34:13', 1, 0.386443, '::1', 'GET', 0, 'gii/default/view', 8169056),
(5824, '2017-01-29 11:34:19', 1, 0.645964, '::1', 'POST', 0, 'gii/default/view', 8530080),
(5825, '2017-01-29 11:34:24', 1, 0.754695, '::1', 'POST', 0, 'gii/default/view', 8510312),
(5826, '2017-01-29 11:34:30', 1, 0.294485, '::1', 'GET', 0, 'site/index', 7031656),
(5827, '2017-01-29 11:34:33', 1, 1.46751, '::1', 'GET', 0, 'examen-historia-clinica/index', 8973056),
(5828, '2017-01-29 11:34:37', 1, 0.193959, '::1', 'GET', 0, 'cita-medica/create', 7966656),
(5829, '2017-01-29 11:35:45', 1, 0.390802, '::1', 'GET', 0, 'cita-medica/create', 7967256),
(5830, '2017-01-29 11:36:25', 1, 0.421532, '::1', 'GET', 0, 'dependiente/index', 9070272),
(5831, '2017-01-29 11:37:12', 1, 0.600147, '::1', 'GET', 0, 'gii/default/index', 7552176),
(5832, '2017-01-29 11:37:14', 1, 0.185066, '::1', 'GET', 0, 'gii/default/view', 8169056),
(5833, '2017-01-29 11:37:20', 1, 0.536149, '::1', 'POST', 0, 'gii/default/view', 8532488),
(5834, '2017-01-29 11:37:24', 1, 0.601113, '::1', 'POST', 0, 'gii/default/view', 8512808),
(5835, '2017-01-29 11:37:29', 1, 0.258946, '::1', 'GET', 0, 'site/index', 7031656),
(5836, '2017-01-29 11:37:31', 1, 0.348643, '::1', 'GET', 0, 'dependiente/index', 9066912),
(5837, '2017-01-29 11:37:33', 1, 0.544164, '::1', 'GET', 1, 'dependiente/create', 7550056),
(5838, '2017-01-29 11:37:41', 1, 7.94016, '::1', 'POST', 0, 'dependiente/create', 8457328),
(5839, '2017-01-29 11:38:03', 1, 0.489582, '::1', 'POST', 0, 'dependiente/create', 6562272),
(5840, '2017-01-29 11:38:04', 1, 0.41079, '::1', 'GET', 0, 'historia-clinica/create', 7993256),
(5841, '2017-01-29 11:38:10', 1, 0.50168, '::1', 'POST', 0, 'historia-clinica/create', 6682232),
(5842, '2017-01-29 11:38:11', 1, 0.426287, '::1', 'GET', 0, 'paciente/index', 9202144),
(5843, '2017-01-29 11:38:20', 1, 0.518857, '::1', 'POST', 1, 'paciente/delete', 6148624),
(5844, '2017-01-29 11:38:21', 1, 0.209629, '::1', 'GET', 1, 'paciente/index', 9036120),
(5845, '2017-01-29 11:38:24', 1, 0.216075, '::1', 'GET', 0, 'dependiente/index', 9066920),
(5846, '2017-01-29 11:38:35', 1, 0.38736, '::1', 'GET', 0, 'examen-historia-clinica/index', 8973128),
(5847, '2017-01-29 11:38:37', 1, 0.491643, '::1', 'GET', 1, 'examen-historia-clinica/create', 7756352),
(5848, '2017-01-29 11:43:23', 1, 0.371158, '::1', 'GET', 0, 'examen-historia-clinica/index', 8997472),
(5849, '2017-01-29 11:43:26', 1, 0.429315, '::1', 'GET', 1, 'examen-historia-clinica/create', 6417672),
(5850, '2017-01-29 11:44:15', 1, 0.256747, '::1', 'GET', 1, 'examen-historia-clinica/create', 6126408),
(5851, '2017-01-29 11:47:54', 1, 0.296115, '::1', 'GET', 1, 'examen-historia-clinica/create', 6126408),
(5852, '2017-01-29 11:49:58', 1, 0.338618, '::1', 'GET', 0, 'examen-historia-clinica/index', 8997472),
(5853, '2017-01-29 11:50:00', 1, 0.887507, '::1', 'GET', 1, 'examen-historia-clinica/create', 8007360),
(5854, '2017-01-29 11:50:50', 1, 0.409215, '::1', 'GET', 1, 'examen-historia-clinica/create', 8007296),
(5855, '2017-01-29 11:56:09', 1, 0.40626, '::1', 'GET', 1, 'examen-historia-clinica/create', 8455248),
(5856, '2017-01-29 11:57:28', 1, 0.443412, '::1', 'GET', 0, 'examen-historia-clinica/index', 9026728),
(5857, '2017-01-29 11:57:31', 1, 0.523973, '::1', 'GET', 1, 'examen-historia-clinica/create', 8455248),
(5858, '2017-01-29 11:58:07', 1, 0.3337, '::1', 'GET', 0, 'examen-historia-clinica/index', 9102888),
(5859, '2017-01-29 11:58:09', 1, 0.669603, '::1', 'GET', 1, 'examen-historia-clinica/create', 8473720),
(5860, '2017-01-29 11:58:15', 1, 0.299332, '::1', 'GET', 1, 'examen-historia-clinica/create', 8473344),
(5861, '2017-01-29 11:58:23', 1, 0.321548, '::1', 'POST', 1, 'examen-historia-clinica/create', 6648960),
(5862, '2017-01-29 11:59:08', 1, 0.716907, '::1', 'GET', 1, 'examen-historia-clinica/create', 8473344),
(5863, '2017-01-29 11:59:17', 1, 0.308, '::1', 'POST', 1, 'examen-historia-clinica/create', 6648960),
(5864, '2017-01-29 12:00:26', 1, 0.388368, '::1', 'GET', 0, 'examen-historia-clinica/index', 9102888),
(5865, '2017-01-29 12:00:28', 1, 0.320171, '::1', 'GET', 1, 'examen-historia-clinica/create', 8473344),
(5866, '2017-01-29 12:00:36', 1, 0.427223, '::1', 'POST', 1, 'examen-historia-clinica/create', 7004512),
(5867, '2017-01-29 12:01:06', 1, 0.316681, '::1', 'GET', 1, 'examen-historia-clinica/create', 8473344),
(5868, '2017-01-29 12:01:23', 1, 0.415249, '::1', 'POST', 1, 'examen-historia-clinica/create', 7004248),
(5869, '2017-01-29 12:02:21', 1, 0.304989, '::1', 'GET', 1, 'examen-historia-clinica/create', 8473344),
(5870, '2017-01-29 12:02:36', 1, 0.383038, '::1', 'POST', 1, 'examen-historia-clinica/create', 7004264),
(5871, '2017-01-29 12:02:43', 1, 0.348786, '::1', 'GET', 1, 'examen-historia-clinica/create', 8473344),
(5872, '2017-01-29 12:02:53', 1, 0.28856, '::1', 'POST', 1, 'examen-historia-clinica/create', 7004360),
(5873, '2017-01-29 12:04:14', 1, 0.315482, '::1', 'GET', 1, 'examen-historia-clinica/create', 8473344),
(5874, '2017-01-29 12:05:32', 1, 0.444835, '::1', 'POST', 1, 'examen-historia-clinica/create', 7008200),
(5875, '2017-01-29 12:05:42', 1, 0.329283, '::1', 'GET', 0, 'examen-historia-clinica/index', 9102888),
(5876, '2017-01-29 12:06:08', 1, 0.676263, '::1', 'GET', 1, 'examen-historia-clinica/create', 8473344),
(5877, '2017-01-29 12:06:50', 1, 0.269339, '::1', 'POST', 1, 'examen-historia-clinica/create', 7004264),
(5878, '2017-01-29 12:07:39', 1, 0.496507, '::1', 'GET', 0, 'reportepacientes/index', 8996072),
(5879, '2017-01-29 12:07:42', 1, 0.283133, '::1', 'GET', 1, 'reportepacientes/create', 6797888),
(5880, '2017-01-29 12:10:05', 1, 0.313851, '::1', 'GET', 1, 'reportepacientes/create', 6797888),
(5881, '2017-01-29 12:10:20', 1, 0.268334, '::1', 'GET', 0, 'reportepacientes/index', 8996640),
(5882, '2017-01-29 12:10:22', 1, 0.436573, '::1', 'GET', 1, 'reportepacientes/create', 6797888),
(5883, '2017-01-29 12:10:30', 1, 0.377981, '::1', 'GET', 0, 'cita-medica/create', 7996080),
(5884, '2017-01-29 12:10:35', 1, 0.43793, '::1', 'GET', 0, 'dependiente/index', 9096072),
(5885, '2017-01-29 12:10:37', 1, 0.872071, '::1', 'GET', 1, 'dependiente/create', 7579192),
(5886, '2017-01-29 12:10:43', 1, 9.85081, '::1', 'POST', 0, 'dependiente/create', 8163224),
(5887, '2017-01-29 12:11:08', 1, 0.358537, '::1', 'GET', 0, 'dependiente/index', 9096072),
(5888, '2017-01-29 12:11:10', 1, 0.578405, '::1', 'GET', 0, 'paciente/index', 9230560),
(5889, '2017-01-29 12:11:15', 1, 0.38302, '::1', 'POST', 1, 'paciente/delete', 6171952),
(5890, '2017-01-29 12:11:16', 1, 0.361331, '::1', 'GET', 1, 'paciente/index', 9065264),
(5891, '2017-01-29 12:11:34', 1, 0.317592, '::1', 'GET', 0, 'paciente/index', 9229704),
(5892, '2017-01-29 12:11:36', 1, 0.237777, '::1', 'GET', 1, 'paciente/create', 7834560),
(5893, '2017-01-29 12:11:40', 1, 0.537068, '::1', 'GET', 0, 'reportepacientes/index', 8997472),
(5894, '2017-01-29 12:11:42', 1, 0.688412, '::1', 'GET', 1, 'reportepacientes/create', 7656776),
(5895, '2017-01-29 12:11:50', 1, 0.396474, '::1', 'GET', 0, 'examen-historia-clinica/index', 9103712),
(5896, '2017-01-29 12:11:51', 1, 0.557514, '::1', 'GET', 1, 'examen-historia-clinica/create', 8474800),
(5897, '2017-01-29 12:11:55', 1, 0.227677, '::1', 'GET', 0, 'site/index', 7064832),
(5898, '2017-01-29 12:11:57', 1, 0.322611, '::1', 'GET', 0, 'paciente/index', 9229176),
(5899, '2017-01-29 12:12:00', 1, 0.253348, '::1', 'GET', 1, 'paciente/create', 7834560),
(5900, '2017-01-29 12:16:05', 1, 0.231982, '::1', 'GET', 0, 'site/index', 7146592),
(5901, '2017-01-29 12:16:07', 1, 0.608501, '::1', 'GET', 0, 'user/admin/create', 7776568),
(5902, '2017-01-29 12:16:09', 1, 0.440459, '::1', 'GET', 0, 'examen/index', 9135480),
(5903, '2017-01-29 12:16:12', 1, 0.332941, '::1', 'GET', 0, 'medicamentos/index', 9231960),
(5904, '2017-01-29 12:16:16', 1, 0.282424, '::1', 'GET', 0, 'site/index', 7063432),
(5905, '2017-01-29 12:16:51', 1, 0.263617, '::1', 'GET', 0, 'site/index', 7063728),
(5906, '2017-01-29 12:36:30', 1, 3.96818, '::1', 'GET', 0, 'reportepacientes/index', 8998256),
(5907, '2017-01-29 12:36:43', 1, 0.625495, '::1', 'GET', 1, 'reportepacientes/create', 7657200),
(5908, '2017-01-29 12:42:29', 1, 0.291146, '::1', 'GET', 0, 'reportepacientes/index', 8998856),
(5909, '2017-01-29 12:42:32', 1, 0.502107, '::1', 'GET', 0, 'dependiente/index', 9104480),
(5910, '2017-01-29 12:42:36', 1, 0.405135, '::1', 'GET', 1, 'dependiente/create', 7586992),
(5911, '2017-01-29 12:42:53', 1, 0.359507, '::1', 'GET', 0, 'dependiente/index', 9105112),
(5912, '2017-01-29 12:42:55', 1, 0.322257, '::1', 'GET', 1, 'dependiente/create', 7586976),
(5913, '2017-01-29 12:43:00', 1, 9.5558, '::1', 'POST', 0, 'dependiente/create', 8517600),
(5914, '2017-01-29 12:43:56', 1, 0.465825, '::1', 'POST', 0, 'dependiente/create', 6623192),
(5915, '2017-01-29 12:43:57', 1, 0.576945, '::1', 'GET', 0, 'historia-clinica/create', 8030152),
(5916, '2017-01-29 12:44:04', 1, 0.517716, '::1', 'POST', 0, 'historia-clinica/create', 6718936),
(5917, '2017-01-29 12:44:05', 1, 0.447679, '::1', 'GET', 0, 'paciente/index', 9233808),
(5918, '2017-01-29 12:44:16', 1, 0.506657, '::1', 'POST', 1, 'paciente/delete', 6185328),
(5919, '2017-01-29 12:44:18', 1, 0.902557, '::1', 'GET', 1, 'paciente/index', 9068088),
(5920, '2017-01-29 12:44:21', 1, 0.729739, '::1', 'GET', 0, 'dependiente/index', 9104496),
(5921, '2017-01-29 12:48:49', 1, 0.381048, '::1', 'GET', 0, 'dependiente/index', 9105104),
(5922, '2017-01-29 12:48:52', 1, 0.522981, '::1', 'GET', 0, 'reportepacientes/index', 9002464),
(5923, '2017-01-29 12:48:53', 1, 0.255915, '::1', 'GET', 0, 'reportepacientes/create', 5985840),
(5924, '2017-01-29 12:48:58', 1, 0.227665, '::1', 'GET', 0, 'reportepacientes/create', 5985816),
(5925, '2017-01-29 12:49:06', 1, 0.224446, '::1', 'GET', 0, 'reportepacientes/create', 5985816),
(5926, '2017-01-29 12:49:09', 1, 0.28309, '::1', 'GET', 0, 'reportepacientes/index', 9001832),
(5927, '2017-01-29 12:49:10', 1, 0.331291, '::1', 'GET', 1, 'reportepacientes/create', 7683576),
(5928, '2017-01-29 12:49:25', 1, 0.375468, '::1', 'POST', 1, 'reportepacientes/create', 6295208),
(5929, '2017-01-29 12:49:26', 1, 2.43571, '::1', 'GET', 0, 'site/reporte1', 21214280),
(5930, '2017-01-29 12:49:37', 1, 0.278967, '::1', 'GET', 0, 'reportepacientes/index', 9138752),
(5931, '2017-01-29 12:49:42', 1, 0.398174, '::1', 'POST', 1, 'reportepacientes/delete', 6023128),
(5932, '2017-01-29 12:49:44', 1, 0.542705, '::1', 'GET', 1, 'reportepacientes/index', 8845800),
(5933, '2017-01-29 12:55:35', 1, 0.334099, '::1', 'GET', 1, 'reportepacientes/create', 7683520),
(5934, '2017-01-29 12:55:43', 1, 0.293937, '::1', 'POST', 1, 'reportepacientes/create', 6295168),
(5935, '2017-01-29 12:55:44', 1, 0.637461, '::1', 'GET', 0, 'site/reporte1', 21214352),
(5936, '2017-01-29 12:55:48', 1, 0.41618, '::1', 'GET', 0, 'reportepacientes/index', 9138728),
(5937, '2017-01-29 12:55:51', 1, 0.471805, '::1', 'GET', 1, 'reportepacientes/create', 7683520),
(5938, '2017-01-29 12:58:07', 1, 0.330326, '::1', 'GET', 0, 'dependiente/index', 9104448),
(5939, '2017-01-29 12:58:09', 1, 0.309011, '::1', 'GET', 1, 'dependiente/create', 7586928),
(5940, '2017-01-29 12:58:14', 1, 6.57368, '::1', 'POST', 0, 'dependiente/create', 8517416),
(5941, '2017-01-29 12:59:01', 1, 0.456922, '::1', 'POST', 0, 'dependiente/create', 6623104),
(5942, '2017-01-29 12:59:02', 1, 0.481316, '::1', 'GET', 0, 'historia-clinica/create', 8030072),
(5943, '2017-01-29 12:59:11', 1, 0.467038, '::1', 'POST', 0, 'historia-clinica/create', 6718936),
(5944, '2017-01-29 12:59:12', 1, 0.407266, '::1', 'GET', 0, 'paciente/index', 9233808),
(5945, '2017-01-29 12:59:15', 1, 0.675629, '::1', 'POST', 1, 'paciente/delete', 6185232),
(5946, '2017-01-29 12:59:17', 1, 0.412955, '::1', 'GET', 1, 'paciente/index', 9068088),
(5947, '2017-01-29 12:59:19', 1, 0.264172, '::1', 'GET', 0, 'dependiente/index', 9104464),
(5948, '2017-01-29 12:59:25', 1, 0.452901, '::1', 'GET', 0, 'reportepacientes/index', 9139344),
(5949, '2017-01-29 12:59:52', 1, 0.403902, '::1', 'GET', 0, 'dependiente/index', 9104480),
(5950, '2017-01-29 12:59:54', 1, 0.320114, '::1', 'GET', 1, 'dependiente/create', 7586928),
(5951, '2017-01-29 12:59:59', 1, 2.13467, '::1', 'POST', 0, 'dependiente/create', 8517472),
(5952, '2017-01-29 13:00:10', 1, 0.414759, '::1', 'POST', 0, 'dependiente/create', 6623104),
(5953, '2017-01-29 13:00:11', 1, 0.581142, '::1', 'GET', 0, 'historia-clinica/create', 8030112),
(5954, '2017-01-29 13:00:16', 1, 0.644289, '::1', 'POST', 0, 'historia-clinica/create', 6718992),
(5955, '2017-01-29 13:00:17', 1, 0.243495, '::1', 'GET', 0, 'paciente/index', 9233800),
(5956, '2017-01-29 13:00:20', 1, 0.547016, '::1', 'POST', 1, 'paciente/delete', 6185232),
(5957, '2017-01-29 13:00:21', 1, 0.261389, '::1', 'GET', 1, 'paciente/index', 9068088),
(5958, '2017-01-29 13:04:45', 1, 0.270098, '::1', 'GET', 0, 'paciente/index', 9230752),
(5959, '2017-01-29 13:04:46', 1, 0.544979, '::1', 'GET', 1, 'paciente/create', 7835400),
(5960, '2017-01-29 13:04:51', 1, 0.303314, '::1', 'GET', 0, 'reportepacientes/index', 9139344),
(5961, '2017-01-29 13:04:53', 1, 0.559808, '::1', 'GET', 1, 'reportepacientes/create', 8203000),
(5962, '2017-01-29 13:05:43', 0, 0.494641, '::1', 'GET', 0, 'reportepacientes/index', 9145128),
(5963, '2017-01-29 13:05:50', 0, 0.314445, '::1', 'GET', 1, 'reportepacientes/index', 8859216),
(5964, '2017-01-29 13:05:51', 0, 0.456152, '::1', 'GET', 1, 'reportepacientes/create', 7564000),
(5965, '2017-01-29 13:05:57', 0, 0.245499, '::1', 'POST', 1, 'reportepacientes/create', 6175384),
(5966, '2017-01-29 13:05:59', 0, 1.05064, '::1', 'GET', 0, 'site/reporte1', 21137160),
(5967, '2017-01-29 13:06:03', 0, 0.262079, '::1', 'GET', 0, 'reportepacientes/index', 9019384),
(5968, '2017-01-29 13:06:14', 0, 0.249425, '::1', 'POST', 1, 'reportepacientes/delete', 5905496),
(5969, '2017-01-29 13:06:15', 0, 0.275205, '::1', 'GET', 1, 'reportepacientes/index', 8859216),
(5970, '2017-01-29 13:07:36', 0, 0.211345, '::1', 'GET', 1, 'reportepacientes/create', 7564000),
(5971, '2017-01-29 13:08:01', 0, 0.307044, '::1', 'GET', 1, 'reportepacientes/create', 7564000),
(5972, '2017-01-29 13:08:08', 0, 0.368736, '::1', 'POST', 1, 'reportepacientes/create', 6175384),
(5973, '2017-01-29 13:08:10', 0, 0.679459, '::1', 'GET', 0, 'site/reporte1', 21137024),
(5974, '2017-01-29 13:08:33', 0, 0.474929, '::1', 'GET', 0, 'reportepacientes/index', 9019384),
(5975, '2017-01-29 13:08:52', 0, 0.265338, '::1', 'GET', 1, 'reportepacientes/create', 7564000),
(5976, '2017-01-29 13:08:59', 0, 0.312991, '::1', 'POST', 1, 'reportepacientes/create', 6175384),
(5977, '2017-01-29 13:09:00', 0, 0.502406, '::1', 'GET', 0, 'site/reporte1', 21137144),
(5978, '2017-01-29 13:09:02', 0, 0.344685, '::1', 'GET', 0, 'reportepacientes/index', 9022344),
(5979, '2017-01-29 13:09:12', 0, 0.540678, '::1', 'GET', 0, 'reportepacientes/index', 9022344),
(5980, '2017-01-29 13:09:18', 0, 0.313588, '::1', 'POST', 1, 'reportepacientes/delete', 5905496),
(5981, '2017-01-29 13:09:19', 0, 0.329519, '::1', 'GET', 1, 'reportepacientes/index', 8862472),
(5982, '2017-01-29 13:09:21', 0, 0.479359, '::1', 'POST', 1, 'reportepacientes/delete', 5905496),
(5983, '2017-01-29 13:09:22', 0, 0.202435, '::1', 'GET', 1, 'reportepacientes/index', 8858912),
(5984, '2017-01-29 13:10:01', 1, 0.354808, '::1', 'GET', 1, 'reportepacientes/view', 6976440),
(5985, '2017-01-29 13:11:38', 1, 0.338525, '::1', 'GET', 0, 'reportepacientes/index', 9139800),
(5986, '2017-01-29 13:11:40', 1, 0.288691, '::1', 'GET', 1, 'reportepacientes/create', 7683920),
(5987, '2017-01-29 13:13:48', 1, 0.363944, '::1', 'GET', 0, 'reportepacientes/index', 9139800),
(5988, '2017-01-29 13:13:49', 1, 0.375751, '::1', 'GET', 1, 'reportepacientes/create', 7683920),
(5989, '2017-01-29 13:14:10', 1, 0.355181, '::1', 'GET', 0, 'reportepacientes/index', 9139864),
(5990, '2017-01-29 13:14:12', 1, 0.264278, '::1', 'GET', 1, 'reportepacientes/create', 7683920),
(5991, '2017-01-29 13:15:04', 1, 0.274336, '::1', 'GET', 1, 'reportepacientes/create', 7683920),
(5992, '2017-01-29 13:15:52', 1, 0.371808, '::1', 'GET', 0, 'reportepacientes/index', 9139864),
(5993, '2017-01-29 13:15:54', 1, 0.360263, '::1', 'GET', 1, 'reportepacientes/create', 7684168),
(5994, '2017-01-29 13:16:12', 1, 0.369139, '::1', 'GET', 0, 'reportepacientes/index', 9139864),
(5995, '2017-01-29 13:16:13', 1, 0.273566, '::1', 'GET', 1, 'reportepacientes/create', 7684168),
(5996, '2017-01-29 13:16:32', 1, 0.346724, '::1', 'GET', 1, 'reportepacientes/create', 7684168),
(5997, '2017-01-29 13:17:25', 1, 0.286947, '::1', 'POST', 1, 'reportepacientes/create', 6295168),
(5998, '2017-01-29 13:17:26', 1, 0.636119, '::1', 'GET', 0, 'site/reporte1', 21214400),
(5999, '2017-01-29 13:19:20', 1, 0.390533, '::1', 'GET', 0, 'reportepacientes/index', 9142344),
(6000, '2017-01-29 13:19:21', 1, 0.326613, '::1', 'GET', 0, 'paciente/index', 9230248),
(6001, '2017-01-29 13:19:23', 1, 0.427554, '::1', 'GET', 0, 'cita-medica/create', 7998248),
(6002, '2017-01-29 13:19:29', 1, 0.296969, '::1', 'POST', 0, 'cita-medica/create', 6446440),
(6003, '2017-01-29 13:19:30', 1, 0.518699, '::1', 'GET', 0, 'receta-detalle/create', 8551136),
(6004, '2017-01-29 13:19:39', 1, 0.410776, '::1', 'POST', 0, 'receta-detalle/create', 6538624),
(6005, '2017-01-29 13:19:40', 1, 0.264517, '::1', 'GET', 0, 'receta-detalle/create', 8670160),
(6006, '2017-01-29 13:19:45', 1, 0.305215, '::1', 'GET', 0, 'cita-medica/create', 7998248),
(6007, '2017-01-29 13:19:48', 1, 0.300564, '::1', 'GET', 0, 'cita-medica/index', 8092232),
(6008, '2017-01-29 13:19:59', 1, 0.308943, '::1', 'GET', 0, 'cita-medica/view', 7404672),
(6009, '2017-01-29 13:20:09', 1, 0.302225, '::1', 'GET', 0, 'reportepacientes/index', 9142376),
(6010, '2017-01-29 13:20:14', 1, 0.177595, '::1', 'GET', 1, 'reportepacientes/view', 6976560),
(6011, '2017-01-29 13:20:18', 1, 0.269665, '::1', 'GET', 1, 'reportepacientes/create', 7684168),
(6012, '2017-01-29 13:20:26', 1, 0.440191, '::1', 'POST', 1, 'reportepacientes/create', 6295168),
(6013, '2017-01-29 13:20:27', 1, 0.618606, '::1', 'GET', 0, 'site/reporte1', 21214424),
(6014, '2017-01-29 13:21:04', 1, 0.532055, '::1', 'GET', 0, 'site/reporte1', 21214736),
(6015, '2017-01-29 13:21:59', 1, 0.56514, '::1', 'GET', 0, 'site/reporte1', 21214776),
(6016, '2017-01-29 13:22:04', 1, 0.537268, '::1', 'GET', 0, 'site/reporte1', 6948152),
(6017, '2017-01-29 13:22:57', 1, 7.35291, '::1', 'GET', 0, 'site/reporte1', 21680128),
(6018, '2017-01-29 13:23:28', 1, 0.499297, '::1', 'GET', 0, 'site/reporte1', 21214744),
(6019, '2017-01-29 13:23:37', 1, 0.661074, '::1', 'GET', 0, 'site/reporte1', 21214752),
(6020, '2017-01-29 13:26:26', 1, 0.355582, '::1', 'GET', 0, 'site/reporte1', 6525696),
(6021, '2017-01-29 13:26:37', 1, 0.463822, '::1', 'GET', 0, 'site/reporte1', 6525472),
(6022, '2017-01-29 13:27:15', 1, 0.702072, '::1', 'GET', 0, 'site/reporte1', 21214296),
(6023, '2017-01-29 13:27:41', 1, 0.636384, '::1', 'GET', 0, 'site/reporte1', 21214384),
(6024, '2017-01-29 13:28:01', 1, 0.368416, '::1', 'GET', 0, 'site/reporte1', 6947664),
(6025, '2017-01-29 13:28:19', 1, 0.616267, '::1', 'GET', 0, 'site/reporte1', 21214248),
(6026, '2017-01-29 13:29:40', 1, 0.448681, '::1', 'GET', 0, 'site/reporte1', 6947480),
(6027, '2017-01-29 13:30:23', 1, 0.500397, '::1', 'GET', 0, 'site/reporte1', 6947256),
(6028, '2017-01-29 13:30:35', 1, 0.605302, '::1', 'GET', 0, 'site/reporte1', 21214376),
(6029, '2017-01-29 13:31:33', 1, 0.604031, '::1', 'GET', 0, 'site/reporte1', 21221320),
(6030, '2017-01-29 13:32:04', 1, 0.516126, '::1', 'GET', 0, 'site/reporte1', 21221288),
(6031, '2017-01-29 13:32:25', 1, 0.587758, '::1', 'GET', 0, 'site/reporte1', 6953000),
(6032, '2017-01-29 13:32:44', 1, 0.554209, '::1', 'GET', 0, 'site/reporte1', 21221008),
(6033, '2017-01-29 13:32:51', 1, 0.62738, '::1', 'GET', 0, 'site/reporte1', 21221288),
(6034, '2017-01-29 13:34:12', 0, 0.799377, '::1', 'GET', 0, 'user/security/login', 7583464),
(6035, '2017-01-29 13:34:20', 1, 0.256039, '::1', 'POST', 0, 'user/security/login', 6393744),
(6036, '2017-01-29 13:34:21', 1, 0.202517, '::1', 'GET', 0, 'site/index', 7062560),
(6037, '2017-01-29 13:34:24', 1, 0.363236, '::1', 'GET', 0, 'reportepacientes/index', 9147864),
(6038, '2017-01-29 13:34:26', 1, 0.284834, '::1', 'GET', 1, 'reportepacientes/create', 7683160),
(6039, '2017-01-29 13:34:32', 1, 0.459074, '::1', 'POST', 1, 'reportepacientes/create', 6294064),
(6040, '2017-01-29 13:34:34', 1, 0.691725, '::1', 'GET', 0, 'site/reporte1', 21220080),
(6041, '2017-01-29 13:35:13', 1, 0.373449, '::1', 'GET', 0, 'site/reporte1', 6946576),
(6042, '2017-01-29 13:35:49', 1, 0.342027, '::1', 'GET', 0, 'site/reporte1', 6946240),
(6043, '2017-01-29 13:36:21', 1, 0.545424, '::1', 'GET', 0, 'site/reporte1', 6525248),
(6044, '2017-01-29 13:36:35', 1, 0.613625, '::1', 'GET', 0, 'site/reporte1', 21213432),
(6045, '2017-01-29 13:36:53', 1, 0.461735, '::1', 'GET', 0, 'site/reporte1', 6525520),
(6046, '2017-01-29 13:38:07', 1, 4.888, '::1', 'GET', 0, 'site/reporte1', 21679288),
(6047, '2017-01-29 13:40:12', 1, 0.377874, '::1', 'GET', 0, 'site/reporte1', 6946744),
(6048, '2017-01-29 13:40:21', 1, 0.379308, '::1', 'GET', 0, 'site/reporte1', 6946424),
(6049, '2017-01-29 13:40:40', 1, 1.55485, '::1', 'GET', 0, 'site/reporte1', 21679080);

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

--
-- Volcado de datos para la tabla `audit_error`
--

INSERT INTO `audit_error` (`id`, `entry_id`, `created`, `message`, `code`, `file`, `line`, `trace`, `hash`, `emailed`) VALUES
(870, 5771, '2017-01-28 23:24:32', 'Getting unknown property: common\\models\\LogsSearch::fecha', 0, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\Component.php', 143, 0x789cad575d8f9b3814fd2ba33c6d1fa61b08e48391564ad3edaa6a67ba6ab7ed0b52e48013e8109b62934934ca7fdf7b8d217c785212f52904dbd73ee79e7bae219e657bcfb137bc23ded87b169ee30dd671420777c21bcfbcc1c2f3f7649ba67e24431e08ffade4f7348c03eeef280b79e61fe258f0b5c45fdb0f57fe1b22e83c90f18e7ea601cfc2d769946230889bc40ce2c69eeddaf0620a1be50c667286e3ae37582e3754eae7202142e0b305f320b6bf82b8fe826f53ce28933aa23ca4eaa4b637b8fd4bbf23d9061612cf2a60a9686b1a446470773cc69e65003a195e0a74479238249267c2ff563e9a903ab3fe48ed5181d440e2f5706d535e2f86abc8bfe7214d0c2047eeb80b12d3a649a27329b378954b2a3a909d02b289ce1e982be55a887082bc3642077cbbe5ccdfe2c185ff916fc4174ab220026a0a21b82569103d0e118c75a702e5222759cc550ef570aab0227d708020a0428d3a2dc68f38a74bb9eb9ca3fca5731ac8769d2ed735aa3bd5e3d4aa4725b007ad43ef19713826e99cc5b122c123a807f03099f124a159816651fd3720720c6600140b9da9ae605ece6adf22d11001a35b626ccbd7c224e3bff72ca4fbf6314610f3d7607b52ddb422d01e7b64fc89b5681aa266c7b0c469a764725535bf671879ae309a74e676b362836f04244996b9a0d912479624cbc8e1a5aaac1ea678645c4d1959257421b2b52e731579a5aa0efa90a6fc5f92916d8d1e5d9cc5f9f8466885800072a40036b271030c10d235c913f999e7452dc00a11178f533cbc0ca2790235f0801b229c66b220c2a7d50f1ac83f7e9ddd574a27b37a8c07b2a52225012d870c51f4a9184c2d4dff4607bd09e90d32b00366c2c22c21b73b58a4130073add743fd1e0c27135517f9fadfbbdba9869910b6c9c9a6141dad9c40f03c0be8c7dab08b39b9fdfa45539a900330a78fb825312b5766f4674e85a461c52cb287c9f8332e0bc4726bf3e627d5cc2a522b27aa8bef55676d997f75bc79a930dc90ee2565c8466714c9e65c0a9991b43d06cf422a732c0cdc1ae1d181e2f05e49a8130c98488d67a894a8fc214d6f75825b8a7cd09b9cd27edf3d55b35da15a909e27baf2e7699ac4812e8e63114a0b7b5ebf4554ccd732f75036a8629eb68b536ddd5319f11384a6c555f0eac17f4799b45ab3556b4a752928b4cdb97d9df658b4ee0e28dde84bbf9f987a9a7b95819e6d6a96a94f631eb39c7d8f65d490781f622e6f6d531354ebda9b1fe8dad4bb4d30670a6543a91d99b718ec7fd7ab6bb399dad96f496dabfe0c98a7930b21bbcd2b589ed04be0b67db609da327eb78dafcaf279d8a389e146808a8e080b13f84e51e6fd52be3bb6d65fcfb33e97076cc330a0caaa3cd812dfd41d5a3919bc5b70fe18d341f9dd00982229d34f2c3914e1d072c7f5fdca05c55eb65d8da9f786ab8cba1534c73e50e5fa2358fcf753f2c375d7930f87f9b7f5261a46fb77ffccc4d8ddefd73fbf5b9bb474e7adf2ea0a131ae3b6b2ef89ea5142dd28ca8b52aba5b827eeabf414aa317d043b67ef91a5076330a54493e94dbb0a292caf6374c35a4d5ca68b42f9ff034b718398, '5n5WfY', 0),
(871, 5818, '2017-01-29 11:26:30', 'Array to string conversion', 8, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\helpers\\BaseHtml.php', 537, 0x789ced5b6d53db3810fe2b4c3e1d1f42633baf66e6e6380eae9d1eb443df3e9c6f18c55612816db9b60ce13afcf75b49965f15702050984b675a527bb3da7d9eddd5ae6c906d1af60f62f7f6913db47f2476dfeecc888f3bfb893d1cda9d43db59a2208a9c05f3a89b387f307a823de252e70a871e8d9d1b42123a63fca7e92cb01fe138717e47097ecb027f2f5a445c1328f549084a893db04670610caba4a1cb080df97dc3b03b0b147a3e3e8a631af34b03bbe3fa2849f86730b103fa9d29a87584c45b211c67bad94d240c36ed4ef7d7ec1a8ae7f05d047a8477c41ec35f830b815707718c6e7618dd49584cc2f98e4bc32bb05b58436c7383be13dbca9c26761fcce967182b93f947bc64d9c71005e2aa01f81c1286c472e86f589dd1f89f0c962be4a798bb2688e32e193dbb93a4b03af202022edc26f6c8eed088c32b4018f155cb881a00d58cc641173c6731f533d509bb91d47342ae89c716b6d5eb45cb8ea42cc6c8a3a17fd3d99f8a75db1a038b114fa805b35cf02b107e75a55f3512d743e416fef0759f297a0dd31a37c31770206194b246dcf664dcd61537c3d6b66b61db97615b82234377050e3c6aef2281c7a14886971c07824bf3f9b81c5bfa5284e07f57f8ddb3502a1013f97a7e5e2978085c0da887fdc42908174c8afa6477146a92dafecfa4561067e9889bac4b1c9834c72c710e0407c704fb9e863b6ba8db45068abacf00efa6e9b3d436b9365f469d2ff345f0d5d7f165dec5d72c06d38033e78ae0ebc4e119dc9529ec9c73d37544994d9e2632fef5045992204d18b4d8ecf356c6cad07d3af406a5cd5ca137583bda4547f315d0d44237d07ab719966e1bb48c381edf53126311b5434d786cd641b3af4b628b9b117a38feb8888ed5bae53cb14acd20d7dc222ecc4d2257aada609748f9cefa654104d1e8c93136fa130dc63d85f1a600b65e20c0bcce9e8a9f635da5b31e68a80b4583611dd41aa4870ae88d46312812706d3416273fb3a06d828c7b2b9aa11b725f7f49db04761b8c2343378cbdf2a2f6822096dde3987f8b37b33844531f1f26f1ec2bf28987241ab29be11d2512f87c44310a844f3dfb47651033e42096199c952c5838f54513649a7c21aec8c33394faec8ca64c8de909911f810817317771e08347a7191559172b0e691e6caf804a1cd6641cb5b11a0401cf0fd30becb25f442f89a7ce4114f920ca95efaa78c85c3aa8cef11e5e660a7d744379877a2aff8b72397352d12f62ea5dc8a353eadacd8a4f89d33e989c074a814d99ddc31262c091312983780ab372122117ab2946a7ac7666c27be99d4ceb8e8777c46c04987b38c90ccc0fbd1208f68eb1d7cbaebb0b14275835e75f3e1f77c719d13e0ae7299aab9c919a0c1e0c348d5dfc57e9f680b3ddfdf2a986a63031402454dfe4251a270c7b796cf1438e12bf6f641aa9112f9757c465fb56113e27982da8d7a984d461ae230f2330aaa4b916b36066c1726be634cc570e2fcb5122592e3b544f536e130c4a384cd4419e29061bb32f54f262f986174b18193dece2a814c745d29835d929a52c61318aea92c6b0263927a42133aec9ccd065dedc146b5a352994b285eb131c329d420f5fb298a481944d138d4290ba44312397dd2b2925e7c36e827de0c7bc5f6b3c45aececcaad688461472a2bbd429ac8a069137d3617d411721615761e6f8055aba71ea352421464c1490394d320621e3d84592f95517b7062bfc87028a19097044dc363c2c188bf43c58c61d2bacd05e8fc2e49acc1864b6df946dc48d87a7e9bc21051937c51efe97cc157ea9471ab69a0d342e6374817197a7988e93aa30a42ce39b5043b25797f408f269d3ca462ccc63d264b861e48c1f627463a890b5a56fc59148292f4bdd1d30284c20ea7c2243e4363bde10d58b9fbdc92dcda750ddbd13b113aac71f1257cd46d872abe4b8a8647278763a27c54e3bcebfae13d9554be437791e3a67f0cf373c2dd4f0f8aeab694aeeaa1d835b0ac5a96c875971a3b8b9abb8507125bb4b81a273a0a2cbb2f2afaf94db15a0438d8cf22a2d8a312fd2e264e88887be3071945df90df396d1c77b2e0dd46e94a451446356084ff26b7571de667030f722d84aae69ec9d61d8943fd34b1c1e2d2331d5f093d05eaf7ab66e8aeeb1abf6ac5a77749a454ab1939dc890935b4e75ef5a1938b78feaa09e64c3de36990f6832d769551eb796180db5cf76060f1a0d0be5ba938691e629dd46cf628ad9b088c9ed84b74dbeed84b79df0b613de76c2db4e78db096f3be16d27bcfded84b79df0fe47139eee25b091d1eaf1d97d4b68e6bcd15a8fdc2725df0fab8d60db67ad1b1ff60468f99b58f5479a9a54297bb42643f7fa290b449939284fe16548afc31af03df13c5df70ed470f4a071be1c8bbab7c6074da2791d7091ef9ff30a7aceef9c2395e34df24a1f5ed768fd8831653b60b61d305b1663ed2c57eb1d6b135df56eb50bacde6bd1ed55bf50ea5456ed700fea14aaca5e6fbff04c03fee3764d52ab36cac9ecb71a78c9117b84ee75cca7383a3506fd66a9156f30a5e137c21695a86f8350fb9776735f75af450eef6c2256fa2a5347e3675fe7e744b85909de276d1f728fb56f28aecd6e2d29355e8f35afa7dde9f4a0e474318cb575785515ae793fd9c8af7c081bef76df1a69fa081edcf297cfce64695fc5bc66b86e1bda93362d07dfade186c830b5b39df32b95fa2daa1c5c3ca4f492e0bce704a7f8d9cf87fc6df65b79de572ca8be2017e3f374764f5cd77440a27ba8de7b8fe559127cf9e8dabf188d3eb9ef6f0ebecee68bde6279fce724190e96cbd9f76fc63c521d52202a79ee14af96415edc47620b4b44e3b162401d14e0e7fcc85f14d2bdced91fb79a35b836b12de92aa0e6d991ac7f8daad72b65c77a912163ff3f6f781b7f, '4LABFF', 0),
(872, 5819, '2017-01-29 11:29:33', 'Array to string conversion', 8, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\helpers\\BaseHtml.php', 537, 0x789ced5b6d53db3810fe2b8c3f1d1f42633baf66e6e6388e5e3b3d6887be7d38df308aad2402c7726d19c275f2df6f25597e55c08140cb5c3a4309f67ab5fb3cabd5aeac20c7329defc4e91e2267e07c4f9c9e634c49808dc3c4190c1ce3d87197681145ee9cf9d44bdc3f183dc53ef1a87b8d439fc6ee2d21099d32fedb72e73888709cb8bfa304bf618be0209a475c13280d48084a89d3b787706104a3a4a1c7080df97dd3748c390afd009fc4318df9a5be6378014a12fe194c3440bf3b01b5ae90782384e34c37bb8d84c19663747ecdaea17806cf22d023bc23ce087e4c2e045e1dc531badd63742f613109677b1e0dafc16e610d71ac2dfa4e1c3b739a383d30a79761ac4ce61ff192651f43b410574dc0e798302486437fc3e88cc6ff64b05ca320c5dc3593ebea3a86717876b84a9ca163d088232afc1ef29b65104d40674ae345079c65310d326d09bb956c730e6e88cfe68edded464b43b21463e4d330b8350e2702bd3bc607fdc4179ac0120fac5f08eb3bd2fa1a559bf9bd827f9cbd678a51d3b247cd2005d74918a5ac119d5d199d75c5cde0749c5a70f6647096e09031ba0e071e9b35dc79808928ffc9d8168c59cfc7d8c8d6a715047f5de3b7cf425c061200727151495e085c5d501f07895bd06a1caeb25ce3180a35c966ef99d9145cd93aaec69b720556cc304bdc2301fb6b82035f43973dd02d027dc5d6274074db8cd96a95db9822b34e91f5a328eae928b2eea2681a833540937b4df04de2f279da9113d5bde0d6eab8b19ad48c6594eb39b125271ae65b2ccf79f16167806e15b07e69c55580f5378e6951767c0100b568f5b50e6d87985583892187e05b4a622c6273a08988ed3a68f57453d5e666843e8e3fcca3d76adcf26cb04b151bd7dc2214ac6d22574ac7609798d8c6e6935f04d1f0c931367b630dc65d85f1b600b67f428079363d13bf47bae4663fd0500ff204c33aa835480f14d05b8d625024e0da6a2c8e7f6442db0619f7663453d789befc94b60decb61847a6ae977ae149ed278258d68823fe142f59718826013e4ee2e91714101f49346401c3eb4624f0f98062b4103e759def950ecb941d56667096b260e03410758f65f181b8221f4f511ab0739a32d56527447e04223cc4bcf95110f0fa485291d5aa6227e5c1f60aa8c48e4ac6511bab4110f07c3fb9c41efb45948f78e21e455100a25cf9be8a87cca5a36a1beee365a63040b79417a567f24f94cb59e38a7e11536f431e9d52d77e967c4a9cf6c0e43c500a6ccaec1e9710038ecc7119c433688293087958f52a3a65b52d0f5e3eef655af77cbc273a20c0dcc7496660be339540b01be64137bbeecd519c60558f7ffef4ba33ca880e50384bd14ccd19a9c9e4c140d3d8c37f956ef739db9dcf1f6b680a13178884ea499ea271c2b09fc716dfa328f1fb4a4e23d5c8e5f28ab86cdd2ac2e714b339f58d4a481de73af23002a34a9a6b310b66162cb7664ec37c6587b11c2592e5b243f569ca6d82de088789da7ab3442f63f5844a9e2c5ff164098da18f3d1c95e2b89834564d7642294b588ca2baa439a849ce0869c88c6a325374951737c598764d0aa56cee0504874ca7d0c7572c26e942caa6894621485da19891abceb594922d6127c101f063ddaf359e204f6766556b44230a73a2b3d429ac8a2e227faac3fa92ce43c2aec3ccf14bb4f4e2d46f48428c5868416634c9188419c72e93ccafbab8dd5fe33f2450ccc80247c46bc3c39cb148cf836dde31c21aedf5284c6ec894c1cc0e9ab28db8f1f1249d35a460c64db08fff2533855fea9386ad56038dab185d62dce1534cc7495518a62ce38b5043b25b97f4090a68d3ca462ccc62d264b861e494ef5b7462c890b5a1576217a4342f4bd51d30284c206a4b22436495ed6888ecc577d8e4921650c8eefea95809d53b0a89ab66216cb954725cd46472f9ec744f8b9576943fae13d95743e437f93c74cfe1bfaf7852a8e1f15d57d394dc572b06b7149253d90eabe24671735f71a1e24a56970245f74845976de78faf95db17a0438e8cf22c2d92314fd2c85f90f08487be3071985df90df39231c0071e5da8d52849a388c6ac101ee7d7eae2bccce0601e44b094dcd0d83fc7b0287fa257383c5946a2abe1fb9ddd6e75d3dc12d56347ad59b5eae82c8b9462253b952127979ceadab53670568faaa09e64c1de15990f28323729551e3796680db52f6dfa0f6a0d0be5ba9d86a1e625db56f7628adeb088c95d87b79b7cbb0e6fd7e1ed3abc5d87b7ebf0761ddeaec3db757887bb0e6fd7e1fd8f3a3cdd51afa1d9eaf5d97d4368fabce146afdcc725df8fab8560db77ad5b6ff60468f9e1abfa2b4dcd54297bb42143f7fa2913449939484fe155486fc21af05df13e5d77066a307c503b5f8e45ddd1ee7e93689e073c1404173c835ef03b1748cdf12679a50f2fabb57e449bb26b30db36982d93b1b697abd58eb58eae7ab75a0556efb5a8f6aa0f942a95752bdc832a85aab2975b2f3c5383ffb85593d4b28d7232fb52024f39628dd01dc77c8aad53b3df6ba65a7182290dbf1236af447d1b84da9fd3cd7dd51d8b1cdc5944acf5554e1d8d9f3d9d9f63e16625789fb47cc83dd69e50dc98dddaa4d4783dd21c4fbbd3e97ec9e9a2196bebf0ba2c5cf37ebc95ef72081bef76df1e6aea081edcf21b62e732b5af635ed35cb70ded719b9283afd67043cc30b5b25df02b95fc2db21c5c3ca6f48a1487d3c129bef7f33e3fc0be92fb7dc580ea013918efa7b37be2baa60212d543f5de3b2cf792e0e1939be07238fce8bdbb3dfa329dcdbbf3e5eb3fc7c9a0bf5c4ebf7d356791aa90162293e74ef16cb9c893fb502c6189283cd634a8fd02fc9c1ff90d20dd71cedea855afc1b5896549970135ef8e64fe6b64bd6e69766c161932f6ff030807f8e7, '4LABFF', 0),
(873, 5820, '2017-01-29 11:30:56', 'Object of class yii\\db\\ActiveQuery could not be converted to string', 4096, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\helpers\\BaseHtml.php', 537, 0x789ced5ceb73db3612ff5734fa74fea05424f5a4673ae7fa926ba7b5d34bf3f870baf1402424c1260906046df932fedfbb0bf04dc8961c2557cfb11f62915c2eb0bbbf7d0160896b5bee17e60e4f893b71bf24eec8edaf5840fba7893b99b8fd7377b125611c2f36d2e75eb2f887e417d4671e5fdcd2c8e76271cf58c25712ffda8b0d0d622a92c54f24a13fcb3078156f62e4044c03160153e68e9d29dc98c12869e449c6237c6e596e7f43223fa0af85e0026f8dddbe179024c1df30c53ef05f2c81ed4251fcac8845c65bdec76ac2b6db1ffc98dd23620def12e0a3a463ee68389fc01f0b059bbafdb7cb6beac91e5ff5d4303de4ef2f176730a75bfaaf948afb9ec7d3c0ef455cf696142ea25b2a24f57b92f7122958b44671ec23ea89b94ea620982d4c7d94d923170f7fd2adcc7e462454772dd0e53993440d47fe0da34b2efe93a9f09604294535d8cab88edb4f3e07fdd34bad2c54fea5b6c63567d1272637fa060894d000f4a32f2d3bbf7e1b6b93656ff92c912ccac9103a8287fa0254bc163c8d7fba2f1ee21805ff0db9552abcd4134da3822f3c8c8920a132dfd0fdf2a008ee3654d0823c60219305395fad122a8b71b9f0a9c8c7856b16f9749b5f5b43b71f729f06e705ba809f4f6fc0a469b848132a16ea79b2f8901408bb2b5403fc48722604b92fb410a6816471404b65c5828544dc5f209f427cf0801b7d0166b86544ff9ee3fc0059097dbb2a46b8ba2ab08fe66d63b37ffaa04555f6509a9aa281ab5e83135971110e00ba52f020834422efb57ba3d3dd315f6e5c67388cb77d2d8ca0c4e75100232c95afbc7c10a94799c53a2899a10403315fd1c02b1e4493504593818e268d307b581c7a80ff30ec7ea7fc62d9ceac9d60c6a89a3895adcc32d42a69326e2716d76d2496914e2c1575e8e4b24b0f982b5eaa0b757178b7f360d6566546177d3be81c3beeaad8697fbfd83973dab113914ad4bc7ff92e2194b8160a5bd721b6000444cdec5a0658e581b60651ae35ed92a3ce253b973cd42595c33926879b1fea7000a535954936c01b4603dfe073cec4d40f8f73977b0f6e716cb773f286ff603fb39a7e66777ed6f9d9b3fd6c64f233fb313f030b45127c6d71cbe85db2c08c39d02973718590333998ddf6afb9ce3766c772f4940deebbc77253b198e6645ed1a1be437d1df5e3cad25e8efaf1c1d945ad857e042f30427e6c44e571bceba1e54e53c4f1e794a1b141c089c1ad8f2ba03d32254d07a701b811bf6fe237f9b8d5bce454969191f31efe6c1f537395ea769c21ba7f781a56209a7e731d5ba3b941c7c35cc7c752b0f3175430d63597eaefcc94a19c674ed483602fa949d5064d4f72451f15c5c048a9eba8589cff2f03da318cf16444b34cdb632f3fa41d437747c491655a247ee141ed2fa462ddadcdf02d6c1e694496013d4fc4ea2309984fb43674158af51051faf9bd51d5950b56965eb0ca269c852c18380d74f16ae340c8c8a72b02d5d63b9eca7cfb2061fa2718c223d2db9c054159e9655da3dade7df67ceb9b3e7bce1a088b9de1bfa91e80420517c7019022f3931c0f994867f5fd05a858338601b9e76959eb9282ce9ed7f82b4cfd12213a35af937eab981c59aa44d740297553b5ee79456360236b5e55e225096912138fe6ab062666995df2bd1cec817a19d79e4f7b6a2d0274eed3249b2056bf994c406bbd1a66f7bd0d11aaae573af9f0fecd6096193a20d13a25ebdc6734270bc1c053e1d1df2a8fc768edc1873f1ada54530c098bf2373144d34452bfc01656de15fbfea0dd285f5229e873c36579ab84cf05951beef76b903a2f7814308249553837300bd32cadbcb7e50c96af1d7ba8a2445bb92a50d34d714ed0e0d228c9b7876dd590da23c51283e50f182c071e440a8fc6151c974e633768979ccb440a123729ad498372cd588b66d6a059919ba2b829c7741a5424951b2f6034922686790ba869d3c4c010a86e8890ec6670aba9745f3fd0bdb1fd3457b1249e699a75ae318f39f8c4606b6258270d637f65d2f535df444cde4699e0d764eb89d46f5102466c12b2354f320b82c7c9eb2493ab49ee8c77c80f01944a16d29879fbd86123656cb683633d32c20eee4d1426776c25c1b383366d0b373e5da6eb161578dc92faf4bf6c9deb2ff5596bae764b1b37825c533a401733d9a44e0c2e2b3109b528874d4a9f9180b767d9c2c25ab0b6855b935ce1e2d34040846c0cfda0d6222a7e59a9eec0826a0a2c5f57ca34f2902d4ba9e8856bdd3aa5051ca2bb7fa132617e704aebd59008f74c95a897fa2acd45996967c5eb2692937c88e221fae1e21dfcf3892e4b3688ef269b36e5499e3170a6109caaf3b06b62940f4f725be4b8d2d5a5d2e2e22c4797e314afefa43b514aaf2d91a9608c419af8218b5e23f4d514a7d99dbf532c1903facac3b5b96c352f8d632e64493c2fee35c9b1cc4065be8a2195dc71e1bfa39094dff31b1abddec6aaabc19d87e1b0be0769abea7190e7ac4675749921a5cc64171a723ae53496c07601e7e1ab2aa86f92b0bb22f31945e621a5cad78da55a43e31ef8f859ad61c9dcb4d230359c1e3aea5a4cd91b9698ec3abccef9ba0eafebf0ba0eafebf0ba0eafebf0ba0eafebf04ebb0eafebf0fe8f3a3cd3a1cba9b5d7f6d9534318fabce9415beef38aece7f54270dfbdd6a3377b4a69c509bae696a6c155aa121d68a127e5d401a26a393c1e7613f1bba8a1f8a1da4f379d81c2af329fd1ce57b168fade74dc3634c6018f04c11546d02b7c7245721f6f1baff2e365b5d65fd1a6740de6be0de69ec1d8d8cb356ac74647577f5aaf025bdf343e55edd55fd8f975e457560a75662fb75ef84e0dfed7654dd68836b990d9d7961872548e301dc7fc164ba7d678d40eb5ea0453aa8e29d750bf8f86f63f6c5dc86a3a163979b488d829ab761d839c23939c7325660dbcdfb47c2824369e503cd8ba0da734483d331c4f7b54e87145e8b219db57e05d51b821fdfc289fc6a9393e2ebe3335d411086efdbfad78a743fb2ecb1b9aeb7da13ddfa7e4c06c0d0f9487e599ed0aefd4e2b78a7270f39cf31b468b9a1384c2b59fb7c557080f7abdaf1c307f410f86fd74f64cdd375440aa7aa83ffb95eab52478f9f55d703d9dfee1fd7a7ff671b5de0c37db37ff9c2793f176bbfafcc95ac7798514aa485e0885d1322c82fb54a5b044151e3b1ad471a9fcc23efa834ad371ced16caf5e03b9a9b4648a8086bd231dff5a516f58f18ec390a1b1ff2790a3fe1e, '8266Uj', 0),
(874, 5821, '2017-01-29 11:31:11', 'Object of class yii\\db\\ActiveQuery could not be converted to string', 4096, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\helpers\\BaseHtml.php', 537, 0x789ced5c5973e33612fe2b2a3dc50f9a88a44eba2ab58e77264925f62493391e565b2e888424d814c101415bce94ff7bba01de846cc996bd712df33016c966037d7c7d0060886b5bee37e6f68f893b72bfc5eec0ed2e5840bbc7b13b1ab9dd5377b621eb289aada4cfbd78f66fc9cfa8cf3c3ebba6a1cfc5ec96b1982f24feb5672b1a4454c4b31f494c7f96ebe04db48a9013300d58084c993b74c6706302a324a127190ff1b965b9dd1509fd80be15820bbc3574bb5e40e2187fc314bbc07f3607b63345f1b32216296f791ba909db6eb7f7437a8f8825bc4b808f928eb983fe74047f2c146cec76dfcf2fa9273b7cd151c37490bf3f9f9dc09caee91f0915b71d8f2781df09b9eccc295c84d75448ea7724efc452b07089e2d807d413739d5441305b98fa20b547261efea41b99fe0cc95addb54097a74c12351cf90f8c2eb9f86faac26b122414d5602be33a6e37fe1a748fcfb5b250f9e7da1a979c855f985ce91b20504c03d08fbeb4ececfa7da44d96bee5b358b2302343d7117cad2f40c54bc193e8c7dbfc218e91f35f916ba5c2733dd124ccf9c2c38808b256e6ebbbdfee14c1cd8a0a9a93076ccd644ece178b98ca7c5c2e7c2ab271e19a853edd64d756dfedaeb94f83d3dcbb809f4fafc0a4c97a96c454ccd4f378f629ce3dec26570df023f18910e436d7c23a09248b025a282b126c4dc4ed19f2c9c507045ce90b30c33523faf714e7079e15d3f78b7c848b8bdcf7d1bc4ddfec1edf6951953d94a6a668e0326a70220b2ed63d705d297890ba442c6f35bc117437cc972bd7e9f7a34d570b2328f17918c008738595d7ef44ea516ab1d6954cae840152d992f9dd34440229ce3f0b32e933e0012c3d88366b156d7a3adad4c2f07e71ea0efec3315f28ff58b6336926a021aa2e4a6423f3f4b5caea8c9b89c7756b8967a0134f491d5ab3dbf480b9e4b542ac8dd3f781cb01fd8cdbe8dcbacecbc765155bed978bad13a7195bd1938992eb971709b1c4b550d8aa8eb18520206a6af722002b35dbdac932ad69c88e5ac8b6903d346415201d1320a7fb02125c6d49659c4ee01da3816fc0a43332f5dbc30c921f01368786a5932d28ec8d43ab8e43bbc5618bc367c3e1c08443fb3e1c82054309589c5d337a13cf30e3f674ca9d5da04b9a006837f137d5f9ca0c3c478b6480f70ecb5df962de30454d8b8a1615fba162585a7acc5031dc3b3ba9b5dacf801223248646af3d0cfaee1a701ba39f7f4d183a03083832c0feb002da0353d275701ae057e2f755f42e1bb79cd79cd2323772de01eff6213557aa9e87a9c777f74fe3ca89c6cfae636b3035e8b89fe9f8500a76fe810ac6bae85cfd9d983298f3c8897a900c2435a9daa0e951a6e8837a313052ea3aa82f4eff9701ed10c67830a259a6edbbd71fd20ea1bb03fa91655aa47ee541ed1fa462dded4df02d6c3e6948e6013d8dc5e23309984fb43674958af51251faf9bd56f5150b62965e104b279c862c18380974716be340c8c8a70b02d5d8079ec86cfb2266fa2718c223d25b9d04415109a65da7da7e7ef47cab9b523bce1a08f39debef548f40a1c28ba2004891f951e60fa94827d5fd0da868538601b9e549510b939cce9e56f82b9ffa2544efd4bc8eba8d627360a9125e3b4aa19bb2754f4b1a031b59d3b212cfa1f28c23e2d16cd5c1c42cb54bbeec09327652ae1d9f76d45a06e8dca7713a41ac8e539980d67ad34fef7b2b2254ddaf74f2e9e3bbde24357440c2654296196634270b9d8127c2a3bf951e0fd1dabd4f7fd6b4a9a6b8262cccdec4104d6349fddcb7b0322fd9f77b0da36c4926a7cf0c97e6adc27dcea85c71bf5b71a9d39c47ee4630a912e79acfc2340b2bef6c3983e52bc732ca5ea2ad5c16a80e539c1334c0348cb3ed6b30290269a05862b0fc1e8365cf8348e1d1a8e4c70568ec1aed9c73194b41a23aa535aa512e196bd04c6a340b72951737c5984e8d8a2472e5058c86d2c4306b11356d121b1802d51511925df5ae3595eefb7bba77b61fe62ae6c4334db3ca35e211074cf436268655d275e42f4cbabee4ab90c9eb3015fc926c3c91f80d4af0119bacd992c7a9050171f2324ee5aa933bc32df24300a592ad69c4bc5decb0923232dbc1b1ee19610bf7ba17c6376c2101d94193b6e1373e9d27cb0615206e4e7dfa175b66fa4b7cd698abddd0c695209794f61062269b548901b212935083b25fa7f419097873960d5f580ad6b47063920b5c9cea098890b5a1efd45a450997a5ea0e2ca8a6c0b275a7542377e9b2958a5eb856ae535ac021bafb672a136607bbb45e0d8970c754897aa9aee29c15997692bf6e2239ca86c81f220e671fe09f2f745eb041ffaeb369521e651903670ac1a93c0fbb2246f1f028b345e657baba545a9c9d64dee538f9eb5be98e94d22b4b682a18639026fe9a856fd1f5d514c7e99d7f512c1903fac6c3b5bb74b52f89222e64413ccdefd5c9b1cc4065be892095dc70e17fa090943ff22b1abedd44aaabc19d8b7effb852d2d9aa7aec6539ab561d9da79e5264b233ed723ae5d496c8b639cedd932aa86749d86d91f98822739f52e56963a9d6d0b8c73e7c546b583037ad348c0da7970eba1653f486854fb61d5e0bbeb6c36b3bbcb6c36b3bbcb6c36b3bbcb6c36b3bbce3b6c36b3bbcffa30ecf7468736cedb47df6d010863e6fbcd796fbb424fb69b510dc75aff5e0cd9e525a7ec2aebea569804a59a23d2df4a09c3a40942d87c7c7ae427e13d614df57fbe9a63350f8d5e823daf9b22f9abe871d360d8d71c02341708111f4029f5c900ce34de3957ebcaed6fa096d4adb60eeda60ee188c8dbd5cad76ac7574d5a7d52ab0f1cde543d55ef585ad5f6f3eb152a8327bbdf5c20b35f84fcb9aac166d3221d3af3d31e4a81c613a8ef91c4ba7d670d00cb5ea0453a28e3157bc7e170ded7e183b97d5742c72746f11b155560d1d839c03939c532566c5799fb57cc825369e50dcdbba35501aa49e188ea7dd2bf4b02474d18ced2af0b6285c937e7a904fefd41cef17df191bea08746efdbfd5f8a043fb36cb1b9aeb5d5d7bba4bc981d91a1e28846599ed02ef54e2b78a7270f394f32b46f39a1384c2b59ff7f9570a777abdaf18307b410f86fd74fa4cdd375440aa7aa83efb95eab52478f9ed4d70391effe9fd7a7bf279b15cf5579b773f4de3d170b3597cfd622da3ac425aab489e0b85d1729d07f7b14a61b12a3cb634a8c342f9b97df4079ba6e39c83c94ebd06725369c914010d7b473afe35a25ebf848efd3c43fbfedf32112db7, '8266Uj', 0),
(875, 5849, '2017-01-29 11:43:26', 'Unable to find ''frontend\\models\\ExamenHistoriaClinica'' in file: C:\\xampp\\htdocs\\DtoMedico/frontend/models/ExamenHistoriaClinica.php. Namespace missing?', 0, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\BaseYii.php', 291, 0x789cb5575d8f9b3814fd2b239eb60fe9020909f14895b269bbbbea665af553959022079ce0d6c1149b9944a3f9efbd363621c0cc2651fb14b0f1fd38e7dc7b1d8ca6e89e22f71aa331ba172844cebacc624979e65ceb575c4ace384ed46b809c986121d4b3e721674f69f41716e42ba56a69841cb9cf897af491839059c3c5064e60e4559e041a4ec04bc13349b224daf2843011bddae12dc9fea142f282e239a3198db173fda02dac29d356e15c997dcff85d664cc367b0a1ac3e50e4818f914aa271228440e62802e3791ea532e1b1885e4abe20098d79540711c36fc11923c52391cceb0f9ee769def21e86d71de43c8855e46c69e15bc698b15f010824ea3fc29607c962fd362f0896a44d59e037dc9c917297dbc18b562a2eba3f87aa610f55e3c95354dd42ccbc88407182afa5faf5a315482ffa375396673aed1e6e82a0cb8def022840c7b214a458aa9d252e0abc6fe5e4dbcaa81f4215b23a4d32bc62642e8af567cc68822bcb2b9060938577b8c0db063cb041751df94330a1311fa406f4416c19062490032228152ce0dc574e95d184ac71c9e47b5e56d442a882568fa14a48c6e94c69ec4605a1523c22700c2b6f57df482cffb84403cfb4c0a64dab377040e4382616d33ebb26d00cbeb5995f19ab5709b95240dd028009114635b770c8f004df7acf5db31ea7b810441a4d7ffaf87a109acc19ce3625de586d56963c850e2f8b98fcd7d80e1475834f1f0cca0cef014c13e216d3cc9e2cc88f920849921aeca1fb28657fc675b57941e3ecec20b8698dbd6a991ddd3eeb9cb5d2d121cfac383d1d0440ac10eaec829315e752c802e7ed3d78165207a98a0f2c01b6aa2d9164a195d63106e8e4bd31d422d63acff38165bda5dc1be3e5a08545372ce075b93c8c94693552eec82a9ae539036c2b041f2a53a6000eb882299a2564d7a2f3a67ac5e63bd36a0e75b92032e5871c5a1db34e104c3498fd2d05759cbf6f466a471f1a81e36f2fefe57a52f6a56e46a8ea556aca8cec9469f6e8e0a21efde4f4f48251cff804ba8b32fb42657a540aa760f5bfc3cab3fddcd3ba005cad4b6f14061337f4dd91371dab610b38047d387817e150d55a0f06a33e0ca61a8223b5774aa505ef09c9fbf6d2d1907745fc49688c7f892a5a15de77a79a9c0948d00064617ad0e9609cd2decf4069d287d2f822cd3c0dd370d273bf5151a5384b18795fcd93c7d4d369b4a797cef494ab90ba2ec086ae603b5a976ae56868e8d60a8b73cebf53e2588c21a954cafc6dc6f6953d3505c64d87f640e5ccf7eb3dbdde7333d3d797e3bd37440fa2211c7e75c7be4d261fe237fbd9e7f52675d3ddebbfa7621cec76eb1f5fbc4d6efff56cf5f8a893527d795b4f94899e9b42df7cecbdaf35e58203f8353f5a35618f6a46e1497f6094313d0afb1a6ccfdf93aabd769aaadb28a2f384514d8d9f0e7cbe62, '8rdjCD', 0),
(876, 5850, '2017-01-29 11:44:15', 'Class ''app\\models\\Indicaciones'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 89, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '6DCnm9', 0),
(877, 5851, '2017-01-29 11:47:54', 'Class ''app\\models\\Indicaciones'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 89, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '6DCnm9', 0),
(878, 5853, '2017-01-29 11:50:01', 'Class ''wbraganca\\dynamicform\\DynamicFormWidget'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\examen-historia-clinica\\_form.php', 25, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '9bEIXL', 0),
(879, 5854, '2017-01-29 11:50:50', 'Class ''wbraganca\\dynamicform\\DynamicFormWidget'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\examen-historia-clinica\\_form.php', 25, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '9bEIXL', 0),
(880, 5855, '2017-01-29 11:56:09', 'Undefined variable: modelsExamen', 8, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\examen-historia-clinica\\_form.php', 33, 0x789ced5b5b73dbb612fe2b1e3dd50f4a494ad4859e39737414a7edf438e9c44ef2a2190d4442126c8a640950964fc6fffdec02e01d7264576e27ad32e35806160beceeb73788249e3df4be32cfba20dec0fbcabdbed759b290762eb83784cf536fb6239b2499ad4510fb7cf656c45734607e3c5ba671246814ccb68cdef31905321a75d78c8b3865a4eb872c623e99cd9771ba7993ac13e4080c61189833afd783bf47b05916f982c5114edbb6d759932808e9659ac6290eb95ec70f09e7f8d981e907c6660bc2e94c52fc2c8953cd5a3c24f2dc8ed7e9fe4b8f9174056b09f09142326f043f36ccf580ea5314d0259c2738db1238f322a4ded9260e68c82fa534784ee7151401d22b0d30af0f67eba3de075e678e8a9fbf8ee641d3f384a464c3e7a80e1bb704dd4a698b812110cd0b75a38608ecaf3432532af959ef32559b742e1e1f8fc548610fce8c6c1c572b8514e8b0bc0efe82b10d15eb38d0164e622ea4cebc4e9c202d2f8e01fb324966c3a7e021221be677d50eb09b6d21d469184c0b80f514c0ee59b0a282cf26b0f796be439a1c9e6a411c2dd90ab7b1bcafc809b44b231fc493a8bcce361b923e742e1612690eec432be353ce8b1ded9e9eebf27c110c828829fd3d63290daac4a372b8b6b64a33460fe25d9afb8f0db6e199ef53a0a9ee6b2b3a3d258780fd96842c208245ab1ab1559d918a7250607418301f8dc4673d8b86aa082d2926b764579fb72e7295951caefd9425225f8da26d8b359f5240d67bad183d4c3f44d7d962c3ca25b5b9298491152de6fad5b9ff84596a9eb99101441fd0ad1ee12d0dc9033aae6b594acb04c4fa0d1d2a0f34f0770e35fcfc960872a303124cdf721de24032eea77118dec43ac8e99380c28810295b6482e61066f2287092499ae2fe8f4dd742431810ab200eff30d6e9005309eceef8a9f0b285d012a73360cbe3a5c0df8e0ab99f21dc9822b9e3d6636d71f06387b1c756c618162e01b318acdb59ecb8c23afda1216ff5f018904cd2dfd6c9bb7cdf4ae6b27b95cc859c0fc858ce6b695161e298190071d67b75d5dbfdb141f556aefa63e9bdf7fde81d01ff5efeee9bca37f708e7f7530aa1d1640d43fd36c86d7154fcbb5819c988f63ac875ffca08796c1b7d33440efe9621f2d86a5448eb1d0f69aa30a83717050e8c8cb118ad30fe250259880feac4eae051579d6ab23e5767ab14d4837aefc3e296fae2873d3ccf953b00428626848c9e8b907bbad80b10dbfa7303f9091dc741872ab046b2b52aeafb294f97edfa5f96c1d2b8b248e665b354346528c21e6de77d5e1c6488058275ee57ddc6d125c942f1318632591b9c33f51124f689f0d79330ef17e0903e5817cb6d4c4a2f3e7bb5067f9104403b2c742c0b76708f499284408a1b9de720d7e24d0abf808d1978c54e338436042457e2d5ba63675ce32f1de597085d4ef13ad7b9a08221170429d05fea690f4ca7154522bec655ddbe87053c21be12d532f3d5e682369ce6da3bd35ccf027a86b26cc11401e5faac5b58a4c5035afb8da5c7fd354939155a3d9f6ede7547dafe21b47d1959e5314171c2268fc759ead3ff56a65d0441f7d37543b1f2881bc2a27c25264fca050d0ac8f5acbd66ff518589bcf32ed6e6f6d4954689b0abe22aa31c9b163c0aa4c1012b9c1bb08669ab30fe4b0c6ac046edaead8a2365fcaa6c4d07b7a57ae00c3cbf8c51deebf4254b4c113f628ae8e285894f930ad24b17731ab48b38165ca424695262df5fa35c31d6a219356896e4ae2852cb3d7b0d2a9289b52f6f274c0c037a07dd7ab651b419373004aa3b920a76d7dd2a2ad5a677390dc154ceb7b9a60be29b8e59e79ac4490caed2dd9918d6493749b034e9fa365e474c6c232df82dd9f96916b42801230ed9b055ccb505c111c52dd77235c97bee1ef9f1b645b00d4d987f881dd64224663bb420c5efd95280f7866db62d10047491ad5a5410d61634a0ff63ab5c1959c0da1bb744bb4bc92da55df4179382ebc4507908cc3f2d4aab49193012c6ed53b60cbb4a59db5ce01af78b94ac48049149b15397a0aa9d6adc2ca1e4a59755aa6bb0873c83ba3887355a25eae6970b1996f00640a5b03086101e5cc9cc97dfbd2bc51a12df81a9111593bbc60c7d6d765566d651b1dc44729e6f514ca257cd3ec27f5fe8a26483686db269539ee769014f0aa1a67a0ea7264639799e23260796aa90a51667931c5ebd5eb17c2fddb9543a98352962aeac42e5e561b061d125625f1e71a847fe8d992a09e91b3fdee46986674912a7a2241e17634d722c2b50996f12480cf7711a7ca490796fe23b1a5dee12d95482e5079675512ded6c55f676f364d4a886de6ba49429ea4a414e25907a26da0b9cc73f5431bd4a263e1598c72b309f538f1c6d5bec714686fe77f0e45de0befeb7646de8828db72445133cd15f27d49a60a7f484e7f6c015d89ebad753f7fa4f0f2ea7eef5d4bd9ebad753f77aea5e4fddeba97b3d75afa7eef55460fe3dbad7b1a17b1d39077d01fa8ccd4c0f8458a6277a9f6e6847a5734c6b25e1a15ffc9fda5af5905ff1f87653ff866050b5c0cbc1f64d1ba968587d1e0962717417c5f7510339163e97629b1e541c0c5ff4604ad5c30c4875dd365031e8f9240ce7982ee638332779406b03aff2e1fbbd4f384ee375eaa45fd2491f98908c9d6aa3986ef4abf5d97a555c9f3ba0faad2fa8546e7b32fecb2aa73ab3efb77efaf36f328e5639b04698ca45d70f9063ac9279c6f480f5e0c9c7abf606e9a78b09b76f2826f019c22cfac2c4bae60b8728eb9be9aa9ed781d13cdfd2ee8fdca13572c763c71aea2acb363dee3cb05fa408e56da66f084c4a184b1dd4f0de7296867eff504175983a4ccf1f3f1f170d2737a86464f8d2e4498db8158d94cdeea1da3824c23f474dae494d8317a1e6693df586861a078fa55eaffba872ca3efc186e390ef59ef121e510960c3051bc3e83e9758e23b5c421c32b0c4ee3f88ed1a29607a1f04aed4314ea37ac1ed5356ab961be40bf8954beab24c70dd5992c61ea73bfd287bc55b8bc0f6f87c36bffd787c9e7e56a6dad77ef7e1af381bbdb2d7fff62afa4eaf17d2af5565a2114c6e6f245b5a1cc9d5c563f7b6e0adc52f9857d146c4ccf6cf79f7c22b74803c84de64353901db531a2426c2bb05a15377a1e3254eaf83fe56e999f, '8lXlxO', 0),
(881, 5857, '2017-01-29 11:57:31', 'Undefined variable: modelsExamen', 8, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\examen-historia-clinica\\_form.php', 33, 0x789ced5b5b73dbb612fe2b1e3dd50f4a494ad4859e39737414a7edf438e9c44ef2a2190d4442126c8a640950964fc6fffdec02e01d7264576e27ad32e35806160beceeb73788249e3df4be32cfba20dec0fbcabdbed759b290762eb83784cf536fb6239b2499ad4510fb7cf656c45734607e3c5ba671246814ccb68cdef31905321a75d78c8b3865a4eb872c623e99cd9771ba7993ac13e4080c61189833afd783bf47b05916f982c5114edbb6d759932808e9659ac6290eb95ec70f09e7f8d981e907c6660bc2e94c52fc2c8953cd5a3c24f2dc8ed7e9fe4b8f9174056b09f09142326f043f36ccf580ea5314d0259c2738db1238f322a4ded9260e68c82fa534784ee7151401d22b0d30af0f67eba3de075e678e8a9fbf8ee641d3f384a464c3e7a80e1bb704dd4a698b812110cd0b75a38608ecaf3432532af959ef32559b742e1e1f8fc548610fce8c6c1c572b8514e8b0bc0efe82b10d15eb38d0164e622ea4cebc4e9c202d2f8e01fb324966c3a7e021221be677d50eb09b6d21d469184c0b80f514c0ee59b0a282cf26b0f796be439a1c9e6a411c2dd90ab7b1bcafc809b44b231fc493a8bcce361b923e742e1612690eec432be353ce8b1ded9e9eebf27c110c828829fd3d63290daac4a372b8b6b64a33460fe25d9afb8f0db6e199ef53a0a9ee6b2b3a3d258780fd96842c208245ab1ab1559d918a7250607418301f8dc4673d8b86aa082d2926b764579fb72e7295951caefd9425225f8da26d8b359f5240d67bad183d4c3f44d7d962c3ca25b5b9298491152de6fad5b9ff84596a9eb99101441fd0ad1ee12d0dc9033aae6b594acb04c4fa0d1d2a0f34f0770e35fcfc960872a303124cdf721de24032eea77118dec43ac8e99380c28810295b6482e61066f2287092499ae2fe8f4dd742431810ab200eff30d6e9005309eceef8a9f0b285d012a73360cbe3a5c0df8e0ab99f21dc9822b9e3d6636d71f06387b1c756c618162e01b318acdb59ecb8c23afda1216ff5f018904cd2dfd6c9bb7cdf4ae6b27b95cc859c0fc858ce6b695161e298190071d67b75d5dbfdb141f556aefa63e9bdf7fde81d01ff5efeee9bca37f708e7f7530aa1d1640d43fd36c86d7154fcbb5819c988f63ac875ffca08796c1b7d33440efe9621f2d86a5448eb1d0f69aa30a83717050e8c8cb118ad30fe250259880feac4eae051579d6ab23e5767ab14d4837aefc3e296fae2873d3ccf953b00428626848c9e8b907bbad80b10dbfa7303f9091dc741872ab046b2b52aeafb294f97edfa5f96c1d2b8b248e665b354346528c21e6de77d5e1c6488058275ee57ddc6d125c942f1318632591b9c33f51124f689f0d79330ef17e0903e5817cb6d4c4a2f3e7bb5067f9104403b2c742c0b76708f499284408a1b9de720d7e24d0abf808d1978c54e338436042457e2d5ba63675ce32f1de597085d4ef13ad7b9a08221170429d05fea690f4ca7154522bec655ddbe87053c21be12d532f3d5e682369ce6da3bd35ccf027a86b26cc11401e5faac5b58a4c5035afb8da5c7fd354939155a3d9f6ede7547dafe21b47d1959e5314171c2268fc759ead3ff56a65d0441f7d37543b1f2881bc2a27c25264fca050d0ac8f5acbd66ff518589bcf32ed6e6f6d4954689b0abe22aa31c9b163c0aa4c1012b9c1bb08669ab30fe4b0c6ac046edaead8a2365fcaa6c4d07b7a57ae00c3cbf8c51deebf4254b4c113f628ae8e285894f930ad24b17731ab48b38165ca424695262df5fa35c31d6a219356896e4ae2852cb3d7b0d2a9289b52f6f274c0c037a07dd7ab651b419373004aa3b920a76d7dd2a2ad5a677390dc154ceb7b9a60be29b8e59e79ac4490caed2dd9918d6493749b034e9fa365e474c6c232df82dd9f96916b42801230ed9b055ccb505c111c52dd77235c97bee1ef9f1b645b00d4d987f881dd64224663bb420c5efd95280f7866db62d10047491ad5a5410d61634a0ff63ab5c1959c0da1bb744bb4bc92da55df4179382ebc4507908cc3f2d4aab49193012c6ed53b60cbb4a59db5ce01af78b94ac48049149b15397a0aa9d6adc2ca1e4a59755aa6bb0873c83ba3887355a25eae6970b1996f00640a5b03086101e5cc9cc97dfbd2bc51a12df81a9111593bbc60c7d6d765566d651b1dc44729e6f514ca257cd3ec27f5fe8a26483686db269539ee769014f0aa1a67a0ea7264639799e23260796aa90a51667931c5ebd5eb17c2fddb9543a98352962aeac42e5e561b061d125625f1e71a847fe8d992a09e91b3fdee46986674912a7a2241e17634d722c2b50996f12480cf7711a7ca490796fe23b1a5dee12d95482e5079675512ded6c55f676f364d4a886de6ba49429ea4a414e25907a26da0b9cc73f5431bd4a263e1598c72b309f538f1c6d5bec714686fe77f0e45de0befeb7646de8828db72445133cd15f27d49a60a7f484e7f6c015d89ebad753f7fa4f0f2ea7eef5d4bd9ebad753f77aea5e4fddeba97b3d75afa7eef55460fe3dbad7b1a17b1d39077d01fa8ccd4c0f8458a6277a9f6e6847a5734c6b25e1a15ffc9fda5af5905ff1f87653ff866050b5c0cbc1f64d1ba968587d1e0962717417c5f7510339163e97629b1e541c0c5ff4604ad5c30c4875dd365031e8f9240ce7982ee638332779406b03aff2e1fbbd4f384ee375eaa45fd2491f98908c9d6aa3986ef4abf5d97a555c9f3ba0faad2fa8546e7b32fecb2aa73ab3efb77efaf36f328e5639b04698ca45d70f9063ac9279c6f480f5e0c9c7abf606e9a78b09b76f2826f019c22cfac2c4bae60b8728eb9be9aa9ed781d13cdfd2ee8fdca135b6fa637b6ce92acb363dee3cb05fa408e56da66f084c4a184b1dd4f0de7296867eff504175983a4ccf1f3f1f170d2737a86464f8d2e4498db8158d94cdeea1da3824c23f474dae494d8317a1e6693df586861a078fa55eaffba872ca3efc186e390ef59ef121e510960c3051bc3e83e9758e23b5c421c32b0c4ee3f88ed1a29607a1f04aed4314ea37ac1ed5356ab961be40bf8954beab24c70dd5992c61ea73bfd287bc55b8bc0f6f87c36bffd787c9e7e56a6dad77ef7e1af381bbdb2d7fff62afa4eaf17d2af5565a2114c6e6f245b5a1cc9d5c563f7b6e0adc52f9857d146c4ccf6cf79f7c22b74803c84de64353901db531a2426c2bb05a15377a1e3254eaf83f81f69987, '8lXlxO', 0),
(882, 5861, '2017-01-29 11:58:24', 'Class ''frontend\\models\\Model'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 109, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '6Upwf0', 0),
(883, 5863, '2017-01-29 11:59:17', 'Class ''frontend\\models\\Model'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 110, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '59InBt', 0),
(884, 5866, '2017-01-29 12:00:36', 'Array to string conversion', 8, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 125, 0x789ced584b6fdb3810fe2b864e9b83bb926c49360b2c6078d36dd04dba68b7edc580414bb4c5561155514e6204feef3b4352b25e761da3bd6d2f91399cd7c76f66c8523221cf9cd8af29f1c9b3246362ad79c2acd7924c5c62cdc9e289de67d9222e2211cac59f85b865110fc5629d8bb46069b408e16f2e9284e572710d9b59fa96cb42e49cce139ef290ceab0dafb23843cbe00444e08413c7f5d01578dda661c1458a72c721564cd32861d7792e725cf2881526544afc7641bce37cb1a2922dd48eb76a736e6c17bb4c2500f10fff306b34df802e053b2a5b4e26e81c37f9c49ae539dd0d0a319045ced3cd00527a807454349cb8bf100b4e4606044ec6109e33c243088895b3ef5b260b0c798a4bae4d2c96d255c2e6325f7fa6098fa8866ba5d298023e20f887e6f45e4108392f71655806a7566dbd6d2ec437ced0b883c601feb828b2f769b2d3f6f6b0d5af3b2c15b433d7ad646abd1b8e83f1b464efd80e631881f2f563f235083e86ef76b3cfeb4d6cc74f6ffe9a4adf7b7a5a7fffe26cb29204f7ac8845542505b82cf592f995d15c02d698884d9ef77ac7b2228ae369a23cb2d5e24309e85e91e95e442c413d1701405f3c5a6634e40cc052bac4724a9f078b183c050a28f52367ac5ca8e87193de62a0d685e69833aed975470dbb3729f00a82112903f11eed05c65e53d4b48a1f1023b87ebffacac2e2b72326af8c4dd7d8943d416a5c7cc4a599a5a94655335d807e9808a83e20252aa620f469c49eca187412181b6fa57a222425349aeae07471c3b70b6e6bb063051cec62c4b060e0f04c24370df9310cda964e87a09a10d401b58e45725adfc4d7a28075099b744a5ad6315587ea48e267f20bfe610666aeb43b3cd691fa35cf19d515576ff11ec82fe9aa674c00dd286a730eb0dba6df52f198b666938dcc714165dc9a8c7e706a1a3c40cc225f40e391625de05f578faa9b142dcf54da3da3d0eb9984d8f6439a24cb2df4b9254a96b42cbc5a4e6ead6af5c7e49ca1713805d5626bf060f545259598c27c181bd08761d9e7000945a46da26689ab0b147423b6a6dba4f820b6fa682154c9f5e704132ac2789640fbbd2b6752e3007dbb22d8251cb8b2aa01542edd818284eece4a4cfbec9a4053d85b663e305607111b20500f0060c4a4614d7547809a808a7d659bf530c6b154184e7ffaf7cd7062324f68bad9d24dc94d6d0947b514db3c647fd7c41e1eddf0d3478372427700a609f19ef2b4d43417051655608feca347f67b58551b76934a777620dcb4c2beba62d5797bd5d12da9d39c0a8e0a022046843a5270b212a280eb16cdda32f896850a122f4712af44562200f6e85631ad63cc57f7809e182a123b7a6a37ae4235e6de192f072edc76c36add2ca6879bc52ccb12c05623b8d7a64c011c702d674beb38eff44f6af6995673a8cbdbeab6d3d731ab04c144ed647f4941b5264cfd0a5ee78742a0b9f7f25ebee7ad3655a66e260bf62a9c32a39ed78bef5dd4a34f3f56bc71cf63058e3bdfa65f7811374ae11cac7e38ac5a1319702d5d3ae38917d853d70d6c2f50f356bf203a383817e1a06bad0783711f0653054183ed9d5269c17b46f2d57da8466f7df067a1e1fd1456b42abc079149f04240bc1a20b7a6079d0fc639edfd0528f97d28f91771e6344ca3a0efa53f2a5ffad5fbac9f3d9d467b7ee9fcff7efeb9ef67644dd0c39af1e4acff2341636a14f635d8499722babd769aaa5d2ba29711434f8dff00f15e4664, '5TeJcw', 0),
(885, 5868, '2017-01-29 12:01:23', 'Array to string conversion', 8, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 125, 0x789ced584b8fda4810fe2bc8a79d0359db60031d6925c44e36a32c9355b2492e48a8b11bdc89713bb699018df8ef5bd50fe317130625b7cd654c57d7ebebafaaba43c9983c7162bfa6c4274f3919126bcd6366bdcec9d825d68c2cf6749ba68ba80845902ffe2cc49c853c108b7526928225e12280bf99886396e58b5bd8cc92b73c2f44c6e92ce6090fe8acdcf02a8d52b40c4e40044e38715c0f5d81d75d12145c2428771c6245340963769b6522c3258f58414cf31cbf5d101f385fac68ce1672c75bb939d3b68b432a1380f8fb7fe8359a6d4097821d992d2763748e9b7c624db38c1e7a85e8e545c6934d0f527a807464349cb8bf100b4e061a044e86109e33c04318112b63df772c2f30e4092eb936b1584257319be5d9fa338d7948155c2b99c604f001c13f34a35b0921e4bcc495be094eaeda6adb4c886f9ca171078d03fc5151a4ef93f8a0ec1d61ab5f7568149433d72d6572bd1d8e83f13464efd801631880f2ed63fc7534fa18bc3b4c3faf37911deddffc35c97d6fbf5f7fffe26c5243822d2b22119649012e4bb5a47fa534cb016b4cc4264f47b5635912c5f114511ed96af1c1007a9464da8a90c5a8e72200e88b87cb94069c01585297588ef179b288c153a080543f73c6d2858c1e37a92d1a6a55688e3ee38a5d7750b37b9700af20189130101fd1de48dbab8bea56f1036204d7ef575f5950fc76c6e48db6e96a9b7947900a171f71a967a9ab51d64c1ba01f2602aa0f48899229087d12b2bd89412581b1f146aacf8454495f1ddcb10235b2fe640ba384050d81a7bddfd5e4e7f26e5a6abb95cd06f84ead73dedb3a3a8ec6f15ad7304585ae642d535548ce24782177e01f764f3d339add1b6b44fe9a658caa6aaab66f0fe4d774cc0bbabb6a02951906d8ed926f89784c1a73c74686b8a0326c4c3d7ff45ca77f809845b680a6928b75817f5d3586ee12b43c9569778c39af63ca614b0f681c2f77d0c3962859525354959cdc4a45aa8ff12503e1740ab27d56e0c1ca0a0d9598c4bc1f69d0fb81e961808424d22e9673c255c507ba215bd35d5c7c103b75b4106aced5e718132a82681a436bbd37f3a67680be5d12ec1a0edc58e570314bf7a09043e76606d32ebb3ad004f69acc7bda6a2f643d04ea01000c59ae5953ce7fa809a8d257b65e0f221c3985e6f4a77fdff4c73af398269b1ddd186e2a4b388673b1cb02f67745ece1d1f53f7dd428c7f40060ea10b7942746535f025858823db0cf1ed9ef41596dd84d4adde989709312fbf2fa54e5ed4d4bd750a7def11d1904408c08b5a4e06425440157299a3665f09d173248bcf8e478ddb16201b08773c9b496315fcef88e184a123b6a22d7ae3915e6de6b2f272eccdb61356e0d93d3ad619aa63160ab103c2a53ba004eb89a19d238ce7bf593ea7dbad59cea725ede64ba3a66992098a89cec2f29a8c684a95eafabfc9008d4f75edfcb8fbcd1a64cea7ab260afc22933e87899f8de553dfaf9878837ec7888c07167bbe40b2fa25a295c82d50f8755632203aec6a5331c7b237be2ba23dbf7e4bc55af83160ece5538a85aebc060d885c1444250637bab541af05e90bc6bee40157aab83bf080defa7b0a251e11d888c472f04c4ab0032d73de872302e69ef2f40c9ef42c9bf8a33cfc3341875bde207e6155fbebdbad9d36ab49797ceff6fe39ffb3646d68c3a58331c5ff4ff1f684c8ec2ae063b6e5344b5d75653b52b45f43262a8a9f11f5d163dd6, '5TeJcw', 0),
(886, 5870, '2017-01-29 12:02:36', 'Array to string conversion', 8, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 125, 0x789ced585b8fda3814fe2b284f3b0f74934002b8d24a889d6e47dd99aeda6dfb82844c628867429cc6610634e2bfef39b6137263caa0f66dfb32c19773f9fc9defd8a5644c9e39b1df52e293674986c45af198596f2519bbc49a91f98e6ed2741ee5a108e4fccf5cdcb2900762beca4492b3249c07f0371371cc3239bf86c52c79cf652e324e67314f784067e582376994a265700253e08413c7f5d01578dd2641ce4582f38e43ac882661ccaeb34c6438e4112b88a994f8edc2f49ef3f9924a36572bdeabc599b19def539500c4dfffc38cd16c0d7b29d851d9723246e7b8c827d634cbe8be978b9ecc339eac7b90d223a4a3a2e1c4fd855870323020703284f09c011ec2885819fbbe6532c7902738e4dac462095dc66c26b3d5571af3906ab8962a8d09e00313ffd08c6e148490f30247fa45706ad4d6cb66423c7086c61d340ef047799e7e4ce2bdb67780a57ed561b1413b73dd724e8db7c371309ec6dc07b6c71806b0f9fa29be1f8d3e071ff6d3afab756447bb777f4da4efed76abefdf9c755a9060c3f24884655280cb420f995f29cd24608d89d8e4f9a0572c4aa2389e26ca135bce3f15801e149936226431ee731100f4c5c3454a03ce002cb597584ee1f3681183a74001b5fdc4192b172a7a5ca49718a875a139e68c2b76dd41cdee4d02bc826044c260fa80f646c65e7daa6e153f204670fd7179cf82fcb71326af8c4dd7d8941d416a5c7cc4a59ea5a94655336d807e98086c7d444a944c41e89390ed8a187412181b6fa4fa424895f4f5c11d2a5023eb8fb64cfcf70fa15c191c3c13c24d6dd1a9e49be6dabe95e200e9a9752a84f61e1347e38cad4be8a243d7732d53555c4e24782681e01f4aa8691c4d09c74251bf6619a3baa4aa1aeec1fc25b27986c46b25a83432c06e9b3c24e22969341f1b69e2c29661a3f5f9a397e4fe116216d91c94458a558e7f5ddd8b6e12b43c556977f43aafa3d5a1ae07348e175b10b205ce2c685159959cdc4a59ea8ff1395de1780a4a432bf0607985059598c2bc1f19d0fb412164808422d23656cdc2d515087b43b6a2db38ff24b6fa682154c9f5e71813ca83681a83bede154da77680be5d12ec120e5c5965872986ee608304f96605a65d764da009ac2d32ef19abbd90f510a847003064d2b0a6bc04404d4095beb1cd781061dfc90da7bffcfbae3f3699c734596fe9bae0a6b684bd588a6d16b0bf2bd31e1e5dffcb6783724cf700a60971437952ec3437011696600fec9347f67b50561baa49b9777a24dca4c4bebc4355797bd5da5b50a72efb8e0a022046845ab3e06429440ef7299a36e7e05be62a48bcfd48bcf358b100d8c35bc5b496315f35fa8e184a123bba2dd7ee3a15e6de192f472edcb6c36a5c1d26c7abc3344d63c0562378d0a64c011c712d7a48e338eff44f6ad619a939d6e56d799de952cc3241305139d95f52508d0e53bd6357f9a110a8afbd5ccb0fbc215345eaa6b3a056619719743c4f7cef228d7ef935e20d3b5e2370dcd936f9c6f3a8560ae760f5c366d5e8c8806be1d2198ebd913d71dd91edfbaadfea27420b07e7221c74ad756030ecc260a220a8b1bd552a0d78cf48de2dee40157aeb833f0b0defa7b0a251e11d888c47af04c4ab00726b34e87c30ce91f757a0e477a1e45fc49997611a8cba9ef283e2295f3ec0bad9d312daf34be7ff07f2cf7d20236b461dac198ecffa4f1034a65a6197c08edb14d1f2da1255bb5244af2386ee1aff01b4d23ff0, '5TeJcw', 0),
(887, 5872, '2017-01-29 12:02:53', 'Array to string conversion', 8, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 125, 0x789ced585b6fda4814fe2bc84f9b07bab6c1364ca595104db75137e9aaddb62f4868b0073ca963bb1e930445fcf73d672ec6375282dab7f625662ee7f2cd77be33534a26e48913fb35253e7912644cac354f98f55a90894bac39593cd2bb3c5fc465948562f1a6ccae59c4c36cb12eb2b46469b408e16f9125092bc4e21216b3f41d176556703a4f78ca433aaf16bccae31c2d83139802279c38ae87aec0eb360d4b9ea538ef38c48a691a25ecb228b202873c6285091502bf5d98de71be5851c11672c53bb9b8d0b6cb5d2e1380f8877fe9315a6c602f053b325b4e26e81c17f9c49a1505dd0dca6c20ca82a79b01a4740fe9c86838717f21169c8c34089c8c213c6784871010ab60dfb74c9418f214875c9b582ca5ab84cd45b1fe42131e5105d74aa631057c60e25f5ad03b0921e4bcc491a1094e8eda6ad93ccbbe7186c61d340ef0c765997f48939db2b787a57edda1d9a09cb96e3527c7bbe138184f6bee3ddb610c23d87cf990dc06c1a7f0fd6ef665bd89edf8f1eddf53e17b8f8febef5f9d4d6e4870c7ca388baaa40097a51ad2bf725a08c01a13b1c9d35ead585644713c459407b65a7c3480ee2599eeb28825b8cf4500d0178f96390d3903b0e45e6239c6e7c122064f810272fb9133962e64f4b8482dd150ab4273f419d7ecbaa386ddab147805c1642983e93dda0bb4bde654d32a7e408ce0fac3ea9685e51f474c5e689baeb6297a8254b8f8884b334b5d8db266ba00fd3011d87a8f94a89882d0a7117b3431a8243036de4af599906ae9833d175cd5a046d61f6c993ab88d2311afa9b88d341a9e0ee4aab9f408046da3dd08a4ee00f5a9752c90ee1e1d47eba4ad7348a34257731d5375748e2478228de01f0aa96e1f6d21c77291bfe605a3aab0ea4aeec1fc39e27982d02b3da8b533c06e9b7e4bb387b4d5826c248b0b5bc6ad06e807cf89fe3dc49c150bd01791ad4bfcebaa8e7495a2e5994cbba7e3793d0d0fd53da449b2dc829c2d7166494d7dd572726bc5a93e26a7f486c3294825adc1834516192a3189f930d6a00f432367808424d236912dc35575087b23b6a6dba4fc986dd5d142a882abcf09265486f12c0195bd31ada77180be5d11ec1c0e5c58559f314337b04180883383699f5d1d680a6b4de6036d7510b10102750f00464c68d6545701a809680aaf6c3d1ec6d87d4acde9cfffbd1d4e74e6094d375bba31dc5496b0238b6c5b84ec9fdab4874737fcfc49a39cd01d80a943bca33c353bf57d804515d823fbe891fd1956d5866a52ed9d1d0837adb0af6e5275de5e74f61aea34c5df914100c4885067169cacb2ac845b15cddb73f02d4a1924de8104de7cac2403d8a36bc9b48e315fb6fb9e182a123baa39376e3c35e6de682f072e5c77c36a5d20a6870bc42ccf13c05621b857a674011c70353da4759c37ea27d5ebb4d41ceaf2babad4f42966952098a89dec2f29a85687a9dfb4ebfc900834d79eafe57bde922993baee2ca855d865463d8f14df3b4ba39f7f9378e39e37091c77b14dbff2326e94c22958fdb059b53a32e06a5c3ae38917d853d70d6c3f90fd563d143a383867e1a06aad0783711f0653094183ed9d5269c17b42f2aeb903d5e8ad0efe2434bc9fc28a5685f72032095e08885703e45a6bd0e9609c22ef2f40c9ef43c93f8b33cfc3340afa1ef423f3a0af9e61fdece908ede9a5f3fb99fc739fc9c89aa08735e3c949ff1582c6642bec13d84997224a5e3ba26ad78ae865c4505de37f6e8e4229, '5TeJcw', 0),
(888, 5874, '2017-01-29 12:05:32', 'Array to string conversion', 8, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 125, 0x789ced584b6fdb3810fe2b864e9b83bb926cc932032c6078d36dd075ba68b7edc580414bb4c5561655494e6c04feef3b4352b25e4914a3bd6d2f9139e43cbef966862c251e79e4c4bca6c4258f19191363c323665c67c4b3893127cb03dd25c932cc03e167cb3f73b16001f7c572938a386771b0f4e16f2aa288a5d9f20636b3f81dcf7291723a8f78cc7d3a2f37bc49c2043583111081114e2cdb415360751ffb391731ca2d8b18218d8388dda4a94871c921861fd12cc36f1bc447ce976b9ab1a5dcf14e6e4eb5eefc98c800c0ffe11f7a8da65b384b418f8c96130f8de3269718b334a5c7412e06599ef2783b8090ee211ce90d27f62fc482939106819331b8678d30091362a4ecc79e6539ba3cc525db24068be93a62f32cdd7ca1110fa8826b2dc398023e20f887a6742721849857b8322c9c93aba6da3617e23b67a8dc42e5007f98e7c987383a2a7d27d8ea560d16079431db2e6572bded8e85fe3464efd9117d18c1e19b87e8db64f2c97f7f9c7dd96c43333cbcfd6b9ab9cee1b0f9f1d5da260509762c0f45500605b8acd492fe95d03403ac3110933c9ed48e554914cb51447960ebe5c702d09324d34e042cc273360280b678b04aa8cf198025cf12c32a6c9e35a2f31428208f3f916369427a8f9bd4160db52a344be7b8a2d71ed5f4dec6c02b7046c40cc427d437d1faeaa2ba56fc001fc1f487f537e6e7bf3da1f24aebb4b5ceacc349858b8bb8d4a3447781466d6c5e8c0160bf4736942441d4e3801d0af3ca7f748b37a27cd99b0ab4c8f2b38272870cd9d1266f2b726db671ea0565b2ab00b1e9933bfb79d348aa71093f14344ad652d5239dbd18f32a72c13f6caf7aa834db3b1691fc354f1955e556edef0ec82f69a93ddabfea1295210730efe3efb178881b83c9bc3e61eba7b0561f8beee4b951700f3e8b74095d27139b1cffda6a4eddc6a87926c3ee98834ec718c49eefd3285aeda1c9ad50b2a238a91a31d9951cab0fafcfc4386741f6d70a3c587f41c13a26311f861af4a15f34394042726e1fc941622b86c1d9806de83eca3f8abd4a2db89a71f5e96140b91fce22e8bd77c540aa25d0354b825dc2812ba39c3ec5d21d1cc8a0b5b302d32ebddad118f616910fb4d641c00608d43d0018b04cb3a6bc20404dc0a87863ea753fc499946b4e7ffef7edd0d3914734deeee9b6e0a6d284733a13fbd4677f57c40ea66ef8f9934639a2470053bbb8a33c2e4eea5b020b4ab047e69329fbdd2fab0d1b4f79767626dcb4c4bebc5f55797bd53a5b5047ba3c2bc8694927006244a82505236b2172b86bd1a42983ef2c974ee2cd28c3fb901109803d5848a6b594b9f212d0e14349624b8decda3da8c2dc3b6de5cc8545dbadc6b5627abe56cc9224026c158227a54a17c019d762e834d279a77e52bd4fb79a735d2ecaab4e57c72c03041595ccfe92826a0ca3eafdbbca0f89407defe5bdfcc41b6daa085d4f16ec553865461d4f17d7b9a8473fff5271c61d2f154877ba8fbff23cac95421fac5e1c56f50b23285a1526adb1e74ccca96d4f4cd793f3563d1f5a385817e1a06aad03837117065309418dedad5269c0db2378bbb8ce56e8ad12df0b0de7a7b0a251e11d8878935702e2540059e81ed41f8c3eedfd1528b95d28b91771e679984693ae67fea878e6978fb36ef6b41a6dffd2f9fff1fc731fcfc89a49076bc65eafff2041657214763558af4d11d55e5b4dd5ac14d1eb88a1a6c67f80014967, '5TeJcw', 0);
INSERT INTO `audit_error` (`id`, `entry_id`, `created`, `message`, `code`, `file`, `line`, `trace`, `hash`, `emailed`) VALUES
(889, 5877, '2017-01-29 12:06:50', 'Array to string conversion', 8, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ExamenHistoriaClinicaController.php', 125, 0x789ced585b8fda3814fe2b284f3b0f74934002b8d24a889d6e47dd99aeda6dfb82844c628867429cc6610634e2bfef39b6137263caa0f66dfb32c19773f9fc9defd8a5644c9e39b1df52e293674986c45af198596f2519bbc49a91f98e6ed2741ee5a108e4fccf5cdcb2900762beca4492b3249c07f0371371cc3239bf86c52c79cf652e324e67314f784067e582376994a265700253e08413c7f5d01578dd2641ce4582f38e43ac882661ccaeb34c6438e4112b88a994f8edc2f49ef3f9924a36572bdeabc599b19def539500c4dfffc38cd16c0d7b29d851d9723246e7b8c827d634cbe8be978b9ecc339eac7b90d223a4a3a2e1c4fd855870323020703284f09c011ec2885819fbbe6532c7902738e4dac462095dc66c26b3d5571af3906ab8962a8d09e00313ffd08c6e148490f30247fa45706ad4d6cb66423c7086c61d340ef047799e7e4ce2bdb67780a57ed561b1413b73dd724e8db7c371309ec6dc07b6c71806b0f9fa29be1f8d3e071ff6d3afab756447bb777f4da4efed76abefdf9c755a9060c3f24884655280cb420f995f29cd24608d89d8e4f9a0572c4aa2389e26ca135bce3f15801e149936226431ee731100f4c5c3454a03ce002cb597584ee1f3681183a74001b5fdc4192b172a7a5ca49718a875a139e68c2b76dd41cdee4d02bc826044c260fa80f646c65e7daa6e153f204670fd7179cf82fcb71326af8c4dd7d8941d416a5c7cc4a59ea5a94655336d807e98086c7d444a944c41e89390ed8a187412181b6fa4fa424895f4f5c11d2a5023eb8fb64cfcf7a17c58191c3c13c24d6dd1a9e49be6dabe95e200e9a9752a84f61e1347e38cad4be8a243d7732d53555c4e24782681e01f4aa8691c4d09c74251bf6619a3baa4aa1aeec1fc25b27986c46b25a83432c06e9b3c24e22969341f1b69e2c29661a3f5f9a397e4fe116216d91c94458a558e7f5ddd8b6e12b43c556977f43aafa3d5a1ae07348e175b10b205ce2c685159959cdc4a59ea8ff1395de1780a4a432bf0607985059598c2bc1f19d0fb412164808422d23656cdc2d515087b43b6a2db38ff24b6fa682154c9f5e71813ca83681a83bede154da77680be5d12ec120e5c5965872986ee608304f96605a65d764da009ac2d32ef19abbd90f510a847003064d2b0a6bc04404d4095beb1cd781061dfc90da7bffcfbae3f3699c734596fe9bae0a6b684bd588a6d16b0bf2bd31e1e5dffcb6783724cf700a60971437952ec3437011696600fec9347f67b50561baa49b9777a24dca4c4bebc4355797bd5da5b50a72efb8e0a022046845ab3e06429440ef7299a36e7e05be62a48bcfd48bcf358b100d8c35bc5b496315f35fa8e184a123bba2dd7ee3a15e6de192f472edcb6c36a5c1d26c7abc3344d63c0562378d0a64c011c712d7a48e338eff44f6ad619a939d6e56d799de952cc3241305139d95f52508d0e53bd6357f9a110a8afbd5ccb0fbc215345eaa6b3a056619719743c4f7cef228d7ef935e20d3b5e2370dcd936f9c6f3a8560ae760f5c366d5e8c8806be1d2198ebd913df186aee7b9aadfea27420b07e7221c74ad756030ecc260a220a8b1bd552a0d78cf48de2dee40157aeb833f0b0defa7b0a251e11d888c47af04c4ab00726b34e87c30ce91f757a0e477a1e45fc49997611a8cba9ef283e2295f3ec0bad9d312daf34be7ff07f2cf7d20236b461dac198ecffa4f1034a65a6197c08edb14d1f2da1255bb5244af2386ee1aff01b5063ff0, '5TeJcw', 0),
(890, 5879, '2017-01-29 12:07:42', 'Class ''kartik\\date\\DatePicker'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\reportepacientes\\_form.php', 16, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '83KMW6', 0),
(891, 5880, '2017-01-29 12:10:05', 'Class ''kartik\\date\\DatePicker'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\reportepacientes\\_form.php', 16, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '83KMW6', 0),
(892, 5882, '2017-01-29 12:10:22', 'Class ''kartik\\date\\DatePicker'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\reportepacientes\\_form.php', 16, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '83KMW6', 0),
(893, 5886, '2017-01-29 12:10:52', 'Class ''kartik\\date\\DatePicker'' not found', 1, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\dependiente\\_form.php', 55, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '84ga9T', 0),
(894, 5961, '2017-01-29 13:04:53', 'Exception ''ReflectionException'' with message ''Class validarFechaInicio8 does not exist'' \n\nin C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\di\\Container.php:422\n\nStack trace:\n#0 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\di\\Container.php(422): ReflectionClass->__construct(''validarFechaIni...'')\n#1 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\di\\Container.php(362): yii\\di\\Container->getDependencies(''validarFechaIni...'')\n#2 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\di\\Container.php(154): yii\\di\\Container->build(''validarFechaIni...'', Array, Array)\n#3 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\BaseYii.php(344): yii\\di\\Container->get(''validarFechaIni...'', Array, Array)\n#4 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\validators\\Validator.php(209): yii\\BaseYii::createObject(Array)\n#5 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\Model.php(445): yii\\validators\\Validator::createValidator(''validarFechaIni...'', Object(app\\models\\Reportepacientes), Array, Array)\n#6 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\Model.php(409): yii\\base\\Model->createValidators()\n#7 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\Model.php(185): yii\\base\\Model->getValidators()\n#8 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\Model.php(772): yii\\base\\Model->scenarios()\n#9 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php(705): yii\\base\\Model->activeAttributes()\n#10 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php(219): yii\\widgets\\ActiveField->getClientOptions()\n#11 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php(209): yii\\widgets\\ActiveField->begin()\n#12 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\widgets\\ActiveField.php(165): yii\\widgets\\ActiveField->render()\n#13 C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\reportepacientes\\_form.php(25): yii\\widgets\\ActiveField->__toString()\n#14 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\View.php(325): require(''C:\\\\xampp\\\\htdocs...'')\n#15 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile(''C:\\\\xampp\\\\htdocs...'', Array)\n#16 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\View.php(149): yii\\base\\View->renderFile(''C:\\\\xampp\\\\htdocs...'', Array, NULL)\n#17 C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\reportepacientes\\create.php(13): yii\\base\\View->render(''_form'', Array)\n#18 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\View.php(325): require(''C:\\\\xampp\\\\htdocs...'')\n#19 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\View.php(247): yii\\base\\View->renderPhpFile(''C:\\\\xampp\\\\htdocs...'', Array)\n#20 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\web\\View.php(210): yii\\base\\View->renderFile(''C:\\\\xampp\\\\htdocs...'', Array, Object(frontend\\controllers\\ReportepacientesController))\n#21 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\web\\Controller.php(47): yii\\web\\View->renderAjax(''create'', Array, Object(frontend\\controllers\\ReportepacientesController))\n#22 C:\\xampp\\htdocs\\DtoMedico\\frontend\\controllers\\ReportepacientesController.php(92): yii\\web\\Controller->renderAjax(''create'', Array)\n#23 [internal function]: frontend\\controllers\\ReportepacientesController->actionCreate()\n#24 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\InlineAction.php(55): call_user_func_array(Array, Array)\n#25 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\Controller.php(154): yii\\base\\InlineAction->runWithParams(Array)\n#26 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\Module.php(454): yii\\base\\Controller->runAction(''create'', Array)\n#27 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\web\\Application.php(87): yii\\base\\Module->runAction(''reportepaciente...'', Array)\n#28 C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\Application.php(375): yii\\web\\Application->handleRequest(Object(yii\\web\\Request))\n#29 C:\\xampp\\htdocs\\DtoMedico\\frontend\\web\\index.php(18): yii\\base\\Application->run()\n#30 {main}', 256, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\base\\ErrorHandler.php', 299, 0x789ced5c596fe338127ecfaf103c0f4980714687e543011a9bcd74ef0ea63b3d485f58ac17012dd1361359d24872e26cc3ff7d8ba4a883a21dcb76cff42cf4923812557715eb2b53418ea93b5f89a35f22a7ef7c4d9ca1d3992e03372561d0b94c1cc3703a7314783e7e1dc7614c2fd94ec7f55192d0cf26dc7e26643c41091eb315ff648bd9c29ed3499f23ccd6399deeabec1a8a67f02c023a8c2f714cbb0f3f0db86b0d07b0e0f5cac51115403bbdc5531f3361f28ba7da1349e7da0227099a61edf49acaa23d229f78287e83dd39fa25202e09879a17e2440bc254c32b92a4a7dac90909b46b67bc428b281acf532f7493f1cf69f80e7bc40dc78f38f0c2780cea24e134a5bfcdb147c6d761902212e0f8229a474ecf344f4e3ea4c87dd0d218b9d839f9413f90e619d03c77b44255a651f7d5dd9d1b06491a2fddf4ec54d2efe2e2e2f4fce407e350d6569fb2a61e2cdfeabe9ae1f4671c01051cb804279bf89b87f237ec9e92ff64497c4fc9f547ed2a8ed173f60b64b01acaf07708d57f11c2d5efa9d983fabb31ef3564ce69a6619c8c3f8b8f4c12531f659264f2398e1b6394e2f7937b888a33c1d06ec89025e6bbd0c33e0fb59e9db151492278e617361821930981100b4a3a19dfe2288c531c21889620c5c979cd52fd0305cfed53dce8be92c44dce80d1e03046c6d056308280a872191ec6653030155c121707282621e3306ac8e18978206532be821af288df10ec7b9c95ae5208b15557691a93c9121c46391a4d2bd92696a6219ca558c18c79edd33879cf0a3ae7ddb4946de4ad6fe53dc1331230864d6bd7268646dfdec630a64534661cb755aa690cd507968e1f097e4ac6b1944fe3bb69182fb8825bd9dddda5e107706a30632c9bd62716229f41045e1e19af18ffbe24313e3b055219ad8c98d885f62a4a3917b337280728bd2eccf6db3c7a43fc4dac8be262ec555d72098cde6893042fb3ff51bbf9f4f62d15625be579c9bfbc927169ac4dc29c9db230282bbe571d6aece0a6b5e8e80e361b97263c290960e887f837dbee7217425b96c6a10f5d6e7de3bbceef9d53b11b573510bb20c1773e613ca19210fdea1eadce4e79e01c45d86d15b1213d26f9c82c495edcdb263f15c3d2fe4d805a1c205f1350e43f8ed65002bec54133cde8d36268ee550c7f097ce809af182da6954d53c645be7fb74c707c4725bc4354f633a9e331f72a8b920d8b06b9260dd871197c012cf41b8ad122c95b4473df566be9f302d4abf2ac786e1970e62ac735edbc68585c45914f5c945b7738909a1510aac256aa9c5299d8ab1cca325803bb14b8a5bbdd571c0adf42c1c4497a96e59a58995d66b9b4ad62e6914c1f22900aabacf32cab5e610bfad308b674edeb0220caba435133e0e5fec0e9eca17019a853d6949c45498e46f0b307d8dca0a38091d3c1027577c445e008c054e07f03d628307ae772bd5e33b03f85fa4a17c263cbe021089f826c0a40e398f2d52fd714fb23b8f6b5f2c4d174abb0a32ad6871c96d3819e6936837cc662cc519a54987c52d1ce27daf9443b9f68e713ed7ca29d4fb4f389763ed1ce27daf9443b9f68e713ed7ca29d4fb4f309793e6164dfecafd77456919d2e28e3fb51537cbfa1c39110bed11fd411be09081ff2f211c7690ed43f86871e69701c69506088a3140d472574fca2b0d0d609c8ce1d993c01b11503109d8a2a3ab39a452c6e1185fd7738e6a13b5fa9823dc588c76e1c02958d5b52cc629ad5bd714443ae6b9603ca597bd2a1832c5be1c6e36a09cd8a7a8055695864171a5629a829e51d1c671edd7c7cd0c772038463d07cc35cd1843fb7c077963460eefe373737b4deea7429dab363d8dafabe6d4d2bf80dfb3d50d5a9e1213217c84236bd55b77c5f18fea8010e8498e5be41840effccb27734bfbc58f746ff9775ef68f63b7a5819bacae05be57d0985caf636f43fb6f07d9fc6e6bdeb903e6b82f23840131f5f27f1341bb732c34cd8e15503f4e3988e031ed1fc30c5096b950c56bf642eacac2d189460f167526e949a87a768e9a7b7e132c599dd12c23f82b5a0f976e7573e287793b9a6409e9dfd856656638025f3d9cea273834aa0a38413ce4590647a5de571051c19cec808fae81954e67af5857c8cfea842bf0639cfb3d254f2710ffe6c08cd59bda3ed7ab1fc062d70024bb996ba9a64e6a200d68ab659cba86a1ed6d8481bccef71c3815c0047924c33586b5ce8d975778ee204a799653e7d7cd31d663ef751305ba29948274ec9a071112e6317bf2dddb6a9e3bb9f3e483665225290269e8c392ac45e1e66a65577f54f3cc3d84376e921e1c36c972bc2e91d4ee7218f9cfcda754e230f2b90ac44598a6150c2ce1dde7462540f850ab22b870d7778592d3983a9647805eca9bff82e61b1f4ea3192b4a2fe442b6ad7855292233b29954c69ed240cd3248d5124afa4b956593923a4b66628ad99a287bc2d2a785ad22ab44ce72efb724345d0c30f8000970bbe96ce8f6a0461d5038a53f2d07de4ab382aec2698225bf365aaf104b92a31ab54a3300a213dba2b15c1ead245e44d55b6be0fe701491f834cf17bb472e3a5575b093162a205998549e64148bef43ec9f492975bf606fda1ace2942c7044dc5dfc304fd348ed875a48254f649a42c6fa75b2b520f0f06439abad825236c11efe2f9909632c3d52675c53ed2146f7187769bea80c5c5d0c1b754af799da4a5d5ee911e48775296b8e9dc5a4ee2e488da7498c6628705146ee192a2e7179032f79cbd8e22d95a7d6ecd44b2931cb873fa08852b1f9ab2af04c66c535fb23495911a3931cbec9f921547a8f4f08c5fb2edc178aad71c7cd93da5264d398a66736811499993dae5a722e58e43769228e6fe1c7173c29c858769d4c7de5b9d83da8a4509dca729815358a9be722c8442cf21e9459717c2522d2b2f2c737ae3b6746874888f232cdaa31add2c85b90e0354d1726e220bbf2374c3b4b1f5fb8e1426c4ac932a2bb47b178945f9397d3c6831af32282bde4298cbd5b0c1bf4c7f00107af57114341e0f9beae5f56da3d93f5975db17549fdd24d1629c586f68e871cdf73eae34365e0ac0feaa9bec9beddf69e87f59e4dda9663706488d2504d767afb20caea574412ae54c2f81c56d2efdc6ab0d22c22bf31aa2cc2b485856d6ab6b0b08585b5506861610b0b5b58d8c2c21616b6b0b085852d2cfc6e7bcf3f0516aa8e6e0d763ba4b0fb514c09238ecccba6187158a4c175a555dcf9cbde6f84149911f3d35db2528a5c2aabb597df763a91d5e4e53cd5d1ad3ddfce934fab4afc6cc5d9345a2e54c759d58e2c7df80ba2f383914d0b4f1bc1d31dcbb712034a6daa8404ab77abcd63f5de0e4d62f5815283b36963dcabc1a812fbebb6197fe878e018fb2c912a9150387b319a1da0a59f55874bfbf65e7578ebf66bd83dc5fe4bd3ab7c9e5fdeabb6d8e9c51da97a6e1a08dd0996466f680f0c4b1f99baa18b9e4475ecb36fec6588e2b502c9083d951146cc069528afa58864dfc37b9017cda13c93d9382e146f3b4826192a46f75b2d62972c5220c15dadb1b5a037b1cf50659ffe5ee1b2dd40d64075b6de12ff41317bff6253e028b0ffae6933daa5d5a1ad01dc60d92bb6d13b7aa5b24fb06a0a17afc3f081e0bcef05a5e86cea7de03f737a6bde18150cc5039c1985fbd93d765dd179b156a57aef57cce733f0f0eb27ff7e30f8e0fefa7cf5793a9bebf3d59b7f8c92bebd5a4d7fff62cc98e9e93fa75cb01d23578ad6e345be890cd85699b02e67037eb60be3e7fee161a33ad3dadbed9462e5c519b9ba0eeb31c26b6bada2eaa5fc6916197ccff81f9abff185, '7K5h5p', 0),
(895, 6016, '2017-01-29 13:22:05', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''=" . $id_reporte->fechafin . "'' at line 1', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Command.php', 900, 0x789ced5a596fdb4610fe2b819eea07a524254a220d14359ca408523b819de38580b12257d25abc422e2da981fe7b672f8ac7daa115bb8051be24ca7238bbf3cd3717b3c8356df707718d53e44edc1fb93b76070b12e2c169ee4e0c7770ee7a5b14a5a9b7a241e2e7de1b9a5ce080f8897787e320c9bc1d2179b2a0ec6fcb0be6de791245280e5ea7ab94e900752189411d711dc3808519e82f629f922466cfa7ee006fb15f50bea3ed0efc10e539fb6d5aeee0d39b8fd714511ce1984a6d74977251783afc43aea16c09af20d7707fecf7c4359fdf96d1c46adb628edcc1f70267bbf731c5598cc29649a0017457547730ca12ee11bb61eaafcec2901dc13cbd3c65d65a1a6bedd943d62eb2040e1807de1dc19bdccb09c55e86d324a3d8d4d86a9a6d5367d2527e962730527a6e043fc74d5b9cc77a6e8e72ec7d05db748eb3ecfacea682f75731dbebb89de1ef05c96067306eac73d4931a678da77a5666a008679f56e93bb56fd56123e1b052f36348f9aba8896835192c268428096ee4f38142cb61abe522719989a6c962c15f2112139f24dc0a78db32cce9d03087963950f102320b12b7041c653897b8c24b92d3acadc729dd28b7cf81a903b97873534268c13f11001025010e73ef4a88a7c82790b83088ecf78cdef6b333c01c3b1a06188a014fe5fe51effe47ba5fe4e919b3c8021d3846f3109fe7d9e22b0a498084abe6ae290b1fe2cefb84321495f991bb82a86ccac0e485cd1dc0b645c811b32c8e24c80578818a905e25b2b256de00607ca4eac8a5b4d9074f654918e26c70fc3939b1ceb20ced24711e3aad80ede3fc16fbf43746c00d9e7b67691a129f6f73a27c244d392bf90c9b1060f3562a0cd10eac14a64cd491b87ea7a69f13fc7dcc4245e83a697b7204ba4bd61e30c9bd6b30e0bc821178c374aab05da208e7e0726199a15723d18841968b8175afa4d657017ec58e7e072807389747bb8397a435206bbe36e43ab036cb3195687cf9fc6e3893ae0d51bc2cd052852e2e6b729e14998fffae3cb6997f875fae1b38f223464886cd5814319c531c946c626e612efd5d45335fb42ba2ca5bb29e1fb87281e92a09946ab17655d152b26656c69da902b34a5238e5a8746f0797699c6d9995cc572586706fd59c6624b2d3e02d6cc9bc232ae288c78c687e58b2fe9d25eba10f29c1c76985ba87f8b01ab2f324a1908750da9434270dc925212d9959436681d602a7da9ea386142ae8ca0f89ecaf9b0a03bca6192922215be41a8520b5461925ebe19d90da906089e930c72178c6fab9d66c8e7cdd31eb5ad3244d2018865b9dc2ba6894060b1dd6b7c92a26f42e9686dfa2ad9f15414b123862a1882c935c7a10428ddee6d2aea6384b185afb2157624a229c12bf8b1f5694a67a3fb428956fc882427c866db52d1204785e2c5b5290b8e638c0ff90a502a308487be39669eb0cdd623c64f1a203b82e0c2d0065c5a3256934250382c2a47dca9663971969bb0b426333cfd012c53e92ea76905f89bf48b2a8e52df3016fe93cb5e70d4825302bad2fb8901f9bf06a08ef4814f7fc1f399b5bf9c421f36598405e0f2e78f5e319c3e689d11139a851fc3a964786a58a268f85a77771a8aeb3f2759dc889daa27cc802d1bb823fbee1f9410d2378534d5bf24425747652c84ed5735835330e0f4f14c91417457bcb51f4ce142347872c7fafdc09071d989096697aa45a4a1444247ecbc2851f712a57fec4ac670df16b3fe12c61052a2f52566f0ec24eb9d61467ad0503f3750ab5649364c1158672fc3959e3f8ed36e5131ffb486018a7d5b68d57c1341daa72d5e8882e25530e45ec42504ed49c7af1ba9738fb5fea9a9ead5ef74d65a7a6f2311dcab1bbb06964a2fb46661f358a1e746b06d2b1a11948276a1e95c03fcd2c5a23603f58f683e54bcd01fd60d90f96fd60d90f96fd6079da0f96fd60d90f96fd60d90f962f65b09c3e7ab0eca05b3358ce46a70ffd5737cbc59a0b184ec5ecf37ad3d7fd16c6ff70ca649e9d299b9aa86bc3b70a7b670675ba2752a3161cbd88d771b2891bfc30d8950b47739f64323dea2b4735483474b4ed361d594af25118deb0847ec39edc20956edad4aafc7819d3fc5183523fdb76986d3b1603ed20d9e8751be364fd69bd03ad3febd069d65fa87449f754d6e3ba94bab297ddab3cfbb785632bb7183574c6c9fb94fc821efbadbd28fa0c1f8e4d7b7c4f812fe26f84ae6a7cef82ce4f6b8ba9d2afd92edcb0b53b98ca16c7d45e30358fc2400493eec3b9ce7e879b5fa3f37fd1db3c8485eefae9e3f9d008605dbfa7b9daf8201c76058ec3d0d8150a4db2ee08c84807c8e428723c8cc868aae939d8b957280e427c252ac37d34d17c17e81a1f4e97f684d57978c0c35425ce1bb6524bff3c41c2e27992ac091e287cc128f6ddea631cee84bebdf85679d850bd2036639f02e433beaee99678df517ff6018b6f37f0f2db4d783b9d5efb1f76675f17cb95b1dabefbcbc927f676bbf8fecd5c72e859db1ef142501ac5d26d54d68629af80396f59ee99aded03f8a57f046d74b783c7dd6e57326dbcaae9d2e8accd1191445ba9d3a804cce398218ac3bf62a9f4ed, '8rIZ8z', 0),
(896, 6016, '2017-01-29 13:22:05', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''=" . $id_reporte->fechafin . "'' at line 1\nThe SQL being executed was: SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita==" . $id_reporte->fechafin . "', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Schema.php', 633, 0x789ced5a7b6fdb3812ff2a8270c05e80755692df0a7671b934bd2bb6697b49b7c501020c5aa22dc692a85254625f91ef7e435292f560b28adb1c509cff486293a3e13c7ef352885c7bec7e25ae7586dc89fb357347aeb9221136cf327762b9e685eb6d519ca65ec803ea67de2b4eaf70407ceadde124a0ccdb1192d115177f1d2f587a17348e51129ca6612a7800bb8824c08eb8737b0c0b33e09f273e273411fbf6c4357d9adc61c62fb73e4ecbf5312c4728cb24cdd03581bde07ee38738460563be4ba59c8e6b0e7e2bd6105bc33308d60aa51ca1d4dc35316394bd495654ec0ed5ae3c66e4589625e4b3c58f3519c11f479c3a0551ff4d73234477d840892139182431763467c6cdbfde1ad92ee1687b668050fec6e0213640f51c45f01171c3a78ce12ca54990199caaa7ae1023e8d5df8d0c3350d9809f0c143656c0583ccec83ae4055bf14c9e6123c188193ffd6a1aa7c65f48b06038a58ce3c16f2bec876805e29c1ae64f069c27ec6cd8e6d943e64e5d73b1d8db0f0cf4e1d5fb9a7d1f84b6b06183876f2edf5e5e7c3480758a7c82138e7f3624ef854f38fad9e024a50bc471e24b49198d0db1b188050c90f1f99f97d797b5077e7d5a52385b1efee2681b4e1c0dda00495f72cc766f404d96a0a803b55105b582757faca9d330f7c3f32852807a27b57534da8e674f690b56060193c0bb23f83ef332c2b15798d3d6e86adb5d556785a65296efa0a4e57e15ba0ce1e3a8adcbfcb99e5ba20c7b9f40379de39c71f364bb0ad66fb4d943c74810270c7fc909c33226463a477d57e59cd1548f4a068c30fb10a6afcb733509b0e2fc1c507eabd554b4dac22c225dec03db2cad3517abd52271a732b5885880b8270981c421b580a71dcb9e0e2c7be0d866192f2a377408e6a5e292e21aaf49c65997cfbc7263717c0648358bc55a0e74e02b0203c434c051e65d2bf232e365222d09788f5f1c01f668ae41805522e07bb97f7874ff33ddaff2f44c68e4000f9ca065842f32b6fa84221220e5aaa5aa9b6071249df701311457f951ba8294d95418531636d78463f3485acc91fd886010e015ca237e4d7345567b020ce3a3b28ebc2b74862e092c1045989987cb298175ce18da15c0794a5a65b6f7cb5becf3bf0a00dee3a5779ea611d47dc1f4a4f451a1cab95febde08a0795b308c10343f5ca932294592fce70dfe12e06f12112a8ad749d79343e05da1766f93ccbb01052e6a36026fd8f3bad9dea118da31e42bcd2c3d9bc21a09d04a32d0ce28b81a01b48120d61d5839c059215ad1c249d15cd33eb58a75402dcb302facf1c7c7d78359e1da0825eb1cadcbd0c5554dcea043f4f1dbdaf658f877f0c74dcb8e52c41815613352450c671c07159a845b844b7f29a3592e8e6ba4a5b78a7abec7ca15e6210d4ad66aedbac6a542cdac8a3bbb0ccc3a4841ca61e5de1e2ed338dbb16b99af0e0ce5deba3aed4814d2e02d1c29bca32ae250c68c6a7e44b2fe4524eb810f29a13978ece3c369d12e29e5908750daa614634c83724d488766d6a259a18db253e3cc618b0ae53cf42391a7740c03bce18ce4b1a28579a1cb10a8368871b219dc29aa7b12ac311f643802cf387fce952d91af13b3c935a5298560186c750c9ba4711aac74b6bea56142f85d52287e8bb63ecb830e2560c4413159d3acf020841abfcd0abddae4226168f5875c893989714afc3e7e08394ff57ee8402abb272b0ef11975d9764010e065beee5041e25ae200ff87ac4b63e401e91edc516dc3d02dc603112f3a033789a105e0a2787428ad3665405044bb52761cbb66a4eb2e088dfb25436b94f8a860b783fc4a7c987ae38eb7ec27bca5f3d4836c406a81596b7dc185526c35edc23385151fe4978c23d5b00c8b7c1951c8ebc195ac7e32638c65629cab1cd42a7e3dcba3b065194d9e084fef6a5f5d67d5e33a9293f2886a5304a2770dbf3ee3e59e8d00789b4d97f2a44ce84252c84e75399c861afbcd9312642516557b2bade89d97881ceeb3fca37427d2e88084b44ad3c3b2a544414c924b112e52c469b1f2372c7ad6089ffa54a24414a82c4f45bdd913cfabb536b9682d84314f53a825f79405d718caf147bac1c9e53695139f7849605967f5b64d56c1341d94e5aad511bd2b90b22f62570a72aae6b45ebb3c069c876fea9a5eac5e1f9bca5e4de5733a94434f11d3c844f78e6c7cd028bae7ad1948479666209d94f36861f8ef338b3600781c2c8f83e58f9a038e83e571b03c0e96c7c1f238589e1d07cbe360791c2c8f83e571b0fc5106cbe9b307cb1ebc3583e56c78f6d4bfba452ed65cc098d7d4be68367dfd6f61fc1f4e99c2b3b352a7b6d5b5e15b377b6f04f5ba27d28016889e279b84de272d7c58e2cac55c739f64323de82d473d4834701c6b6e9f8994e4a3285a8884be103b0b54a69b472e93a90f3fc6347fd0a0749c6d7bccb63d8b8176906cf5baad71b2b9dbec409b7b3d3acde603b52ee991ca7a5897d264f663f72a2ffe6ee1d0ca5ddcd8d42857dca79417f4c467ed55de1778716c8f478f14f83cf94c78d8c07b1febfc696db1cbf46b770b371ced9ad3a2c5b1b5174ced836ca08249f7e25ca7ff5caadf80f3ffa2b779ca16baeba7cfc7432b8075fd9ee66ae393e618d7ccb11f1afb9a4293ac7b1a64a833c8e420703c6d91e15477e31de40e511244f85a5586c760a2792fd0373ee67dda1351e76143866999381762a591fe658284c50b4a37049ba57d4129f1deea7d12ed14bf07f5ae727f60f9803a4cbc0a28f6e4baa65b927d4773ef77acdeddc0c397f7d1ed747ae3ffbe3bffb45a8756b87dfd8f7936196fb7ab2f9fedb534bd68db6359082aa544ba8dabda30951530932dcb23b3f5786ffcca3f0a36badbc1a37eb72b053759d5746974d6c5884aa29dd469d502e679c850c5e1bfc1f57f16, '5kOFjl', 0),
(897, 6020, '2017-01-29 13:26:26', 'syntax error, unexpected ''->'' (T_OBJECT_OPERATOR)', 4, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\site\\reporte1.php', 11, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '55etA4', 0),
(898, 6021, '2017-01-29 13:26:37', 'syntax error, unexpected ''queryAll'' (T_STRING)', 4, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\site\\reporte1.php', 11, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '7Rx3IM', 0),
(899, 6024, '2017-01-29 13:28:01', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''>fechafin'' at line 1', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Command.php', 900, 0x789ced5a596fdb4610fe2b819eea07a524254a220d14359ca408523b819de38580b12257d25abc422e2da981fe7b672f8ac7daa115bb8051be24ca7238bbf3cd3717b3c8356df707718d53e44edc1fb93b76070b12e2c169ee4e0c7770ee7a5b14a5a9b7a241e2e7de1b9a5ce080f8897787e320c9bc1d2179b2a0ec6fcb0be6de791245280e5ea7ab94e900752189411d711dc3808519e82f629f922466cfa7ee006fb15f50bea3ed0efc10e539fb6d5aeee0d39b8fd714511ce1984a6d74977251783afc43aea16c09af20d7707fecf7c4359fdf96d1c46adb628edcc1f70267bbf731c5598cc29649a0017457547730ca12ee11bb61eaafcec2901dc13cbd3c65d65a1a6bedd943d62eb2040e1807de1dc19bdccb09c55e86d324a3d8d4d86a6a4c9d494bf9599ec048e9b911fc1c376d711eebb939cab1f7156cd339ceb2eb3b9b0ade5fc56cafe37686bf1724839dc1b8b1ce514f6a9c359eea599981229c7d5aa5efd4be55878d84c34acd8f21e5afa226a2d564b09810a224b891cf070a2d87ad968bc465269a268b057f85484c7c92702be06dcb30a743c31c5ae640c50bc82c48dc127094e15ce20a2f494eb3b61ea774a3dc3e07a60ee4e2cd4d09a105ff440040940438ccbd2b219e229f40e2c220b2df337adbcfce0073ec68186028063c95fb47bdfb1fe97e91a767cc220b74e018cd437c9e678baf28240112ae9a031aa2f021eebc4f284351991fb92b88caa60c4c5ed8dc016c5b841c31cbe248825c8017a808e955222b6be50d00c647aa8e5c4a9b7df054968421ce06c79f9313eb2ccbd04e12e7a1d30ad83ece6fb14f7f6304dce0b97796a621f1f93627ca47d294b392cfb00901366fa5c210edc04a61ca441d89eb776afa39c1dfc72c5484ae93b62747a0bb64ed0193dcbb0603ce2b1881374ca70adb258a700e2e1796197a35128d1864b91858f74a6a7d15e057ece8778072807379b43b78495a03b2e66b43ae036bb31c5389c697cfef8633e9da10c5cb022d55e8e2b226e74991f9f8efca639bf977f8e5ba81233f628464d88c4511c339c541c926e616e6d2df5534f345bb22aabc25ebf9812b1798ae9240a9166b57152d256b6665dc992a30ab2485538e4af7767099c6d99659c97c556208f756cd6946223b0ddec296cc3ba2228e78cc88e68725ebdf59b21efa90127c9c56a87b880fab213b4f120a7908a54d4973d2905c12d29299356416682d70aaed396a48a182aefc90c8febaa930c06b9a912212b245ae5108526b9451b21ede09a90d0996980e731c8267ac9f6bcde6c8d71db3ae354dd2048261b8d529ac8b4669b0d0617d9bac6242ef6269f82ddafa5911b4248123168ac832c9a50721d4e86d2eed6a8ab384a1b51f7225a624c229f1bbf8614569aaf7438b52f9862c28c467d856db224180e7c5b22505896b8e03fc0f592a308a80b4376e99b6ced02dc643162f3a80ebc2d00250563c5a9246533220284cdaa76c39769991b6bb203436f30c2d51ec23a96e07f995f88b248b5ade321ff096ce537bde805402b3d2fa820bf9b109af86f08e4471cfff91b3b9954f1c325f8609e4f5e082573f9e316c9e181d91831ac5af63796458aa68f258787a1787ea3a2b5fd7899ca82dca872c10bd2bf8e31b9e1fd4308237d5b4254f5442672785ec543d875533e3f0f044914c7151b4b71c45ef4c317274c8f2f7ca9d70d081096999a647aaa5444144e2b72c5cf811a772e54fcc7ad610bff613ce1256a0f22265f5e620ec946b4d71d65a30305fa7504b3649165c6128c79f93358edf6e533ef1b18f0486715a6ddb78154cd3a12a578d8ee85232e550c42e04e544cda917af7b89b3ffa5aee9d9ea75df54766a2a1fd3a11cbb0b9b4626ba6f64f651a3e841b766201d1b9a8174a2e65109fcd3cca23502f683653f58bed41cd00f96fd60d90f96fd60d90f96a7fd60d90f96fd60d90f96fd60f95206cbe9a307cb0eba3583e56c74fad07f75b35cacb980e154cc3eaf377ddd6f61fc0fa74ce6d999b2a989ba367cabb0776650a77b22356ac1d18b781d279bb8c10f835db97034f74926d3a3be725483444347db6ed391a5241f85e10d4be837ecc90d52e9a64dadca8f9731cd1f3528f5b36d87d9b66331d00e928d5eb7314ed69fd63bd0fab30e9d66fd854a97744f653dae4ba92b7bd9bdcab37f5b38b6728b5143679cbc4fc92fe8b1dfda8ba2cff0e1d8b4c7f714f822fe46e8aac6f72ee8fcb4b6982afd9aedc20d5bbb83a96c714ced0553f3280c4430e93e9cebec77b8f9353aff17bdcd4358e8ae9f3e9e0f8d00d6f57b9aab8d0fc26157e0380c8d5da1d024eb8e808c74804c8e22c7c3888ca69a9e839d7b85e220c457a232dc4713cd7781aef1e174694f589d87073c4c55e2bc612bb5f4cf13242c9e27c99ae081c2178c62dfad3ec6e14ee8db8b6f95870dd50b6233f629403ee3eb9a6e89f71df5671fb0f876032fbfdd84b7d3e9b5ff6177f675b15c19abedbbbf9c7c626fb78befdfcc25879eb5ed112f04a5512cdd46656d98f20a98f396e59ed9da3e805ffa47d046773b78dced7625d3c6ab9a2e8dceda1c1149b4953a8d4ac03c8e19a238fc0b90d0f4ee, '83RZy6', 0),
(900, 6024, '2017-01-29 13:28:01', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''>fechafin'' at line 1\nThe SQL being executed was: SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita=$id_reporte->fechafin', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Schema.php', 633, 0x789ced5a7b6fdb3812ff2a8270c05e80755792df0a6e71b934dd2db6697b49b7c502020c5aa22dc692a85254626f91ef7e435292f560b28adb2c509cff486293a3e13c7ef352885c7bec7e21ae758adc89fb257347aeb92211364f337762b9e6b9eb6d519ca65ec803ea67de4b4e2f71407ceadde224a0ccdb1192d115177f1d2f587ae7348e5112bc48c354f000761149801d71e7f6181666c03f4f7c4e6822f6ed896bfa34b9c58c5f6c7d9c96eb63588e5096499aa16b027bc1fdda0f718c0ac67c974a391dd71cfc5cac21b6866710ac154a3942a9b96b62c6287b9daca8d81daa5d79ccc8b12c4bc8678b1f6b32823f8e38753c75cd3f686e84e8161b283124078324c68ee6ccb8feef1b23db251c6d4f0d10cadf183cc406a89ea3083e226ef894319ca53409328353f5d4256204bdfc8f9161062a1bf09381c2c60a188bc7195987bc602b9ec9336c241831e3879f57d80fd18a243f18c05a98d4b0cdd3fbcc0521178bbda9c016ef5fbeab99f25e28061b96ed9ad7176f2ece3f182458a4c82738e1f84743f25df884a31f0d4e52ba401c27be148ad1d8101b8b58781c199f7ebdb8baa83df0af7f00278653ca381e5402c291f2cc67c7d370e268f00458f99c63b67b0ddab104451d308d2a3015acfba3499d86b91f9e459182cc5ba9ada3d1763c7b4c5b302e089804de2dc1779997118ebdc294b646575ba3eaacd054caf20d94b4dc2f4297217c1cb575993fd5734b9461ef23e8a6739c336e9e6c57e1f89536bbef1809c283e1cf39615886c248e7a86faa9c339aea51c9801166efc3f45579ae26c5559c9f02caafb59a8a565b98c58610dd07b5595a6b2e56ab45e20a156d5bc402c43c4908e40ba9053ced58f67460d903c736cb7829f3428b605e2a2e29aef09a649c75f9cc2b3716c7678054b358aca53e07be2230404c031c65de95222f135d26d29280f7f8d911608fe61a04582502be95fb8747f73fd1fd2a4fcf84460ef0c0095a46f83c63ab8f28220152ae5aaa72091647d279ef114371951fa52b48994d85316561734d38368fa4c51cd9710806015ea13ce257345764b527c0303e2aebc8db4267e883c00251849979b89c1258678ca15d019cc7a455667bb7bcc13effa700e01d5e7a67691a41b9174c4f4a1f15aa9cf9b5fe8c009ab705c308417bc3952a935224c97fdee02f01fe3a11a1a2789d743d3904de156af736c9bc6b50e0bc6623f0863daf9bed2d8aa1e142bed2ccd2b329ac9100ad2403ed8c82ab1140a30762dd8295039c15a2154d9a14cd35ed1756b10ea86519e685357efff06a302b5c1ba1649da37519bab8aac919f4803e7e53db1e0bff0e7ebf6ed9518a18a3226c46aa88e18ce3a04293708b70e94f6534cbc5718db4f45651cff758b9c43ca441c95aad5dd5b854a89955716797815907294839acdcdbc3651a673b762df3d581a1dc5b57a71d89421abc8523857754451cca9851cd8f48d63f89643df0212534478b7d7c382dda25a51cf2104adb9462506950ae09e9d0cc5a342bb451766a9c396c51a19c877e24f2948e6180379c913c56b43011741902d506314e36835b4575478235e6830c47e019e7afb9b225f2756236b9a634a5100c83ad8e6193344e8395ced637344c08bf4d0ac56fd0d66779d0a1048c3828266b9a151e8450e33759a1579b5c240cadfe902b3127314e89dfc70f21e7a9de0f1d48657764c5213ea32edb0e0802bcccd71d2a485c4b1ce03fc9ba34461e90eec11dd5360cdd603c10f1a2337093185a002e8a4787d26a53060445b42b65c7b16b46baee82d0b85b32b446898f0a763bc8afc487b936ee78cb7ec45b3a4fddcb06a41698b5d6175c28c556432e3c5358f15e7ec938520dcbb0c8971185bc1e5ccaea2733c65826c6b9ca41ade2d7b33c0a5b96d1e489f0f42ef7d575563dae2339298fa83645207a57f0eb135eeed90880b7d974294fca842e2485ec5497c369a8b1df3c2941566251b5b7d28ade5989c8e13ecb3f4877228d0e4848ab343d2c5b4a14c424b910e122459c162bffc6a2678df00b9f4a94880295e5a9a8377be279b5d62617ad8530e68b146ac91d65c1158672fc816e7072b14de5c4275e1258d669bd6d9355304d0765b96a75446f0ba4ec8bd8a5829caa39adb72d0f01e7feabbaa667abd7c7a6b25753f9940ee5d053c43432d1bd231b1f348aee796b06d291a5194827e53c5a18fedbcca20d001e07cbe360f9bde680e360791c2c8f83e571b03c0e96a7c7c1f238581e07cbe360791c2cbf97c172fae4c1b2076fcd60391b9e3ef6af6e918b351730e635b5cf9b4d5fff5b18ff8753a6f0ecacd4a96d756df8d6cdde1b41bdee8934a005a2e7c926a177490b1f96b87231d7dc27994c0f7acb510f120d1cc79afb652225f9288a1622a12fc4ce0295e9e681eb62eac3f731cd1f34281d67db1eb36dcf62a01d245bbd6e6b9c6cee363bd0e65e8f4eb3f940ad4b7aa0b21ed6a534997ddfbdcab3bf5b38b47217173535ca15f729e5053df1597b59f7195e1cdbe3d103053e4f3e111e36f0dec73a7f595bec32fddaddc20d47bbe6b468716ced0553fb201ba860d2bd38d7e93f97ea37e0fc77f4368fd94277fdf4e9786805b0aedfd35c6d7cd41ce39a39f643635f536892754f830c7506991c048ec72d329ceaeeb483dc214a82085fa9caf0104c34ef05fac6c7bc4f7b22ea3c6cc8302d13e742ac34d2bf4c90b0784ee98660b3b42f2825de5bbd4ba29de277afde55ee0f2c1f5087895701c59e5cd7744bb2ef68eefd86d5bb1b78f8e22eba994eaffddf76671f57ebd00ab7af7e996793f176bbfafcc95e4bd38bb63d9685a0524aa4dbb8aa0d53590133d9b23c305b8ff7c6affca360a3bb1d3cea77bb527093554d9746675d8ca824da499d562d609e860c551cfe07b9e577dc, '5MPelG', 0),
(901, 6026, '2017-01-29 13:29:40', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''=2017-01-29'' at line 1', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Command.php', 900, 0x789ced5a596fdb4610fe2b819eea07a524254a220d14359ca408523b819de38580b12257d25abc422e2da981fe7b672f8ac7daa115bb8051be24ca7238bbf3cd3717b3c8356df707718d53e44edc1fb93b76070b12e2c169ee4e0c7770ee7a5b14a5a9b7a241e2e7de1b9a5ce080f8897787e320c9bc1d2179b2a0ec6fcb0be6de791245280e5ea7ab94e900752189411d711dc3808519e82f629f922466cfa7ee006fb15f50bea3ed0efc10e539fb6d5aeee0d39b8fd714511ce1984a6d74977251783afc43aea16c09af20d7707fecf7c4359fdf96d1c46adb628edcc1f70267bbf731c5598cc29649a0017457547730ca12ee11bb61eaafcec2901dc13cbd3c65d65a1a6bedd943d62eb2040e1807de1dc19bdccb09c55e86d324a3d8d4d86a6a4c9d494bf9599ec048e9b911fc1c376d711eebb939cab1f7156cd339ceb2eb3b9b0ade5fc56cafe37686bf1724839dc1b8b1ce514f6a9c359eea599981229c7d5aa5efd4be55878d84c34acd8f21e5afa226a2d564b09810a224b891cf070a2d87ad968bc465269a268b057f85484c7c92702be06dcb30a743c31c5ae640c50bc82c48dc127094e15ce20a2f494eb3b61ea774a3dc3e07a60ee4e2cd4d09a105ff440040940438ccbd2b219e229f40e2c220b2df337adbcfce0073ec68186028063c95fb47bdfb1fe97e91a767cc220b74e018cd437c9e678baf28240112ae9a031aa2f021eebc4f284351991fb92b88caa60c4c5ed8dc016c5b841c31cbe248825c8017a808e955222b6be50d00c647aa8e5c4a9b7df054968421ce06c79f9313eb2ccbd04e12e7a1d30ad83ece6fb14f7f6304dce0b97796a621f1f93627ca47d294b392cfb00901366fa5c210edc04a61ca441d89eb776afa39c1dfc72c5484ae93b62747a0bb64ed0193dcbb0603ce2b1881374ca70adb258a700e2e1796197a35128d1864b91858f74a6a7d15e057ece8778072807379b43b78495a03b2e66b43ae036bb31c5389c697cfef8633e9da10c5cb022d55e8e2b226e74991f9f8efca639bf977f8e5ba81233f628464d88c4511c339c541c926e616e6d2df5534f345bb22aabc25ebf9812b1798ae9240a9166b57152d256b6665dc992a30ab2485538e4af7767099c6d99659c97c556208f756cd6946223b0ddec296cc3ba2228e78cc88e68725ebdf59b21efa90127c9c56a87b880fab213b4f120a7908a54d4973d2905c12d29299356416682d70aaed396a48a182aefc90c8febaa930c06b9a912212b245ae5108526b9451b21ede09a90d0996980e731c8267ac9f6bcde6c8d71db3ae354dd2048261b8d529ac8b4669b0d0617d9bac6242ef6269f82ddafa5911b4248123168ac832c9a50721d4e86d2eed6a8ab384a1b51f7225a624c229f1bbf8614569aaf7438b52f9862c28c467d856db224180e7c5b22505896b8e03fc0f592a308a80b4376e99b6ced02dc643162f3a80ebc2d00250563c5a9246533220284cdaa76c39769991b6bb203436f30c2d51ec23a96e07f995f88b248b5ade321ff096ce537bde805402b3d2fa820bf9b109af86f08e4471cfff91b3b9954f1c325f8609e4f5e082573f9e316c9e181d91831ac5af63796458aa68f258787a1787ea3a2b5fd7899ca82dca872c10bd2bf8e31b9e1fd4308237d5b4254f5442672785ec543d875533e3f0f044914c7151b4b71c45ef4c317274c8f2f7ca9d70d081096999a647aaa5444144e2b72c5cf811a772e54fcc7ad610bff613ce1256a0f22265f5e620ec946b4d71d65a30305fa7504b3649165c6128c79f93358edf6e533ef1b18f0486715a6ddb78154cd3a12a578d8ee85232e550c42e04e544cda917af7b89b3ffa5aee9d9ea75df54766a2a1fd3a11cbb0b9b4626ba6f64f651a3e841b766201d1b9a8174a2e65109fcd3cca23502f683653f58bed41cd00f96fd60d90f96fd60d90f96a7fd60d90f96fd60d90f96fd60f95206cbe9a307cb0eba3583e56c74fad07f75b35cacb980e154cc3eaf377ddd6f61fc0fa74ce6d999b2a989ba367cabb0776650a77b22356ac1d18b781d279bb8c10f835db97034f74926d3a3be725483444347db6ed391a5241f85e10d4be837ecc90d52e9a64dadca8f9731cd1f3528f5b36d87d9b66331d00e928d5eb7314ed69fd63bd0fab30e9d66fd854a97744f653dae4ba92b7bd9bdcab37f5b38b6728b5143679cbc4fc92fe8b1dfda8ba2cff0e1d8b4c7f714f822fe46e8aac6f72ee8fcb4b6982afd9aedc20d5bbb83a96c714ced0553f3280c4430e93e9cebec77b8f9353aff17bdcd4358e8ae9f3e9e0f8d00d6f57b9aab8d0fc26157e0380c8d5da1d024eb8e808c74804c8e22c7c3888ca69a9e839d7b85e220c457a232dc4713cd7781aef1e174694f589d87073c4c55e2bc612bb5f4cf13242c9e27c99ae081c2178c62dfad3ec6e14ee8db8b6f95870dd50b6233f629403ee3eb9a6e89f71df5671fb0f876032fbfdd84b7d3e9b5ff6177f675b15c19abedbbbf9c7c626fb78befdfcc25879eb5ed112f04a5512cdd46656d98f20a98f396e59ed9da3e805ffa47d046773b78dced7625d3c6ab9a2e8dceda1c1149b4953a8d4ac03c8e19a238fc0b90d0f4ee, '5uBHoA', 0),
(902, 6026, '2017-01-29 13:29:40', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''=2017-01-29'' at line 1\nThe SQL being executed was: SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita==2017-01-29', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Schema.php', 633, 0x789ced5a6d6fdb3812fe2b82beec05587725f9550af670d934dd2db669bb49b7c502020c5aa26dc692a85254626f91ff7e435292f5c26415b739a0387f486293c32167e6993786c8b3c7de17e259a7c89b785f326fe4994b1261f334f32696679e7bfe16c569eaaf794883cc7fc9e9250e4940fd5b9c8494f93b4232bae4e2afe3870bff9cc6314ac217e93a153c805d441260473cd71ec3c00cf8e749c0094dc4bc3df1cc8026b798f18b6d80d3727c0cc311ca324933f44c602fb85f076b1ca38231dfa5f29c8e670efe5d8c21b6823508c60aa11c2194eb999831ca5e274b2a66876a566e33722ccb12e7b3c58f3519c11f47ec3a86557fd1dc58a35b6ca0c4901c0c92183b9a33e3fa8f3746b64b38da9e1a70a86063f0353640f41c45f0117123a08ce12ca54998199caa55978811f4f21723c30c4436e02703818d253016cb1959ad79c156acc9336c241831e3879f1dcb9e0e2c7be0b83f18c05c28d5b0cdd3fbcc9b7ae67cbe571668e3fdcb773565de0bd14007b6675e5fbcb938ff6090709ea280e084e31f8d250ed6681e108e7e343849e91c719c04f2548cc6869898c7c2e4c8f8f4dbc5d5456dc1cfb553c13e72a36787d170e268600410f99c63b67b0d32b104451d0c8d2a0c15acfb8348ed8679b03e8b228594b7525a4723ed78f698b4a052386012fab704df657e4638f6194e29e3d8d6c86a6b449d1592cab37c03212def8b9065081f476d59dca75a6e8132ec7f04d9748673c6cd9dedca0bbf5267f71d25814f30fc39270c4bfc8f7486faa6c239a3a91e950c1861f67e9dbe2af7d544b68af35340f9b55a53de6a0bb5d8e0a210148a79b3d4962b46ab41e209116d5bf802440092108812520a585d0502db2cfd05689624e910b8a5e092e20aaf48c659978f5b99b1d83e03a49ac5602dde39f0158102621ae228f3af147919de32119604bcc7cf8e007be46a10609508f856e61f1ecdff44f3ab383d131239c003276811e1f38c2d3fa2888448996a2173a4489e481aef3d6228aee2a3340529a3a950a64c6c9e09dbe691d498230b0dc120c44b9447fc8ae68aacb6021413a0328fbc2d6486f2073410459899879f5302eb8c31b42b80f3d86995dade2d6e70c0ff2500788717fe599a4690e405d393d24685286741ad2c2380e66dc1304250d57025caa43c92e4ef36f84b80bf4e84ab285e275d4b0e817785dabd4e32ff1a0438afe908ac61bb75b5bd4531d459285092597a36853612a09564209d51703542a8efe058b7a0e51067c5d18ada4c1ecd33ed1756310ea86519e68536fefcf06a302b4c1ba16495a355e9bab8cac919947e017e539b1e0bfb0efebc6ee9511e314685db8c5412c319c7618526611661d29f4a6f9683e31a6969ad229fefb17289f99a86256b357655e352a16656f99d5d3a661da470ca6165de1e26d318dbb16b91af0e0c65deba386d4f14a7c15bd852584765c4a1f41955fc8860fd9308d683004242b3a3d8fb87d3a25d50ca210ea1b44d29fa9306e58a900ecdac45b3441ba5a7c69ec31615caf93a88449cd2310cf1863392c78a161a812e43a0da20c6c96670aba8ee48b8c27c90e1082ce3fc3357b64081ee984dae294d2938c360ab63d8248dd370a9d3f50d5d2784df2685e037681bb03cec5002461c149315cd0a0b82abf19bac90ab4d2e0286567e8895989318a724e8638735e7a9de0e1d48657764c9c13fa32edb0e0842bcc8571d2a085c0b1ce2bfc9aa54461e92eec61dd1360cdd603c10fea2537093184a002e924787d26a53860445b47bca8e61578c74cd05ae71b7606885920015ec76105f4900ed6cdcb196fd88b57496ba970548cd316ba52f98501e5b75b6b0a6d0e2bdfc9271a40a9661112f230a713dbc94d94f468cb10c8cae8a41ade4d7333d0a5d96dee40bf7f42ff7d975562dd7919c945b5493c211fd2bf8f5092ff66c04c0db6cba94276540172785e8543f87d310633f795282acc4a22a6fa516fdb31291c37d947f90ee442a1d909056617a589694288c497221dc451e715a8cfc078b9a35c22f022a5122125496a722dfec89dd6aac4d2e4a0ba1cc1729e4923bcac22b0ce9f803dde0e4629bca8e4f5c1258d669bd6c9359304d0765ba6a55446f0ba4ec93d8a5829cca39ad2b96878073ff5555d3b3e5eb6351d9aba87c4a8572e82ea21b99e8eec8c607b5a27bde9a867464691ad249d98f168aff36bd680380c7c6f2d8587eaf31e0d8581e1bcb6363796c2c8f8de5e9b1b13c3696c7c6f2d8581e1bcbefa5b19c3eb9b1ecc15bd358ce86a78ffdab5bc462cd030cb726f679b3e8ebff0ae3ffb0cb14969d9532b5b5ae75dfbada7b23a8d73b9106b4e0e879b249e85dd2c287259e5cb89af72493e941b71c7527d1c071ac795626425280a2682e02fa5ccccc51196e1e7825a63e7c1fddfc418dd2b1b7edd1dbf64c06da46b255ebb6dac9e66cb3026dcef5a8349b0b6a55d20399f5b02aa5c9ecfbae559efd6ee1d0ccad5a0d9d70c57b4af9404f7cd6bed17d868b637b3c7a20c1e7c927c2d70dbcf7d1ce3fe616bb0cbf763771c3d69e392d4a1c5bfbc0d43e4807ca997417e73af95d297e03ceff8bdae6315de89e9f3e1d0f2d07d6d57b9aa78d8faa635c53c7be69ecab0a4db0eea990a14e219383c0f1b8468653dd537638f71a256184af54667808269a7b81befee1f6294f449e8709e9a665e09c8b9146f897011206cf29dd106c96fa05a1c4bdd5bb24da297ef7eaae72bf61b9406d26ae028a3939aea99664ddd19cfb1dabbb1b587c7117dd4ca7d7c1efbbb38fcbd5da5a6f5ffdea6693f176bbfcfcc95e49d58bb23d9689a0124a84dbb8ca0d5399013359b23cd05b8ff7caafeca360a37b1d3ceaf7ba527093594d1746675d8ca820da099d56cd619e860c951cfe0ba71b70ae, '89oEEo', 0),
(903, 6027, '2017-01-29 13:30:23', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''=2017-01-21'' at line 1', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Command.php', 900, 0x789ced5a596fdb4610fe2b819eea07a524254a220d14359ca408523b819de38580b12257d25abc422e2da981fe7b672f8ac7daa115bb8051be24ca7238bbf3cd3717b3c8356df707718d53e44edc1fb93b76070b12e2c169ee4e0c7770ee7a5b14a5a9b7a241e2e7de1b9a5ce080f8897787e320c9bc1d2179b2a0ec6fcb0be6de791245280e5ea7ab94e900752189411d711dc3808519e82f629f922466cfa7ee006fb15f50bea3ed0efc10e539fb6d5aeee0d39b8fd714511ce1984a6d74977251783afc43aea16c09af20d7707fecf7c4359fdf96d1c46adb628edcc1f70267bbf731c5598cc29649a0017457547730ca12ee11bb61eaafcec2901dc13cbd3c65d65a1a6bedd943d62eb2040e1807de1dc19bdccb09c55e86d324a3d8d4d86a6a4c9d494bf9599ec048e9b911fc1c376d711eebb939cab1f7156cd339ceb2eb3b9b0ade5fc56cafe37686bf1724839dc1b8b1ce514f6a9c359eea599981229c7d5aa5efd4be55878d84c34acd8f21e5afa226a2d564b09810a224b891cf070a2d87ad968bc465269a268b057f85484c7c92702be06dcb30a743c31c5ae640c50bc82c48dc127094e15ce20a2f494eb3b61ea774a3dc3e07a60ee4e2cd4d09a105ff440040940438ccbd2b219e229f40e2c220b2df337adbcfce0073ec68186028063c95fb47bdfb1fe97e91a767cc220b74e018cd437c9e678baf28240112ae9a031aa2f021eebc4f284351991fb92b88caa60c4c5ed8dc016c5b841c31cbe248825c8017a808e955222b6be50d00c647aa8e5c4a9b7df054968421ce06c79f9313eb2ccbd04e12e7a1d30ad83ece6fb14f7f6304dce0b97796a621f1f93627ca47d294b392cfb00901366fa5c210edc04a61ca441d89eb776afa39c1dfc72c5484ae93b62747a0bb64ed0193dcbb0603ce2b1881374ca70adb258a700e2e1796197a35128d1864b91858f74a6a7d15e057ece8778072807379b43b78495a03b2e66b43ae036bb31c5389c697cfef8633e9da10c5cb022d55e8e2b226e74991f9f8efca639bf977f8e5ba81233f628464d88c4511c339c541c926e616e6d2df5534f345bb22aabc25ebf9812b1798ae9240a9166b57152d256b6665dc992a30ab2485538e4af7767099c6d99659c97c556208f756cd6946223b0ddec296cc3ba2228e78cc88e68725ebdf59b21efa90127c9c56a87b880fab213b4f120a7908a54d4973d2905c12d29299356416682d70aaed396a48a182aefc90c8febaa930c06b9a912212b245ae5108526b9451b21ede09a90d0996980e731c8267ac9f6bcde6c8d71db3ae354dd2048261b8d529ac8b4669b0d0617d9bac6242ef6269f82ddafa5911b4248123168ac832c9a50721d4e86d2eed6a8ab384a1b51f7225a624c229f1bbf8614569aaf7438b52f9862c28c467d856db224180e7c5b22505896b8e03fc0f592a308a80b4376e99b6ced02dc643162f3a80ebc2d00250563c5a9246533220284cdaa76c39769991b6bb203436f30c2d51ec23a96e07f995f88b248b5ade321ff096ce537bde805402b3d2fa820bf9b109af86f08e4471cfff91b3b9954f1c325f8609e4f5e082573f9e316c9e181d91831ac5af63796458aa68f258787a1787ea3a2b5fd7899ca82dca872c10bd2bf8e31b9e1fd4308237d5b4254f5442672785ec543d875533e3f0f044914c7151b4b71c45ef4c317274c8f2f7ca9d70d081096999a647aaa5444144e2b72c5cf811a772e54fcc7ad610bff613ce1256a0f22265f5e620ec946b4d71d65a30305fa7504b3649165c6128c79f93358edf6e533ef1b18f0486715a6ddb78154cd3a12a578d8ee85232e550c42e04e544cda917af7b89b3ffa5aee9d9ea75df54766a2a1fd3a11cbb0b9b4626ba6f64f651a3e841b766201d1b9a8174a2e65109fcd3cca23502f683653f58bed41cd00f96fd60d90f96fd60d90f96a7fd60d90f96fd60d90f96fd60f95206cbe9a307cb0eba3583e56c74fad07f75b35cacb980e154cc3eaf377ddd6f61fc0fa74ce6d999b2a989ba367cabb0776650a77b22356ac1d18b781d279bb8c10f835db97034f74926d3a3be725483444347db6ed391a5241f85e10d4be837ecc90d52e9a64dadca8f9731cd1f3528f5b36d87d9b66331d00e928d5eb7314ed69fd63bd0fab30e9d66fd854a97744f653dae4ba92b7bd9bdcab37f5b38b6728b5143679cbc4fc92fe8b1dfda8ba2cff0e1d8b4c7f714f822fe46e8aac6f72ee8fcb4b6982afd9aedc20d5bbb83a96c714ced0553f3280c4430e93e9cebec77b8f9353aff17bdcd4358e8ae9f3e9e0f8d00d6f57b9aab8d0fc26157e0380c8d5da1d024eb8e808c74804c8e22c7c3888ca69a9e839d7b85e220c457a232dc4713cd7781aef1e174694f589d87073c4c55e2bc612bb5f4cf13242c9e27c99ae081c2178c62dfad3ec6e14ee8db8b6f95870dd50b6233f629403ee3eb9a6e89f71df5671fb0f876032fbfdd84b7d3e9b5ff6177f675b15c19abedbbbf9c7c626fb78befdfcc25879eb5ed112f04a5512cdd46656d98f20a98f396e59ed9da3e805ffa47d046773b78dced7625d3c6ab9a2e8dceda1c1149b4953a8d4ac03c8e19a238fc0b90d0f4ee, '7HMW0s', 0);
INSERT INTO `audit_error` (`id`, `entry_id`, `created`, `message`, `code`, `file`, `line`, `trace`, `hash`, `emailed`) VALUES
(904, 6027, '2017-01-29 13:30:23', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''=2017-01-21'' at line 1\nThe SQL being executed was: SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita==2017-01-21', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Schema.php', 633, 0x789ced5aeb6fdb3812ff57047fd90bb0ee4af25bc11e2e9ba6bbc5366d37e9b6584080414bb4cd5812558a4aec2df2bfdff021590f26abb8cd01c5f943129b1c0e3933bf7931449e33f2be10cf3e45ded8fb927943afb72411ee9d66ded8f67ae79ebf45719afa6b1ed220f35f727a89431250ff16272165fe8e908c2eb9f8ebfae1c23fa7718c92f045ba4e050f60179104d8116fe68c60600afcf324e0842662de197bbd8026b798f18b6d80d3627c04c311ca324933f07ac05e70bf0ed638469a31dfa5f29caed7ebff5b8f21b6823508c6b450ae106ae6f5306394bd4e9654cc0ed4acdc66e8dab62dcee7881f7b3c843faed87504abfea2b9b546b7d8428925395824b1763467d6f51f6fac6c9770b43db5e050c1c6e26b6c81e8398ae023e2564019c3594a9330b33855ab2e1123e8e52f568619886cc14f06025b4b602c9633b25a73cd56acc9336c251831eb879f5ddb99f46da7ef3a3f58c05c28d5727aa7f79937f17af3f95e59a08df72fdf5594792f44031d385eeffae2cdc5f9078b84f3140504271cff682d71b046f38070f4a3c5494ae788e32490a76234b6c4c43c162647d6a7df2eae2e2a0b7eae9c0af6911b3d3b8c0663d7002380c8e71cb3dd6b908925286a6168586248b3ee0e22b51be6c1fa2c8a1452de4a695d83b4a3e963d2824ae18049e8df127c97f919e1d86738a58c63c720ab631075aa259567f90642dade1721cb003e0e9bb2cc9e6ab905cab0ff11643319ce1dd577764a2ffc4a9dddb794043ec1f0e79c302cf13f3419ea9b0ae70e276654326084d9fb75faaad8d710d94ace4f01e5d76a4d79ab23d4e2808b4250d0f3bd425b33315a0e124f88e838c2172002908440949052c0ea6a20d0fe02344b92b4086685e092e20aaf48c6599bcfac34a3de3e03a4f6f46025deb9f0158102621ae228f3af147911de32119604bc47cf8e0067383320c02e10f0adcc3f389aff89e657717a2a247281074ed022c2e7195b7e4411099132d542e648913c9134de7bc4505cc647690a524453a14c99d8bc1e6c9b475263ae2c340483102f511ef12b9a2bb2ca0a504c808a3cf256cb0ce50f68208a30eb1d7e4e09ac33c6d04e03e7b1d32ab5bd5bdce080ff4b00f00e2ffcb3348d20c90ba627858db4286741a52c2380e6ad661821a86ab812655c1c49f29fd5f84b80bf4e84ab285e276d4b0e807789dabd4e32ff1a0438afe808ace1ccaa6a7b8b62a8b350a024b3cd6cb43612a09564209da5b95a21d47770ac5bd07288337d345d9bc9a3793de785adc701b52cc35c6be3cf0faffa536dda0825ab1cad0ad7c5654ecea0f40bf09bcaf448d8b7ffe775438ff28831d26e3354490c671c87259a845984497f2abc590e8e2aa485b5743edf63e512f3350d0bd66aecaac2a544cdb4f43ba770cc2a48e19483d2bc1d4c6630b6eb54225f1518cabc55719a9e284e83b7b0a5b08eca8803e933aaf811c1fa2711acfb0184847a47b1f70fb741bba094431c42699352f42735ca15212d9a69836689364a4fb53d070d2a94f375108938656218e20d67248f152d34026d8640b5418c934dff5651dd917085793fc31158c6fd67ae6c8102d331eb5c539a527086fed6c4b04e1aa7e1d2a4eb1bba4e08bf4db4e037681bb03c6c5102465c149315cdb405c1d5f84da6e56a928b8061941f6225e624c62909bad861cd796ab6430b52d91d5972f0cfa8cdb60582102ff2558b0a02d70287f86fb22a949187a4bd714bb40d433718f785bf98145c278612808be4d1a2b49b942141116d9fb265d815236d73816bdc2d185aa124409add0ee22b09a09d8d5bd6721eb196c952f7b200a93866a5f40513ca63abce16d6682ddecb2f1947aa6019e878195188ebe1a5cc7e32628c64609ca918d4487e1dd3a3d065e14dbe704fff729f5da7e57213c949b14539291cd1bf825f9ff062cf4600bcc9a64d795204747152884ed573b83531f6932705c80a2caaf2566ad13f2b1039d847f907e94ea4d201096919a607454989c2982417c25de411277ae43f58d4ac117e1150891291a0b23c15f9664f3c2bc79ae4a2b410ca7c91422eb9a32cbcc2908e3fd00d4e2eb6a9ecf8c425816d9f56cb369905d3b45fa4ab4645f45623659fc42e15e454ce695cb13c049cfbafaa9a9e2d5f1f8bca4e45e5532a94437711ddc8d87447363aa815ddf33634a443dbd0908e8b7e542bfedbf4a235001e1bcb6363f9bdc6806363796c2c8f8de5b1b13c3696a7c7c6f2d8581e1bcb6363796c2cbf97c672f2e4c6b2036f4363391d9c3ef6af6e118b0d0f306615b1cfeb455ff75718ff875da6b0ecb490a9a975a3fb56d5de19419dde89d4a00547cf934d42ef92063e6cf1e46266784f329e1c74cb517512031c47866765222405288ae622a0cfc5cc1c15e1e6815762eac3f7d1cd1fd4281d7bdb0ebd6dc764606c241bb56ea39daccfd62bd0fa5c874ab3bea052253d90590fab52eaccbeef5ae5d9ef160ecddcaad53009a7df53ca077ae2b3f18dee335c1c3ba3e103093e4f3e11beaee1bd8b76fe31b73845f875da891bb6f67a135de238c607a6ce413a50ce64ba3837c93f93e2d7e0fcbfa86d1ed385e9f9e9d3f1d0706053bd6778daf8a83a461575ec9bc6aeaa3004eb8e0a199814323e081c8f6b6430313d658773af511246f84a6586876062b817e8ea1fb32ee589c8f33021ddb4089c7331520bff3240c2e039a51b827b857e4128716ff52e89768adfbdbaabdc6f582c509b89ab003d27c70dd592ac3bea73bf637577038b2feea29bc9e43af87d77f671b95adbebedab5f67d978b4dd2e3f7f725652f5a26c8f6522288512e1362e73c34466c04c962c0ff4d6a3bdf24bfb28d8985e070fbbbdae14dc64563385d1691b232a88b642a75d7198a721432587ff02aa5e709e, '8FWfFq', 0),
(905, 6031, '2017-01-29 13:32:25', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''fecha_cita2017'' in ''where clause''', 42, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Command.php', 900, 0x789ced5a596fdb4610fe2b819eea07a524254a220d14359ca408523b819de38580b12257d25abc422e2da981fe7b672f8ac7daa115bb8051be24ca7238bbf3cd3717b3c8356df707718d53e44edc1fb93b76070b12e2c169ee4e0c7770ee7a5b14a5a9b7a241e2e7de1b9a5ce080f8897787e320c9bc1d2179b2a0ec6fcb0be6de791245280e5ea7ab94e900752189411d711dc3808519e82f629f922466cfa7ee006fb15f50bea3ed0efc10e539fb6d5aeee0d39b8fd714511ce1984a6d74977251783afc43aea16c09af20d7707fecf7c4359fdf96d1c46adb628edcc1f70267bbf731c5598cc29649a0017457547730ca12ee11bb61eaafcec2901dc13cbd3c65d65a1a6bedd943d62eb2040e1807de1dc19bdccb09c55e86d324a3d8d4d86a8edba6cea4a5fc2c4f60a4f4dc087e8e9bb6388ff5dc1ce5d8fb0ab6e91c67d9f59d4d05efaf62b6d7713bc3df0b92c1ce60dc58e7a82735ce1a4ff5accc4011ce3eadd2776adfaac346c261a5e6c790f2575113d16a32584c085112dcc8e7038596c356cb45e232134d93c582bf4224263e49b815f0b66598d3a1610e2d73a0e2056416246e0938ca702e71859724a7595b8f53ba516e9f03530772f1e6a684d0827f2200204a021ce6de95104f914f20716110d9ef19bded6767803976340c3014039ecafda3defd8f74bfc8d3336691053a708ce6213ecfb3c5571492000957cd010d51f81077de2794a1a8cc8fdc1544655306262f6cee00b62d428e98657124412ec00b5484f42a9195b5f20600e32355472ea5cd3e782a4bc2106783e3cfc989759665682789f3d069056c1fe7b7d8a7bf31026ef0dc3b4bd390f87c9b13e52369ca59c967d884009bb75261887660a53065a28ec4f53b35fd9ce0ef63162a42d749db9323d05db2f68049ee5d8301e7158cc01ba65385ed12453807970bcb0cbd1a89460cb25c0cac7b25b5be0af02b76f43b4039c0b93cda1dbc24ad0159f3b521d781b5598ea944e3cbe777c399746d88e26581962a74715993f3a4c87cfc77e5b1cdfc3bfc72ddc0911f3142326cc6a288e19ce2a06413730b73e9ef2a9af9a25d1155de92f5fcc0950b4c5749a0548bb5ab8a969235b332ee4c15985592c22947a57b3bb84ce36ccbac64be2a31847babe63423919d066f614be61d5111473c6644f3c392f5ef2c590f7d48093e4e2bd43dc487d5909d2709853c84d2a6a43969482e0969c9cc1a320bb41638d5f61c35a45041577e48647fdd5418e035cd481109d922d72804a935ca28590fef84d486044b4c87390ec133d6cfb56673e4eb8e59d79a266902c130dcea14d645a33458e8b0be4d5631a177b134fc166dfdac085a92c0110b456499e4d283106af436977635c559c2d0da0fb9125312e194f85dfcb0a234d5fba145a97c431614e2336cab6d9120c0f362d99282c435c701fe872c15184540da1bb74c5b67e816e3218b171dc075616801282b1e2d49a32919101426ed53b61cbbcc48db5d101a9b79869628f69154b783fc4afc4592452d6f990f784be7a93d6f402a8159697dc185fcd88457437847a2b8e7ffc8d9dcca270e992fc304f27a70c1ab1fcf18364f8c8ec8418de2d7b13c322c5534792c3cbd8b43759d95afeb444ed416e5431688de15fcf10dcf0f6a18c19b6ada92272aa1b3934276aa9ec3aa99717878a248a6b828da5b8ea277a618393a64f97be54e38e8c084b44cd323d552a22022f15b162efc8853b9f227663d6b885ffb0967092b507991b27a731076cab5a6386b2d1898af53a8259b240bae3094e3cfc91ac76fb7299ff8d84702c338adb66dbc0aa6e95095ab4647742999722862178272a2e6d48bd7bdc4d9ff52d7f46cf5ba6f2a3b35958fe9508edd854d2313dd3732fba851f4a05b33908e0dcd403a51f3a804fe6966d11a01fbc1b21f2c5f6a0ee807cb7eb0ec07cb7eb0ec07cbd37eb0ec07cb7eb0ec07cb7eb07c2983e5f4d1836507dd9ac172363a7de8bfba592ed65cc0702a669fd79bbeeeb730fe875326f3ec4cd9d4445d1bbe55d83b33a8d33d911ab5e0e845bc8e934ddce087c1ae5c389afb2493e9515f39aa41a2a1a36db7e9c852928fc2f08625f41bf6e406a974d3a656e5c7cb98e68f1a94fad9b6c36cdbb1186807c946afdb1827eb4feb1d68fd59874eb3fe42a54bbaa7b21ed7a5d495bdec5ee5d9bf2d1c5bb9c5a8a1334edea7e417f4d86fed45d167f8706cda9a6b87bcc017f137425735be7741e7a7b5c554e9d76c176ed8da1d4c658b636a2f989a4761208249f7e15c67bfc3cdafd1f9bfe86d1ec24277fdf4f17c6804b0aedfd35c6d7c100ebb02c76168ec0a852659770464a403647214391e466434d5f41cecdc2b140721be1295e13e9a68be0b748d0fa74b7bc2ea3c3ce061aa12e70d5ba9a57f9e2061f13c49d6040f14be6014fb6ef5310e7742df5e7cab3c6ca85e109bb14f01f2195fd7744bbcefa83ffb80c5b71b78f9ed26bc9d4eaffd0fbbb3af8be5ca586ddffde5e4137bbb5d7cff662e39f4ac6d8f7821288d62e9362a6bc39457c09cb72cf7ccd6f601fcd23f8236badbc1e36eb72b99365ed5746974d6e68848a2add4695402e671cc10c5e15fed1ef4f0, '4QVomM', 0),
(906, 6031, '2017-01-29 13:32:25', 'SQLSTATE[42S22]: Column not found: 1054 Unknown column ''fecha_cita2017'' in ''where clause''\nThe SQL being executed was: SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita2017-01-29', 42, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Schema.php', 633, 0x789ced5a5b6fdb3816fe2b865fba01c61d4bbe4a01061364d2dd62266d91f4f222c0a025da6622892a45c5ce14f9ef7b0e29c9ba3019c56d1628d60f6d13f2e8f05cbe7363495c6be27e63eef094b853f75bea8eddfe8a85b47f9abad3a1db3f77bd1d8992c4dbc880fba9f787e49734603ef7ee681c70e1dd3396f295c47f6d2f587ae73c8a481cbc4e3609f20076218b811d731d6b020b73e09fc5be643cc67d6beaf67d1edf51212f763e4d8af5092c87244d15cdc8ed037be47eed6f684472c6f23e5172da6e7ff05bbe46c41abe21b0962b65a3528edba74270f1365e71dc1de95d75ccd8beb66d94cfc23fc3c918feb191197cf429be8df936eef93ccca2b8f76a45fd0d59f84c127b68cd5ef518ac6d3754d01e089ba5f455fff42175676e7fb1d84b0fe27df8e37d45bb073c0b2c01075c5ffc7571feb1c78245427c4663497fe9ed0ff9a52759c21744d2d8872f7b2bc1a31e6e2c22f401e97df9cfc5d545af2ed560680d6c074e51c7bcb8574753dbe055f0d8d78c8afbb7a0918849d872e9b87469cebabb4ff56954fa9bb330d48e7ba7b4b50dda4ee64f690b060501e3c0bb63749b7a2993d41334e14252cba0ab356eab3acf3555b2fc002587ee37d465043f8e9bba38cff5dc92a4d4fb0cba991c674fea275b65507ca7cd1e5a46828810f46bc60455e81f9b1cf54395b3c733332a0530a2e2c32679539c6b483425e7e780f27bada6a3d542b35810a29012f2fd7e612d0757cb45e6a28a9685b100f1cf6206394269015f9789c0ea17f102342b16b7089c4271457145d72c95a2cdc729dd981f9f0252fbf96225dbd9f02b0103443ca061ea5d69f222b9a5989610de9317478035760c08181608f851ee1f1dddff4cf7eb3c3d478d6ce04163b20ce9792a569f49c802a25db55415124b2751cefb400489cafca85cc18a6c8ac65485cdedc3b159a82c66abba8f0c02ba225928af78a6c92a5f80617c52d49177b9ced08d8005c2908afee1722a609d0941ee73e03c25ad36dbfbe50df5e5bf10805bbaf4ce922484128f4c4f0a1fe5aa9cf9952e89019a7739c390dc83965a95692192e2efd4f82b80bf8d315434af93b62747c0bb44edde26a9770d0a9c576c04deb09caad9de9188a6e072add9d0cc26b7460cb48a0cb4ebe55c7b01eda1e87760e580a6b968d021a6b936406bbd1ee6eb805a9152995be3d3c7378379eeda90c4eb8cac8bd0a5654d4e79267cfa57657b82fe1d7cba6ed8518918913c6cc6ba88d154d2a04413ba055dfa6b11cd6a7152212dbc95d7f33d562ea9dcf0a060add7ae2a5c4ad4cccbb8b38ac0ac8214a41c95eeede03283b36dab92f9aac0d0eeadaad38c449486eee048f48eae88231533baf9c164fd2b26eb810f29a1dee0efe3c36ed02e3997908748d2a4c471a146b966ac45336fd0acc8adb653edcc51838a6472e38798a74c0c037a2b05cb224d0bad7e9b2150dd1221d9ede04e536d59b0a67290d2103c63ff3357b124be49cc3ad784271c8261b03331ac934649b032d9fa866f6226efe25cf11bb2f34516b42801233689d89aa7b90721d4e44d9aebd524c78461d41f7225952ca209f3bbf861236562f6430b52e996ad24c467d866db02414097d9ba4505896b4903fa375b17c6c802d63eb8a5daad2037940e305e4c06ae13430b20b178b428874dca809190b7a56c39762d58db5d101adba5206b12fb2467770ff995f92b2ea296b7ac27bc65f2d4836a402a8159697dc1854a6c3dd7c237b9151fd42fa924ba6119e5f932e490d7834b55fd54c698a8c4e8e81cd4287e1dcb23dab288260fc3d3bbdc57d779f9b989e4a438a2dcc440f4aee0af2f74b96783006fb269539e14091d2585ec5495c3aea9b1df3c2940566051b7b7ca8ade5981c8d13ecb3f4a77a28c0e4848ca343d2a5a4a12442cbec0705122cef295df29f6ac217ded7385122c50699660bdd9133be55a931c5b0b34e6eb046ac9968be08a4239fec86f697cb14bd4c4879704c3e169b56d535530490645b96a7444ef72a4ec8bd8a5869cae398d0b96c780f3f05d5dd38bd5eb6353d9a9a97c4e8772e829388d4c4d7764938346d13d6fc3403a1e1a06d269318fe686ff31b3680d80c7c1f23858feac39e038581e07cbe360791c2c8f83e5e971b03c0e96c7c1f238581e07cb9f65b09c3d7bb0ecc0db3058ce47a74ffd5737e662c3030ca7a2f679bde9ebfe0ae3ff70ca44cfce0b9d9a5637866fd5ec9d11d4e99d480d5a207aa69f2b35f031c427178ee13dc97476d02d4735480c709c185e79614af249182e30a12f7067418a74f3c8a32dfdc3cf31cd1f34281d67db0eb36dc762601c241bbd6e639cacefd63bd0fa5e874eb3fe41a54b7aa4b21ed6a5d499fddcbdca8bdf2d1c5ab9f5a861522e7f4fa91ee8e1cfc627b32f70716c4d0ccf0e5581cfe22f4c6e6a78ef629d7fac2d56917ead76e186a3ddfe2c6f712ce30353eb201be860325d9c9bf47794fa3538ff2f7a9ba76c617a7efa7c3c3402d8d4ef199e363e698e49c51cfba1b1ab290cc9baa3414626834c0f02c7d31619cd4c2fcb41ee0d8983905ee9caf0184c0cf7025de3c3e9d29e609d870d15a645e25ce04a2dfdab04098be79cdf32da2fec0b4ae1bdd5fb38bcd7fc1ef45de5fec0e2037d185e05e47b6addd02da9bea3bef727d57737f0f1c536bc99cdaefd3fefcf3eafd69be166f7e6df4e3a9dec76abaf5facb5323db6ed912a04a552986ea3b236cc54054c55cbf2c86c3dd91bbff48f868de975f0b8dbeb4ae4a6aa9a298dcedb18d149b4953a879580791e327471f82fc3084a1e, '80LgUx', 0),
(907, 6041, '2017-01-29 13:35:13', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''"2017-01-29'' at line 1', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Command.php', 900, 0x789ced5a596fdb3810fe2b859f360fee4ab2e54301161ba4eda2e8262d921e2f02025aa26dc692a84a546c6fe1ffbec34bd6c1a48a9b2c10ac5f5a971a0d39df7c73a9449eed7a3f88679d226fe4fdc8bda1d79b9308f74e736f6479bd73cfdfa0384dfd250b6990fb6f18bdc02109a87f87939066fe96909cce19ffdbf1c3997f4ee31825e1eb7499721da02e2209a823ded4b2606102fa8b24608426fcf9d8ebe10d0e0a267674bd5e10a13ce7bf6dc7eb7d7af3f19a2186639c30a58d6d53210a4ffb7fa835942de015e459de8fdd8e78f6f3db3218396d5bec81d7fb5ee06cfb3e61384b50d432093480ee8aea0e4639d23d7237cc82e55914f123d8a797a7dc5ac760ad3b79c8da7946e18049e8df11bccefd9c30ec6738a519c3b6c1567bd83675a22c156779022395e706f073d8b465fa58cfcd508efdaf609bc9718e5bdfd9d6f0fe2a663b13b733fcbd2019ec0cc60d4d8e7a52e39ce1d8ccca0c14e1ecd3327da7f7ad3a6c201d566a7e0c297f153519ad3687c5861025e18d7aded3684df96ab948bc093fb2cd63215822929080506105bced58f6b86fd97ddbe9e978019939499a02ce541b2e24aef082e42c6be99162c28d6afb1c98da538b373725840efc130100310d7194fb57523c450181c4854164b7e3f4769f9d01f6706a6080a519f054ee1f1cddff48f7cb3c3de11639a003276816e1f33c9b7f4511099174d50cd090850f09e77d42198acbfc285c417436e5608ac2e6f560db221288398e4012e4423c4745c4aea8aaac9537009800e93a72a96c0ec053198d229cf50e3fa720d65996a1ad22ce43a795b07d9cdde280fdc609b8c633ff2c4d2312886d4eb48f942967259f6113026cde288511da8295d294913e92d03fade917047f9ff05091ba4eda9e1c80ee92b57b4c72ff1a0c38af6004deb0a755d82e518c7370b9b4cc32ab516824202bc4c0ba574aebab10bfe247bf0394439caba3ddc14bca1a90b55f5b6a1d589be5982934be7c7ed79f28d74628591468a14317973539a74516e0bf2b8f5deedffe97eb068ee2883152613394450ce70c87259bb85bb84b7fd7d12c16dd8aa8f696aae77bae5c60b6a4a1562dd7ae2a5a4ad64ccab8b3756056490aa71c94eeede03283b31dbb92f9aac490eead9ad38c447e1abc812db97764451c889891cd0f4fd6bff364dd0f20250438ad50771f1f4e43764629833c84d2a6a43d6a482e0869c94c1a3273b49238d5f61c34a450c1964144547fdd5418e215cb48114bd922372804a915ca1859f5efa4d49a840bccfa398ec033cecfb5663314988e59d79ad2944230f437268575d1380de726ac6fe93221ec2e5186dfa24d9015614b1238e2a0982c68ae3c08a1c66e736557539c270ca3fd902b3123314e49d0c50f4bc652b31f5a94cad764ce203ea3b6da1609423c2b162d29485c331ce27fc842835184a4bd71cbb455866e31eef37831015c17861680f1e2d192b49a922141116d9fb2e5d84546daee82d058cf32b440498094ba2de45712cc6916b7bc653fe02d93a776a201a90466a5f505178a6313510de11d85e24efc23e773ab983854be8c28e4f5f042543f91315c9118a73207358a5fc7f2c8b1d4d1e4f3f0f42ff6d57552be6e1239d15b940f7920fa57f0c7373cdbabe1046faa694b9ee884ce4f0ad9a97a0ea766c6fee1892699e6a26c6f058afe9966e4609fe5ef953b11a00313d2324d0f744b89c298246f79b888238ed5ca9f98f7ac117e1d50c1125ea0f222e5f5662f3c2dd79ae2bcb5e060be4ea196ac69165e6128c79fe90a276f37a998f8f84702cb3aadb66da20aa6695f97ab464774a998b22f62179272b2e6d48bd7bdc4d9fd52d7f46cf5fad854766a2a1fd3a11cba0b9f4646a66f64ee41a3e85eb761201d5a868174a4e75105fcd3cca235021e07cbe360f95273c071b03c0e96c7c1f238581e07cbd3e360791c2c8f83e571b03c0e962f65b01c3f7ab0eca0db30584e06a70ffd5737cfc5860b18d38ad9e7f5a6affb2d8cffe194c93d3bd136355137866f15f6ce0cea744fa4462d387a91ac12ba4e1afcb0f8958ba9e13ec9687cd0578e6a9018e8e8ba6d3af29414a028bae109fd863fb9413addb4a955f9f132a6f98306a5e36cdb61b6ed580c8c8364a3d76d8c93f5a7f50eb4feac43a7597fa1d225dd53590feb52eaca5e76aff2ecdf160eaddc72d43019a7ee538a0b7afcb7f1a2e8337c38b65dc3b54351e08be41b61cb1adfbba0f3d3da62ebf46bb70b376cedf526aac5b18d174ced833090c164fa706eb27f2accafd1f9bfe86d1ec2c274fdf4f17c6804b0a9df335c6d7c100eb702c77e68ec0a8521597704646002647410391e46643036f41cfcdc4b948411be9295e13e9a18be0b748d8f6997f684d7797820c25427ce1bbe524bff2241c2e239a52b827b1a5f308a7fb7fa98445ba96f27bf55ee37d42fc8cdf8a700f54cac1bba25d177d49f7dc0f2db0dbcfc761ddd8ec7d7c187edd9d7f962692d37effe9ae62377b3997fff662f04f4bc6d8f4521288de2e9362e6bc35854c05cb42cf7ccd6ee1efcd23f9236a6dbc1c36eb72bb93651d54c6974d2e6884ca2add4695502e671cc90c5e15f76acf4f7, '9koE4L', 0),
(908, 6041, '2017-01-29 13:35:13', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''"2017-01-29'' at line 1\nThe SQL being executed was: SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita<="2017-01-29', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Schema.php', 633, 0x789ced5a5b6fdc3616fe2b825e5a039d54d2dce5dd625dc7d90d1a27a99d26282060c09138237a2451a1287b6603fff73d24258d2eb42b4fe20582ce43129b3c3c3c97efdc1422d71ebb5f886b9d2277e27ec9dc916bae4884cdd3cc9d58ae79ee7a5b14a7a917f280fa99f792d34b1c109f7ab7380928f376846474c5c5bf8e172cbd731ac728095ea4612a7800bb8824c08eb8737b0c0b33e09f273e273411fbf6c4357d9adc62c62fb63e4ecbf5312c4728cb24cdd03581bde07eed8738460563be4ba59c8e6b0e7e29d6105bc319046b85528e506aee9a9831ca5e272b2a76876a575e33722ccb12f2d9e28f3519c13f8eb8750ca7fea4b911a25b6ca0c4901c0c92183b9a33e3faf73746b64b38da9e1a2094bf3178880d503d4711fc88b8e153c67096d224c80c4ed5a94bc4087af9ab9161062a1bf02703858d153016c7195987bc602bcee41936128c98f183e958f67460d90367fe8301cc85510ddb3cbdcfdca96b2e167b638135debf7c5733e6bd500d6c001bd7176f2ece3f182458a4c82738e1f8276385fd102d7cc2d14f0627295d208e135f4ac5686c888d452c5c8e8c4fffb9b8baa81df8c73f6b62c145f2a667c7d170e268700418f99c63b67b0d4ab104451d108d2a1015acfba348dd86b91f9e459182ca5ba9ada3d1763c7b4c5bb029089804de2dc1779997118e3d8653ca38b635badaa3aeaab3425329cb3750d272bf085d86f0e3a8adcbfca99e5ba20c7b1f41379de39c71f366bb0ac3afb4d97dc74810140c7fce09c33200463a477d53e59cd1548f4a068c307b1fa6afca7b35a9ade2fc14507eadd554b4dac22c368428648562df2cad3517abd522716742645bc402a40092104813520b385d2602db31cb78019a1549da04225328c525c5155e938cb30e1f4526dd585c9f0152cd62b196f01cf8158101621ae028f3ae147999df32919604bcc7cf8e007b34d720c02a11f0addc3f3cbaff89ee57797a26347280074ed032c2e7195b7d4411099072d5521649513d9174de7bc4505ce547e90a526653614c59d85c13aecd23693147761a82418057288ff815cd1559ed0418c647651d795be80cfd0f58208a30330f975302eb8c31b42b80f398b4ca6cef9637d8e73f0a00dee1a57796a6115479c1f4a4f451a1ca995febcb08a0795b308c10b4355ca932294592fce70dfe12e0af13112a8ad749d79343e05da1766f93ccbb0605ce6b36026fd8f3bad9dea2181a2de42bcd2c3d9bc21a09d04a32d0ce28b81a01347820d62d5839c059215ad19c49d15cd37e6115eb805a96615e58e38f0faf06b3c2b5114ad6395a97a18bab9a9c41efe7e337b5edb1f0efe08feb961da588312ac266a48a18ce380e2a3409b70897fe5c46b35c1cd7484b6f15f57c8f954bcc431a94acd5da558d4b859a59157776199875908294c3cabd3d5ca671b663d7325f1d18cabd7575da9128a4c15bb852784755c4a18c19d5fc8864fdb348d6031f524273a4d8c787d3a25d52ca210fa1b44d29069406e59a900ecdac45b3421b65a7c69dc31615ca79e847224fe9180678c319c963450b93409721506d10e36433b85554772458633ec870049e71fe9a2b5b225f2766936b4a530ac130d8ea183649e33458e96c7d43c384f0dba450fc066d7d96071d4ac0888362b2a659e14108357e93157ab5c945c2d0ea0fb9127312e394f87dfc10729eeafdd081547647561ce233eab2ed8020c0cb7cdda182c4b5c401fe2f5997c6c803d2bdb8a3da86a11b8c07225e74066e12430bc045f1e8505a6dca80a08876a5ec3876cd48d75d101a774b86d628f151c16e07f995f830cfc61d6fd98f784be7a97bd980d402b3d6fa820ba5d86ab485338515efe52f1947aa611916f932a290d7834b59fd64c618cbc4385739a855fc7a964761cb329a3c119edee5bebaceaae33a9293f28a6a5304a277057f7dc2cb3d1b01f0369b2ee54999d085a4909dea72380d35f69b2725c84a2caaf6565ad13b2b1139dc67f907e94ea4d101096995a687654b8982982417225ca488d362e55f58f4ac117ee153891251a0b23c15f5664f3cafd6dae4a2b510c67c91422db9a32cb8c2508e3fd00d4e2eb6a99cf8c44702cb3aadb76db20aa6e9a02c57ad8ee86d81947d11bb54905335a7f58de521e0dc7f55d7f46cf5fad854f66a2a9fd2a11c7a8b984626ba6f64e38346d13d6fcd403ab23403e9a49c470bc37f9b59b401c0e360791c2cbfd71c701c2c8f83e571b03c0e96c7c1f2f438581e07cbe360791c2c8f83e5f732584e9f3c58f6e0ad192c67c3d3c7feab5be462cd038c794dedf366d3d7ff15c6df70ca149e9d953ab5adae0ddfbad97b23a8d73b9106b440f43cd924f42e69e1c3124f2ee69af72493e9415f39ea41a281e358f3ae4ca4241f45d14224f485d859a032dd3cf04c4cfdf07d4cf3070d4ac7d9b6c76cdbb3186807c956afdb1a279bbbcd0eb4b9d7a3d36c1ea875490f54d6c3ba9426b3efbb5779f66f0b87566e356ae8942bde53ca077ae267ed23dd67f8706c8f35cf0e6581cf934f84870dbcf7b1ce5fd616bb4cbf76b770c3d5ae392b5a1c5bfbc0d43ec8062a98741fce75facfa5fa0d38ff3f7a9bc76ca17b7efa743cb40258d7ef699e363e6a8e71cd1cfba1b1af2934c9baa741863a834c0e02c7e316194e756fd941ee10254184af54657808269aef027de363dea73d11751e36649896897321561ae95f2648583ca77443b059da179412dfadde25d14ef1bb57df2af7179607d465e25340b127d735dd92ec3b9a7bbf61f5ed060e5fdc4537d3e9b5ffdbeeece36a1d5ae1f6d5bfe7d964bcddae3e7fb2d7d2f4a26d8f6521a89412e936ae6ac35456c04cb62c0fccd6e3bdf12bff28d8e85e078ffabdae14dc6455d3a5d15917232a897652a7550b98a721431587ff0186f970be, '7midXY', 0),
(909, 6042, '2017-01-29 13:35:50', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''"2017-01-29'' at line 1', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Command.php', 900, 0x789ced5a596fdb3810fe2b859f360fee4ab2e54301161ba4eda2e8262d921e2f02025aa26dc692a84a546c6fe1ffbec34bd6c1a48a9b2c10ac5f5a971a0d39df7c73a9449eed7a3f88679d226fe4fdc8bda1d79b9308f74e736f6479bd73cfdfa0384dfd250b6990fb6f18bdc02109a87f87939066fe96909cce19ffdbf1c3997f4ee31825e1eb7499721da02e2209a823ded4b2606102fa8b24608426fcf9d8ebe10d0e0a267674bd5e10a13ce7bf6dc7eb7d7af3f19a2186639c30a58d6d53210a4ffb7fa835942de015e459de8fdd8e78f6f3db3218396d5bec81d7fb5ee06cfb3e61384b50d432093480ee8aea0e4639d23d7237cc82e55914f123d8a797a7dc5ac760ad3b79c8da7946e18049e8df11bccefd9c30ec6738a519c3b6c1567bd83675a22c156779022395e706f073d8b465fa58cfcd508efdaf609bc9718e5bdfd9d6f0fe2a663b13b733fcbd2019ec0cc60d4d8e7a52e39ce1d8ccca0c14e1ecd3327da7f7ad3a6c201d566a7e0c297f153519ad3687c5861025e18d7aded3684df96ab948bc093fb2cd63215822929080506105bced58f6b86fd97ddbe9e978019939499a02ce541b2e24aef082e42c6be99162c28d6afb1c98da538b373725840efc130100310d7194fb57523c450181c4854164b7e3f4769f9d01f6706a6080a519f054ee1f1cddff48f7cb3c3de11639a003276816e1f33c9b7f4511099174d50cd090850f09e77d42198acbfc285c417436e5608ac2e6f560db221288398e4012e4423c4745c4aea8aaac9537009800e93a72a96c0ec053198d229cf50e3fa720d65996a1ad22ce43a795b07d9cdde280fdc609b8c633ff2c4d2312886d4eb48f942967259f6113026cde288511da8295d294913e92d03fade917047f9ff05091ba4eda9e1c80ee92b57b4c72ff1a0c38af6004deb0a755d82e518c7370b9b4cc32ab516824202bc4c0ba574aebab10bfe247bf0394439caba3ddc14bca1a90b55f5b6a1d589be5982934be7c7ed79f28d74628591468a14317973539a74516e0bf2b8f5deedffe97eb068ee2883152613394450ce70c87259bb85bb84b7fd7d12c16dd8aa8f696aae77bae5c60b6a4a1562dd7ae2a5a4ad64ccab8b3756056490aa71c94eeede03283b31dbb92f9aac490eead9ad38c447e1abc812db97764451c889891cd0f4fd6bff364dd0f20250438ad50771f1f4e43764629833c84d2a6a43d6a482e0869c94c1a3273b49238d5f61c34a450c1964144547fdd5418e215cb48114bd922372804a915ca1859f5efa4d49a840bccfa398ec033cecfb5663314988e59d79ad2944230f437268575d1380de726ac6fe93221ec2e5186dfa24d9015614b1238e2a0982c68ae3c08a1c66e736557539c270ca3fd902b3123314e49d0c50f4bc652b31f5a94cad764ce203ea3b6da1609423c2b162d29485c331ce27fc842835184a4bd71cbb455866e31eef37831015c17861680f1e2d192b49a922141116d9fb2e5d84546daee82d058cf32b440498094ba2de45712cc6916b7bc653fe02d93a776a201a90466a5f505178a6313510de11d85e24efc23e773ab983854be8c28e4f5f042543f91315c9118a73207358a5fc7f2c8b1d4d1e4f3f0f42ff6d57552be6e1239d15b940f7920fa57f0c7373cdbabe1046faa694b9ee884ce4f0ad9a97a0ea766c6fee1892699e6a26c6f058afe9966e4609fe5ef953b11a00313d2324d0f744b89c298246f79b888238ed5ca9f98f7ac117e1d50c1125ea0f222e5f5662f3c2dd79ae2bcb5e060be4ea196ac69165e6128c79fe90a276f37a998f8f84702cb3aadb66da20aa6695f97ab464774a998b22f62179272b2e6d48bd7bdc4d9fd52d7f46cf5fad854766a2a1fd3a11cba0b9f4646a66f64ee41a3e85eb761201d5a868174a4e75105fcd3cca235021e07cbe360f95273c071b03c0e96c7c1f238581e07cbd3e360791c2c8f83e571b03c0e962f65b01c3f7ab0eca0db30584e06a70ffd5737cfc5860b18d38ad9e7f5a6affb2d8cffe194c93d3bd136355137866f15f6ce0cea744fa4462d387a91ac12ba4e1afcb0f8958ba9e13ec9687cd0578e6a9018e8e8ba6d3af29414a028bae109fd863fb9413addb4a955f9f132a6f98306a5e36cdb61b6ed580c8c8364a3d76d8c93f5a7f50eb4feac43a7597fa1d225dd53590feb52eaca5e76aff2ecdf160eaddc72d43019a7ee538a0b7afcb7f1a2e8337c38b65dc3b54351e08be41b61cb1adfbba0f3d3da62ebf46bb70b376cedf526aac5b18d174ced833090c164fa706eb27f2accafd1f9bfe86d1ec2c274fdf4f17c6804b0a9df335c6d7c100eb702c77e68ec0a8521597704646002647410391e46643036f41cfcdc4b948411be9295e13e9a18be0b748d8f6997f684d7797820c25427ce1bbe524bff2241c2e239a52b827b1a5f308a7fb7fa98445ba96f27bf55ee37d42fc8cdf8a700f54cac1bba25d177d49f7dc0f2db0dbcfc761ddd8ec7d7c187edd9d7f962692d37effe9ae62377b3997fff662f04f4bc6d8f4521288de2e9362e6bc35854c05cb42cf7ccd6ee1efcd23f9236a6dbc1c36eb72bb93651d54c6974d2e6884ca2add4695502e671cc90c5e15f76acf4f7, '9koE4L', 0),
(910, 6042, '2017-01-29 13:35:50', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''"2017-01-29'' at line 1\nThe SQL being executed was: SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita<="2017-01-29', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Schema.php', 633, 0x789ced5a5b6fdc3616fe2b825e5a039d54d2dce5dd625dc7d90d1a27a99d26282060c09138237a2451a1287b6603fff73d24258d2eb42b4fe20582ce43129b3c3c3c97efdc1422d71ebb5f886b9d2277e27ec9dc916bae4884cdd3cc9d58ae79ee7a5b14a7a917f280fa99f792d34b1c109f7ab7380928f376846474c5c5bf8e172cbd731ac728095ea4612a7800bb8824c08eb8737b0c0b33e09f273e273411fbf6c4357d9adc62c62fb63e4ecbf5312c4728cb24cdd03581bde07eed8738460563be4ba59c8e6b0e7e29d6105bc319046b85528e506aee9a9831ca5e272b2a76876a575e33722ccb12f2d9e28f3519c13f8eb8750ca7fea4b911a25b6ca0c4901c0c92183b9a33e3faf73746b64b38da9e1a2094bf3178880d503d4711fc88b8e153c67096d224c80c4ed5a94bc4087af9ab9161062a1bf02703858d153016c7195987bc602bcee41936128c98f183e958f67460d90367fe8301cc85510ddb3cbdcfdca96b2e167b638135debf7c5733e6bd500d6c001bd7176f2ece3f182458a4c82738e1f8276385fd102d7cc2d14f0627295d208e135f4ac5686c888d452c5c8e8c4fffb9b8baa81df8c73f6b62c145f2a667c7d170e268700418f99c63b67b0d4ab104451d108d2a1015acfba348dd86b91f9e459182ca5ba9ada3d1763c7b4c5bb029089804de2dc1779997118e3d8653ca38b635badaa3aeaab3425329cb3750d272bf085d86f0e3a8adcbfca99e5ba20c7b1f41379de39c71f366bb0ac3afb4d97dc74810140c7fce09c33200463a477d53e59cd1548f4a068c307b1fa6afca7b35a9ade2fc14507eadd554b4dac22c368428648562df2cad3517abd522716742645bc402a40092104813520b385d2602db31cb78019a1549da04225328c525c5155e938cb30e1f4526dd585c9f0152cd62b196f01cf8158101621ae028f3ae147999df32919604bcc7cf8e007b34d720c02a11f0addc3f3cbaff89ee57797a26347280074ed032c2e7195b7d4411099072d5521649513d9174de7bc4505ce547e90a526653614c59d85c13aecd23693147761a82418057288ff815cd1559ed0418c647651d795be80cfd0f58208a30330f975302eb8c31b42b80f398b4ca6cef9637d8e73f0a00dee1a57796a6115479c1f4a4f451a1ca995febcb08a0795b308c10b4355ca932294592fce70dfe12e0af13112a8ad749d79343e05da1766f93ccbb0605ce6b36026fd8f3bad9dea2181a2de42bcd2c3d9bc21a09d04a32d0ce28b81a01347820d62d5839c059215ad19c49d15cd37e6115eb805a96615e58e38f0faf06b3c2b5114ad6395a97a18bab9a9c41efe7e337b5edb1f0efe08feb961da588312ac266a48a18ce380e2a3409b70897fe5c46b35c1cd7484b6f15f57c8f954bcc431a94acd5da558d4b859a59157776199875908294c3cabd3d5ca671b663d7325f1d18cabd7575da9128a4c15bb852784755c4a18c19d5fc8864fdb348d6031f524273a4d8c787d3a25d52ca210fa1b44d29069406e59a900ecdac45b3421b65a7c69dc31615ca79e847224fe9180678c319c963450b93409721506d10e36433b85554772458633ec870049e71fe9a2b5b225f2766936b4a530ac130d8ea183649e33458e96c7d43c384f0dba450fc066d7d96071d4ac0888362b2a659e14108357e93157ab5c945c2d0ea0fb9127312e394f87dfc10729eeafdd081547647561ce233eab2ed8020c0cb7cdda182c4b5c401fe2f5997c6c803d2bdb8a3da86a11b8c07225e74066e12430bc045f1e8505a6dca80a08876a5ec3876cd48d75d101a774b86d628f151c16e07f995f830cfc61d6fd98f784be7a97bd980d402b3d6fa820ba5d86ab485338515efe52f1947aa611916f932a290d7834b59fd64c618cbc4385739a855fc7a964761cb329a3c119edee5bebaceaae33a9293f28a6a5304a277057f7dc2cb3d1b01f0369b2ee54999d085a4909dea72380d35f69b2725c84a2caaf6565ad13b2b1139dc67f907e94ea4d101096995a687654b8982982417225ca488d362e55f58f4ac117ee153891251a0b23c15f5664f3cafd6dae4a2b510c67c91422db9a32cb8c2508e3fd00d4e2eb6a99cf8c44702cb3aadb76db20aa6e9a02c57ad8ee86d81947d11bb54905335a7f58de521e0dc7f55d7f46cf5fad854f66a2a9fd2a11c7a8b984626ba6f64e38346d13d6fcd403ab23403e9a49c470bc37f9b59b401c0e360791c2cbfd71c701c2c8f83e571b03c0e96c7c1f2f438581e07cbe360791c2c8f83e5f732584e9f3c58f6e0ad192c67c3d3c7feab5be462cd038c794dedf366d3d7ff15c6df70ca149e9d953ab5adae0ddfbad97b23a8d73b9106b440f43cd924f42e69e1c3124f2ee69af72493e9415f39ea41a281e358f3ae4ca4241f45d14224f485d859a032dd3cf04c4cfdf07d4cf3070d4ac7d9b6c76cdbb3186807c956afdb1a279bbbcd0eb4b9d7a3d36c1ea875490f54d6c3ba9426b3efbb5779f66f0b87566e356ae8942bde53ca077ae267ed23dd67f8706c8f35cf0e6581cf934f84870dbcf7b1ce5fd616bb4cbf76b770c3d5ae392b5a1c5bfbc0d43ec8062a98741fce75facfa5fa0d38ff3f7a9bc76ca17b7efa743cb40258d7ef699e363e6a8e71cd1cfba1b1af2934c9baa741863a834c0e02c7e316194e756fd941ee10254184af54657808269aef027de363dea73d11751e36649896897321561ae95f2648583ca77443b059da179412dfadde25d14ef1bb57df2af7179607d465e25340b127d735dd92ec3b9a7bbf61f5ed060e5fdc4537d3e9b5ffdbeeece36a1d5ae1f6d5bfe7d964bcddae3e7fb2d7d2f4a26d8f6521a89412e936ae6ac35456c04cb62c0fccd6e3bdf12bff28d8e85e078ffabdae14dc6455d3a5d15917232a897652a7550b98a721431587ff0186f970be, '7midXY', 0),
(911, 6043, '2017-01-29 13:36:21', 'syntax error, unexpected ''id_paciente'' (T_STRING)', 4, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\site\\reporte1.php', 37, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '5cPpgb', 0),
(912, 6045, '2017-01-29 13:36:53', 'syntax error, unexpected ''id_paciente'' (T_STRING)', 4, 'C:\\xampp\\htdocs\\DtoMedico\\frontend\\views\\site\\reporte1.php', 37, 0x789c2d8ec10ac2301044ff65ef42235a650ade143fa297b5a61a0c5b4952a484fcbbcdd2dbf0e60d0cc3203b341da3458e3883c65986e426a12ec2b4a037cbd3db1b27f6d710a650f91134788eb1e6bd012dcef50f8eb657e3ae0b150fa0b47cad7aa0dd65631c5eeb96d1201705a3f32a9d40b37c64fac9667a276b511f96f207d56136f9, '5cPpgb', 0),
(913, 6047, '2017-01-29 13:40:12', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''"'' at line 1', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Command.php', 900, 0x789ced5a596fdb3810fe2b859f360fee4ab2e54301161ba4eda2e8262d921e2f02025aa26dc692a84a546c6fe1ffbec34bd6c1a48a9b2c10ac5f5a971a0d39df7c73a9449eed7a3f88679d226fe4fdc8bda1d79b9308f74e736f6479bd73cfdfa0384dfd250b6990fb6f18bdc02109a87f87939066fe96909cce19ffdbf1c3997f4ee31825e1eb7499721da02e2209a823ded4b2606102fa8b24608426fcf9d8ebe10d0e0a267674bd5e10a13ce7bf6dc7eb7d7af3f19a2186639c30a58d6d53210a4ffb7fa835942de015e459de8fdd8e78f6f3db3218396d5bec81d7fb5ee06cfb3e61384b50d432093480ee8aea0e4639d23d7237cc82e55914f123d8a797a7dc5ac760ad3b79c8da7946e18049e8df11bccefd9c30ec6738a519c3b6c156db60ea44592acef204462acf0de0e7b069cbf4b19e9ba11cfb5fc13693e31cb7beb3ade1fd55cc76266e67f87b4132d8198c1b9a1cf5a4c639c3b199951928c2d9a765fa4eef5b75d8403aacd4fc1852fe2a6a325a6d0e8b0d214ac21bf5bca7d19af2d5729178137e649bc742b044242101a1c20a78dbb1ec71dfb2fbb6d3d3f10232739234059ca9365c485ce105c959d6d223c5841bd5f63930b5a7166f6e4a081df8270200621ae228f7afa4788a0202890b83c86ec7e9ed3e3b03ece1d4c0004b33e0a9dc3f38baff91ee97797ac22d7240074ed02cc2e77936ff8a221222e9aa19a0210b1f12cefb84321497f951b882e86ccac11485cdebc1b6452410731c8124c885788e8a885d5155592b6f003001d275e452d91c80a7321a4538eb1d7e4e41acb32c435b459c874e2b61fb38bbc501fb8d13708d67fe599a462410db9c681f2953ce4a3ec32604d8bc510a23b4052ba529237d24a17f5ad32f08fe3ee1a122759db43d3900dd256bf798e4fe3518705ec108bc614fabb05da218e7e07269996556a3d0484056888175af94d657217ec58f7e072887385747bb83979435206bbfb6d43ab036cb3153687cf9fcae3f51ae8d50b228d042872e2e6b724e8b2cc07f571ebbdcbffd2fd70d1cc51163a4c266288b18ce190e4b3671b77097feaea3592cba1551ed2d55cff75cb9c06c4943ad5aae5d55b494ac99947167ebc0ac92144e3928dddbc16506673b7625f3558921dd5b35a71989fc3478035b72efc88a381031239b1f9eac7fe7c9ba1f404a08705aa1ee3e3e9c86ec8c52067908a54d497bd4905c10d292993464e6682571aaed396848a1822d8388a8febaa930c42b96912296b2456e5008522b9431b2eadf49a935091798f5731c81679c9f6bcd6628301db3ae35a5298560e86f4c0aeba2711ace4d58dfd26542d85da20cbf459b202bc2962470c4413159d05c7910428ddde6caaea6384f1846fb21576246629c92a08b1f968ca5663fb42895afc99c417c466db52d128478562c5a5290b86638c4ff908506a308497be39669ab0cdd62dce7f16202b82e0c2d00e3c5a325693525438222da3e65cbb18b8cb4dd05a1b19e656881920029755bc8af2498d32c6e79cb7ec05b264fed44035209cc4aeb0b2e14c726a21ac23b0ac59df847cee7563171a87c1951c8ebe185a87e2263b822314e650e6a14bf8ee59163a9a3c9e7e1e95fecabeba47cdd2472a2b7281ff240f4afe08f6f78b657c309de54d3963cd1099d9f14b253f51c4ecd8cfdc3134d32cd45d9de0a14fd33cdc8c13ecbdf2b7722400726a4659a1ee89612853149def27011471cab953f31ef5923fc3aa08225bc40e545caebcd5e785aae35c5796bc1c17c9d422d59d32cbcc2508e3fd3154ede6e5231f1f18f0496755a6ddb44154cd3be2e578d8ee85231655fc42e24e564cda917af7b89b3fba5aee9d9eaf5b1a9ecd4543ea6433974173e8d8c4cdfc8dc8346d1bd6ec3403ab40c03e948cfa30af8a799456b043c0e96c7c1f2a5e680e360791c2c8f83e571b03c0e96a7c7c1f238581e07cbe360791c2c5fca60397ef460d941b761b09c0c4e1ffaaf6e9e8b0d1730a615b3cfeb4d5ff75b18ffc329937b76a26d6aa26e0cdf2aec9d19d4e99e488d5a70f4225925749d34f861f12b1753c37d92d1f8a0af1cd52031d0d175db74e42929405174c313fa0d7f728374ba6953abf2e3654cf3070d4ac7d9b6c36cdbb1181807c946afdb1827eb4feb1d68fd59874eb3fe42a54bbaa7b21ed6a5d495bdec5ee5d9bf2d1c5ab9e5a861324edda71417f4f86fe345d167f8706cbbc37b0a7c917c236c59e37b17747e5a5b6c9d7eed76e186adbdde44b538b6f182a97d100632984c1fce4df64f85f9353aff17bdcd435898ae9f3e9e0f8d0036f57b86ab8d0fc2e156e0d80f8d5da13024eb8e800c4c808c0e22c7c3880cc6869e839f7b899230c257b232dc4713c37781aef131edd29ef03a0f0f4498eac479c3576ae95f2448583ca77445704fe30b46f1ef561f93682bf5ede4b7cafd86fa05b919ff14a09e897543b724fa8efab30f587ebb8197dfaea3dbf1f83af8b03dfb3a5f2cade5e6dd5fd37ce46e36f3efdfec85809eb7edb12804a5513cddc6656d188b0a988b96e59ed9dadd835ffa47d2c6743b78d8ed7625d726aa9a298d4eda1c9149b4953aad4ac03c8e19b238fc0b1a5ef4f5, '5AysyP', 0),
(914, 6047, '2017-01-29 13:40:13', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''"'' at line 1\nThe SQL being executed was: SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita>="2017-01-12"AND fecha_cita<=2017-01-29"', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Schema.php', 633, 0x789ced5ae96fdcb815ff57047dd91ad8c94a9a5bee2eea3a4e1b6ceca47636410101038ec419d1a32b1465cf34f0ffdec7431a1db4579ec40582ce872436f9f8f88edfbb1422d71ebb5f896b9d2277e27ecddd916bae4884cdd3dc9d58ae79ee7a5b14679917b220f573ef354b2f7140fcd4bbc34990526f47489eae18ffd7f182a5779ec6314a82575998711ec02e2209b023eedc1ec3c20cf81789cf489af07d7be29a7e9adc61ca2eb63ececaf5312c4728cf05cdd035813de77ee38738468a31db65424ec73507bfa93544d77006c19a52cae14acd5d13539ad2b7c92ae5bb43b92bae1939966571f96cfec79a8ce01f87df3a8253ff4e0b234477d8408921381824317669418d9b7fbd33f25dc2d0f6d400a1fc8dc1426c80ea058ae047c40c3fa514e7599a04b9c15279ea1251825effddc83105950df89383c2c60a18f3e394ac43a6d8f233458e8d04236afc64fe64004b6e4ac3364f1f7277ea9a8bc5de4460830fafdfd74cf8c015e21be0c49b8b7717e71f0d122c32e4139c30fcb3b1c27e88163e61e86783912c5d2086135f0843d3d8e01b8b987b1a199fff79717d513bf0dbafa663d9d381650f6cc73cbb7a5ddbfbebafe5963337410a21c68b436b387134d002d87c2930ddbd05856982a20eae4615ae14ebfec092b761e687675124d17325b47534da8e674f690bf6060193c0bb23f83ef772c2b047719652866d8daeb646d599d254c8f21d94b4dcaf5c9721fc386aeb327faee79628c7de27d04de73867dcbcd9ae22f31b6df6d03112440cc55f0a42b1888e91ce51df55396734d5a39202234c3f84d99bf25e4db6ab383f0794df6a3519ad36378b0d210a1943ed9ba5b5e67cb55a24ee8c8b6cf358801440120229446801a76b49a28c17a05991a44d00a942292e28aef19ae48c76f84832e146757d0e4835d5622d1b3af02b0203c46980a3dcbb96e465eecb795ae2f01ebf3802a0866810609508f85eee1f1eddff4cf7cb3c3de31af1028913b48cf0794e579f504402245db5541514b809e77d4014c5557e14ae206536e5c61485cd35e1da2212167344f3c1190478858a885da78524ab9d00c3f8a8ac23574a676889c0025184a979b89c02586794a29d02ce53d24ab3bd5fde629ffd8503f01e2fbdb32c8ba003e04c4f4a1f2955cefc5aab4600cd5bc53042d0e930a9caa41449f09f37f80b80bf4d78a8485e275d4f0e817785dabd4d72ef061438afd908bc61cfeb66bb4231f45ec8979a597a36ca1a09d00a32d0ce505c8d007a3e10eb0eac1ce05c89a6fa35219a6bdaaf2cb50ea8a53966ca1a7f7c7c339829d746285917685d862eae6a720eeda08fdfd5b6c7dcbf833f6e5a761422c64885cd4816319c331c5468e26ee12efda58c66b138ae9196de52f57c8f954bccc2342859cbb5eb1a970a35b32aeeec3230eb20052987957b7bb84ce36cc7ae65be3a30a47bebeab423914b83b77025f78eac88431133b2f9e1c9fa179eac073ea484e694b18f0fa745bb4c53067908656d4a3eb33428d7847468662d9a15da483b35ee1cb6a850c1423fe2794ac730c01b4649114b5a180eba0c816a8328239bc19da4ba27c11ab3418e23f08cf3e75ce912f93a319b5cb3344b2118065b1dc326699c052b9dad6fd33021ec2e518adfa2ad4f8ba043091871504cd669ae3c08a1c66e73a5579b9c270cadfe902b312331ce88dfc70f216399de0f1d48e5f764c5203ea32edb0e0802bc2cd61d2a485c4b1ce0ff9075698c2220dd8b3baa6d28bac578c0e34567e02631b4008c178f0ea5d5a60c088ad2ae941dc7ae29e9ba0b42e37e49d11a253e52ec76905f890f236edcf196fd84b7749e7a100d482d306bad2fb850882de75e38a3acf8207ec919920dcb50e5cb2885bc1e5c8aea2732c65824c6b9cc41ade2d7b33c725b96d1e4f1f0f42ef7d575561dd7919c9457549b3c10bd6bf8eb335eeed97080b7d974294fca84ce2585ec5497c369a8b1df3c2941566251b6b7c28ade5989c8e13ecb3f4a77228c0e48c8aa343d2c5b4a14c424b9e0e122449caa95bf61deb346f8959f0a94f002951719af377be279b5d626e7ad0537e6ab0c6ac97d4a836b0ce5f863bac1c9c53613131fff486059a7f5b64d54c12c1b94e5aad5115d29a4ec8bd8a5849cac39ad0f308f01e7e19bbaa617abd7c7a6b25753f99c0ee5d05bf83432d17d231b1f348aee796b06d291a5194827e53caa0cff7d66d106008f83e571b0fc5173c071b03c0e96c7c1f238581e07cbd3e360791c2c8f83e571b03c0e963fca60397df660d983b766b09c0d4f9ffaaf6e9e8b350f30e635b5cf9b4d5fff5718ff875326f7ecacd4a96d756df8d6cdde1b41bdde8934a005a217c92649ef93163e2cfee462ae794f32991ef495a31e241a388e354fcd784af251142d78425ff09d052ad3cd232fc7e40f3fc6347fd0a0749c6d7bccb63d8b8176906cf5baad71b2b9dbec409b7b3d3acde6815a97f448653dac4b6932fbb17b9517ffb67068e5566f3735caa9f794e2811eff59fb6ef7053e1cdbe3d12305be483e131636f0dec73a7f5a5bec32fddaddc20d57bbe64cb538b6f681a97d900d6430e93e9cebf49f0bf51b70fe5ff4364fd942f7fcf4f9786805b0aedfd33c6d7cd21ce39a39f643635f536892754f830c7506991c048ea72d329cea9eb783dc214a82085fcbcaf0184c34df05fac6c7bc4f7bc2eb3c6c88302d13e782af34d2bf4890b0789ea61b82cdd2bea014ff6ef53e897692df83fc56b9bfb03c202fe39f02d49e58d7744ba2ef68eefd8ee5b71b387c711fdd4ea737feefbbb34fab756885db37ff98e793f176bbfaf2d95e0bd3f3b63d1685a0528aa7dbb8aa0d53510173d1b23c325b8ff7c6affc2361a37b1d3ceaf7ba927313554d9746675d8cc824da499d562d609e870c591cfe0bebd37684, '7rTj2G', 0),
(915, 6048, '2017-01-29 13:40:21', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''"'' at line 1', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Command.php', 900, 0x789ced5a596fdb3810fe2b859f360fee4ab2e54301161ba4eda2e8262d921e2f02025aa26dc692a84a546c6fe1ffbec34bd6c1a48a9b2c10ac5f5a971a0d39df7c73a9449eed7a3f88679d226fe4fdc8bda1d79b9308f74e736f6479bd73cfdfa0384dfd250b6990fb6f18bdc02109a87f87939066fe96909cce19ffdbf1c3997f4ee31825e1eb7499721da02e2209a823ded4b2606102fa8b24608426fcf9d8ebe10d0e0a267674bd5e10a13ce7bf6dc7eb7d7af3f19a2186639c30a58d6d53210a4ffb7fa835942de015e459de8fdd8e78f6f3db3218396d5bec81d7fb5ee06cfb3e61384b50d432093480ee8aea0e4639d23d7237cc82e55914f123d8a797a7dc5ac760ad3b79c8da7946e18049e8df11bccefd9c30ec6738a519c3b6c156db60ea44592acef204462acf0de0e7b069cbf4b19e9ba11cfb5fc13693e31cb7beb3ade1fd55cc76266e67f87b4132d8198c1b9a1cf5a4c639c3b199951928c2d9a765fa4eef5b75d8403aacd4fc1852fe2a6a325a6d0e8b0d214ac21bf5bca7d19af2d5729178137e649bc742b044242101a1c20a78dbb1ec71dfb2fbb6d3d3f10232739234059ca9365c485ce105c959d6d223c5841bd5f63930b5a7166f6e4a081df8270200621ae228f7afa4788a0202890b83c86ec7e9ed3e3b03ece1d4c0004b33e0a9dc3f38baff91ee97797ac22d7240074ed02cc2e77936ff8a221222e9aa19a0210b1f12cefb84321497f951b882e86ccac11485cdebc1b6452410731c8124c885788e8a885d5155592b6f003001d275e452d91c80a7321a4538eb1d7e4e41acb32c435b459c874e2b61fb38bbc501fb8d13708d67fe599a462410db9c681f2953ce4a3ec32604d8bc510a23b4052ba529237d24a17f5ad32f08fe3ee1a122759db43d3900dd256bf798e4fe3518705ec108bc614fabb05da218e7e07269996556a3d0484056888175af94d657217ec58f7e072887385747bb83979435206bbfb6d43ab036cb3153687cf9fcae3f51ae8d50b228d042872e2e6b724e8b2cc07f571ebbdcbffd2fd70d1cc51163a4c266288b18ce190e4b3671b77097feaea3592cba1551ed2d55cff75cb9c06c4943ad5aae5d55b494ac99947167ebc0ac92144e3928dddbc16506673b7625f3558921dd5b35a71989fc3478035b72efc88a381031239b1f9eac7fe7c9ba1f404a08705aa1ee3e3e9c86ec8c52067908a54d497bd4905c10d292993464e6682571aaed396848a1822d8388a8febaa930c42b96912296b2456e5008522b9431b2eadf49a935091798f5731c81679c9f6bcd6628301db3ae35a5298560e86f4c0aeba2711ace4d58dfd26542d85da20cbf459b202bc2962470c4413159d05c7910428ddde6caaea6384f1846fb21576246629c92a08b1f968ca5663fb42895afc99c417c466db52d128478562c5a5290b86638c4ff908506a308497be39669ab0cdd62dce7f16202b82e0c2d00e3c5a325693525438222da3e65cbb18b8cb4dd05a1b19e656881920029755bc8af2498d32c6e79cb7ec05b264fed44035209cc4aeb0b2e14c726a21ac23b0ac59df847cee7563171a87c1951c8ebe185a87e2263b822314e650e6a14bf8ee59163a9a3c9e7e1e95fecabeba47cdd2472a2b7281ff240f4afe08f6f78b657c309de54d3963cd1099d9f14b253f51c4ecd8cfdc3134d32cd45d9de0a14fd33cdc8c13ecbdf2b7722400726a4659a1ee89612853149def27011471cab953f31ef5923fc3aa08225bc40e545caebcd5e785aae35c5796bc1c17c9d422d59d32cbcc2508e3fd3154ede6e5231f1f18f0496755a6ddb44154cd3be2e578d8ee85231655fc42e24e564cda917af7b89b3fba5aee9d9eaf5b1a9ecd4543ea6433974173e8d8c4cdfc8dc8346d1bd6ec3403ab40c03e948cfa30af8a799456b043c0e96c7c1f2a5e680e360791c2c8f83e571b03c0e96a7c7c1f238581e07cbe360791c2c5fca60397ef460d941b761b09c0c4e1ffaaf6e9e8b0d1730a615b3cfeb4d5ff75b18ffc329937b76a26d6aa26e0cdf2aec9d19d4e99e488d5a70f4225925749d34f861f12b1753c37d92d1f8a0af1cd52031d0d175db74e42929405174c313fa0d7f728374ba6953abf2e3654cf3070d4ac7d9b6c36cdbb1181807c946afdb1827eb4feb1d68fd59874eb3fe42a54bbaa7b21ed6a5d495bdec5ee5d9bf2d1c5ab9e5a861324edda71417f4f86fe345d167f8706cbbc37b0a7c917c236c59e37b17747e5a5b6c9d7eed76e186adbdde44b538b6f182a97d100632984c1fce4df64f85f9353aff17bdcd435898ae9f3e9e0f8d0036f57b86ab8d0fc2e156e0d80f8d5da13024eb8e800c4c808c0e22c7c3880cc6869e839f7b899230c257b232dc4713c37781aef131edd29ef03a0f0f4498eac479c3576ae95f2448583ca77445704fe30b46f1ef561f93682bf5ede4b7cafd86fa05b919ff14a09e897543b724fa8efab30f587ebb8197dfaea3dbf1f83af8b03dfb3a5f2cade5e6dd5fd37ce46e36f3efdfec85809eb7edb12804a5513cddc6656d188b0a988b96e59ed9dadd835ffa47d2c6743b78d8ed7625d726aa9a298d4eda1c9149b4953aad4ac03c8e19b238fc0b1a5ef4f5, '5AysyP', 0),
(916, 6048, '2017-01-29 13:40:21', 'SQLSTATE[42000]: Syntax error or access violation: 1064 You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near ''"'' at line 1\nThe SQL being executed was: SELECT id_paciente, fecha_cita, tipo_atencion from cita_medica WHERE fecha_cita>="2017-01-12" AND fecha_cita<=2017-01-29"', 42000, 'C:\\xampp\\htdocs\\DtoMedico\\vendor\\yiisoft\\yii2\\db\\Schema.php', 633, 0x789ced5ae96fdcb815ff57047dd91ad8c94a9a5bee2eea3a4e1b6ceca47636410101038ec419d1a32b1465cf34f0ffdec7431a1db4579ec40582ce872436f9f8f88edfbb1422d71ebb5f896b9d2277e27ecddd916bae4884cdd3dc9d58ae79ee7a5b14679917b220f573ef354b2f7140fcd4bbc34990526f47489eae18ffd7f182a5779ec6314a82575998711ec02e2209b023eedc1ec3c20cf81789cf489af07d7be29a7e9adc61ca2eb63ececaf5312c4728cf05cdd035813de77ee38738468a31db65424ec73507bfa93544d77006c19a52cae14acd5d13539ad2b7c92ae5bb43b92bae1939966571f96cfec79a8ce01f87df3a8253ff4e0b234477d8408921381824317669418d9b7fbd33f25dc2d0f6d400a1fc8dc1426c80ea058ae047c40c3fa514e7599a04b9c15279ea1251825effddc83105950df89383c2c60a18f3e394ac43a6d8f233458e8d04236afc64fe64004b6e4ac3364f1f7277ea9a8bc5de4460830fafdfd74cf8c015e21bb66bde5cbcbb38ff68906091219fe084e19f8d15f643b4f009433f1b8c64e902319cf842189ac606df58c4dcd3c8f8fccf8beb8bda81df7e351dcb9e0e2c7b603ba67176f5bab6f9d75fcb3d676e8218428e17c7d670e268b005b8f95260ba7b0b1ad304451d608d2a6029d6fd91256fc3cc0fcfa248c2e74a68eb68b41dcf9ed2160c0e0226817747f07deee584618fe22ca50cdb1a5d6d8daa33a5a990e53b2869b95fb92e43f871d4d665fe5ccf2d518ebd4fa09bce71ceb879b35d85e637daeca1632408198abf148462111e239da3beab72ce68aa47250546987e08b337e5bd9a7457717e0e28bfd56a325a6d6e161b42145286da374b6bcdf96ab548dc1917d9e6b100298024047288d0024ed7b244192f40b322499b005285525c505ce335c919edf09164c28deafa1c906aaac55a3a74e057040688d30047b9772dc9cbe497f3b4c4e13d7e71044011d120c02a11f0bddc3f3cbaff99ee97797ac6357280074ed032c2e7395d7d4211099074d5529550e0269cf701511457f951b88294d9941b531436d7846b8b4858cc11dd076710e0152a22769d1692ac76020ce3a3b28e5c299da127020b4411a6e6e1720a609d518a760a384f492bcdf67e798b7df6170ec07bbcf4ceb22c821680333d297da45439f36bbd1a01346f15c30841abc3a42a935224c17fdee02f00fe36e1a122799d743d3904de156af736c9bd1b50e0bc6623f0863daf9bed0ac5d07c215f6a66e9d9286b24402bc8403b4371350268fa40ac3bb0728073259a6ad88468ae69bfb2d43aa096e698296bfcf1f1cd60a65c1ba1645da07519bab8aac939f4833e7e57db1e73ff0efeb869d95188182315362359c470ce7050a189bb85bbf497329ac5e2b8465a7a4bd5f33d562e310bd3a0642dd7ae6b5c2ad4ccaab8b3cbc0ac8314a41c56eeede1328db379abaa0586746f5d9d76247269f016aee4de911571286246363f3c59ffc293f5c08794d01c33f6f1e1b4689769ca200fa1ac4dc9879606e59a900ecdac45b3421b69a7c69dc316152a58e8473c4fe9180678c3282962490bd3419721506d10656433b89354f724586336c871049e71fe9c2b5d225f2766936b96662904c360ab63d8248db360a5b3f56d1a2684dd254af15bb4f56911742801230e8ac93acd950721d4d86daef46a93f384a1d51f72256624c619f1fbf821642cd3fba103a9fc9eac18c467d465db01418097c5ba4305896b8903fc1fb22e8d5104a47b7147b50d45b7180f78bce80cdc24861680f1e2d1a1b4da94014151da95b2e3d835255d774168dc2f295aa3c4478add0ef22bf161c68d3bdeb29ff096ce530fa201a90566adf505170ab1e5e00b6794151fc42f3943b26119aa7c19a590d7834b51fd44c6188bc4389739a855fc7a96476ecb329a3c1e9edee5bebaceaae33a9293f28a6a9307a2770d7f7dc6cb3d1b0ef0369b2ee54999d0b9a4909dea72380d35f69b2725c84a2ccaf65658d13b2b1139dc67f947e94e84d101095995a687654b89829824173c5c848853b5f237cc7bd608bff25381125ea0f222e3f5664f3cafd6dae4bcb5e0c67c95412db94f69708da11c7f4c3738b9d86662e2e31f092cebb4deb6892a986583b25cb53aa22b85947d11bb94909335a7f505e631e03c7c53d7f462f5fad854f66a2a9fd3a11c7a0b9f4626ba6f64e38346d13d6fcd403ab23403e9a49c4795e1bfcf2cda00e071b03c0e963f6a0e380e96c7c1f238581e07cbe360797a1c2c8f83e571b03c0e96c7c1f247192ca7cf1e2c7bf0d60c96b3e1e953ffd5cd73b1e601c6bca6f679b3e9ebff0ae3ff70cae49e9d953ab5adae0ddfbad97b23a8d73b9106b440f422d924e97dd2c287c59f5ccc35ef4926d383be72d4834403c7b1e6ad194f493e8aa2054fe80bbeb34065ba79e4e998fce1c798e60f1a948eb36d8fd9b66731d00e92ad5eb7354e36779b1d6873af47a7d93c50eb921ea9ac8775294d663f76aff2e2df160eaddceaf1a64639f59e523cd0e33f6b1feebec087637b3c7aa4c017c967c2c206defb58e74f6b8b5da65fbb5bb8e16ad79ca916c7d63e30b50fb2810c26dd87739dfe73a17e03ceff8bdee6295be89e9f3e1f0fad00d6f57b9aa78d4f9a635c33c77e68ec6b0a4db2ee6990a1ce209383c0f1b4458653ddfb76903b444910e16b59191e8389e6bb40dff898f7694f789d870d11a665e25cf09546fa17091216cfd37443b059da1794e2dfadde27d14ef27b90df2af7179607e465fc5380da13eb9a6e49f41dcdbddfb1fc7603872feea3dbe9f4c6ff7d77f669b50ead70fbe61ff37c32de6e575f3edb6b617adeb6c7a210544af1741b57b5612a2a602e5a964766ebf1def8957f246c74af8347fd5e57726ea2aae9d2e8ac8b1199443ba9d3aa05ccf390218bc37f01cc6676a5, '8naQE6', 0);

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

--
-- Volcado de datos para la tabla `certificado_medico`
--

INSERT INTO `certificado_medico` (`id`, `identificacion_persona`, `tipo_certificado`, `detalle`) VALUES
(1, '0803926806', 'certificado', 'ghj');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_medica`
--

CREATE TABLE `cita_medica` (
  `doctor` varchar(40) NOT NULL,
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

--
-- Volcado de datos para la tabla `cita_medica`
--

INSERT INTO `cita_medica` (`doctor`, `id_cita`, `temperatura`, `peso`, `frc_cardiaca`, `revision_fisica`, `sintomas`, `diagnostico_exFisicos`, `diagnostico`, `id_paciente`, `fecha_cita`, `tratamiento_sm`, `presion_arterial`, `tipo_atencion`) VALUES
('superadmin', 1, NULL, NULL, '', '', '', '', '', 1, '2017-01-29', '', '', 'Urgente');

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
-- Estructura de tabla para la tabla `indicaciones`
--

CREATE TABLE `indicaciones` (
  `idIndicacion` int(11) NOT NULL,
  `idExamenHistoria` int(11) NOT NULL,
  `indicacion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `usuario` varchar(250) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `acceso` varchar(250) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `logs`
--

INSERT INTO `logs` (`id`, `usuario`, `ip`, `acceso`, `fecha`) VALUES
(1, 'test', '::1', '0', '0000-00-00'),
(2, 'test', '::1', '0', '0000-00-00'),
(3, 'superadmin', '::1', '0', '0000-00-00');

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

--
-- Volcado de datos para la tabla `receta_detalle`
--

INSERT INTO `receta_detalle` (`id_cita`, `id_medicamento`, `cantidad_med`, `indicaciones`, `observacion`) VALUES
(1, 2, 6, 'hdskf', '');

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

--
-- Volcado de datos para la tabla `reportepacientes`
--

INSERT INTO `reportepacientes` (`idreporte`, `fechainicio`, `fechafin`, `fechaRegistro`, `reporte`) VALUES
(2, '2017-01-19', '2016-12-26', '2017-01-29', ''),
(6, '2017-01-05', '2017-01-19', '2017-01-29', ''),
(7, '2017-01-21', '2017-01-29', '2017-01-29', ''),
(8, '2017-01-12', '2017-01-29', '2017-01-29', '');

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
-- Indices de la tabla `indicaciones`
--
ALTER TABLE `indicaciones`
  ADD PRIMARY KEY (`idIndicacion`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6050;
--
-- AUTO_INCREMENT de la tabla `audit_error`
--
ALTER TABLE `audit_error`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=917;
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `cita_medica`
--
ALTER TABLE `cita_medica`
  MODIFY `id_cita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `examen`
--
ALTER TABLE `examen`
  MODIFY `idExamen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `indicaciones`
--
ALTER TABLE `indicaciones`
  MODIFY `idIndicacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `id_medicamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `reportepacientes`
--
ALTER TABLE `reportepacientes`
  MODIFY `idreporte` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
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
-- Filtros para la tabla `dependiente`
--
ALTER TABLE `dependiente`
  ADD CONSTRAINT `dependiente_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`) ON DELETE CASCADE ON UPDATE CASCADE;

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
