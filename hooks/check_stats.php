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

    if ($args->gwp > 100)
    {
        $args->gwp = 100;
        $changed = true;
    }

    if ($changed === true)
    {
        $db->execute('UPDATE `<ezrpg>players` SET `energy`=?, `hp`=?, `gwp`=? WHERE `id`=?', array($args->energy, $args->hp, $args->gwp, $args->id));
    }

    // Recompute the players values not elegant but working ;)
            $compute[] = $db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.propulsion AND type = 'propulsion'",array($args->id));
            $compute[] = $db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.gearbox AND type = 'gearbox'",array($args->id));
            $compute[] = $db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.energy AND type = 'energy'",array($args->id));
            $compute[] = $db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.engine AND type = 'engine'",array($args->id));
            $compute[] = $db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.navigation AND type = 'navigation'",array($args->id));
            $compute[] = $db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.sonar AND type = 'sonar'",array($args->id));

            $result= array();

	    //Add basic values
	    $result['vitality'] = 15;
	    $result['agility']  = 2;
	    $result['dexterity']= 2;
	    $result['energy']   = 10;
	    
            foreach($compute as $com) {
                $com = unserialize($com->properties);
                $result['strength']  += $com['strength'];
                $result['vitality']  += $com['vitality'];
                $result['agility']   += $com['agility'];
                $result['dexterity'] += $com['dexterity'];
                $result['energy']    += $com['energy'];
            }

 


    $db->execute("UPDATE `<ezrpg>players` SET `strength`='$result[strength]', `vitality`='$result[vitality]', `agility`='$result[agility]', `dexterity`='$result[dexterity]', `max_energy`='$result[energy]' WHERE `id`=?", array($args->id));

    return $args;
}
?>
