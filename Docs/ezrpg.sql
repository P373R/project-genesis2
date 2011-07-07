-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: genesis
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4

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
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (1,'Unbeatable Bronze','The player was not defeated while doing the first 10 kills.'),(2,'Rich As Bronze','The player owned more than 1.000.000$ once'),(3,'Genesis Foundation','The player once hit the 100 GWP mark'),(4,'Unstopable','The ship has a Perpetuum Mobile as energy source!'),(5,'Levelmaster Bronze','Level 30 was reached within a month'),(6,'The Traveler','The ship did more than 1.000.000 miles'),(7,'Metropolis','One of the players city has 1.000.000 inhabitants'),(8,'Bookworm','The Library contains more than 50 books'),(9,'Busy Typer','The player send more then 100 Messages'),(10,'Puzzle Solver','5 Puzzles have been solved!'),(11,'Rich As Silver','The player owned more than 10.000.000$ once'),(12,'Rich As Gold','The player owned more than 100.000.000$ once'),(13,'Unbeatable Silver','The player was not defeated while doing the first 50 kills.'),(14,'Unbeatable Gold','The player was not defeated while doing the first 100 kills.'),(15,'Levelmaster Silver','Level 50 was reached within a month'),(16,'Levelmaster Gold','Level 80 was reached within a month'),(17,'The Long Traveler','The ship did more than 4.000.000 miles'),(18,'The Incredible Long Traveler','The ship did more than 10.000.000 miles'),(19,'Bookworm Extrem','The Library contains more than 100 books'),(20,'Bookworms Paradies','The Library contains more than 150 books');
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `owner_id` int(11) NOT NULL,
  `habitat` int(11) NOT NULL,
  `factory_mining` int(11) NOT NULL,
  `factory_defence` int(11) NOT NULL,
  `factory_offence` int(11) NOT NULL,
  `farm` int(11) NOT NULL,
  `school` int(11) NOT NULL,
  `storage_resources` int(11) NOT NULL,
  `storage_weapon` int(11) NOT NULL,
  `power_plant` int(11) NOT NULL,
  `mine_oxygen` int(11) NOT NULL,
  `mine_water` int(11) NOT NULL,
  `mine_iron` int(11) NOT NULL,
  `mine_aluminium` int(11) NOT NULL,
  `mine_titan` int(11) NOT NULL,
  `max_shield` int(11) NOT NULL,
  `shield` int(11) NOT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1216,895,'New Atlantis',1003,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delay`
--

DROP TABLE IF EXISTS `delay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delay` (
  `when` int(11) NOT NULL,
  `command` text CHARACTER SET latin1 NOT NULL,
  KEY `when` (`when`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delay`
--

