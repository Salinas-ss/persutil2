-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 10-11-2025 a las 11:28:03
-- Versión del servidor: 8.4.5
-- Versión de PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `persutildb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id` bigint NOT NULL,
  `titulo` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext COLLATE utf32_unicode_ci NOT NULL,
  `etiquetas` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

-- --------------Joan Salinas------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id` bigint NOT NULL,
  `nombre` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `ingredientes` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `preparacion` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Volcado de datos para la tabla `receta`
--

INSERT INTO `receta` (`id`, `nombre`, `ingredientes`, `preparacion`, `fecha_creacion`, `fecha_modificacion`) VALUES
  (1, 'Lasaña de Verduras con Ricotta', '12 láminas de pasta para lasaña, 1 calabacín, 1 berenjena, 1 pimiento rojo, 200g de espinacas frescas, 250g de queso ricotta, 100g de queso parmesano rallado, 500ml de salsa bechamel, 400g de tomate triturado, 1 cebolla, aceite de oliva, sal, pimienta y nuez moscada.',
  'Picar la cebolla y sofreírla. Añadir el calabacín, la berenjena y el pimiento cortados en cubos pequeños y cocinar hasta que estén tiernos. Mezclar el sofrito de verduras con el tomate triturado y las espinacas cocidas. En un bol aparte, mezclar la ricotta con la mitad del parmesano, sal y pimienta. \n\nPara montar la lasaña: Colocar una capa fina de bechamel en la base del molde. Cubrir con láminas de pasta, luego una capa de salsa de verduras, y después una capa de la mezcla de ricotta. Repetir las capas hasta terminar con una lámina de pasta cubierta generosamente con bechamel y el resto del queso parmesano. \n\nHornear a 180°C durante 30-35 minutos, o hasta que esté dorado y burbujeante. Dejar reposar 10 minutos antes de servir.','2025-11-27 10:44:25', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;
