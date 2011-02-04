-- phpMyAdmin SQL Dump
-- version 3.3.7deb2build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Erstellungszeit: 04. Februar 2011 um 16:20
-- Server Version: 5.1.49
-- PHP-Version: 5.3.3-1ubuntu9.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Datenbank: `ezrpg`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `buildings`
--

CREATE TABLE IF NOT EXISTS `buildings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `cost_money` int(11) NOT NULL,
  `cost_water` int(11) NOT NULL,
  `cost_iron` int(11) NOT NULL,
  `cost_aluminium` int(11) NOT NULL,
  `cost_titan` int(11) NOT NULL,
  `gives_money` int(11) NOT NULL,
  `gives_water` int(11) NOT NULL,
  `gives_iron` int(11) NOT NULL,
  `gives_aluminium` int(11) NOT NULL,
  `gives_titan` int(11) NOT NULL,
  `gives_exp` int(11) NOT NULL,
  `gives_energy` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `buildings`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cargo`
--

CREATE TABLE IF NOT EXISTS `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `function` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `cargo`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `items`
--

CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `items`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `library`
--

CREATE TABLE IF NOT EXISTS `library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `release` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `book` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `library`
--

INSERT INTO `library` (`id`, `name`, `release`, `author`, `book`) VALUES
(1, 'Test', 1295127872, 'Genesis Foundation', 'This book is an example on how to make books for the library. You can use this Example and add more books. As the player is able to read the books its a good place to store information. Books can be seperated in different Chapters by the Chapter divider &nbsp;---&nbsp; For further knowledge of Books read the comments in the module file.'),
(2, 'Navigating your ship', 1295127872, 'Genesis Foundation', '<b>Overview</b>\r\nTo navigate your ship you have to use the map. On the left side of the map is the surrounding area of your ship and you can see what type of water it is, what type of resources can be found there and if the field is accessible (not black). The right side shows more information about the field you are on. It shows you the coordinates, the name of the surrounding, the name of the resource and the name of the Player claiming the field.\r\nBelow that information you can find the navigation table. It offers you the eight moving directions and a central action button. This button is a sword or a shield. If someone else claims the field there is a sword and that means you have to attack the person claiming before other actions can be done. If noone or you are claiming the field you can look for random stuff or gather the resources on the field. You do not have to claim an unclaimed field if you want to gather stuff there, but others can come there, too. You have to calim and defend the spot in case to keep others out.\r\n --- <b>Details</b >');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` varchar(50) NOT NULL,
  `from` varchar(50) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isread` int(1) NOT NULL,
  `message` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Daten für Tabelle `mail`
--


-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `map`
--

CREATE TABLE IF NOT EXISTS `map` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `x` tinyint(4) NOT NULL,
  `y` tinyint(4) NOT NULL,
  `type` int(11) NOT NULL,
  `res` tinyint(4) NOT NULL,
  `count` smallint(6) NOT NULL,
  `accessable` tinyint(1) NOT NULL,
  `owner` int(11) NOT NULL,
  `buildings` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=145 ;

--
-- Daten für Tabelle `map`
--

