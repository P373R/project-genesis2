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
$config_username = 'ezrpg';
$config_password = '';
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
define('SHOW_ERRORS', 1);

(!isset($_REQUEST['DEBUG_MODE']))? define('DEBUG_MODE', 0) : define('DEBUG_MODE', 1);

define('MAX_X', 10000); // Cardsize is dominated by the image available.
define('MAX_Y', 3200);
define('SYS_VERSION',"0.5.0");

/* DEPRECATED: As no local city is supplied anymore
define('ATLANTIS_X',500);
define('ATLANTIS_Y',50);
*/

define('RECAPTCHA_KEY','6Lf8YsESAAAAAKDSjCPqC5-JwepeeYsDB9Hnetlz');
define('RECAPTCHA_PRIVATE','6Lf8YsESAAAAAJ5meoyIjm94OI2iSXEYLhBa900C');

/*
  Variables:
  These Variables are used to translate ids in the database to human readable names
*/

$id2names = array(
  "field"=>array("Unknown","Shallow water (50m)","Water (100m)","Water (200m)","Water (500m)","Deep sea (1000m)",99=>"Atlantis"),
  "items"=>array("Nothing","Water","Iron","Aluminium","Titan","Oxygen"),
  "db_fields"=>array("","water","iron","aluminium","titan","oxygen"),
  "weapons"=>array("","Mine")
);

?>