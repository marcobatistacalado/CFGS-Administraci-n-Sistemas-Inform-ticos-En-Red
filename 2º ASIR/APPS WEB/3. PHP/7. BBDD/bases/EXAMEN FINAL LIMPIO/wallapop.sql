-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-02-2022 a las 03:49:12
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `wallapop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE `anuncios` (
  `codigo` varchar(6) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `precioventa` decimal(10,2) NOT NULL,
  `mail` varchar(20) NOT NULL,
  `peso` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `anuncios`
--

INSERT INTO `anuncios` (`codigo`, `categoria`, `descripcion`, `precioventa`, `mail`, `peso`) VALUES
('AAA012', 'moda', 'adidas blancas 42', '30.00', 'belenguay@gmail.com', '1.00'),
('BDE123', 'coches', 'seat ibiza 12 años', '3500.00', 'fr387@gmail.com', '0.00'),
('CDR111', 'telefonia', 'samsumg galaxy', '85.00', 'fr387@gmail.com', '0.20'),
('FDS012', 'libros', 'El principito', '9.00', 'hhh_21@hotmail.com', '0.00'),
('GFG231', 'libros', 'La reina roja', '12.00', 'fr387@gmail.com', '0.40'),
('HGF545', 'coches', 'Opel corsa 15 años', '2500.00', 'hhh_21@hotmail.com', '0.00'),
('LDS012', 'libros', 'El asesinato de Pitágoras', '12.50', 'mikeold@gmail.com', '0.00'),
('TER111', 'electrodomesticos', 'lámpara mesilla hierro', '28.00', 'fr387@gmail.com', '4.00'),
('TRE342', 'electrodomesticos', 'microondas', '89.00', 'hhh_21@hotmail.com', '10.00'),
('YRE554', 'telefonia', 'motorola cuarta generación', '110.00', 'fr387@gmail.com', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `mail` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `valoracion` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`mail`, `nombre`, `ciudad`, `valoracion`) VALUES
('belenguay@gmail.com', 'Belen', 'Madrid', '4.20'),
('fr387@gmail.com', 'Fernando', 'Madrid', '3.50'),
('hhh_21@hotmail.com', 'Helen', 'Barcelona', '3.40'),
('mikeold@gmail.com', 'Miguel', 'Barcelona', '4.70');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vendidos`
--

CREATE TABLE `vendidos` (
  `codigo` varchar(6) NOT NULL,
  `mailcomprador` varchar(20) NOT NULL,
  `precioventa` decimal(10,2) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `vendidos`
--

INSERT INTO `vendidos` (`codigo`, `mailcomprador`, `precioventa`, `fecha`) VALUES
('ASD123', 'fr387@gmail.com', '24.00', '2022-01-30 00:00:00'),
('RED322', 'belenguay@gmail.com', '22.00', '2022-02-23 04:55:54'),
('RTD444', 'belenguay@gmail.com', '7.00', '2022-01-30 00:00:00'),
('TER111', 'fr387@gmail.com', '38.00', '2022-02-07 00:00:00'),
('UIU876', 'fr387@gmail.com', '23.00', '2022-01-30 09:11:21');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `mail` (`mail`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`mail`);

--
-- Indices de la tabla `vendidos`
--
ALTER TABLE `vendidos`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `mailcomprador` (`mailcomprador`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD CONSTRAINT `anuncios_ibfk_1` FOREIGN KEY (`mail`) REFERENCES `usuarios` (`mail`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
