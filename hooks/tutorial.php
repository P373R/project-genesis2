<?php
/**
 * Update last active and assign to template
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

//Add hook to update the last active value for the player, default priority (5)
$hooks->add_hook('player', 'tutorial');

/**
  Update the DB if the player is active and it wasn't updated for 5 minutes
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_tutorial($db, $tpl, $player, $args = 0)
{
    if ($args === 0 || LOGGED_IN == false)
       return $args;

    if($args->tutorial >= 0) {
	$res = $db->execute("SELECT `text` FROM `<ezrpg>tutorial` WHERE `id` = ".$args->tutorial."+1");
	$tutorial = $db->fetch($res);
	$tpl->assign('tutorial',nl2br($tutorial->text));
    }
    
    return $args;
}
?>