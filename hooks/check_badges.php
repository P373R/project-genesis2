<?php
/**
 * Check if a badge can be issued
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

$hooks->add_hook('player', 'check_badges', 3);

/**
  Check if a value is honorable
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_check_badges($db, &$tpl, $player, $args = 0)
{
    if ($args === 0 || LOGGED_IN == false)
        return $args;
    
    $badges = $db->fetchAll($db->execute("SELECT `bid` FROM `<ezrpg>player_badges` WHERE `pid`=?",array($args->id)));

    //--------------------------------------------------------------------------
    // Kills Badges
    //--------------------------------------------------------------------------
    if($args->kills == 10 && $args->deaths == 0 && !in_array(array("bid"=>2),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 1));
    }
    if($args->kills == 50 && $args->deaths == 0 && !in_array(array("bid"=>13),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 1));
    }
    if($args->kills == 100 && $args->deaths == 0 && !in_array(array("bid"=>14),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 1));
    }

    //--------------------------------------------------------------------------
    // Gold Badges
    //--------------------------------------------------------------------------
    if($args->gold >= 1000000 && !in_array(array("bid"=>2),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 2));
    }
    if($args->gold >= 10000000 && !in_array(array("bid"=>11),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 11));
    }
    if($args->gold >= 10000000 && !in_array(array("bid"=>12),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 12));
    }

    //--------------------------------------------------------------------------
    // Genesis FOundation Badge
    //--------------------------------------------------------------------------
    if($args->gwp == 100 && !in_array(array("bid"=>3),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 3));
    }
    
    //--------------------------------------------------------------------------
    // Perpetuum Badge
    //--------------------------------------------------------------------------
    if($args->ship->energy == 8 && !in_array(array("bid"=>4),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 4));
    }

    //--------------------------------------------------------------------------
    // Levelmaster Badges
    //--------------------------------------------------------------------------
    if($args->level == 30 && $args->registered < time()-(60*60*24*30) && !in_array(array("bid"=>5),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 5));
    }
    if($args->level == 50 && $args->registered < time()-(60*60*24*30) && !in_array(array("bid"=>15),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 15));
    }
    if($args->level == 80 && $args->registered < time()-(60*60*24*30) && !in_array(array("bid"=>16),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 16));
    }
    
    //--------------------------------------------------------------------------
    // Traveler Badges
    //--------------------------------------------------------------------------
    if($args->ship->distance >= 1000000 && !in_array(array("bid"=>6),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 6));
    }
    if($args->ship->distance >= 4000000 && !in_array(array("bid"=>17),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 17));
    }
    if($args->ship->distance >= 10000000 && !in_array(array("bid"=>18),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 18));
    }
    
    if($args->city->inhabitants >= 1000000 && !in_array(array("bid"=>7),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 7));
    }
    
    //--------------------------------------------------------------------------
    // Bookworm Badges
    //--------------------------------------------------------------------------
    $lib = $db->execute("SELECT `bid` FROM `<ezrpg>player_library` WHERE `pid` = ?",array($rags->id));
    if($db->numRows($lib) >= 50 && !in_array(array("bid"=>8),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 8));
    }
    if($db->numRows($lib) >= 100 && !in_array(array("bid"=>19),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 8));
    }
    if($db->numRows($lib) >= 150 && !in_array(array("bid"=>20),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 20));
    }

    //--------------------------------------------------------------------------
    // Typer Badges
    //--------------------------------------------------------------------------
    if($args->messages >= 100 && !in_array(array("bid"=>9),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 9));
    }

    //--------------------------------------------------------------------------
    // Puzzle Badges
    //--------------------------------------------------------------------------
    if($args->puzzles_solved >= 5 && !in_array(array("bid"=>10),$badges)) {
	$db->insert('<ezrpg>player_badges',array("pid" => $args->id, "bid" => 10));
    }
    return $args;
}
?>
