-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-10-2021 a las 23:38:50
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
(1, 'Este es un comentario de ejemplo.');

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
(1, 'Esta es una PQRS de prueba.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(11) NOT NULL,
  `nombreRol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `nombreRol`) VALUES
(1, 'admin'),
(2, 'user');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rolesusuarios`
--

CREATE TABLE `rolesusuarios` (
  `idRolesUsuarios` int(11) NOT NULL,
  `usuEmail` varchar(40) NOT NULL,
  `usuPassword` varchar(100) NOT NULL,
  `intentos` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rolesusuarios`
--

INSERT INTO `rolesusuarios` (`idRolesUsuarios`, `usuEmail`, `usuPassword`, `intentos`, `idUsuario`, `idRol`) VALUES
(13, 'Admin123@gmail.com', '$2a$07$usesomesillystringfores.79oDL.a4zuwVec9LIxd5sYmqRGkPq', 0, 47, 1),
(16, 'Zulet123@gmail.com', '$2a$07$usesomesillystringfore6TP35VPoFKKGdEVoIbHIirRvKPG.Y5y', 0, 50, 2);

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
  `descripcionST` varchar(150) DEFAULT NULL,
  `yearST` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sitiosturisticos`
--

INSERT INTO `sitiosturisticos` (`idSitioTuristico`, `nombreST`, `direccionST`, `telefonoST`, `tipoST`, `correoST`, `propietarioST`, `descripcionST`, `yearST`) VALUES
(1, 'Marbella', '14-31-313', 2147483647, 'Piscinas', 'marbella@gmail.com', 'Don Edgar', 'Es un lugar donde podrá refrescarse y tener un espacio para usted y su familia', '2021-10-04'),
(90, 'Hotel Saela', '12-31-98', 2147483647, 'Hoteles', 'HotelSaela@gmail.com', 'Julian Farra', 'Este es un hotel con la capacidad de brindar comodidad.', '2021-10-08'),
(91, 'chino el cochino', '20-31-313', 301723123, 'Restaurantes', 'chinocochino@gmail.com', 'el chino', 'la mejor comida cochina para mandarte al baño por cochino.', '2009-12-31'),
(92, 'Cachimula 8', '65-31-313', 2147483647, 'Quebradas', 'Cachimula8@gmail.com', 'E lCachimulo', 'Esta quebrada está quebrada.', '0001-01-01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `usuNombre` varchar(40) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `usuNombre`) VALUES
(47, 'Admin123'),
(50, 'Zulet123'),
(52, 'stiven');

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
-- Indices de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  ADD PRIMARY KEY (`idPqrs`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `rolesusuarios`
--
ALTER TABLE `rolesusuarios`
  ADD PRIMARY KEY (`idRolesUsuarios`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

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
  MODIFY `idcomentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  MODIFY `idPqrs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `rolesusuarios`
--
ALTER TABLE `rolesusuarios`
  MODIFY `idRolesUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `sitiosturisticos`
--
ALTER TABLE `sitiosturisticos`
  MODIFY `idSitioTuristico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rolesusuarios`
--
ALTER TABLE `rolesusuarios`
  ADD CONSTRAINT `rolesusuarios_ibfk_2` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`),
  ADD CONSTRAINT `rolesusuarios_ibfk_3` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
