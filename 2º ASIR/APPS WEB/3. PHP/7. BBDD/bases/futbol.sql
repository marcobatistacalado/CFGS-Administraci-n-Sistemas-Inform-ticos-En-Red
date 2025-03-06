-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-12-2014 a las 12:18:58
-- Versión del servidor: 5.5.24-log
-- Versión de PHP: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `futbol`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE IF NOT EXISTS `equipos` (
  `nombre` varchar(30) NOT NULL,
  `partidos` int(11) NOT NULL DEFAULT '0',
  `puntos` int(11) NOT NULL DEFAULT '0',
  `partidos_ganados` int(11) NOT NULL DEFAULT '0',
  `partidos_perdidos` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`nombre`, `partidos`, `puntos`, `partidos_ganados`, `partidos_perdidos`) VALUES
('Athletico', 1, 0, 0, 1),
('Barcelona', 5, 7, 2, 2),
('Madrid', 3, 7, 2, 0),
('Sevilla', 3, 3, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE IF NOT EXISTS `partidos` (
  `numero` int(11) NOT NULL AUTO_INCREMENT,
  `equipo_local` varchar(30) NOT NULL,
  `equipo_visitante` varchar(30) NOT NULL,
  `goles_local` int(11) NOT NULL,
  `goles_visitante` int(11) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `equipo_visitante` (`equipo_visitante`),
  KEY `equipo_local` (`equipo_local`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`numero`, `equipo_local`, `equipo_visitante`, `goles_local`, `goles_visitante`) VALUES
(4, 'Barcelona', 'Sevilla', 3, 2),
(5, 'Barcelona', 'Madrid', 2, 2),
(6, 'Madrid', 'Sevilla', 3, 2),
(7, 'Madrid', 'Barcelona', 3, 2),
(8, 'Sevilla', 'Barcelona', 3, 1),
(9, 'Athletico', 'Barcelona', 1, 5);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`equipo_local`) REFERENCES `equipos` (`nombre`),
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`equipo_visitante`) REFERENCES `equipos` (`nombre`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
