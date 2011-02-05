<?php
/**
 * Check if Stats are ok
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

$hooks->add_hook('player', 'check_stats', 2);

/**
  Check if Stats are ticked higher than max
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_check_stats($db, &$tpl, $player, $args = 0)
{
    if ($args === 0 || LOGGED_IN == false)
        return $args;
    
    $changed = false;
    //Check if player's stats are above the limit
    if ($args->hp > $args->vitality)
    {
        $args->hp = $args->vitality;
        $changed = true;
    }

    if ($args->energy > $args->max_energy)
    {
        $args->energy = $args->max_energy;
        $changed = true;
    }

    if ($changed === true)
    {
        $db->execute('UPDATE `<ezrpg>players` SET `energy`=?, `hp`=? WHERE `id`=?', array($args->energy, $args->hp, $args->id));
    }



    return $args;
}
?>
