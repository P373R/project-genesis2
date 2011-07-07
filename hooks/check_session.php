<?php
/**
 * Chekcs Session and assign if none is found.
 *
 * @category   Hooks
 *
 * @package    Hooks
 *
 * @author     Bastian Neumann <neumann.bastian@gmail.com>
 * @license    http://www.opensource.org/licenses/gpl-license.php GPL
 *
 * @version    SVN: <svn_id>
 * @link       http://dev.project-genesis2.de
 */
defined('IN_EZRPG') or exit;
/**
 Checking if session is running
  @package Hooks
*/
//Add a player object hook - check the user session, priority 0
$hooks->add_hook('player', 'check_session', 0);

/**
  Player hook to check the session and get player data

  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_check_session($db, &$tpl, $player, $args = 0)
{
    if (isset($_SESSION['userid']) && isset($_SESSION['hash']))
    {
        //Check if user logged in
        $session_check = sha1($_SESSION['userid'] . $_SERVER['REMOTE_ADDR'] . SECRET_KEY);
        
        if ($_SESSION['hash'] == $session_check)
        {
            //Select player details
            $player = $db->fetchRow('SELECT * FROM `<ezrpg>players` WHERE `id`=?', array($_SESSION['userid']));
            $player->ship = $db->fetchRow('SELECT * FROM `<ezrpg>ships` WHERE `id`=?', array($_SESSION['userid']));
            $player->ship->bookmarks = unserialize($player->ship->bookmarks);
            $player->city = $db->fetchRow('SELECT * FROM cities WHERE `owner_id`=?',array($_SESSION['userid']));

	    // No valid Database Result!
            if($player->id == 0) header("Location: index.php");

            $player->city->water      = intval($player->city->water);
            $player->city->oxygen     = intval($player->city->oxygen);
            $player->city->iron       = intval($player->city->iron);
            $player->city->titan      = intval($player->city->titan);
            $player->city->alluminium = intval($player->city->alluminium);
            
            $tpl->assignByRef('player', $player);
            
            //Set logged-in flag
            define('LOGGED_IN', true);
            $tpl->assign('LOGGED_IN', 'TRUE');
        }
        else
        {
            if (isset($_SESSION['hash']))
                unset($_SESSION['hash']);
            if (isset($_SESSION['userid']))
                unset($_SESSION['userid']);
            
            define('LOGGED_IN', false);
        }
    }
    else
    {
        define('LOGGED_IN', false);
    }
    
    return $player;
}
?>
