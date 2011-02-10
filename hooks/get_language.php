<?php
/**
 * Sets the language in SESSION array
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
 Loading Language
  @package Hooks
*/
//Add a player object hook - check the user session, priority 0
$hooks->add_hook('login_after', 'get_language', 0);

/**
  Login after hook to fetch language in SESSION array

  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_get_language($db, &$tpl, $player, $args = 0)
{
    $query = $db->fetchRow('SELECT `language` FROM `<ezrpg>players` WHERE `id`=?',array($args->id));
    $_SESSION['language'] = $query->language;

    return $args;
}
?>
