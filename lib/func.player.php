<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * This file contains functions that deal with players.
 *
 * @package Genesis2
 * @subpackage Functions
 * @subpackage Player
 */

/**
 * Checks if the player is logged in. If not, the user is redirected back to the home page.
 *
 * @param string  $msg An optional message to show the user after they are redirected.
 *
 * Example Usage:
 * Just call the requireLogin() function in a module's start() method *once*, if the module requires a user to be logged in.
 *
 * The function must be called before any output is made (so before templates have been displayed).
 */
function requireLogin($msg='')
{
    if (!LOGGED_IN)
    {
	if (AJAX) { // No AJAX requests alowed if not logged in
	    header("Status: 403");
	    exit;
	}
        if (!empty($msg))
            header('Location: index.php?msg=' . urlencode($msg));
        else
            header('Location: index.php');
        exit;
    }
}

/**
 * Checks if the player is an admin. If not, the user is redirected back to the home page.
 * 
 * @param object $player A player object.
 * 
 * Example Usage:
 * Just call the requireAdmin() function if you require the user to be an admin.
 * 
 * The function must be called before any output is made.
 */
function requireAdmin($player = 0)
{
    if (!isset($player) || $player->rank < 5)
    {
        //header('Location: index.php');
        //exit;
    }
}


/**
 * Addiert $count Erfahrung zum Player
 *
 * @param int $player Die Id des Spielers
 * @param object &$db Object der Datenbank
 * @param int Die Anzahl der Erfahrungspunkte
 */
function addExp($player, &$db, $count = 0)
{
  $db->execute("UPDATE `<ezrpg>players` SET `exp` = `exp`+".$count." WHERE `id`='".$player."'");
}

/**
 * Substrahiert den Wert $count von der Energie des Spielers
 * 
 * @param int $player Die Id des Spielers
 * @param object &$db Object der Datenbank
 * @param int $count  Die Anzahl der zu subtrahierenden Energie	  
 */
function redNrg($player, &$db, $count = 0)
{
  $db->execute("UPDATE `<ezrpg>players` SET `energy` = `energy`-".$count." WHERE `id`='".$player."'");
}

/** 
 * Liefert Angriffsstärke des Users
 * 
 * @param: object &$player Objekt des Player, der abgefragt wird
 */
function getAtk(&$player)
{
}

/**
 * Sets the ship in busy mode for $time seconds
 *
 * @param int $player Player id
 * @param object &$db Database object
 * @param int $time Seconds to be busy
 */
function setBusy($player, &$db, $time)
{
    $until = time() + $time;
    $db->execute("UPDATE `<ezrpg>ships` SET `busy`='$until', `start`='".time()."' WHERE `id`='$player'");
    return;
}

/**
 * Tests if busy
 *
 * @param object $player Player object
 */
function isBusy($player)
{
    if($player->ship->busy > time()) return true;
    else return false;
}

?>