INSERT INTO `map` (`id`, `x`, `y`, `type`, `res`, `count`, `accessable`, `owner`, `buildings`) VALUES
(1, 0, 0, 0, 0, 0, 1, 0, ''),
(2, 1, 0, 0, 0, 0, 0, 0, ''),
(3, 2, 0, 0, 0, 0, 1, 0, ''),
(4, 3, 0, 0, 0, 0, 1, 0, ''),
(5, 4, 0, 0, 0, 0, 1, 0, ''),
(6, 5, 0, 0, 0, 0, 1, 0, ''),
(7, 6, 0, 0, 0, 0, 1, 0, ''),
(8, 7, 0, 0, 0, 0, 1, 0, ''),
(9, 8, 0, 0, 0, 0, 1, 0, ''),
(10, 9, 0, 0, 0, 0, 1, 0, ''),
(11, 10, 0, 0, 0, 0, 0, 0, ''),
(12, 11, 0, 0, 0, 0, 1, 0, ''),
(13, 0, 1, 0, 0, 0, 0, 0, ''),
(14, 1, 1, 4, 0, 0, 0, 0, ''),
(15, 2, 1, 4, 0, 0, 0, 0, ''),
(16, 3, 1, 4, 0, 0, 0, 0, ''),
(17, 4, 1, 5, 0, 0, 0, 0, ''),
(18, 5, 1, 4, 0, 0, 0, 0, ''),
(19, 6, 1, 4, 0, 0, 0, 0, ''),
(20, 7, 1, 5, 0, 0, 0, 0, ''),
(21, 8, 1, 4, 0, 0, 0, 0, ''),
(22, 9, 1, 4, 5, 0, 0, 0, ''),
(23, 10, 1, 4, 0, 0, 0, 0, ''),
(24, 11, 1, 0, 0, 0, 0, 0, ''),
(25, 0, 2, 0, 0, 0, 1, 0, ''),
(26, 1, 2, 5, 0, 0, 0, 0, ''),
(27, 2, 2, 5, 0, 0, 1, 0, ''),
(28, 3, 2, 5, 4, 0, 1, 0, ''),
(29, 4, 2, 1, 0, 0, 1, 0, ''),
(30, 5, 2, 4, 0, 0, 1, 0, ''),
(31, 6, 2, 1, 0, 0, 1, 0, ''),
(32, 7, 2, 4, 0, 0, 1, 0, ''),
(33, 8, 2, 3, 0, 0, 1, 0, ''),
(34, 9, 2, 3, 5, 0, 1, 0, ''),
(35, 10, 2, 5, 5, 0, 0, 0, ''),
(36, 11, 2, 0, 0, 0, 1, 0, ''),
(37, 0, 3, 0, 0, 0, 1, 0, ''),
(38, 1, 3, 4, 0, 0, 0, 0, ''),
(39, 2, 3, 4, 0, 0, 1, 0, ''),
(40, 3, 3, 1, 0, 0, 1, 0, ''),
(41, 4, 3, 2, 0, 0, 1, 0, ''),
(42, 5, 3, 5, 0, 0, 1, 0, ''),
(43, 6, 3, 1, 0, 0, 1, 0, ''),
(44, 7, 3, 2, 0, 0, 1, 0, ''),
(45, 8, 3, 1, 0, 0, 1, 0, ''),
(46, 9, 3, 3, 0, 0, 1, 0, ''),
(47, 10, 3, 4, 5, 0, 0, 0, ''),
(48, 11, 3, 0, 0, 0, 1, 0, ''),
(49, 0, 4, 0, 0, 0, 1, 0, ''),
(50, 1, 4, 1, 0, 0, 0, 0, ''),
(51, 2, 4, 4, 0, 0, 1, 0, ''),
(52, 3, 4, 4, 0, 0, 1, 0, ''),
(53, 4, 4, 4, 0, 0, 1, 0, ''),
(54, 5, 4, 3, 0, 0, 1, 0, ''),
(55, 6, 4, 2, 0, 0, 1, 0, ''),
(56, 7, 4, 3, 0, 0, 1, 0, ''),
(57, 8, 4, 2, 1, 0, 1, 0, ''),
(58, 9, 4, 4, 0, 0, 1, 0, ''),
(59, 10, 4, 5, 0, 0, 0, 0, ''),
(60, 11, 4, 0, 0, 0, 1, 0, ''),
(61, 0, 5, 0, 0, 0, 1, 0, ''),
(62, 1, 5, 3, 3, 0, 0, 0, ''),
(63, 2, 5, 5, 3, 0, 1, 0, ''),
(64, 3, 5, 5, 0, 0, 1, 0, ''),
(65, 4, 5, 2, 0, 0, 1, 0, ''),
(66, 5, 5, 5, 0, 0, 1, 0, ''),
(67, 6, 5, 3, 0, 0, 1, 0, ''),
(68, 7, 5, 2, 1, 0, 1, 0, ''),
(69, 8, 5, 4, 1, 0, 1, 0, ''),
(70, 9, 5, 1, 1, 0, 1, 0, ''),
(71, 10, 5, 5, 0, 0, 0, 0, ''),
(72, 11, 5, 0, 0, 0, 1, 0, ''),
(73, 0, 6, 0, 0, 0, 1, 0, ''),
(74, 1, 6, 3, 0, 0, 0, 0, ''),
(75, 2, 6, 5, 3, 0, 1, 0, ''),
(76, 3, 6, 3, 0, 0, 1, 0, ''),
(77, 4, 6, 4, 0, 0, 1, 0, ''),
(78, 5, 6, 1, 0, 0, 1, 1, ''),
(79, 6, 6, 2, 0, 0, 1, 1, ''),
(80, 7, 6, 1, 0, 0, 1, 1, ''),
(81, 8, 6, 3, 0, 0, 1, 0, ''),
(82, 9, 6, 2, 0, 0, 1, 2, ''),
(83, 10, 6, 2, 0, 0, 0, 0, ''),
(84, 11, 6, 0, 0, 0, 1, 0, ''),
(85, 0, 7, 0, 0, 0, 1, 0, ''),
(86, 1, 7, 1, 0, 0, 0, 0, ''),
(87, 2, 7, 3, 0, 0, 1, 0, ''),
(88, 3, 7, 1, 0, 0, 1, 0, ''),
(89, 4, 7, 5, 0, 0, 1, 0, ''),
(90, 5, 7, 3, 0, 0, 1, 1, ''),
(91, 6, 7, 99, 0, 0, 1, 1, ''),
(92, 7, 7, 2, 0, 0, 1, 1, ''),
(93, 8, 7, 4, 0, 0, 1, 0, ''),
(94, 9, 7, 1, 0, 0, 1, 0, ''),
(95, 10, 7, 5, 0, 0, 0, 0, ''),
(96, 11, 7, 0, 0, 0, 1, 0, ''),
(97, 0, 8, 0, 0, 0, 1, 0, ''),
(98, 1, 8, 4, 2, 0, 0, 0, ''),
(99, 2, 8, 3, 2, 0, 1, 0, ''),
(100, 3, 8, 2, 0, 0, 1, 0, ''),
(101, 4, 8, 3, 0, 0, 1, 0, ''),
(102, 5, 8, 2, 0, 0, 1, 1, ''),
(103, 6, 8, 1, 0, 0, 1, 1, ''),
(104, 7, 8, 1, 0, 0, 1, 1, ''),
(105, 8, 8, 1, 3, 0, 1, 1, ''),
(106, 9, 8, 2, 0, 0, 1, 0, ''),
(107, 10, 8, 2, 0, 0, 0, 0, ''),
(108, 11, 8, 0, 0, 0, 1, 0, ''),
(109, 0, 9, 0, 0, 0, 1, 0, ''),
(110, 1, 9, 2, 2, 0, 0, 1, ''),
(111, 2, 9, 5, 2, 0, 1, 0, ''),
(112, 3, 9, 1, 0, 0, 1, 0, ''),
(113, 4, 9, 3, 0, 0, 1, 0, ''),
(114, 5, 9, 3, 0, 0, 1, 0, ''),
(115, 6, 9, 2, 0, 0, 1, 0, ''),
(116, 7, 9, 5, 3, 0, 1, 0, ''),
(117, 8, 9, 2, 3, 0, 1, 0, ''),
(118, 9, 9, 5, 0, 0, 1, 0, ''),
(119, 10, 9, 2, 0, 0, 0, 0, ''),
(120, 11, 9, 0, 0, 0, 1, 0, ''),
(121, 0, 10, 0, 0, 0, 0, 0, ''),
(122, 1, 10, 4, 0, 0, 0, 0, ''),
(123, 2, 10, 1, 4, 0, 0, 0, ''),
(124, 3, 10, 4, 4, 0, 0, 0, ''),
(125, 4, 10, 4, 0, 0, 0, 0, ''),
(126, 5, 10, 1, 0, 0, 0, 0, ''),
(127, 6, 10, 5, 0, 0, 0, 0, ''),
(128, 7, 10, 2, 0, 0, 0, 0, ''),
(129, 8, 10, 2, 0, 0, 0, 0, ''),
(130, 9, 10, 4, 3, 0, 0, 0, ''),
(131, 10, 10, 2, 0, 0, 0, 0, ''),
(132, 11, 10, 0, 0, 0, 0, 0, ''),
(133, 0, 11, 0, 0, 0, 1, 0, ''),
(134, 1, 11, 0, 0, 0, 0, 0, ''),
(135, 2, 11, 0, 0, 0, 1, 0, ''),
(136, 3, 11, 0, 0, 0, 1, 0, ''),
(137, 4, 11, 0, 0, 0, 1, 0, ''),
(138, 5, 11, 0, 0, 0, 1, 0, ''),
(139, 6, 11, 0, 0, 0, 1, 0, ''),
(140, 7, 11, 0, 0, 0, 1, 0, ''),
(141, 8, 11, 0, 0, 0, 1, 0, ''),
(142, 9, 11, 0, 0, 0, 1, 0, ''),
(143, 10, 11, 0, 0, 0, 0, 0, ''),
(144, 11, 11, 0, 0, 0, 1, 0, '');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `players`
--

CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `secret_key` text,
  `rank` smallint(5) unsigned NOT NULL DEFAULT '1',
  `registered` int(11) unsigned DEFAULT NULL,
  `last_active` int(11) unsigned DEFAULT '0',
  `last_login` int(11) unsigned DEFAULT '0',
  `money` int(11) unsigned DEFAULT '100',
  `water` int(11) NOT NULL,
  `iron` int(11) NOT NULL,
  `titan` int(11) NOT NULL,
  `oxygen` int(11) NOT NULL,
  `max_oxygen` int(11) NOT NULL,
  `aluminium` int(11) NOT NULL,
  `level` int(11) unsigned DEFAULT '1',
  `stat_points` int(11) unsigned DEFAULT '0',
  `exp` int(11) unsigned DEFAULT '0',
  `max_exp` int(11) unsigned DEFAULT '10',
  `hp` int(11) unsigned DEFAULT '20',
  `max_hp` int(11) unsigned DEFAULT '20',
  `energy` int(11) unsigned NOT NULL DEFAULT '10',
  `max_energy` int(11) unsigned NOT NULL DEFAULT '10',
  `strength` int(11) unsigned DEFAULT '5',
  `vitality` int(11) unsigned DEFAULT '5',
  `agility` int(11) unsigned DEFAULT '5',
  `dexterity` int(11) unsigned DEFAULT '5',
  `damage` int(11) unsigned DEFAULT '0',
  `kills` int(11) unsigned NOT NULL DEFAULT '0',
  `deaths` int(11) unsigned NOT NULL DEFAULT '0',
  `x` tinyint(4) NOT NULL,
  `y` tinyint(4) NOT NULL,
  `infight` tinyint(1) NOT NULL,
  `missions` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Daten für Tabelle `players`
