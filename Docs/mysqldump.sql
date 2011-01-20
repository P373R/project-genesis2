-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ezrpg
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `function` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `player_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `library`
--

DROP TABLE IF EXISTS `library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `library` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `release` int(11) NOT NULL,
  `author` varchar(50) NOT NULL,
  `book` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,'Test',1295127872,'Genesis Foundation','This book is an example on how to make books for the library. You can use this Example and add more books. As the player is able to read the books its a good place to store information. Books can be seperated in different Chapters by the Chapter divider &nbsp;---&nbsp; For further knowledge of Books read the comments in the module file.'),(2,'Navigating your ship',1295127872,'Genesis Foundation','<b>Overview</b>\r\nTo navigate your ship you have to use the map. On the left side of the map is the surrounding area of your ship and you can see what type of water it is, what type of resources can be found there and if the field is accessible (not black). The right side shows more information about the field you are on. It shows you the coordinates, the name of the surrounding, the name of the resource and the name of the Player claiming the field.\r\nBelow that information you can find the navigation table. It offers you the eight moving directions and a central action button. This button is a sword or a shield. If someone else claims the field there is a sword and that means you have to attack the person claiming before other actions can be done. If noone or you are claiming the field you can look for random stuff or gather the resources on the field. You do not have to claim an unclaimed field if you want to gather stuff there, but others can come there, too. You have to calim and defend the spot in case to keep others out.\r\n---\r\n<b>Details</b >');
