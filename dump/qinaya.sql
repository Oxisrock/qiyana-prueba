-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 23-03-2021 a las 15:29:44
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qinaya`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `activities_users`
--

DROP TABLE IF EXISTS `activities_users`;
CREATE TABLE IF NOT EXISTS `activities_users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `screen_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `activities_users`
--

INSERT INTO `activities_users` (`id`, `screen_url`, `action`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'https://images.unsplash.com/photo-1613820723315-b362e91c56cd?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', '2', 2, '2021-03-21 08:26:12', '2021-03-21 08:26:12'),
(2, 'https://images.unsplash.com/photo-1615738599351-cb9bb2361ff7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', '3', 2, '2021-03-21 08:27:28', '2021-03-21 08:27:28'),
(3, 'https://images.unsplash.com/photo-1615738599351-cb9bb2361ff7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', '4', 3, '2021-03-21 08:27:47', '2021-03-21 08:27:47'),
(4, 'https://images.unsplash.com/photo-1613820723315-b362e91c56cd?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', '5', 3, '2021-03-21 08:27:56', '2021-03-21 08:27:56'),
(5, 'https://images.unsplash.com/photo-1615494488088-43ac74d0c232?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', '6', 3, '2021-03-21 08:28:10', '2021-03-21 08:28:10'),
(6, 'https://images.unsplash.com/photo-1615494488088-43ac74d0c232?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', '7', 3, '2021-03-21 08:34:48', '2021-03-21 08:34:48'),
(7, 'https://images.unsplash.com/photo-1614676166964-c25efc2abd3b?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', '7', 3, '2021-03-21 08:51:33', '2021-03-21 08:51:33'),
(8, 'https://images.unsplash.com/photo-1614676166964-c25efc2abd3b?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', '7', 3, '2021-03-21 09:01:42', '2021-03-21 09:01:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_03_19_013056_create_preferences_users_table', 2),
(5, '2021_03_19_013333_create_activities_users_table', 2),
(6, '2021_03_21_001339_create_quotes_table', 3),
(7, '2021_03_21_011526_create_slider_table', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preferences_users`
--

DROP TABLE IF EXISTS `preferences_users`;
CREATE TABLE IF NOT EXISTS `preferences_users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cellphone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `screen_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `preferences_users`
--

INSERT INTO `preferences_users` (`id`, `name`, `cellphone`, `screen_url`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'francisco aular', '2', 'https://images.unsplash.com/photo-1613820723315-b362e91c56cd?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', 2, '2021-03-21 08:22:33', '2021-03-21 08:22:33'),
(7, 'Zelena Aular', '3', 'https://images.unsplash.com/photo-1614676166964-c25efc2abd3b?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', 3, '2021-03-21 08:34:48', '2021-03-21 09:01:42');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `quotes`
--

DROP TABLE IF EXISTS `quotes`;
CREATE TABLE IF NOT EXISTS `quotes` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_quote` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quote` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `background` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_show` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_expos` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `quotes`
--

INSERT INTO `quotes` (`id`, `id_quote`, `quote`, `author`, `title`, `background`, `date_show`, `numero_expos`, `created_at`, `updated_at`) VALUES
(1, '', 'Life is like a camera: just focus on what is important, capture good times, develop from negative, and if things do not work out, take another shot!', 'Daireth Winehouse', 'Inspiring Quote of the day', 'https://theysaidso.com/img/qod/qod-inspire.jpg', '2021-03-21', 16, '2021-03-21 07:45:40', '2021-03-23 18:19:03'),
(7, 'NMrdeKJZAouC1i06aoMm3weF', 'We are each gifted in a unique and important way. It is our privilege and our adventure to discover our own special light', 'Mary Dunbar', 'Inspiring Quote of the day', 'https://theysaidso.com/img/qod/qod-inspire.jpg', '2021-03-23', 7, '2021-03-23 05:41:42', '2021-03-23 18:22:49'),
(6, '6swMxxXixfwY6vqClJXzmweF', 'Luck is a dividend of sweat. The more you sweat, the luckier you get', 'Ray Kroc', 'Inspiring Quote of the day', 'https://theysaidso.com/img/qod/qod-inspire.jpg', '2021-03-22', 10, '2021-03-22 23:09:19', '2021-03-23 18:37:33'),
(8, '7o1kOJyXP0E_t7Z2IXyXuweF', 'I keep asking myself these three questions.. What do you have? What do you want? What will you give up?', 'Jack Ma', 'Inspiring Quote of the day', 'https://theysaidso.com/img/qod/qod-inspire.jpg', '2021-03-23', 4, '2021-03-23 18:15:03', '2021-03-23 18:37:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sliders`
--

DROP TABLE IF EXISTS `sliders`;
CREATE TABLE IF NOT EXISTS `sliders` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sliders`
--

INSERT INTO `sliders` (`id`, `image`, `created_at`, `updated_at`) VALUES
(1, 'https://images.unsplash.com/photo-1614110178057-3a098db7d4c6?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', NULL, NULL),
(2, 'https://images.unsplash.com/photo-1613730317814-1cede28e0151?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', NULL, NULL),
(3, 'https://images.unsplash.com/photo-1616127054878-dd456e5c6764?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', NULL, NULL),
(4, 'https://images.unsplash.com/photo-1613929905911-96040610a54d?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', NULL, NULL),
(5, 'https://images.unsplash.com/photo-1613744967722-20dc0b3343bb?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', NULL, NULL),
(6, 'https://images.unsplash.com/photo-1614015451306-fac3770c9149?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'francisco aular', 'franciscoaular18@gmail.com', NULL, '$2y$10$f4OHvj/YdiNdBQKY4UKN8esHHWwsOi.i6w8eOCz6y1X9Kdc79buuO', NULL, '2021-03-20 22:23:48', '2021-03-20 22:23:48'),
(3, 'Zelena Aular', 'zelena@gmail.com', NULL, '$2y$10$MwAQB3b3i1ZA4i8smRXhGeuR0xZxyx5Ggtq0Kz6fLFwmQbOnLGUQK', NULL, '2021-03-21 08:02:27', '2021-03-21 08:02:27');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