--

INSERT INTO `players` (`id`, `username`, `password`, `email`, `secret_key`, `rank`, `registered`, `last_active`, `last_login`, `money`, `water`, `iron`, `titan`, `oxygen`, `max_oxygen`, `aluminium`, `level`, `stat_points`, `exp`, `max_exp`, `hp`, `max_hp`, `energy`, `max_energy`, `strength`, `vitality`, `agility`, `dexterity`, `damage`, `kills`, `deaths`, `x`, `y`, `infight`, `missions`) VALUES
(1, 'Genesis Foundation', 'e882a6c125e8527a22ebe06502036756c0ecf831', 'neumann.bastian@gmail.com', '#[LraAn8E9^k5`[g', 10, 1286231120, 1292231872, 1292231872, 146, 56, 82, 70, 30, 100, 130, 17, 0, 32, 330, 135, 135, 24, 26, 16, 12, 15, 19, 0, 18, 21, 8, 8, 0, 0),
(2, 'Bastian', '2e6c0ca265be5863883940f3102116a33eb72812', 'bastian.neumann@devcoding.com', 'Ab+G:d3m+y%@nak}', 1, 1286238668, 1296789378, 1296781986, 100, 3, 0, 0, 30, 100, 0, 6, 1, 67, 110, 5, 45, 6, 15, 22, 5, 7, 6, 0, 22, 18, 6, 7, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `player_log`
--

CREATE TABLE IF NOT EXISTS `player_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player` int(11) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `player_log` (`player`,`time`),
  KEY `new_logs` (`player`,`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=180 ;

--
-- Daten für Tabelle `player_log`
--

INSERT INTO `player_log` (`id`, `player`, `time`, `message`, `status`) VALUES
(101, 1, 1286443010, 'You have leveled up! You gained +2 stat points and +1 max energy!', 1),
(102, 1, 1286443010, 'You have leveled up! You gained +2 stat points and +1 max energy!', 1),
(103, 1, 1286443010, 'You have leveled up! You gained +2 stat points and +1 max energy!', 1),
(104, 1, 1286443076, 'You have increased your strength!', 1),
(105, 1, 1286443079, 'You have increased your strength!', 1),
(106, 1, 1286443080, 'You have increased your strength!', 1),
(107, 1, 1286443081, 'You have increased your strength!', 1),
(108, 1, 1286443081, 'You have increased your strength!', 1),
(109, 1, 1286443082, 'You have increased your strength!', 1),
(110, 2, 1286443165, '<strong>Kampfbereicht:</strong><br /><strong>Basti</strong> hat mit <strong>13</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>10</strong> Schaden getroffen<br /><strong>Basti</strong> hat mit <strong>12</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>10</strong> Schaden getroffen<br /><strong>Basti</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat nicht getroffen<br />Bastian hat keine Lebenspunkte mehr<br /><strong>Basti hat gewonnen</strong><br />', 1),
(111, 1, 1286443206, 'test', 1),
(112, 1, 1286443206, 'test2', 1),
(113, 1, 1286443233, 'test3', 1),
(114, 1, 1286443233, 'test4', 1),
(115, 1, 1286443282, 'test3', 1),
(116, 1, 1286443282, 'test4', 1),
(117, 1, 1287095839, 'You have leveled up! You gained +2 stat points and +1 max energy!', 1),
(118, 1, 1287095877, 'You have increased your agility!', 1),
(119, 1, 1287095880, 'You have increased your strength!', 1),
(120, 1, 1289000527, 'moved north', 1),
(121, 1, 1289000560, 'moved north', 1),
(122, 1, 1289000593, 'moved south', 1),
(123, 1, 1289000595, 'moved south', 1),
(124, 1, 1289000596, 'moved south', 1),
(125, 1, 1292065323, 'moved east', 1),
(126, 1, 1292065328, 'moved east', 1),
(127, 1, 1292065330, 'moved south', 1),
(128, 2, 1292067747, 'moved east', 1),
(129, 2, 1292067754, 'moved east', 1),
(130, 2, 1292067757, 'moved east', 1),
(131, 2, 1292067759, 'moved east', 1),
(132, 2, 1292067763, 'moved west', 1),
(133, 2, 1292067765, 'moved west', 1),
(134, 2, 1292067767, 'moved west', 1),
(135, 2, 1292067770, 'moved west', 1),
(136, 2, 1292067773, 'moved west', 1),
(137, 2, 1292067775, 'moved west', 1),
(138, 2, 1292067777, 'moved west', 1),
(139, 2, 1292067779, 'moved west', 1),
(140, 2, 1292067785, 'moved south', 1),
(141, 2, 1292067790, 'moved south', 1),
(142, 2, 1292067821, 'moved south', 1),
(143, 2, 1292067823, 'moved south', 1),
(144, 2, 1292067826, 'moved east', 1),
(145, 2, 1292067829, 'moved east', 1),
(146, 2, 1292067832, 'moved east', 1),
(147, 2, 1292067837, 'moved east', 1),
(148, 2, 1292067843, 'moved north', 1),
(149, 1, 1292067863, '<strong>Kampfbereicht:</strong><br /><strong>Bastian</strong> hat nicht getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat nicht getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat nicht getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br />Bastian hat keine Lebenspunkte mehr<br /><strong>Genesis Foundation hat gewonnen</strong><br />', 1),
(150, 2, 1292117175, 'moved north', 1),
(151, 2, 1292117178, 'moved north', 1),
(152, 2, 1292117180, 'moved west', 1),
(153, 2, 1292117359, 'moved south', 1),
(154, 2, 1292117361, 'moved west', 1),
(155, 2, 1292117363, 'moved south', 1),
(156, 2, 1292117366, 'moved west', 1),
(157, 2, 1292117369, 'moved west', 1),
(158, 2, 1292117370, 'moved west', 1),
(159, 2, 1292117394, 'moved east', 1),
(160, 2, 1292117396, 'moved east', 1),
(161, 2, 1292117397, 'moved east', 1),
(162, 2, 1292117399, 'moved east', 1),
(163, 2, 1292117401, 'moved east', 1),
(164, 2, 1292118554, 'moved west', 1),
(165, 2, 1292118556, 'moved east', 1),
(166, 2, 1292120494, 'moved east', 1),
(167, 2, 1292120496, 'moved east', 1),
(168, 1, 1292133363, '<strong>Kampfbereicht:</strong><br /><strong>Bastian</strong> hat mit <strong>10</strong> Schaden getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>12</strong> Schaden getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br />Bastian hat keine Lebenspunkte mehr<br /><strong>Genesis Foundation hat gewonnen</strong><br />', 1),
(169, 2, 1292487257, 'moved east', 1),
(170, 1, 1292488159, '<strong>Kampfbereicht:</strong><br />Bastian hat keine Lebenspunkte mehr<br /><strong>Genesis Foundation hat gewonnen</strong><br />', 0),
(171, 2, 1292488176, 'moved north', 1),
(172, 2, 1292488180, 'moved east', 1),
(173, 2, 1292488216, 'moved east', 1),
(174, 2, 1292489662, 'moved north', 1),
(175, 2, 1292489664, 'moved west', 1),
(176, 2, 1292489666, 'moved south', 1),
(177, 2, 1292489667, 'moved south', 1),
(178, 2, 1292489668, 'moved west', 1),
(179, 2, 1292489671, 'moved west', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ships`
--

CREATE TABLE IF NOT EXISTS `ships` (
  `id` int(11) NOT NULL,
  `propulsion` tinyint(4) NOT NULL DEFAULT '1',
  `gearbox` tinyint(4) NOT NULL DEFAULT '1',
  `engine` tinyint(4) NOT NULL DEFAULT '1',
  `energy` tinyint(4) NOT NULL DEFAULT '1',
  `navigation` tinyint(4) NOT NULL DEFAULT '1',
  `sonar` tinyint(4) NOT NULL DEFAULT '1',
  `weapon1` tinyint(4) NOT NULL DEFAULT '1',
  `weapon2` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ships`
--

INSERT INTO `ships` (`id`, `propulsion`, `gearbox`, `engine`, `energy`, `navigation`, `sonar`, `weapon1`, `weapon2`) VALUES
(2, 2, 3, 1, 3, 2, 1, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ship_parts`
--

CREATE TABLE IF NOT EXISTS `ship_parts` (
  `id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `name` text NOT NULL,
  `desc` text NOT NULL,
  `properties` text NOT NULL,
  KEY `id` (`id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `ship_parts`
--

INSERT INTO `ship_parts` (`id`, `type`, `name`, `desc`, `properties`) VALUES
(1, 'propulsion', 'Basic propeller', '', 'a:4:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:1;s:9:"dexterity";i:0;}'),
(2, 'propulsion', 'Big propeller', '', 'a:4:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:3;s:9:"dexterity";i:0;}'),
(3, 'propulsion', 'Advanced propeller', '', 'a:4:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:5;s:9:"dexterity";i:0;}'),
(4, 'propulsion', 'Basic impeller', '', 'a:4:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:6;s:9:"dexterity";i:1;}'),
(5, 'propulsion', 'Big impeller', '', 'a:4:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:8;s:9:"dexterity";i:2;}'),
(6, 'propulsion', 'Advanced impeller', '', 'a:4:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:10;s:9:"dexterity";i:4;}'),
(7, 'propusion', 'Small jet', '', 'a:4:{s:8:"strength";i:1;s:8:"vitality";i:0;s:7:"agility";i:13;s:9:"dexterity";i:5;}'),
(8, 'propulsion', 'Big jet', '', 'a:4:{s:8:"strength";i:2;s:8:"vitality";i:0;s:7:"agility";i:15;s:9:"dexterity";i:5;}'),
(9, 'propulsion', 'Advanced jet', '', 'a:4:{s:8:"strength";i:4;s:8:"vitality";i:0;s:7:"agility";i:20;s:9:"dexterity";i:7;}'),
(10, 'propulsion', 'Highspeed jet', '', 'a:4:{s:8:"strength";i:5;s:8:"vitality";i:0;s:7:"agility";i:25;s:9:"dexterity";i:10;}'),
(1, 'gearbox', 'Iron cog wheels', '', 'a:4:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:1;s:9:"dexterity";i:0;}'),
(2, 'gearbox', 'Steel cog wheels', '', 'a:4:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:2;s:9:"dexterity";i:0;}'),
(3, 'gearbox', 'Hard steel cog wheles', '', 'a:4:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:5;s:9:"dexterity";i:0;}'),
(4, 'gearbox', 'Titanium cog wheels', '', 'a:4:{s:8:"strength";i:2;s:8:"vitality";i:0;s:7:"agility";i:7;s:9:"dexterity";i:0;}'),
(1, 'energy', 'small nuclear plant', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:0;s:6:"energy";i:10;}'),
(2, 'energy', 'Medium nuclear plant', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:0;s:6:"energy";i:20;}'),
(3, 'energy', 'Big nuclear plant', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:0;s:6:"energy";i:30;}'),
(5, 'energy', 'Small fusion reactor', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:0;s:6:"energy";i:50;}'),
(6, 'energy', 'Medium fusion reactor', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:0;s:6:"energy";i:70;}'),
(7, 'energy', 'Hughe fusion reactor', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:0;s:6:"energy";i:100;}'),
(8, 'energy', 'Perpetuum Mobile', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:0;s:6:"energy";i:200;}'),
(1, 'engine', 'small Motor', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:10;s:9:"dexterity";i:0;s:6:"energy";i:0;}'),
(2, 'engine', 'Medium Motor', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:20;s:9:"dexterity";i:0;s:6:"energy";i:0;}'),
(3, 'engine', 'Big Motor', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:30;s:9:"dexterity";i:0;s:6:"energy";i:0;}'),
(4, 'engine', 'Twin Motor', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:50;s:9:"dexterity";i:0;s:6:"energy";i:0;}'),
(1, 'navigation', 'Pen and paper', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:1;s:6:"energy";i:0;}'),
(2, 'navigation', 'Calulator', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:5;s:6:"energy";i:0;}'),
(3, 'navigation', 'computer', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:10;s:6:"energy";i:0;}'),
(4, 'navigation', 'super copmuter', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:10;s:6:"energy";i:0;}'),
(5, 'navigation', 'Autopilot', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:15;s:6:"energy";i:0;}'),
(1, 'sonar', 'Small sonar', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:1;s:6:"energy";i:0;}'),
(2, 'sonar', 'Medium sonar', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:5;s:6:"energy";i:0;}'),
(3, 'sonar', 'Large sonar', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:10;s:6:"energy";i:0;}'),
(4, 'sonar', 'Sonar array', '', 'a:5:{s:8:"strength";i:0;s:8:"vitality";i:0;s:7:"agility";i:0;s:9:"dexterity";i:15;s:6:"energy";i:0;}');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `technology`
--

CREATE TABLE IF NOT EXISTS `technology` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `depend` int(11) NOT NULL,
  `name` varchar(25) NOT NULL,
  `type` varchar(25) NOT NULL,
  `add` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `water` int(11) NOT NULL,
  `iron` int(11) NOT NULL,
  `aluminium` int(11) NOT NULL,
  `titan` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Daten für Tabelle `technology`
--

INSERT INTO `technology` (`id`, `depend`, `name`, `type`, `add`, `level`, `gold`, `water`, `iron`, `aluminium`, `titan`) VALUES
(1, 0, 'Tank', 'max_energy', 10, 1, 500, 0, 20, 100, 5),
(2, 1, 'Tank', 'max_energy', 15, 2, 1500, 0, 40, 300, 50),
(3, 2, 'Tank', 'max_energy', 20, 3, 15000, 0, 60, 500, 120),
(4, 0, 'Schild', 'max_hp', 20, 1, 100, 0, 0, 0, 20),
(5, 4, 'Schild', 'max_hp', 50, 2, 1000, 0, 0, 20, 50),
(6, 5, 'Schild', 'max_hp', 50, 3, 3000, 0, 0, 200, 100);
