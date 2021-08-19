-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-08-2021 a las 23:17:56
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tocaimapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `idcomentario` int(11) NOT NULL,
  `registrarcomentario` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comentarios`
--

INSERT INTO `comentarios` (`idcomentario`, `registrarcomentario`) VALUES
(25, 'holas sss'),
(26, 'culaquier');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `nombres` varchar(16) NOT NULL,
  `apellidos` varchar(16) DEFAULT NULL,
  `documento de identidad` varchar(16) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(32) NOT NULL,
  `create_time` timestamp NULL DEFAULT current_timestamp(),
  `login` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mapa`
--

CREATE TABLE `mapa` (
  `idsitio turistico` int(11) NOT NULL,
  `ubicacion` varchar(45) DEFAULT NULL,
  `sitios turisticos_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqrs`
--

CREATE TABLE `pqrs` (
  `idPqrs` int(11) NOT NULL,
  `comPqrs` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pqrs`
--

INSERT INTO `pqrs` (`idPqrs`, `comPqrs`) VALUES
(30, 'Daniel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sitiosturisticos`
--

CREATE TABLE `sitiosturisticos` (
  `idSitioTuristico` int(11) NOT NULL,
  `nombreST` varchar(40) NOT NULL,
  `direccionST` varchar(40) DEFAULT NULL,
  `telefonoST` int(25) DEFAULT NULL,
  `tipoST` enum('Piscinas','Hoteles','Restaurantes','Quebradas') DEFAULT NULL,
  `correoST` varchar(40) DEFAULT NULL,
  `propietarioST` varchar(40) DEFAULT NULL,
  `descripcionST` varchar(50) DEFAULT NULL,
  `yearST` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sitiosturisticos`
--

INSERT INTO `sitiosturisticos` (`idSitioTuristico`, `nombreST`, `direccionST`, `telefonoST`, `tipoST`, `correoST`, `propietarioST`, `descripcionST`, `yearST`) VALUES
(49, 'Marbella', '14-31-313', 2147483647, 'Piscinas', 'marbella@gmail.com', 'Don Edgar', 'es un lugar muy bonito XD.', '2021-08-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuNombre` varchar(40) CHARACTER SET utf8mb4 NOT NULL,
  `usuEmail` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `usuPassword` varchar(90) CHARACTER SET utf8mb4 NOT NULL,
  `intentos` int(1) NOT NULL,
  `rol` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuNombre`, `usuEmail`, `usuPassword`, `intentos`, `rol`) VALUES
(5, 'Joniel', 'Joniel@gmail.es', '$2a$07$usesomesillystringforehR8V/jI2LoLh3LPfFvHrV1rha7SJzzu', 2, 0),
(9, 'Hola1234', 'hola@gmail.com', '$2a$07$usesomesillystringforeufjwF1r0UBNrpDv06NOcKpswar1/nFm', 0, 0),
(10, 'Chao1234', 'hola@gmail.com', '$2a$07$usesomesillystringforeyPCij0bwPyKWlSgMEwZZ2fQQKKThyNW', 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`idcomentario`);

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`login`);

--
-- Indices de la tabla `mapa`
--
ALTER TABLE `mapa`
  ADD PRIMARY KEY (`idsitio turistico`,`sitios turisticos_id`),
  ADD KEY `fk_Mapa_sitios turisticos1_idx` (`sitios turisticos_id`);

--
-- Indices de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  ADD PRIMARY KEY (`idPqrs`);

--
-- Indices de la tabla `sitiosturisticos`
--
ALTER TABLE `sitiosturisticos`
  ADD PRIMARY KEY (`idSitioTuristico`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  MODIFY `idPqrs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `sitiosturisticos`
--
ALTER TABLE `sitiosturisticos`
  MODIFY `idSitioTuristico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mapa`
--
ALTER TABLE `mapa`
  ADD CONSTRAINT `fk_Mapa_sitios turisticos1` FOREIGN KEY (`sitios turisticos_id`) REFERENCES `sitiosturisticos` (`idSitioTuristico`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
