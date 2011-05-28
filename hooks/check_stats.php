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
    
    // fetch the current boni from ship parts
    $row = $db->fetchRow("SELECT SUM(ship_parts.shield) as max_shield, 
				 SUM(ship_parts.speed) as speed, 
				 SUM(ship_parts.accuracy) as accuracy, 
				 SUM(ship_parts.energy) as energy 
			  FROM  ships, ship_parts
			  WHERE ships.id=? AND (
			      (ships.propulsion = ship_parts.id AND ship_parts.type='propulsion') OR
			      (ships.engine = ship_parts.id AND ship_parts.type='engine') OR
			      (ships.energy = ship_parts.id AND ship_parts.type='energy') OR
			      (ships.navigation = ship_parts.id AND ship_parts.type='navigation') OR
			      (ships.sonar = ship_parts.id AND ship_parts.type='sonar')
			)",array($args->ship->id));

    $energy = $row->energy;
    unset($row->energy);
    // Fill in the attributes created by the city!
    
    $db->update('<ezrpg>ships', (array)$row, array("id" => $args->id));
    $db->update('<ezrpg>players', array("max_energy" => $energy), array("id" => $args->id));

    $changedcity = false;
    if ($args->city->shield > $args->city->max_shield)
    {
        $args->city->shield = $args->city->max_shield;
        $changedcity = true;
    }

    $changedship = false;
    if ($args->ship->shield > $args->ship->max_shield)
    {
        $args->ship->shield = $args->ship->max_shield;
        $changedship = true;
    }
    
    $changed = false;
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

    if ($changedcity === true)
    {
	$db->execute('UPDATE `<ezrpg>map_cities` SET `shield`=? WHERE `owner`=?', array($args->city->shield, $args->id));
    }

    if ($changedship === true)
    {
	$db->execute('UPDATE `<ezrpg>ships` SET `shield`=? WHERE `id`=?', array($args->ship->shield, $args->id));
    }

    if ($changed === true)
    {
	$db->execute('UPDATE `<ezrpg>players` SET `energy`=?, `gwp`=? WHERE `id`=?', array($args->energy, $args->gwp, $args->id));
    }
    
    //$db->execute("UPDATE `<ezrpg>players` SET `strength`='$result[strength]', `vitality`='$result[vitality]', `agility`='$result[agility]', `dexterity`='$result[dexterity]', `max_energy`='$result[energy]' WHERE `id`=?", array($args->id));

    return $args;
}
?>
