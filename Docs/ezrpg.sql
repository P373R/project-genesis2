-- MySQL dump 10.13  Distrib 5.1.49, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ezrpg
-- ------------------------------------------------------
-- Server version	5.1.49-1ubuntu8.1-log

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map`
--

LOCK TABLES `map` WRITE;
/*!40000 ALTER TABLE `map` DISABLE KEYS */;
/*!40000 ALTER TABLE `map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions`
--

DROP TABLE IF EXISTS `missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `min_gwp` int(11) NOT NULL,
  `energy` int(11) NOT NULL,
  `exp` int(11) NOT NULL,
  `gwp` int(11) NOT NULL,
  `gold` int(11) NOT NULL,
  `shield` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `accuracy` int(11) NOT NULL,
  `redo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions`
--

LOCK TABLES `missions` WRITE;
/*!40000 ALTER TABLE `missions` DISABLE KEYS */;
INSERT INTO `missions` VALUES (1,'Welcome to Genesis2','The Genesis Foundation welcomes you as a new member on Taranus.<br />\r\nWe have a lot of work to do and so we would be happy if you want to join the good thing and help us building up a new foundation for humanity.<br />\r\nThe first step is to see if your equipment is sufficient. Therefor we will stress your ship with a special treatment. This will coast you 5 energy and 5 shield. Do not worry. This will built up after a while.<br />\r\n<br />\r\nWe are looking forward to hear from you.',50,5,15,5,10,5,10,0,0),(2,'Border Patrol','With the big unknown sea surrounding us we have to be prepared to fight against what ever may come. It is essential that someone is having an eye on the borders. Yu can earn yourself some money by spending some time doing it.',55,5,10,1,10,0,60,0,0),(3,'Fetch Oxygen','We know that there are several sources of oxygen in the south west of our city. Go there and fetch some.',60,20,50,2,30,2,600,5,1);
/*!40000 ALTER TABLE `missions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_log`
--

LOCK TABLES `player_log` WRITE;
/*!40000 ALTER TABLE `player_log` DISABLE KEYS */;
INSERT INTO `player_log` VALUES (1,1002,1297310107,'You have leveled up! You gained +1 stat point!',0),(2,1002,1297330960,'You have leveled up! You gained +1 stat point!',0),(3,1002,1297333179,'You have leveled up! You gained +1 stat point!',0),(4,1002,1297500867,'You have leveled up! You gained +1 stat point!',0);
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
  `language` varchar(3) NOT NULL,
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
  `strength` int(11) unsigned DEFAULT '0',
  `vitality` int(11) unsigned DEFAULT '15',
  `agility` int(11) unsigned DEFAULT '2',
  `dexterity` int(11) unsigned DEFAULT '2',
  `damage` int(11) unsigned DEFAULT '0',
  `kills` int(11) unsigned NOT NULL DEFAULT '0',
  `deaths` int(11) unsigned NOT NULL DEFAULT '0',
  `x` tinyint(4) NOT NULL DEFAULT '6',
  `y` tinyint(4) NOT NULL DEFAULT '7',
  `infight` tinyint(1) NOT NULL,
  `missions` text NOT NULL,
  `gwp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Genesis Foundation','e882a6c125e8527a22ebe06502036756c0ecf831','neumann.bastian@gmail.com','#[LraAn8E9^k5`[g','',10,1286231120,1298360066,1298360071,166,56,82,70,130,17,989,62,330,20,30,30,0,20,27,3,0,18,21,7,9,0,'0',100),(1000,'Bastian','2f4b11d85236ff03507452616556303911edf2b8','einfachsaufen@gmail.com','t_foCz>+Ob!#x-sk','de',1,1296895561,1298334062,1298334062,100,0,0,0,0,1,0,0,10,5,10,10,5,5,5,5,0,0,0,6,7,0,'0',50),(1001,'TestUser','622f381b3428c648cd5974adda303deef6c7e9c7','test@userland.ohg','H8_m,P.r<%{K:?Ji','',1,1296979017,1297247481,1297247481,100,0,0,0,0,1,0,0,10,15,10,10,0,15,2,2,0,0,0,7,7,0,'0',50),(1002,'test','d3527e5c09b197204578da73255b24195681391d','test@project-genesis2.de','}!_ND*c(V&H?RoJv','',1,1297280744,1299209136,1299208670,260,0,0,0,0,5,0,65,90,0,5,10,0,5,2,2,0,0,0,6,7,0,'0',100),(1003,'Bastitest','cf8888f08f8a208513555bc53ba80085b65166be','basti@localhost.de','{_t2]Eqq61r@z!5`','',1,1297585076,1297589581,1297587525,100,0,0,0,0,1,0,0,10,15,10,10,0,15,2,2,0,0,0,6,7,0,'',0);
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
  `depend` text NOT NULL,
  KEY `id` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_parts`
--

LOCK TABLES `ship_parts` WRITE;
/*!40000 ALTER TABLE `ship_parts` DISABLE KEYS */;
INSERT INTO `ship_parts` VALUES (1,'energy','Small nuclear plant','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:5;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:10;}',''),(2,'energy','Medium nuclear plant','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:10;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:20;}',''),(3,'energy','Big nuclear plant','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:20;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:30;}','a:7:{s:10:\"propulsion\";i:4;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(4,'energy','Tiny fusion reactor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:45;}','a:7:{s:10:\"propulsion\";i:5;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(5,'energy','Small fusion reactor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:40;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:50;}','a:7:{s:10:\"propulsion\";i:6;s:7:\"gearbox\";i:2;s:6:\"engine\";i:2;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(6,'energy','Medium fusion reactor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:80;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:70;}','a:7:{s:10:\"propulsion\";i:7;s:7:\"gearbox\";i:2;s:6:\"engine\";i:2;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(7,'energy','Huge fusion reactor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:100;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:100;}','a:7:{s:10:\"propulsion\";i:10;s:7:\"gearbox\";i:3;s:6:\"engine\";i:3;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(8,'energy','Perpetuum Mobile','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:100;s:7:\"agility\";i:0;s:9:\"dexterity\";i:0;s:6:\"energy\";i:200;}','a:7:{s:10:\"propulsion\";i:10;s:7:\"gearbox\";i:4;s:6:\"engine\";i:4;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(1,'engine','Small Motor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:10;s:9:\"dexterity\";i:0;s:6:\"energy\";i:0;}',''),(2,'engine','Medium Motor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:20;s:9:\"dexterity\";i:0;s:6:\"energy\";i:0;}','a:7:{s:10:\"propulsion\";i:2;s:7:\"gearbox\";i:2;s:6:\"engine\";i:0;s:6:\"energy\";i:3;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(3,'engine','Big Motor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:30;s:9:\"dexterity\";i:0;s:6:\"energy\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:2;s:6:\"engine\";i:0;s:6:\"energy\";i:4;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(4,'engine','Twin Motor','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:50;s:9:\"dexterity\";i:0;s:6:\"energy\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:3;s:6:\"engine\";i:0;s:6:\"energy\";i:5;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(1,'gearbox','Iron cog wheels','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:1;s:9:\"dexterity\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(2,'gearbox','Steel cog wheels','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:2;s:9:\"dexterity\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(3,'gearbox','Hard steel cog wheles','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:5;s:9:\"dexterity\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(4,'gearbox','Titanium cog wheels','','a:4:{s:8:\"strength\";i:2;s:8:\"vitality\";i:0;s:7:\"agility\";i:7;s:9:\"dexterity\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(1,'navigation','Pen and paper','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:1;s:6:\"energy\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:0;s:10:\"navigation\";i:0;s:5:\"sonar\";i:0;s:9:\"harvester\";i:0;}'),(2,'navigation','Calulator','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:5;s:6:\"energy\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:2;s:10:\"navigation\";i:0;s:5:\"sonar\";i:3;s:9:\"harvester\";i:0;}'),(3,'navigation','Computer','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:8;s:6:\"energy\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:3;s:10:\"navigation\";i:0;s:5:\"sonar\";i:3;s:9:\"harvester\";i:0;}'),(4,'navigation','Super copmuter','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:10;s:6:\"energy\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:4;s:10:\"navigation\";i:0;s:5:\"sonar\";i:4;s:9:\"harvester\";i:0;}'),(5,'navigation','Autopilot','','a:5:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:0;s:9:\"dexterity\";i:15;s:6:\"energy\";i:0;}','a:7:{s:10:\"propulsion\";i:0;s:7:\"gearbox\";i:0;s:6:\"engine\";i:0;s:6:\"energy\";i:4;s:10:\"navigation\";i:0;s:5:\"sonar\";i:4;s:9:\"harvester\";i:0;}'),(1,'propulsion','Basic propeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:1;s:9:\"dexterity\";i:0;}',''),(2,'propulsion','Big propeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:3;s:9:\"dexterity\";i:0;}',''),(3,'propulsion','Advanced propeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:5;s:9:\"dexterity\";i:0;}',''),(4,'propulsion','Basic impeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:6;s:9:\"dexterity\";i:1;}',''),(5,'propulsion','Big impeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:8;s:9:\"dexterity\";i:2;}',''),(6,'propulsion','Advanced impeller','','a:4:{s:8:\"strength\";i:0;s:8:\"vitality\";i:0;s:7:\"agility\";i:10;s:9:\"dexterity\";i:4;}',''),(8,'propulsion','Big jet','','a:4:{s:8:\"strength\";i:2;s:8:\"vitality\";i:0;s:7:\"agility\";i:15;s:9:\"dexterity\";i:5;}',''),(9,'propulsion','Advanced jet','','a:4:{s:8:\"strength\";i:4;s:8:\"vitality\";i:0;s:7:\"agility\";i:20;s:9:\"dexterity\";i:7;}',''),(10,'propulsion','Highspeed jet','','a:4:{s:8:\"strength\";i:5;s:8:\"vitality\";i:0;s:7:\"agility\";i:25;s:9:\"dexterity\";i:10;}','');
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
  `busy` int(11) NOT NULL,
  `start` int(11) NOT NULL,
  `harvester` tinyint(4) NOT NULL,
  `missions` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships` VALUES (1,1,3,1,1,1,1,1,0,1298359965,1298359955,0,'a:0:{}'),(1000,1,1,1,1,1,1,1,0,0,0,0,'a:0:{}'),(1001,1,1,1,1,1,1,1,0,0,0,0,'a:0:{}'),(1002,1,1,2,4,1,1,1,0,1299209148,1299209138,0,'a:1:{i:0;s:1:\"1\";}');
/*!40000 ALTER TABLE `ships` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-03-04 16:29:47
