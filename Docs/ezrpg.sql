-- MySQL dump 10.13  Distrib 5.1.54, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ezrpg
-- ------------------------------------------------------
-- Server version	5.1.54-1ubuntu4-log

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
-- Table structure for table `delay`
--

DROP TABLE IF EXISTS `delay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delay` (
  `when` int(11) NOT NULL,
  `command` text NOT NULL,
  KEY `when` (`when`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
  `to` varchar(50) NOT NULL,
  `from` varchar(50) NOT NULL,
  `subject` varchar(45) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isread` int(1) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
INSERT INTO `mail` VALUES (3,'test','test','No Subject','2011-05-11 21:55:16',0,'sgd');
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `map_cities`
--

DROP TABLE IF EXISTS `map_cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `map_cities` (
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `owner` int(11) NOT NULL,
  `inhabitants` int(11) NOT NULL,
  `mine_water` float NOT NULL,
  `mine_oxygen` float NOT NULL,
  `mine_iron` float NOT NULL,
  `mine_titan` float NOT NULL,
  `mine_aluminium` float NOT NULL,
  `water` float NOT NULL,
  `oxygen` float NOT NULL,
  `iron` float NOT NULL,
  `titan` float NOT NULL,
  `aluminium` float NOT NULL,
  `shield` int(11) NOT NULL,
  `max_shield` int(11) NOT NULL,
  PRIMARY KEY (`x`,`y`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `map_cities`
--

LOCK TABLES `map_cities` WRITE;
/*!40000 ALTER TABLE `map_cities` DISABLE KEYS */;
INSERT INTO `map_cities` VALUES (1216,895,'New Atlantis',1003,0,0,0,0,0,0,0,0,0,0,0,15,15);
/*!40000 ALTER TABLE `map_cities` ENABLE KEYS */;
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
  `img` varchar(50) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`x`,`y`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player_log`
--

LOCK TABLES `player_log` WRITE;
/*!40000 ALTER TABLE `player_log` DISABLE KEYS */;
INSERT INTO `player_log` VALUES (1,1002,1297310107,'You have leveled up! You gained +1 stat point!',1),(2,1002,1297330960,'You have leveled up! You gained +1 stat point!',1),(3,1002,1297333179,'You have leveled up! You gained +1 stat point!',1),(4,1002,1297500867,'You have leveled up! You gained +1 stat point!',1),(5,1002,1300689005,'You have leveled up! You gained +1 stat point!',1),(6,1002,1302904475,'You have leveled up! You gained +1 stat point!',1),(7,1002,1302906263,'You have leveled up! You gained +1 stat point!',1),(8,1000,1302912870,'You have leveled up! You gained +1 stat point!',1),(9,1000,1302915275,'You have leveled up! You gained +1 stat point!',1),(10,1000,1302921487,'You have leveled up! You gained +1 stat point!',1),(11,1000,1302924049,'You have leveled up! You gained +1 stat point!',1),(12,1000,1302935818,'You have leveled up! You gained +1 stat point!',1),(13,1001,1302947901,'You have leveled up! You gained +1 stat point!',1),(14,1005,1302948284,'You have leveled up! You gained +1 stat point!',0),(15,1001,1302952255,'You have leveled up! You gained +1 stat point!',1),(16,0,1303876872,'You have leveled up! You gained +1 stat point!',0),(17,0,1303880204,'You have leveled up! You gained +1 stat point!',0),(18,0,1303880207,'You have leveled up! You gained +1 stat point!',0);
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
  `session_id` varchar(30) NOT NULL,
  `language` varchar(3) NOT NULL,
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
  `missions` text NOT NULL,
  `gwp` int(11) NOT NULL DEFAULT '50',
  `facebook` bigint(15) NOT NULL DEFAULT '0',
  `tutorial` tinyint(4) NOT NULL DEFAULT '0',
  `ban` tinyint(4) NOT NULL DEFAULT '0',
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
INSERT INTO `players` VALUES (1,'Genesis Foundation','e882a6c125e8527a22ebe06502036756c0ecf831','neumann.bastian@gmail.com','#[LraAn8E9^k5`[g','','',10,1286231120,1300603731,1300562123,166,17,989,62,330,20,20,18,21,'0',100,0,0,0),(1003,'test','64e6526a73933671d06840b017afba65762b3159','test@test.de','wioUQ0kCB,AjveAz','','',1,1303877800,1305185186,1305183040,100,1,0,0,10,20,20,0,0,'',50,0,4,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_parts`
--

LOCK TABLES `ship_parts` WRITE;
/*!40000 ALTER TABLE `ship_parts` DISABLE KEYS */;
INSERT INTO `ship_parts` VALUES (1,'energy','Small nuclear plant',0,0,0,0,0,0,0,0,0,10),(1,'engine','Small Motor',0,0,0,0,0,0,0,4,0,0),(1,'gearbox','Iron cog wheels',0,0,0,0,0,0,0,2,0,0),(1,'navigation','Pen and paper',0,0,0,0,0,0,0,0,0,0),(1,'propulsion','Basic propeller',0,0,0,0,0,0,0,2,0,0),(1,'sonar','Small Microphone',0,0,0,0,0,0,0,0,2,0),(2,'energy','Medium nuclear plant',0,0,0,0,0,0,10,0,0,20),(2,'engine','Medium Motor',0,0,0,0,0,0,0,6,0,0),(2,'gearbox','Steel cog wheels',0,0,0,0,0,0,0,3,0,0),(2,'navigation','Calulator',0,0,0,0,0,0,0,0,1,0),(2,'propulsion','Big propeller',0,0,0,0,0,0,0,3,0,0),(2,'sonar','Budget Sonar Panel',0,0,0,0,0,0,0,0,5,0),(3,'energy','Big nuclear plant',0,0,0,0,0,0,20,0,0,40),(3,'engine','Big Motor',0,0,0,0,0,0,0,9,0,0),(3,'gearbox','Hard steel cog wheles',0,0,0,0,0,0,0,5,0,0),(3,'navigation','Computer',0,0,0,0,0,0,0,0,3,0),(3,'propulsion','Advanced propeller',0,0,0,0,0,0,0,6,0,0),(3,'sonar','Decent Sonar panel',0,0,0,0,0,0,0,0,10,0),(4,'energy','Tiny fusion reactor',0,0,0,0,0,0,40,0,0,60),(4,'engine','Twin Motor',0,0,0,0,0,0,0,21,0,0),(4,'gearbox','Titanium cog wheels',0,0,0,0,0,0,0,20,0,0),(4,'navigation','Super copmuter',0,0,0,0,0,0,0,0,5,0),(4,'propulsion','Basic impeller',0,0,0,0,0,0,0,10,0,0),(5,'energy','Small fusion reactor',0,0,0,0,0,0,60,0,0,100),(5,'navigation','Autopilot',0,0,0,0,0,0,0,0,10,0),(5,'propulsion','Big impeller',0,0,0,0,0,0,0,20,0,0),(6,'energy','Medium fusion reactor',0,0,0,0,0,0,100,0,0,127),(6,'propulsion','Advanced impeller',0,0,0,0,0,0,0,35,0,0),(7,'energy','Huge fusion reactor',0,0,0,0,0,0,127,0,0,127),(8,'energy','Perpetuum Mobile',0,0,0,0,0,0,127,0,0,127),(8,'propulsion','Big jet',0,0,0,0,0,0,0,50,0,0),(9,'propulsion','Advanced jet',0,0,0,0,0,0,0,70,0,0),(10,'propulsion','Highspeed jet',0,0,0,0,0,0,0,100,0,0);
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
  `missions` text NOT NULL,
  `max_shield` int(11) NOT NULL,
  `shield` int(11) NOT NULL,
  `accuracy` int(11) NOT NULL,
  `speed` int(11) NOT NULL,
  `bookmarks` text NOT NULL COMMENT 'array',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ships`
--

LOCK TABLES `ships` WRITE;
/*!40000 ALTER TABLE `ships` DISABLE KEYS */;
INSERT INTO `ships` VALUES (0,0,0,0,0,1,1,1,1,1,1,1,0,0,0,0,'',0,0,0,0,''),(1003,9216,1395,0,0,1,1,1,1,1,1,1,0,1303881021,1303880975,0,'',15,16,4,8,'');
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
  `from` varchar(50) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`time`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shouts`
--

LOCK TABLES `shouts` WRITE;
/*!40000 ALTER TABLE `shouts` DISABLE KEYS */;
INSERT INTO `shouts` VALUES (1302817944,'?','test'),(1302817957,'?','test'),(1302817976,'test','test'),(1302818844,'test','jetzt gehts!'),(1302818886,'test','und auch zu langer text wird gekÃ¼rzt, weil sonst die shoutbox Ã¼berlÃ¤uft und das will ja auch keine, muss ja auhc net...'),(1302818929,'test','bin mal gespannt, wie es aussieht, wenn man das alles mit maximalen shouts vollpackt, das ist bestimmt mahr als erwartet'),(1302818947,'test','und wenn jetzt noch ein dritter dazu kommt, dann hÃ¤tt ich doch gerne einen Ã¼berlauf drin'),(1302818957,'test','ja, scrollbars werden wohl reinkommen'),(1302823709,'test','schon besser :)'),(1302901310,'Bastian','ui'),(1302947503,'test','this version is ready for testing!'),(1303990955,'test','hahaha');
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
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
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

-- Dump completed on 2011-05-12 19:39:36
