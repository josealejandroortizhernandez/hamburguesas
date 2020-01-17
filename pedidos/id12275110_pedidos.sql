-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-01-2020 a las 19:23:10
-- Versión del servidor: 5.7.21
-- Versión de PHP: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pedidos`
--
CREATE DATABASE IF NOT EXISTS `pedidos` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pedidos`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
CREATE TABLE IF NOT EXISTS `detalle_pedido` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `numero_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `costo` double NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `numero_cotizacion` (`numero_pedido`,`id_producto`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `id_marca` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_marca` char(40) NOT NULL,
  PRIMARY KEY (`id_marca`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`id_marca`, `nombre_marca`) VALUES
(1, 'Mcdonalds'),
(2, 'Burger King'),
(6, 'fuze tea'),
(5, 'Agua Ciel'),
(4, 'Pepsi'),
(3, 'Coca-Cola');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `id_pedido` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `transporte` varchar(255) NOT NULL,
  `condiciones` varchar(255) NOT NULL,
  `comentarios` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  UNIQUE KEY `numero_cotizacion` (`numero`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_comercial` varchar(255) NOT NULL,
  `propietario` varchar(255) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(64) NOT NULL,
  `iva` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id`, `nombre_comercial`, `propietario`, `telefono`, `direccion`, `email`, `iva`) VALUES
(1, 'Jose Alejandro Ortiz Hernandez', 'Jose Alejandro Ortiz Hernandez', '55-37-22-40-66', 'universidad tecnológica de Nezahualcóyotl', '17371084@alumnos.utn.edu.mx', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_producto` char(20) NOT NULL,
  `nombre_producto` char(100) NOT NULL,
  `id_departamento_producto` int(11) NOT NULL,
  `id_marca_producto` int(11) NOT NULL,
  `status_producto` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `precio_producto` double NOT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_producto` (`codigo_producto`),
  KEY `id_departamento_producto` (`id_departamento_producto`),
  KEY `id_marca_producto` (`id_marca_producto`)
) ENGINE=MyISAM AUTO_INCREMENT=4301 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `codigo_producto`, `nombre_producto`, `id_departamento_producto`, `id_marca_producto`, `status_producto`, `date_added`, `precio_producto`) VALUES
(1, 'McTP', 'MacTrio Pollo Tocino Grill o Crispy	', 3, 1, 1, '2013-03-25 20:35:15', 90),
(2, 'McTriPCL', 'Pollo Classico Grill o Crispy	', 3, 1, 1, '2013-03-25 20:35:15', 85),
(3, 'McTriEns', 'EnsaladaGrill o Crispy	', 3, 1, 1, '2013-03-25 20:35:15', 90),
(4, 'CajFe', 'Eliga Cajita Feliz,Elige una bebida, Elige un postre	', 3, 1, 1, '2013-03-25 20:35:15', 67),
(5, 'CajJun', 'Junior Pak (Hamburguesa Doblecon Queso, o McNuggets, 6 piezas)	', 3, 1, 1, '2013-03-25 20:35:15', 75),
(6, 'LiDeHa', 'Habanero Ranch (con Tocino)	', 3, 1, 1, '2013-03-25 20:35:15', 110),
(8, 'WhoC', 'Whopper (Combo)', 3, 2, 1, '2013-03-25 20:35:15', 85),
(7, 'SugKi', 'Crispy King', 3, 2, 1, '2013-03-25 20:35:15', 119),
(10, 'BeCo', 'Coca-Cola Lata', 3, 3, 1, '2013-03-25 20:35:15', 15),
(9, 'BeCoc', 'Coca-cola 400ml', 3, 3, 1, '2013-03-25 20:35:15', 17),
(11, 'PsL', 'Pepsi Lata 335ml', 3, 4, 1, '2013-03-25 20:35:15', 11),
(12, 'PesB', 'Pepsi 600ml', 3, 4, 1, '2020-01-17 22:35:15', 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
CREATE TABLE IF NOT EXISTS `proveedores` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_proveedor` varchar(255) NOT NULL,
  `telefono` varchar(100) NOT NULL,
  `email` varchar(64) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id_proveedor`, `nombre_proveedor`, `telefono`, `email`, `direccion`) VALUES
(1, 'Plaza Neza', '55 5731 6071', 'plazaneza@gmail.com', 'Av. Gral. Lázaro Cárdenas 8, Rey Neza, 57809 Nezahualcóyotl, Méx.\r\n'),
(2, 'Plaza Cuidad Jardin', '800 300 3435', 'jardin@gmail.com', 'Walmart, Av Bordo de Xochiaca 3, Col. Raul Romero Ampliación, Benito Juárez, 57205 Nezahualcóyotl, Méx'),
(3, 'Plaza Parque Tezontle', '800 300 3435', 'tezontle@gmail.com', 'Av Canal de Tezontle 1512, Área Federal Central de Abastos, Iztapalapa, 09020 Ciudad de México, CDMX');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tmp`
--

DROP TABLE IF EXISTS `tmp`;
CREATE TABLE IF NOT EXISTS `tmp` (
  `id_tmp` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad_tmp` int(11) NOT NULL,
  `precio_tmp` double(8,2) DEFAULT NULL,
  `session_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_tmp`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tmp`
--

INSERT INTO `tmp` (`id_tmp`, `id_producto`, `cantidad_tmp`, `precio_tmp`, `session_id`) VALUES
(82, 4, 1, 67.00, 'n5200iulp4mo99rlh0el6jbhs5'),
(81, 2, 1, 85.00, 'n5200iulp4mo99rlh0el6jbhs5');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
