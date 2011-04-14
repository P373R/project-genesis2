<?php
/**
 * Check for a new shout and fill shoutlist
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

$hooks->add_hook('player', 'shout', 5);

/**
  Check if the ship is busy. If set BUSY true for the template engine
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_shout($db, &$tpl, $player, $args = 0)
{
	if(isset($_POST['shout'])) {
	    $insert = array(
		'time' => time(),
		'from' => $args->username,
		'text' => shorten(strip_tags($_POST['shout']),120),
		);
	    $db->insert('<ezrpg>shouts', $insert);
	}
	
	$shouts = $db->fetchAll($db->execute("SELECT * FROM `<ezrpg>shouts` ORDER By `time` DESC LIMIT 10"),true);
	$tpl->assign('shouts', $shouts);
	
	return $args;
}
?>
