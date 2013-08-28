-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Хост: resscode.mysql.ukraine.com.ua
-- Время создания: Авг 28 2013 г., 23:35
-- Версия сервера: 5.1.69-cll-lve
-- Версия PHP: 5.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `resscode_hb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `in_categories`
--

CREATE TABLE IF NOT EXISTS `in_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `in_categories`
--

INSERT INTO `in_categories` (`id`, `name`, `description`, `is_default`, `created`, `updated`) VALUES
(1, 'Зарплата Антон', '<p>\n	Каждый месяц ЗП</p>\n', 1, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(2, 'ЗП Нина', '<p>\n	Каждый месяц ЗП</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(3, 'Freelance Антон', '<p>\n	Доп заработки</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(4, 'Доп заработки Нина', '<p>\n	Все может когда-то быть</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `in_transactions`
--

CREATE TABLE IF NOT EXISTS `in_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `category_id` int(11) NOT NULL,
  `pocket_id` int(11) NOT NULL,
  `count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created` datetime NOT NULL,
  `result` tinyint(1) NOT NULL,
  `updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `pocket_id` (`pocket_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `in_transactions`
--

INSERT INTO `in_transactions` (`id`, `name`, `category_id`, `pocket_id`, `count`, `created`, `result`, `updated`) VALUES
(1, 'Заработала на приложении', 4, 1, '55.00', '2013-08-28 00:00:00', 0, 0),
(2, 'андроид', 4, 1, '23.00', '2013-08-28 00:00:00', 0, 0),
(3, '', 4, 1, '67.00', '2013-08-28 00:00:00', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `migrate_transactions`
--

CREATE TABLE IF NOT EXISTS `migrate_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pocket_id_from` int(11) NOT NULL,
  `pocket_id_to` int(11) NOT NULL,
  `count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created` datetime NOT NULL,
  `result` tinyint(1) NOT NULL DEFAULT '0',
  `updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pocket_id_from` (`pocket_id_from`,`pocket_id_to`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `migrate_transactions`
--

INSERT INTO `migrate_transactions` (`id`, `pocket_id_from`, `pocket_id_to`, `count`, `created`, `result`, `updated`) VALUES
(12, 4, 3, '76000.00', '2013-08-28 00:00:00', 1, 0),
(13, 3, 6, '1000.00', '2013-08-28 00:00:00', 1, 0),
(14, 3, 2, '500.00', '2013-08-28 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `out_categories`
--

CREATE TABLE IF NOT EXISTS `out_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `out_categories`
--

INSERT INTO `out_categories` (`id`, `name`, `description`, `is_default`, `created`, `updated`) VALUES
(1, 'Продукты', '<p>\n	Покупка продуктов</p>\n', 1, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(2, 'Техника', '<p>\n	Покупка разной техники</p>\n', 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Квартплата', '<p>\n	Ежемесячная квартплата</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(4, 'Проезд', '<p>\n	Оплата проезда в транспорте</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(5, 'Медицина', '<p>\n	Лекарства, Врачи и прочее</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(6, 'Автомобиль', '<p>\n	Все что с ним связано (штрафы, ремонт, и т.д.)</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(7, 'Одежда', '<p>\n	Покупка одежды, для одежды, прочее</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(8, 'Велосипед', '<p>\n	Для велосипеда, детали, аксессуары</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(9, 'Отпуск', '<p>\n	Едем куда-нибудь, все траты</p>\n', 0, '2013-08-28 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `out_transactions`
--

CREATE TABLE IF NOT EXISTS `out_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `category_id` int(11) NOT NULL,
  `pocket_id` int(11) NOT NULL,
  `count` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created` datetime NOT NULL,
  `result` tinyint(1) NOT NULL,
  `updated` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pocket_id` (`pocket_id`),
  KEY `pocket_id_2` (`pocket_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `out_transactions`
--

INSERT INTO `out_transactions` (`id`, `name`, `description`, `category_id`, `pocket_id`, `count`, `created`, `result`, `updated`) VALUES
(3, 'Нина Зубы', '<p>\n	Чистка камня</p>\n', 5, 6, '200.00', '2013-08-27 00:00:00', 1, 0),
(4, 'одежда магазин', '<p>\n	штаны и куртка на осень</p>\n', 7, 3, '2200.00', '2013-08-26 00:00:00', 1, 0),
(5, 'метро', '<p>\n	Карта метро, Антон</p>\n', 4, 2, '30.00', '2013-08-27 00:00:00', 1, 0),
(6, 'Мрео переоформление', '<p>\n	Переоформление авто :</p>\n<ol>\n	<li>\n		Справка-счет 650</li>\n	<li>\n		Переоформление техпаспорта 225</li>\n</ol>\n', 6, 6, '875.00', '2013-08-28 00:00:00', 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `pockets`
--

CREATE TABLE IF NOT EXISTS `pockets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `count` decimal(10,2) NOT NULL,
  `count_limit` decimal(10,2) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `pockets`
--

INSERT INTO `pockets` (`id`, `name`, `description`, `count`, `count_limit`, `created`, `updated`) VALUES
(1, 'Кошелек Нины', '<p>\n	Лежит в кармане</p>\n', '50.00', '2000.00', '2013-08-28 00:00:00', '2013-08-28 16:48:34'),
(2, 'Кошелек Антона', '<p>\n	Обычный, в кармане лежит</p>\n', '507.00', '3000.00', '2013-08-28 00:00:00', '2013-08-28 20:33:47'),
(3, 'Заначка', '<p>\n	Наличная и дома</p>\n', '75300.00', '100000.00', '2013-08-28 00:00:00', '2013-08-28 20:33:47'),
(4, 'Депозитный Нины', '<p>\n	Депозитный счет Нины</p>\n', '2000.00', '999999.00', '2013-08-28 00:00:00', '2013-08-28 20:30:14'),
(5, 'Квартплатный', '', '2600.00', '2700.00', '2013-08-28 00:00:00', '0000-00-00 00:00:00'),
(6, 'Еда', '', '1125.00', '3000.00', '2013-08-28 00:00:00', '2013-08-28 20:32:34'),
(7, 'Дебетная карта Нина', '<p>\n	карта банка, физ лицо</p>\n', '50.00', '5000.00', '2013-08-28 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `login` varchar(64) NOT NULL,
  `pass` varchar(64) NOT NULL,
  `email` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `users_pockets`
--

CREATE TABLE IF NOT EXISTS `users_pockets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pocket_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`pocket_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
