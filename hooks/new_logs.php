<?php
/**
 * Check for new messages or log entries
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

//Header hook to check for new logs, default priority (5)
//$hooks->add_hook('header', 'new_logs');

/**
  Check the DB for new Logs
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_new_logs(&$db, &$tpl, &$player, $args = 0)
{
    if (LOGGED_IN == true)
        $tpl->assign('new_logs', checkLog($player->id, $db));
	//$tpl->assign('new_mail', checkMail($player->username, $db));
    return $args;
}
?>