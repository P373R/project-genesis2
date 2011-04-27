<?php
/**
 * Check if there is a level up
 *
 * @category   AdminModules
 *
 * @package    Modules
 * @subpackage Admin
 *
 * @author     Bastian Neumann <neumann.bastian@gmail.com>
 * @license    http://www.opensource.org/licenses/gpl-license.php GPL
 *
 * @version    SVN: <svn_id>
 * @link       http://dev.project-genesis2.de
 */
defined('IN_EZRPG') or exit;

$hooks->add_hook('player', 'level_up', 2);

/**
  Add Level if enough exp
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_level_up($db, &$tpl, $player, $args = 0)
{
    //No player data
    if ($args === 0 || LOGGED_IN == false)
       return $args;

    //Check if player has leveled up
    if ($args->exp >= $args->max_exp)
    {
        //Update the current player variable ($args)
        $args->exp = $args->exp - $args->max_exp;
        //Update the database
        //$db->execute('UPDATE `<ezrpg>players` SET `exp`=?, `level`=level+1, `stat_points`=stat_points+1, `max_exp`=max_exp+20, `hp`=vitality WHERE `id`=?', array(intval($args->exp), intval($args->id)));

        //Add event log
        $msg = 'You have leveled up! You gained +1 stat point!';
        addLog(intval($args->id), $msg, $db);
    }
    
    return $args;
}
?>
