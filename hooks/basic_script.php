<?php
/**
 * Loads the basic scripts
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

$hooks->add_hook('header', 'javascript', 2);

/**
  Just fill the javascriptscript variable with the basic scripts for the game, jquery and jquery.ui
  
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_javascript(&$db, &$tpl, &$player, $args = 0)
{
    $tpl->append('javascript','jquery-1.5.2.js');
    $tpl->append('javascript','jquery-ui-1.8.12.custom.min.js');
    $tpl->append('javascript','jquery-ui-numeric-min.js');
    $tpl->append('javascript','system.js');
    $tpl->append('javascript','world.js');
    
    return $args;
}
?>