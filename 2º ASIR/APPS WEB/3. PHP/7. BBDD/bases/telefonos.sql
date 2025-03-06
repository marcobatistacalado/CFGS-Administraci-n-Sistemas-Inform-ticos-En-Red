-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 08-12-2014 a las 17:56:10
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `telefonos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `abonados`
--

CREATE TABLE IF NOT EXISTS `abonados` (
  `numero` int(9) NOT NULL,
  `clave` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `saldo` double NOT NULL,
  KEY `numero` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `abonados`
--

INSERT INTO `abonados` (`numero`, `clave`, `nombre`, `apellido`, `saldo`) VALUES
(616161616, '222222222', 'Marina', 'Rodríguez', 2),
(655555555, '333333333', 'Eusebio', 'Recalde', 12),
(666666665, '111111111', 'Julian', 'Llorente', 54);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `llamadas`
--

CREATE TABLE IF NOT EXISTS `llamadas` (
  `orden` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` int(9) NOT NULL,
  `telefono_des` int(9) NOT NULL,
  `importe` double NOT NULL,
  PRIMARY KEY (`orden`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Volcado de datos para la tabla `llamadas`
--

INSERT INTO `llamadas` (`orden`, `telefono`, `telefono_des`, `importe`) VALUES
(1, 616161616, 913434534, 1.3),
(2, 655555555, 655874859, 0.5),
(3, 616161616, 678945673, 1.4),
(4, 666666665, 943567802, 2.3),
(5, 655555555, 674337242, 0.89),
(6, 666666665, 912345343, 0.75),
(7, 616161616, 923420434, 1.3),
(8, 655555555, 694359209, 1.8),
(9, 616161616, 918348384, 3.1),
(10, 655555555, 609384932, 0.3);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
