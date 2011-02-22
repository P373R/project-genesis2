<?php
/**
 * Check if Ship is busy
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

$hooks->add_hook('player', 'check_busy', 2);

/**
  Check if the ship is busy. If set BUSY true for the template engine
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_check_busy($db, &$tpl, $player, $args = 0)
{
    if ($args === 0 || LOGGED_IN == false)
        return $args;
    
    if ($args->ship->busy-time() > 0) $tpl->assign('BUSY',true);

    return $args;
}
?>
