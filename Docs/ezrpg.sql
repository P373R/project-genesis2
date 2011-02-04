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
-- Table structure for table `buildings`
--

DROP TABLE IF EXISTS `buildings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buildings` (
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
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buildings`
--

LOCK TABLES `buildings` WRITE;
/*!40000 ALTER TABLE `buildings` DISABLE KEYS */;
/*!40000 ALTER TABLE `buildings` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,'Test',1295127872,'Genesis Foundation','This book is an example on how to make books for the library. You can use this Example and add more books. As the player is able to read the books its a good place to store information. Books can be seperated in different Chapters by the Chapter divider &nbsp;---&nbsp; For further knowledge of Books read the comments in the module file.'),(2,'Navigating your ship',1295127872,'Genesis Foundation','<b>Overview</b>\r\nTo navigate your ship you have to use the map. On the left side of the map is the surrounding area of your ship and you can see what type of water it is, what type of resources can be found there and if the field is accessible (not black). The right side shows more information about the field you are on. It shows you the coordinates, the name of the surrounding, the name of the resource and the name of the Player claiming the field.\r\nBelow that information you can find the navigation table. It offers you the eight moving directions and a central action button. This button is a sword or a shield. If someone else claims the field there is a sword and that means you have to attack the person claiming before other actions can be done. If noone or you are claiming the field you can look for random stuff or gather the resources on the field. You do not have to claim an unclaimed field if you want to gather stuff there, but others can come there, too. You have to calim and defend the spot in case to keep others out.\r\n --- <b>Details</b >');
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
) ENGINE=InnoDB AUTO_INCREMENT=313 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_log`
--

LOCK TABLES `player_log` WRITE;
/*!40000 ALTER TABLE `player_log` DISABLE KEYS */;
INSERT INTO `player_log` VALUES (101,1,1286443010,'You have leveled up! You gained +2 stat points and +1 max energy!',1),(102,1,1286443010,'You have leveled up! You gained +2 stat points and +1 max energy!',1),(103,1,1286443010,'You have leveled up! You gained +2 stat points and +1 max energy!',1),(104,1,1286443076,'You have increased your strength!',1),(105,1,1286443079,'You have increased your strength!',1),(106,1,1286443080,'You have increased your strength!',1),(107,1,1286443081,'You have increased your strength!',1),(108,1,1286443081,'You have increased your strength!',1),(109,1,1286443082,'You have increased your strength!',1),(110,2,1286443165,'<strong>Kampfbereicht:</strong><br /><strong>Basti</strong> hat mit <strong>13</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>10</strong> Schaden getroffen<br /><strong>Basti</strong> hat mit <strong>12</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>10</strong> Schaden getroffen<br /><strong>Basti</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat nicht getroffen<br />Bastian hat keine Lebenspunkte mehr<br /><strong>Basti hat gewonnen</strong><br />',1),(111,1,1286443206,'test',1),(112,1,1286443206,'test2',1),(113,1,1286443233,'test3',1),(114,1,1286443233,'test4',1),(115,1,1286443282,'test3',1),(116,1,1286443282,'test4',1),(117,1,1287095839,'You have leveled up! You gained +2 stat points and +1 max energy!',1),(118,1,1287095877,'You have increased your agility!',1),(119,1,1287095880,'You have increased your strength!',1),(120,1,1289000527,'moved north',1),(121,1,1289000560,'moved north',1),(122,1,1289000593,'moved south',1),(123,1,1289000595,'moved south',1),(124,1,1289000596,'moved south',1),(125,1,1292065323,'moved east',1),(126,1,1292065328,'moved east',1),(127,1,1292065330,'moved south',1),(128,2,1292067747,'moved east',1),(129,2,1292067754,'moved east',1),(130,2,1292067757,'moved east',1),(131,2,1292067759,'moved east',1),(132,2,1292067763,'moved west',1),(133,2,1292067765,'moved west',1),(134,2,1292067767,'moved west',1),(135,2,1292067770,'moved west',1),(136,2,1292067773,'moved west',1),(137,2,1292067775,'moved west',1),(138,2,1292067777,'moved west',1),(139,2,1292067779,'moved west',1),(140,2,1292067785,'moved south',1),(141,2,1292067790,'moved south',1),(142,2,1292067821,'moved south',1),(143,2,1292067823,'moved south',1),(144,2,1292067826,'moved east',1),(145,2,1292067829,'moved east',1),(146,2,1292067832,'moved east',1),(147,2,1292067837,'moved east',1),(148,2,1292067843,'moved north',1),(149,1,1292067863,'<strong>Kampfbereicht:</strong><br /><strong>Bastian</strong> hat nicht getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat nicht getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat nicht getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br />Bastian hat keine Lebenspunkte mehr<br /><strong>Genesis Foundation hat gewonnen</strong><br />',1),(150,2,1292117175,'moved north',1),(151,2,1292117178,'moved north',1),(152,2,1292117180,'moved west',1),(153,2,1292117359,'moved south',1),(154,2,1292117361,'moved west',1),(155,2,1292117363,'moved south',1),(156,2,1292117366,'moved west',1),(157,2,1292117369,'moved west',1),(158,2,1292117370,'moved west',1),(159,2,1292117394,'moved east',1),(160,2,1292117396,'moved east',1),(161,2,1292117397,'moved east',1),(162,2,1292117399,'moved east',1),(163,2,1292117401,'moved east',1),(164,2,1292118554,'moved west',1),(165,2,1292118556,'moved east',1),(166,2,1292120494,'moved east',1),(167,2,1292120496,'moved east',1),(168,1,1292133363,'<strong>Kampfbereicht:</strong><br /><strong>Bastian</strong> hat mit <strong>10</strong> Schaden getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br /><strong>Bastian</strong> hat mit <strong>12</strong> Schaden getroffen<br /><strong>Genesis Foundation</strong> hat mit <strong>11</strong> Schaden getroffen<br />Bastian hat keine Lebenspunkte mehr<br /><strong>Genesis Foundation hat gewonnen</strong><br />',1),(169,2,1292487257,'moved east',1),(170,1,1292488159,'<strong>Kampfbereicht:</strong><br />Bastian hat keine Lebenspunkte mehr<br /><strong>Genesis Foundation hat gewonnen</strong><br />',0),(171,2,1292488176,'moved north',1),(172,2,1292488180,'moved east',1),(173,2,1292488216,'moved east',1),(174,2,1292489662,'moved north',1),(175,2,1292489664,'moved west',1),(176,2,1292489666,'moved south',1),(177,2,1292489667,'moved south',1),(178,2,1292489668,'moved west',1),(179,2,1292489671,'moved west',1),(180,2,1296795439,'You have leveled up! You gained +1 stat point!',1),(181,2,1296795439,'You have leveled up! You gained +1 stat point!',1),(182,2,1296795439,'You have leveled up! You gained +1 stat point!',1),(183,2,1296795439,'You have leveled up! You gained +1 stat point!',1),(184,2,1296795445,'You have leveled up! You gained +1 stat point!',1),(185,2,1296795445,'You have leveled up! You gained +1 stat point!',1),(186,2,1296795445,'You have leveled up! You gained +1 stat point!',1),(187,2,1296795445,'You have leveled up! You gained +1 stat point!',1),(188,2,1296795453,'You have leveled up! You gained +1 stat point!',1),(189,2,1296795453,'You have leveled up! You gained +1 stat point!',1),(190,2,1296795454,'You have leveled up! You gained +1 stat point!',1),(191,2,1296795454,'You have leveled up! You gained +1 stat point!',1),(192,2,1296795455,'You have leveled up! You gained +1 stat point!',1),(193,2,1296795455,'You have leveled up! You gained +1 stat point!',1),(194,2,1296795455,'You have leveled up! You gained +1 stat point!',1),(195,2,1296795456,'You have leveled up! You gained +1 stat point!',1),(196,2,1296795457,'You have leveled up! You gained +1 stat point!',1),(197,2,1296795457,'You have leveled up! You gained +1 stat point!',1),(198,2,1296795457,'You have leveled up! You gained +1 stat point!',1),(199,2,1296795458,'You have leveled up! You gained +1 stat point!',1),(200,2,1296795459,'You have leveled up! You gained +1 stat point!',1),(201,2,1296795459,'You have leveled up! You gained +1 stat point!',1),(202,2,1296795459,'You have leveled up! You gained +1 stat point!',1),(203,2,1296795459,'You have leveled up! You gained +1 stat point!',1),(204,2,1296795460,'You have leveled up! You gained +1 stat point!',1),(205,2,1296795461,'You have leveled up! You gained +1 stat point!',1),(206,2,1296795461,'You have leveled up! You gained +1 stat point!',1),(207,2,1296795461,'You have leveled up! You gained +1 stat point!',1),(208,2,1296795462,'You have leveled up! You gained +1 stat point!',1),(209,2,1296795462,'You have leveled up! You gained +1 stat point!',1),(210,2,1296795462,'You have leveled up! You gained +1 stat point!',1),(211,2,1296795462,'You have leveled up! You gained +1 stat point!',1),(212,2,1296795464,'You have leveled up! You gained +1 stat point!',1),(213,2,1296795464,'You have leveled up! You gained +1 stat point!',1),(214,2,1296795464,'You have leveled up! You gained +1 stat point!',1),(215,2,1296795464,'You have leveled up! You gained +1 stat point!',1),(216,2,1296795467,'You have leveled up! You gained +1 stat point!',1),(217,2,1296795467,'You have leveled up! You gained +1 stat point!',1),(218,2,1296795468,'You have leveled up! You gained +1 stat point!',1),(219,2,1296795468,'You have leveled up! You gained +1 stat point!',1),(220,2,1296795470,'You have leveled up! You gained +1 stat point!',1),(221,2,1296795470,'You have leveled up! You gained +1 stat point!',1),(222,2,1296795470,'You have leveled up! You gained +1 stat point!',1),(223,2,1296795470,'You have leveled up! You gained +1 stat point!',1),(224,2,1296795478,'You have leveled up! You gained +1 stat point!',1),(225,2,1296795478,'You have leveled up! You gained +1 stat point!',1),(226,2,1296795478,'You have leveled up! You gained +1 stat point!',1),(227,2,1296795478,'You have leveled up! You gained +1 stat point!',1),(228,2,1296795753,'You have leveled up! You gained +1 stat point!',1),(229,2,1296795753,'You have leveled up! You gained +1 stat point!',1),(230,2,1296795753,'You have leveled up! You gained +1 stat point!',1),(231,2,1296795753,'You have leveled up! You gained +1 stat point!',1),(232,2,1296795756,'You have leveled up! You gained +1 stat point!',1),(233,2,1296795756,'You have leveled up! You gained +1 stat point!',1),(234,2,1296795756,'You have leveled up! You gained +1 stat point!',1),(235,2,1296795756,'You have leveled up! You gained +1 stat point!',1),(236,2,1296795758,'You have leveled up! You gained +1 stat point!',1),(237,2,1296795758,'You have leveled up! You gained +1 stat point!',1),(238,2,1296795758,'You have leveled up! You gained +1 stat point!',1),(239,2,1296795758,'You have leveled up! You gained +1 stat point!',1),(240,2,1296795759,'You have leveled up! You gained +1 stat point!',1),(241,2,1296795759,'You have leveled up! You gained +1 stat point!',1),(242,2,1296795759,'You have leveled up! You gained +1 stat point!',1),(243,2,1296795759,'You have leveled up! You gained +1 stat point!',1),(244,2,1296795760,'You have leveled up! You gained +1 stat point!',1),(245,2,1296795760,'You have leveled up! You gained +1 stat point!',1),(246,2,1296795760,'You have leveled up! You gained +1 stat point!',1),(247,2,1296795760,'You have leveled up! You gained +1 stat point!',1),(248,2,1296795765,'You have leveled up! You gained +1 stat point!',1),(249,2,1296795765,'You have leveled up! You gained +1 stat point!',1),(250,2,1296795765,'You have leveled up! You gained +1 stat point!',1),(251,2,1296795765,'You have leveled up! You gained +1 stat point!',1),(252,2,1296795897,'You have leveled up! You gained +1 stat point!',1),(253,2,1296795897,'You have leveled up! You gained +1 stat point!',1),(254,2,1296795897,'You have leveled up! You gained +1 stat point!',1),(255,2,1296795897,'You have leveled up! You gained +1 stat point!',1),(256,2,1296795899,'You have leveled up! You gained +1 stat point!',1),(257,2,1296795900,'You have leveled up! You gained +1 stat point!',1),(258,2,1296795900,'You have leveled up! You gained +1 stat point!',1),(259,2,1296795900,'You have leveled up! You gained +1 stat point!',1),(260,2,1296795902,'You have leveled up! You gained +1 stat point!',1),(261,2,1296795902,'You have leveled up! You gained +1 stat point!',1),(262,2,1296795902,'You have leveled up! You gained +1 stat point!',1),(263,2,1296795902,'You have leveled up! You gained +1 stat point!',1),(264,2,1296795904,'You have leveled up! You gained +1 stat point!',1),(265,2,1296795904,'You have leveled up! You gained +1 stat point!',1),(266,2,1296795904,'You have leveled up! You gained +1 stat point!',1),(267,2,1296795904,'You have leveled up! You gained +1 stat point!',1),(268,2,1296795951,'You have leveled up! You gained +1 stat point!',1),(269,2,1296795952,'You have leveled up! You gained +1 stat point!',1),(270,2,1296795952,'You have leveled up! You gained +1 stat point!',1),(271,2,1296795952,'You have leveled up! You gained +1 stat point!',1),(272,2,1296796001,'You have leveled up! You gained +1 stat point!',1),(273,2,1296796002,'You have leveled up! You gained +1 stat point!',1),(274,2,1296796002,'You have leveled up! You gained +1 stat point!',1),(275,2,1296796002,'You have leveled up! You gained +1 stat point!',1),(276,2,1296796003,'You have leveled up! You gained +1 stat point!',1),(277,2,1296796003,'You have leveled up! You gained +1 stat point!',1),(278,2,1296796004,'You have leveled up! You gained +1 stat point!',1),(279,2,1296796004,'You have leveled up! You gained +1 stat point!',1),(280,2,1296796005,'You have leveled up! You gained +1 stat point!',1),(281,2,1296796005,'You have leveled up! You gained +1 stat point!',1),(282,2,1296796005,'You have leveled up! You gained +1 stat point!',1),(283,2,1296796005,'You have leveled up! You gained +1 stat point!',1),(284,2,1296796006,'You have leveled up! You gained +1 stat point!',1),(285,2,1296796007,'You have leveled up! You gained +1 stat point!',1),(286,2,1296796007,'You have leveled up! You gained +1 stat point!',1),(287,2,1296796007,'You have leveled up! You gained +1 stat point!',1),(288,2,1296796008,'You have leveled up! You gained +1 stat point!',1),(289,2,1296796008,'You have leveled up! You gained +1 stat point!',1),(290,2,1296796008,'You have leveled up! You gained +1 stat point!',1),(291,2,1296796008,'You have leveled up! You gained +1 stat point!',1),(292,2,1296796009,'You have leveled up! You gained +1 stat point!',1),(293,2,1296796009,'You have leveled up! You gained +1 stat point!',1),(294,2,1296796009,'You have leveled up! You gained +1 stat point!',1),(295,2,1296796010,'You have leveled up! You gained +1 stat point!',1),(296,2,1296796180,'You have leveled up! You gained +1 stat point!',1),(297,2,1296796184,'You have leveled up! You gained +1 stat point!',1),(298,2,1296796184,'You have leveled up! You gained +1 stat point!',1),(299,2,1296796184,'You have leveled up! You gained +1 stat point!',1),(300,2,1296796184,'You have leveled up! You gained +1 stat point!',1),(301,2,1296796200,'You have leveled up! You gained +1 stat point!',1),(302,2,1296796201,'You have leveled up! You gained +1 stat point!',1),(303,2,1296796201,'You have leveled up! You gained +1 stat point!',1),(304,2,1296796202,'You have leveled up! You gained +1 stat point!',1),(305,2,1296796247,'You have leveled up! You gained +1 stat point!',1),(306,2,1296798421,'You have leveled up! You gained +1 stat point!',1),(307,2,1296798492,'You have leveled up! You gained +1 stat point!',1),(308,2,1296798545,'You have leveled up! You gained +1 stat point!',1),(309,2,1296798653,'You have leveled up! You gained +1 stat point!',1),(310,2,1296798725,'You have leveled up! You gained +1 stat point!',1),(311,4,1296799252,'You have leveled up! You gained +1 stat point!',1),(312,4,1296800659,'You have leveled up! You gained +1 stat point!',1);
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
  `aluminium` int(11) NOT NULL,
  `level` int(11) unsigned DEFAULT '1',
  `stat_points` int(11) unsigned DEFAULT '0',
  `exp` int(11) unsigned DEFAULT '0',
  `max_exp` int(11) unsigned DEFAULT '10',
  `hp` int(11) unsigned DEFAULT '20',
  `energy` int(11) unsigned NOT NULL DEFAULT '10',
  `max_energy` int(11) unsigned NOT NULL DEFAULT '10',
  `strength` int(11) unsigned DEFAULT '5',
  `vitality` int(11) unsigned DEFAULT '5',
  `agility` int(11) unsigned DEFAULT '5',
  `dexterity` int(11) unsigned DEFAULT '5',
  `damage` int(11) unsigned DEFAULT '0',
  `kills` int(11) unsigned NOT NULL DEFAULT '0',
  `deaths` int(11) unsigned NOT NULL DEFAULT '0',
  `x` tinyint(4) NOT NULL DEFAULT '6',
  `y` tinyint(4) NOT NULL DEFAULT '7',
  `infight` tinyint(1) NOT NULL,
  `missions` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Genesis Foundation','e882a6c125e8527a22ebe06502036756c0ecf831','neumann.bastian@gmail.com','#[LraAn8E9^k5`[g',10,1286231120,1292231872,1292231872,146,56,82,70,130,17,0,32,330,185,245,200,0,100,20,25,0,18,21,8,8,0,0),(2,'Bastian','2e6c0ca265be5863883940f3102116a33eb72812','bastian.neumann@devcoding.com','Ab+G:d3m+y%@nak}',1,1286238668,1296798653,1296792332,100,3,0,0,0,13,96,5,250,550,245,200,0,100,20,25,0,22,18,6,7,0,0),(3,'TestUser','e56c9eced94d2776191145826cea2bbecc4cf266','test@userland.ohg','^:ZS+vXI:e%]C#(b',1,1296790646,1296799132,1296798768,100,0,0,0,0,1,0,0,10,70,245,200,0,100,20,25,0,0,0,0,0,0,0),(4,'Test2','b2a15b65af0e613d9ed46a5cbb8c21c99e7fd059','test@userland.ohgt','2+|PGGs.m#EQ=Q1|',1,1296799178,1296806384,1296799189,100,0,0,0,395,3,0,19,50,20,30,30,0,20,12,2,0,0,0,6,7,0,0);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_parts`
--

DROP TABLE IF EXISTS `ship_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ship_parts` (
  `id` int(11) NOT NULL,
  `type` varchar(25) NOT NULL,
  `name` text NOT NULL,
  `desc` text NOT NULL,
  `properties` text NOT NULL,
  KEY `id` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_parts`
--

LOCK TABLES `ship_parts` WRITE;
/*!40000 ALTER TABLE `ship_parts` DISABLE KEYS */;
INSERT INTO `ship_parts` VALUES (1,'propulsion','Basic propeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:1;s:9:\"dexterity\";i:0;}'),(2,'propulsion','Big propeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:3;s:9:\"dexterity\";i:0;}'),(3,'propulsion','Advanced propeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:5;s:9:\"dexterity\";i:0;}'),(4,'propulsion','Basic impeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:6;s:9:\"dexterity\";i:1;}'),(5,'propulsion','Big impeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:8;s:9:\"dexterity\";i:2;}'),(6,'propulsion','Advanced impeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:10;s:9:\"dexterity\";i:4;}'),(7,'propusion','Small jet','','a:4:{s:8:\"strength\";i:1;s:8:\"vitality\";i:0;s:7:\"agility\";i:13;s:9:\"dexterity\";i:5;}'),(8,'propulsion','Big jet','','a:4:{s:8:\"strength\";i:2;s:8:\"vitality\";i:0;s:7:\"agility\";i:15;s:9:\"dexterity\";i:5;}'),(9,'propulsion','Advanced jet','','a:4:{s:8:\"strength\";i:4;s:8:\"vitality\";i:0;s:7:\"agility\";i:20;s:9:\"dexterity\";i:7;}'),(10,'propulsion','Highspeed jet','','a:4:{s:8:\"strength\";i:5;s:8:\"vitality\";i:0;s:7:\"agility\";i:25;s:9:\"dexterity\";i:10;}'),(1,'gearbox','Iron cog wheels','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:1;s:9:\"dexterity\";i:0;}'),(2,'gearbox','Steel cog wheels','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:2;s:9:\"dexterity\";i:0;}'),(3,'gearbox','Hard steel cog wheles','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:5;s:9:\"dexterity\";i:0;}'),(4,'gearbox','Titanium cog wheels','','a:4:{s:8:\"strength\";i:2;s:8:\"vitality\";i:0;s:7:\"agility\";i:7;s:9:\"dexterity\";i:0;}'),(1,'energy','small nuclear plant','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:5;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:10;}'),(2,'energy','Medium nuclear plant','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:10;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:20;}'),(3,'energy','Big nuclear plant','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:20;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:30;}'),(5,'energy','Small fusion reactor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:40;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:50;}'),(6,'energy','Medium fusion reactor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:80;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:70;}'),(7,'energy','Huge fusion reactor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:100;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:100;}'),(8,'energy','Perpetuum Mobile','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:100;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:200;}'),(1,'engine','small Motor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:10;s:9:\"dexterity\";i:0;s:6:\"energy\";i:0;}'),(2,'engine','Medium Motor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:20;s:9:\"dexterity\";i:0;s:6:\"energy\";i:0;}'),(3,'engine','Big Motor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:30;s:9:\"dexterity\";i:0;s:6:\"energy\";i:0;}'),(4,'engine','Twin Motor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:50;s:9:\"dexterity\";i:0;s:6:\"energy\";i:0;}'),(1,'navigation','Pen and paper','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:1;s:6:\"energy\";i:0;}'),(2,'navigation','Calulator','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:5;s:6:\"energy\";i:0;}'),(3,'navigation','Computer','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:8;s:6:\"energy\";i:0;}'),(4,'navigation','super copmuter','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:10;s:6:\"energy\";i:0;}'),(5,'navigation','Autopilot','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:15;s:6:\"energy\";i:0;}'),(1,'sonar','Small sonar','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:1;s:6:\"energy\";i:0;}'),(2,'sonar','Medium sonar','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:5;s:6:\"energy\";i:0;}'),(3,'sonar','Large sonar','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:10;s:6:\"energy\";i:0;}'),(4,'sonar','Sonar array','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:15;s:6:\"energy\";i:0;}'),(4,'energy','Tiny fusion reactor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:45;}');
/*!40000 ALTER TABLE `ship_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ships`
--

DROP TABLE IF EXISTS `ships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ships` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships` VALUES (2,3,3,1,8,4,4,1,0),(3,1,1,1,1,1,1,1,0),(4,1,1,1,3,1,1,1,0);
/*!40000 ALTER TABLE `ships` ENABLE KEYS */;
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

-- Dump completed on 2011-02-04 21:05:16
