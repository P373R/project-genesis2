<?php
/**
 @package Scripts
*/
define('IN_EZRPG', true);

require_once('init.php');

//User must be logged in
//requireLogin();

//Don't show errors or notices, or it breaks the image
//error_reporting(0);

$width = (isset($_GET['width']))?intval($_GET['width']):100;
$height = (isset($_GET['height']))?intval($_GET['height']):15;

$bar = new ImageBar(); // Load the class
$bar->setWidth($width); // Set the width
$bar->setHeight($height);
$bar->makeBar(); // Start the bar

switch($_GET['type'])
{
  case "exp":
      $bar->setFillColor('blue'); //EXP is a blue bar
      $bar->setData($player->max_exp, $player->exp);	// Give the bar some values
      $bar->setTitle('Exp: ');
      break;
  case "hp":
      $percentage = ($player->hp / $player->vitality) * 100;
      
      //Set the colour according to how much is left
      if ($percentage <= 10)
          $bar->setFillColor('red');
      else if ($percentage <= 30)
          $bar->setFillColor('yellow');
      else
          $bar->setFillColor('green');
      
      $bar->setData($player->vitality, $player->hp);	// Give the bar some values
      $bar->setTitle('Shield: ');
      break;
  case "energy":
      $percentage = ($player->energy / $player->max_energy) * 100;

      //Set the colour according to how much is left
      if ($percentage <= 10)
          $bar->setFillColor('red');
      else if ($percentage <= 30)
          $bar->setFillColor('yellow');
      else
          $bar->setFillColor('green');

      $bar->setData($player->max_energy, $player->energy);	// Give the bar some values
      $bar->setTitle('Energy: ');
      break;
  case "oxygen":
      $percentage = ($player->oxygen / $player->max_oxygen) * 100;

      if($percentage <= 77)
          $bar->setFillColor('green');
      else
          $bar->setFillColor('red');

      $bar->setData($player->max_oxygen, $player->oxygen);
      $bar->setTitle('Oxygen: ');
      break;
  case 'busy':
      if ($player->ship->busy-time() > 0) {
	$bar->setData($player->ship->busy-$player->ship->start, $player->ship->busy-time(), false);

	$bar->setTitle('Ship is busy');
	$bar->setFillColor('blue');
      }
      break;
  default:
      if(isset($_GET['val1'])) $val1 = $_GET['val1'];
      if(isset($_GET['val2'])) $val2 = $_GET['val2'];
      if(isset($_GET['color'])) $color = $_GET['color'];
      if(isset($_GET['title'])) $title = $_GET['title'];
      if(isset($_GET['numbers'])) $text = $_GET['numbers'];

      $bar->setData($val1,$val2,$text);
      $bar->setFillColor($color);
      $bar->setTitle($title.' ');
      break;
}

// Output the bar!
$bar->generateBar();
?>