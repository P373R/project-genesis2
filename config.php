<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Title: Config
  The most important settings for the game are set here.
*/

/*
  Variables: Database Connection
  Connection settings for the database.
  
  $config_server - Database server
  $config_dbname - Database name
  $config_username - Username to login to server with
  $config_password - Password to login to server with
  $config_driver - Contains the database driver to use to connect to the database.
*/
$config_server = 'localhost';
$config_dbname = 'ezrpg';
$config_username = 'root';
$config_password = 'root';
$config_driver = 'mysql';

/*
  Constant:
  This secret key is used in the hashing of player passwords and other important data.
  Secret keys can be of any length, however longer keys are more effective.
  
  This should only ever be set ONCE! Any changes to it will cause your game to break!
  You should save a copy of the key on your computer, just in case the secret key is lost or accidentally changed,.
  
  SECRET_KEY - A long string of random characters.
*/
define('SECRET_KEY', '47EIsE4xi=Bb&YdB(nUJehe=');


/*
  Constants: Settings
  Various settings used in ezRPG.
  
  DB_PREFIX - Prefix to the table names
  VERSION - Version of ezRPG
  SHOW_ERRORS - Turn on to show PHP errors.
  DEBUG_MODE - Turn on to show database errors and debug information.
*/
define('DB_PREFIX', '');
define('VERSION', '1.0');
define('SHOW_ERRORS', 0);
define('DEBUG_MODE', 0);
define('MAX_X', 10); // Kartengröße
define('MAX_Y', 10);
define('SYS_VERSION',"0.3.0");

// Koordinaten auf denen Atlantis gebaut wurde
define('ATLANTIS_X',6);
define('ATLANTIS_Y',7);

/*
  Variables:
  These Variables are used to translate ids in the database to human readable names
*/

$id2names = array(
  "field"=>array("Unbekannt","Seichts Wasser (50m)","Wasser (100m)","Wasser (200m)","Wasser (500m)","Tiefsee (1000m)",99=>"Atlantis"),
  "items"=>array("Nichts","Wasser","Eisen","Aluminium","Titan","oxygen"),
  "db_fields"=>array("","water","iron","aluminium","titan","oxygen"),
  "waepons"=>array("","Miene")
);

$shop = array(
  array("name"=>"Miene", "price"=>10, "weight"=>10),
  array("name"=>"Große Miene", "price"=>10, "weight"=>10)
);
?>