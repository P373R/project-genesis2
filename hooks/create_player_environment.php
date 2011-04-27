<?php
/**
 * Cretes the envrironment for the player
 * 
 * This includes ship city and other stuff
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

$hooks->add_hook('register_after', 'create_player_environment', 1);

/**
  Run this hook on registration and create the ship and the city
  
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_create_player_environment(&$db, &$tpl, &$player, $args = 0)
{
    // create city within the map and find a empty spot
    while(true) {
	$city['x'] = rand(30, MAX_X-30);
	$city['y'] = rand(30, MAX_Y-30);
	$lookup = $db->execute("SELECT `x` FROM `<ezrpg>map_cities` WHERE `x`=? AND `y`=?", $city);
	if($db->numRows($lookup) == 0) break; //empty found
    }
    $city['name'] = "New Atlantis";
    $city['owner'] = $args;
    $db->insert('<ezrpg>map_cities',$city);
    
    //create ship
    $db->insert('<ezrpg>ships', array('id' => $args));
    
    return $args;
}
?>