/*!40000 ALTER TABLE `library` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to` varchar(50) NOT NULL,
  `from` varchar(50) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isread` int(1) NOT NULL,
  `message` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail_old`
--

DROP TABLE IF EXISTS `mail_old`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mail_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL,
  `from` varchar(30) NOT NULL,
  `to` varchar(30) NOT NULL,
  `msg` text NOT NULL,
  `read` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail_old`
--

LOCK TABLES `mail_old` WRITE;
/*!40000 ALTER TABLE `mail_old` DISABLE KEYS */;
INSERT INTO `mail_old` VALUES (9,1286343281,'Basti','sadasdaa','sd',0);
/*!40000 ALTER TABLE `mail_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map`
--

DROP TABLE IF EXISTS `map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map` (
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
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
INSERT INTO `map` VALUES (1,0,0,0,0,0,1,0,''),(2,1,0,0,0,0,0,0,''),(3,2,0,0,0,0,1,0,''),(4,3,0,0,0,0,1,0,''),(5,4,0,0,0,0,1,0,''),(6,5,0,0,0,0,1,0,''),(7,6,0,0,0,0,1,0,''),(8,7,0,0,0,0,1,0,''),(9,8,0,0,0,0,1,0,''),(10,9,0,0,0,0,1,0,''),(11,10,0,0,0,0,0,0,''),(12,11,0,0,0,0,1,0,''),(13,0,1,0,0,0,0,0,''),(14,1,1,4,0,0,0,0,''),(15,2,1,4,0,0,0,0,''),(16,3,1,4,0,0,0,0,''),(17,4,1,5,0,0,0,0,''),(18,5,1,4,0,0,0,0,''),(19,6,1,4,0,0,0,0,''),(20,7,1,5,0,0,0,0,''),(21,8,1,4,0,0,0,0,''),(22,9,1,4,5,0,0,0,''),(23,10,1,4,0,0,0,0,''),(24,11,1,0,0,0,0,0,''),(25,0,2,0,0,0,1,0,''),(26,1,2,5,0,0,0,0,''),(27,2,2,5,0,0,1,0,''),(28,3,2,5,4,0,1,0,''),(29,4,2,1,0,0,1,0,''),(30,5,2,4,0,0,1,0,''),(31,6,2,1,0,0,1,0,''),(32,7,2,4,0,0,1,0,''),(33,8,2,3,0,0,1,0,''),(34,9,2,3,5,0,1,0,''),(35,10,2,5,5,0,0,0,''),(36,11,2,0,0,0,1,0,''),(37,0,3,0,0,0,1,0,''),(38,1,3,4,0,0,0,0,''),(39,2,3,4,0,0,1,0,''),(40,3,3,1,0,0,1,0,''),(41,4,3,2,0,0,1,0,''),(42,5,3,5,0,0,1,0,''),(43,6,3,1,0,0,1,0,''),(44,7,3,2,0,0,1,0,''),(45,8,3,1,0,0,1,0,''),(46,9,3,3,0,0,1,0,''),(47,10,3,4,5,0,0,0,''),(48,11,3,0,0,0,1,0,''),(49,0,4,0,0,0,1,0,''),(50,1,4,1,0,0,0,0,''),(51,2,4,4,0,0,1,0,''),(52,3,4,4,0,0,1,0,''),(53,4,4,4,0,0,1,0,''),(54,5,4,3,0,0,1,0,''),(55,6,4,2,0,0,1,0,''),(56,7,4,3,0,0,1,0,''),(57,8,4,2,1,0,1,0,''),(58,9,4,4,0,0,1,0,''),(59,10,4,5,0,0,0,0,''),(60,11,4,0,0,0,1,0,''),(61,0,5,0,0,0,1,0,''),(62,1,5,3,3,0,0,0,''),(63,2,5,5,3,0,1,0,''),(64,3,5,5,0,0,1,0,''),(65,4,5,2,0,0,1,0,''),(66,5,5,5,0,0,1,0,''),(67,6,5,3,0,0,1,0,''),(68,7,5,2,1,0,1,0,''),(69,8,5,4,1,0,1,0,''),(70,9,5,1,1,0,1,0,''),(71,10,5,5,0,0,0,0,''),(72,11,5,0,0,0,1,0,''),(73,0,6,0,0,0,1,0,''),(74,1,6,3,0,0,0,0,''),(75,2,6,5,3,0,1,0,''),(76,3,6,3,0,0,1,0,''),(77,4,6,4,0,0,1,0,''),(78,5,6,1,0,0,1,1,''),(79,6,6,2,0,0,1,1,''),(80,7,6,1,0,0,1,1,''),(81,8,6,3,0,0,1,0,''),(82,9,6,2,0,0,1,2,''),(83,10,6,2,0,0,0,0,''),(84,11,6,0,0,0,1,0,''),(85,0,7,0,0,0,1,0,''),(86,1,7,1,0,0,0,0,''),(87,2,7,3,0,0,1,0,''),(88,3,7,1,0,0,1,0,''),(89,4,7,5,0,0,1,0,''),(90,5,7,3,0,0,1,1,''),(91,6,7,99,0,0,1,1,''),(92,7,7,2,0,0,1,1,''),(93,8,7,4,0,0,1,0,''),(94,9,7,1,0,0,1,0,''),(95,10,7,5,0,0,0,0,''),(96,11,7,0,0,0,1,0,''),(97,0,8,0,0,0,1,0,''),(98,1,8,4,2,0,0,0,''),(99,2,8,3,2,0,1,0,''),(100,3,8,2,0,0,1,0,''),(101,4,8,3,0,0,1,0,''),(102,5,8,2,0,0,1,1,''),(103,6,8,1,0,0,1,1,''),(104,7,8,1,0,0,1,1,''),(105,8,8,1,3,0,1,1,''),(106,9,8,2,0,0,1,0,''),(107,10,8,2,0,0,0,0,''),(108,11,8,0,0,0,1,0,''),(109,0,9,0,0,0,1,0,''),(110,1,9,2,2,0,0,1,''),(111,2,9,5,2,0,1,0,''),(112,3,9,1,0,0,1,0,''),(113,4,9,3,0,0,1,0,''),(114,5,9,3,0,0,1,0,''),(115,6,9,2,0,0,1,0,''),(116,7,9,5,3,0,1,0,''),(117,8,9,2,3,0,1,0,''),(118,9,9,5,0,0,1,0,''),(119,10,9,2,0,0,0,0,''),(120,11,9,0,0,0,1,0,''),(121,0,10,0,0,0,0,0,''),(122,1,10,4,0,0,0,0,''),(123,2,10,1,4,0,0,0,''),(124,3,10,4,4,0,0,0,''),(125,4,10,4,0,0,0,0,''),(126,5,10,1,0,0,0,0,''),(127,6,10,5,0,0,0,0,''),(128,7,10,2,0,0,0,0,''),(129,8,10,2,0,0,0,0,''),(130,9,10,4,3,0,0,0,''),(131,10,10,2,0,0,0,0,''),(132,11,10,0,0,0,0,0,''),(133,0,11,0,0,0,1,0,''),(134,1,11,0,0,0,0,0,''),(135,2,11,0,0,0,1,0,''),(136,3,11,0,0,0,1,0,''),(137,4,11,0,0,0,1,0,''),(138,5,11,0,0,0,1,0,''),(139,6,11,0,0,0,1,0,''),(140,7,11,0,0,0,1,0,''),(141,8,11,0,0,0,1,0,''),(142,9,11,0,0,0,1,0,''),(143,10,11,0,0,0,0,0,''),(144,11,11,0,0,0,1,0,'');
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_log`
--

DROP TABLE IF EXISTS `player_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `player` int(11) unsigned NOT NULL,
  `time` int(11) unsigned NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `player_log` (`player`,`time`),
  KEY `new_logs` (`player`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_log`
--

LOCK TABLES `player_log` WRITE;
/*!40000 ALTER TABLE `player_log` DISABLE KEYS */;
INSERT INTO `player_log` VALUES (101,1,1286443010,'You have leveled up! You gained +2 stat points and +1 max energy!',1),(102,1,1286443010,'You have leveled up! You gained +2 stat points and +1 max energy!',1),(103,1,1286443010,'You have leveled up! You gained +2 stat points and +1 max energy!',1),(104,1,1286443076,'You have increased your strength!',1),(105,1,1286443079,'You have increased your strength!',1),(106,1,1286443080,'You have increased your strength!',1),(107,1,1286443081,'You have increased your strength!',1),(108,1,1286443081,'You have increased your strength!',1),(109,1,1286443082,'You have increased your strength!',1),(110,2,1286443165,'<strong>Kampfbereicht:</strong><br /><strong>Basti</strong> hat mit <strong>13</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>10</strong> Schaden getroffen<br /><strong>Basti</strong> hat mit <strong>12</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>10</strong> Schaden getroffen<br /><strong>Basti</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat nicht getroffen<br />Bastian hat keine Lebenspunkte mehr<br /><strong>Basti hat gewonnen</strong><br />',1),(111,1,1286443206,'test',1),(112,1,1286443206,'test2',1),(113,1,1286443233,'test3',1),(114,1,1286443233,'test4',1),(115,1,1286443282,'test3',1),(116,1,1286443282,'test4',1),(117,1,1287095839,'You have leveled up! You gained +2 stat points and +1 max energy!',1),(118,1,1287095877,'You have increased your agility!',1),(119,1,1287095880,'You have increased your strength!',1),(120,1,1289000527,'moved north',1),(121,1,1289000560,'moved north',1),(122,1,1289000593,'moved south',1),(123,1,1289000595,'moved south',1),(124,1,1289000596,'moved south',1),(125,1,1292065323,'moved east',1),(126,1,1292065328,'moved east',1),(127,1,1292065330,'moved south',1),(128,2,1292067747,'moved east',1),(129,2,1292067754,'moved east',1),(130,2,1292067757,'moved east',1),(131,2,1292067759,'moved east',1),(132,2,1292067763,'moved west',1),(133,2,1292067765,'moved west',1),(134,2,1292067767,'moved west',1),(135,2,1292067770,'moved west',1),(136,2,1292067773,'moved west',1),(137,2,1292067775,'moved west',1),(138,2,1292067777,'moved west',1),(139,2,1292067779,'moved west',1),(140,2,1292067785,'moved south',1),(141,2,1292067790,'moved south',1),(142,2,1292067821,'moved south',1),(143,2,1292067823,'moved south',1),(144,2,1292067826,'moved east',1),(145,2,1292067829,'moved east',1),(146,2,1292067832,'moved east',1),(147,2,1292067837,'moved east',1),(148,2,1292067843,'moved north',1),(149,1,1292067863,'<strong>Kampfbereicht:</strong><br /><strong>Bastian</strong> hat nicht getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat nicht getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat nicht getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br />Bastian hat keine Lebenspunkte mehr<br /><strong>Genesis Foundation hat gewonnen</strong><br />',1),(150,2,1292117175,'moved north',1),(151,2,1292117178,'moved north',1),(152,2,1292117180,'moved west',1),(153,2,1292117359,'moved south',1),(154,2,1292117361,'moved west',1),(155,2,1292117363,'moved south',1),(156,2,1292117366,'moved west',1),(157,2,1292117369,'moved west',1),(158,2,1292117370,'moved west',1),(159,2,1292117394,'moved east',1),(160,2,1292117396,'moved east',1),(161,2,1292117397,'moved east',1),(162,2,1292117399,'moved east',1),(163,2,1292117401,'moved east',1),(164,2,1292118554,'moved west',1),(165,2,1292118556,'moved east',1),(166,2,1292120494,'moved east',1),(167,2,1292120496,'moved east',1),(168,1,1292133363,'<strong>Kampfbereicht:</strong><br /><strong>Bastian</strong> hat mit <strong>10</strong> Schaden getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>12</strong> Schaden getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br />Bastian hat keine Lebenspunkte mehr<br /><strong>Genesis Foundation hat gewonnen</strong><br />',1),(169,2,1292487257,'moved east',1),(170,1,1292488159,'<strong>Kampfbereicht:</strong><br />Bastian hat keine Lebenspunkte mehr<br /><strong>Genesis Foundation hat gewonnen</strong><br />',0),(171,2,1292488176,'moved north',1),(172,2,1292488180,'moved east',1),(173,2,1292488216,'moved east',1),(174,2,1292489662,'moved north',1),(175,2,1292489664,'moved west',1),(176,2,1292489666,'moved south',1),(177,2,1292489667,'moved south',1),(178,2,1292489668,'moved west',1),(179,2,1292489671,'moved west',1);
/*!40000 ALTER TABLE `player_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
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
  `stat_points` int(11) unsigned DEFAULT '10',
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Genesis Foundation','e882a6c125e8527a22ebe06502036756c0ecf831','neumann.bastian@gmail.com','#[LraAn8E9^k5`[g',10,1286231120,1292231872,1292231872,146,56,82,70,30,100,130,17,0,32,330,135,135,24,26,16,12,15,19,0,18,21,8,8,0,0),(2,'Bastian','2e6c0ca265be5863883940f3102116a33eb72812','bastian.neumann@devcoding.com','Ab+G:d3m+y%@nak}',1,1286238668,1295127728,1295127368,100,3,0,0,30,100,0,6,0,67,110,5,45,7,15,22,5,7,6,0,22,18,8,7,0,0);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ships`
--

DROP TABLE IF EXISTS `ships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ships` (
  `id` int(11) NOT NULL,
  `weapon1` int(11) NOT NULL,
  `weapon2` int(11) NOT NULL,
  `weapon3` int(11) NOT NULL,
  `weapon4` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships` VALUES (2,1,0,0,0);
/*!40000 ALTER TABLE `ships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story`
--

DROP TABLE IF EXISTS `story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `par_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story`
--

LOCK TABLES `story` WRITE;
/*!40000 ALTER TABLE `story` DISABLE KEYS */;
/*!40000 ALTER TABLE `story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technology`
--

DROP TABLE IF EXISTS `technology`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technology` (
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technology`
--

LOCK TABLES `technology` WRITE;
/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
INSERT INTO `technology` VALUES (1,0,'Tank','max_energy',10,1,500,0,20,100,5),(2,1,'Tank','max_energy',15,2,1500,0,40,300,50),(3,2,'Tank','max_energy',20,3,15000,0,60,500,120),(4,0,'Schild','max_hp',20,1,100,0,0,0,20),(5,4,'Schild','max_hp',50,2,1000,0,0,20,50),(6,5,'Schild','max_hp',50,3,3000,0,0,200,100);
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-01-16 10:52:29