LOCK TABLES `delay` WRITE;
/*!40000 ALTER TABLE `delay` DISABLE KEYS */;
/*!40000 ALTER TABLE `delay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET latin1 NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
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
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `release` int(11) NOT NULL,
  `author` varchar(50) CHARACTER SET latin1 NOT NULL,
  `book` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `library`
--

LOCK TABLES `library` WRITE;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` VALUES (1,'The law',1295127872,'Genesis Foundation','To keep the peace on this submarine planet we have to make some simple law statements. You are not allowed to:\r\n<b>Use more than on ship per person.\r\nCause any damage.\r\n...\r\n</b>\r\nIf you do not comply with the rules you are not allowed to play here.'),(2,'Navigating your ship',1295127872,'Genesis Foundation','<b>Overview</b>\r\nTo navigate your ship you have to use the map. On the left side of the map is the surrounding area of your ship and you can see what type of water it is, what type of resources can be found there and if the field is accessible (not black). The right side shows more information about the field you are on. It shows you the coordinates, the name of the surrounding, the name of the resource and the name of the Player claiming the field.\r\nBelow that information you can find the navigation table. It offers you the eight moving directions and a central action button. This button is a sword or a shield. If someone else claims the field there is a sword and that means you have to attack the person claiming before other actions can be done. If noone or you are claiming the field you can look for random stuff or gather the resources on the field. You do not have to claim an unclaimed field if you want to gather stuff there, but others can come there, too. You have to calim and defend the spot in case to keep others out.\r\n --- <b>Details</b>\r\nThe navigation filed:\r\nTo navigate your ship you can use one of the eight directions you see in the navigation field. To go north you use the <img src=\"/static/images/gui/up.png\" alt=\"up-arrow\"/> to go north-east use the <img src=\"/static/images/gui/rightup.png\" alt=\"up-right-arrow\"/>. The icon in the middle of your navigation field shows you what you can do. It can be a <img src=\"/static/images/gui/attack.png\" alt=\"sword\"> or a <img src=\"/static/images/gui/guard.png\" alt=\"shield\">. You can attack the field, whenever ther is a sword. The shield shows you that you already own the field and that you can buuild some defence on this field.');
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
  `to` varchar(50) CHARACTER SET latin1 NOT NULL,
  `from` varchar(50) CHARACTER SET latin1 NOT NULL,
  `subject` varchar(45) CHARACTER SET latin1 NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isread` int(1) NOT NULL,
  `message` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES (3,'test','test','No Subject','2011-05-11 21:55:16',3,'sgd');
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_entities`
--

DROP TABLE IF EXISTS `map_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_entities` (
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `img` varchar(50) CHARACTER SET latin1 NOT NULL,
  `id` int(11) NOT NULL,
  `type` enum('puzzle','place','item') COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_entities`
--

LOCK TABLES `map_entities` WRITE;
/*!40000 ALTER TABLE `map_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `map_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `missions`
--

DROP TABLE IF EXISTS `missions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `missions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `description` text CHARACTER SET latin1 NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `missions`
--

LOCK TABLES `missions` WRITE;
/*!40000 ALTER TABLE `missions` DISABLE KEYS */;
INSERT INTO `missions` VALUES (1,'Welcome to Genesis2','The Genesis Foundation welcomes you as a new member on Taranus.<br />\r\nWe have a lot of work to do and so we would be happy if you want to join the good thing and help us building up a new foundation for humanity.<br />\r\nThe first step is to see if your equipment is sufficient. Therefor we will stress your ship with a special treatment. This will coast you 5 energy and 5 shield. Do not worry. This will built up after a while.<br />\r\n<br />\r\nWe are looking forward to hear from you.',50,5,15,5,10,5,10,0,0),(2,'Border Patrol','With the big unknown sea surrounding us we have to be prepared to fight against what ever may come. It is essential that someone is having an eye on the borders. Yu can earn yourself some money by spending some time doing it.',55,5,10,1,10,0,60,0,0),(3,'Fetch Oxygen','We know that there are several sources of oxygen in the south west of our city. Go there and fetch some.',60,20,50,2,30,2,600,5,1),(4,'Patrol','Get out there and see if you can find out what\'s happening out there.',0,10,5,2,5,3,600,1,1),(5,'Pirate','There is nothing as nice as it looks when it comes to power. People are always looking for a opportunity to trick the authorities. So can you do, too. But beware if you are going to be on the pirate trip be aware, that you can not count on the support of the Genesis Foundation when you are in real trouble!\r\n\r\nTo come to your mission. Steal some gold from the communal depot.',0,20,10,-30,100,1,300,5,0);
/*!40000 ALTER TABLE `missions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_badges`
--

DROP TABLE IF EXISTS `player_badges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_badges` (
  `pid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_badges`
--

LOCK TABLES `player_badges` WRITE;
/*!40000 ALTER TABLE `player_badges` DISABLE KEYS */;
INSERT INTO `player_badges` VALUES (1003,1),(1003,2),(1003,3),(1003,4),(1003,5),(1003,6),(1003,7),(1003,8),(1003,9),(1003,10),(1003,11),(1003,12),(1003,13),(1003,14),(1003,15),(1003,16),(1003,17),(1003,18),(1003,19),(1003,20);
/*!40000 ALTER TABLE `player_badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player_library`
--

DROP TABLE IF EXISTS `player_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player_library` (
  `pid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_library`
--

LOCK TABLES `player_library` WRITE;
/*!40000 ALTER TABLE `player_library` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_library` ENABLE KEYS */;
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
  `message` text CHARACTER SET latin1 NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `player_log` (`player`,`time`),
  KEY `new_logs` (`player`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_log`
--

LOCK TABLES `player_log` WRITE;
/*!40000 ALTER TABLE `player_log` DISABLE KEYS */;
INSERT INTO `player_log` VALUES (1,0,1309507866,'You have leveled up! You gained +1 stat point!',1),(2,0,1309507875,'You have leveled up! You gained +1 stat point!',1),(3,0,1309507884,'You have leveled up! You gained +1 stat point!',1),(4,0,1309508093,'You have leveled up! You gained +1 stat point!',1),(5,0,1309508155,'You have leveled up! You gained +1 stat point!',1),(6,0,1309508285,'You have leveled up! You gained +1 stat point!',1),(7,0,1309508288,'You have leveled up! You gained +1 stat point!',1),(8,0,1309508291,'You have leveled up! You gained +1 stat point!',1),(9,0,1309508293,'You have leveled up! You gained +1 stat point!',1),(10,0,1309508294,'You have leveled up! You gained +1 stat point!',1),(11,0,1309508295,'You have leveled up! You gained +1 stat point!',1),(12,0,1309508297,'You have leveled up! You gained +1 stat point!',1),(13,0,1309508310,'You have leveled up! You gained +1 stat point!',1),(14,0,1309508428,'You have leveled up! You gained +1 stat point!',1),(15,0,1309508514,'You have leveled up! You gained +1 stat point!',0);
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
  `username` varchar(30) CHARACTER SET latin1 DEFAULT NULL,
  `password` varchar(40) CHARACTER SET latin1 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `secret_key` text CHARACTER SET latin1,
  `session_id` varchar(30) CHARACTER SET latin1 NOT NULL,
  `language` varchar(3) CHARACTER SET latin1 NOT NULL,
  `rank` smallint(5) unsigned NOT NULL DEFAULT '1',
  `registered` int(11) unsigned DEFAULT NULL,
  `last_active` int(11) unsigned DEFAULT '0',
  `last_login` int(11) unsigned DEFAULT '0',
  `money` int(11) unsigned DEFAULT '100',
  `level` int(11) unsigned DEFAULT '1',
  `stat_points` int(11) unsigned DEFAULT '0',
  `exp` int(11) unsigned DEFAULT '0',
  `max_exp` int(11) unsigned DEFAULT '10',
  `energy` int(11) unsigned NOT NULL DEFAULT '10',
  `max_energy` int(11) unsigned NOT NULL DEFAULT '10',
  `kills` int(11) unsigned NOT NULL DEFAULT '0',
  `deaths` int(11) unsigned NOT NULL DEFAULT '0',
  `missions` text CHARACTER SET latin1 NOT NULL,
  `gwp` int(11) NOT NULL DEFAULT '50',
  `facebook` bigint(15) NOT NULL DEFAULT '0',
  `tutorial` tinyint(4) NOT NULL DEFAULT '0',
  `ban` tinyint(4) NOT NULL DEFAULT '0',
  `messages` int(11) NOT NULL,
  `puzzles_solved` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,'Genesis Foundation','e882a6c125e8527a22ebe06502036756c0ecf831','neumann.bastian@gmail.com','#[LraAn8E9^k5`[g','','',10,1286231120,1300603731,1300562123,166,17,989,62,330,20,20,18,21,'0',100,0,0,0,0,0),(1003,'test','64e6526a73933671d06840b017afba65762b3159','test@test.de','wioUQ0kCB,AjveAz','','',1,1303877800,1310073398,1310066648,100,1,0,0,10,10,10,0,0,'',50,0,4,0,0,0);
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
  `type` varchar(25) CHARACTER SET latin1 NOT NULL,
  `name` text CHARACTER SET latin1 NOT NULL,
  `dep_propulsion` tinyint(4) NOT NULL,
  `dep_gearbox` tinyint(4) NOT NULL,
  `dep_energy` tinyint(4) NOT NULL,
  `dep_engine` tinyint(4) NOT NULL,
  `dep_navigation` tinyint(4) NOT NULL,
  `dep_sonar` tinyint(4) NOT NULL,
  `shield` tinyint(4) NOT NULL,
  `speed` tinyint(4) NOT NULL,
  `accuracy` tinyint(4) NOT NULL,
  `energy` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`,`type`),
  KEY `id` (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_parts`
--

LOCK TABLES `ship_parts` WRITE;
/*!40000 ALTER TABLE `ship_parts` DISABLE KEYS */;
INSERT INTO `ship_parts` VALUES (1,'energy','Small nuclear plant',1,1,1,1,1,1,20,0,0,10),(1,'engine','Small Motor',1,1,1,1,1,1,0,4,0,0),(1,'gearbox','Iron cog wheels',1,1,1,1,1,1,0,2,0,0),(1,'navigation','Pen and paper',1,1,1,1,1,1,0,0,0,0),(1,'propulsion','Basic propeller',1,1,1,1,1,1,0,2,0,0),(1,'sonar','Small Microphone',1,1,1,1,1,1,0,0,2,0),(2,'energy','Medium nuclear plant',1,1,1,1,1,1,25,0,0,20),(2,'engine','Medium Motor',1,1,2,1,1,1,0,6,0,0),(2,'gearbox','Steel cog wheels',0,1,1,2,1,1,0,3,0,0),(2,'navigation','Calulator',1,1,1,1,1,1,0,0,1,0),(2,'propulsion','Big propeller',1,2,1,1,1,1,0,3,0,0),(2,'sonar','Budget Sonar Panel',1,1,3,1,1,1,0,0,5,0),(3,'energy','Big nuclear plant',1,1,2,1,1,1,30,0,0,40),(3,'engine','Big Motor',1,1,4,2,1,1,0,9,0,0),(3,'gearbox','Hard steel cog wheles',2,1,1,2,1,1,0,5,0,0),(3,'navigation','Computer',1,1,1,1,2,3,0,0,3,0),(3,'propulsion','Advanced propeller',2,2,1,1,1,1,0,6,0,0),(3,'sonar','Decent Sonar panel',1,1,4,1,1,2,0,0,10,0),(4,'energy','Tiny fusion reactor',1,1,3,1,1,1,40,0,0,60),(4,'engine','Twin Motor',1,1,6,3,1,1,0,21,0,0),(4,'gearbox','Titanium cog wheels',1,3,1,4,1,1,0,20,0,0),(4,'navigation','Super copmuter',5,1,1,1,3,3,0,0,5,0),(4,'propulsion','Basic impeller',3,3,1,1,1,1,0,10,0,0),(5,'energy','Small fusion reactor',1,1,4,1,1,1,60,0,0,100),(5,'navigation','Autopilot',9,1,1,1,4,3,0,0,10,0),(5,'propulsion','Big impeller',4,3,1,1,1,1,0,20,0,0),(6,'energy','Medium fusion reactor',1,1,5,1,1,1,100,0,0,127),(6,'propulsion','Advanced impeller',5,3,5,1,1,1,0,35,0,0),(7,'energy','Huge fusion reactor',1,4,6,1,1,1,127,0,0,127),(8,'energy','Perpetuum Mobile',1,1,7,1,1,1,127,0,0,127),(8,'propulsion','Big jet',7,3,6,1,1,1,0,50,0,0),(9,'propulsion','Advanced jet',8,3,6,7,1,1,1,70,0,0),(10,'propulsion','Highspeed jet',9,3,6,8,1,1,1,100,0,0);
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
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `x_new` int(11) NOT NULL,
  `y_new` int(11) NOT NULL,
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
  `missions` text CHARACTER SET latin1 NOT NULL,
  `max_shield` int(11) NOT NULL,
  `shield` int(11) NOT NULL,
  `accuracy` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `bookmarks` text CHARACTER SET latin1 NOT NULL COMMENT 'array',
  `distance` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships` VALUES (0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,'',20,0,2,6,'',0),(1003,7216,1395,7286,1334,1,1,1,1,1,1,1,0,1303881021,1303880975,0,'',20,20,2,6,'',0);
/*!40000 ALTER TABLE `ships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shouts`
--

DROP TABLE IF EXISTS `shouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shouts` (
  `time` int(11) NOT NULL,
  `from` varchar(50) CHARACTER SET latin1 NOT NULL,
  `text` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shouts`
--

LOCK TABLES `shouts` WRITE;
/*!40000 ALTER TABLE `shouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tutorial`
--

DROP TABLE IF EXISTS `tutorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tutorial` (
  `id` int(11) NOT NULL,
  `text` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tutorial`
--

LOCK TABLES `tutorial` WRITE;
/*!40000 ALTER TABLE `tutorial` DISABLE KEYS */;
INSERT INTO `tutorial` VALUES (1,'Welcome to <b>Project Genesis 2</b>!\r\nThis little tutorial will show you the basic way to play this game. You will learn how to explore the world, gather resources, solve missions and get ready for battle. You can skip the tutorial whenever you want. Just click on \'skip\'. If you want to continue klick \'next\''),(2,'At first you will learn what the basic interface offers you. You can see the functions that are always available at the top row. To learn more about these functions click \'next\''),(3,'To come to your dashboard simply click <b>Home</b> wherever you are.\r\n\r\nTo see where you are in the world klick <b>Map</b>. That shows you the world map if your ship is not busy doning something.\r\n\r\nIf you want to see how far your ship is upgraded and what kind of status upgrades are available for you click on <b>Ship</b>\r\n\r\nClick \'next\' to learn more about missions and the city.'),(4,'To keep you and your ship busy you can accept several missions. These missions are available on the <b>Missions</b> page.\r\n\r\nThere are several things you can access from the main city. Click on <b>City</b> whenever you feel like you should update your profile, read some information in the library or want to view the scoreboard.');
/*!40000 ALTER TABLE `tutorial` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-07-07 23:59:47
