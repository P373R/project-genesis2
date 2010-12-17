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
$hooks->add_hook('header', 'last_active');

/**
  Update the DB if the player is active and it wasn't updated for 5 minutes
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_last_active($db, $tpl, $player, $args = 0)
{
    if ($player === 0 || LOGGED_IN == false)
        return $args;
    
    //Only update last active value if 5 minutes have passed since the last update
    if ($player->last_active <= (time() - 300))
    {
        $query = $db->execute('UPDATE `<ezrpg>players` SET `last_active`=? WHERE `id`=?', array(time(), $player->id));
    }
    
    return $args;
}
?>