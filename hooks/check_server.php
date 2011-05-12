<?php
/**
 * Check if the server running on is localhost
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
$hooks->add_hook('player', 'check_server', 0);

/**

  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_check_server($db, &$tpl, $player, $args = 0)
{
    ($_SERVER['SERVER_ADDR'] == '127.0.0.1')? define('LOCAL_SERVER',1): define('LOCAL_SERVER',0);
    if (LOCAL_SERVER){
	$tpl->assign('SERVER','local');
	$tpl->assign('BASIC_URL','genesis');
    } else {
	$tpl->assign('BASIC_URL','www.project-genesis2.de');
    }
    return $args;
}
?>
