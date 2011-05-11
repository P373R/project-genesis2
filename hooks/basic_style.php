<?php
/**
 * Loads the basic stylesheets
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

$hooks->add_hook('header', 'stylesheets', 2);

/**
  Just fill the stylesheet variable with the basic stylesheets for the game and jquery.ui
  
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_stylesheets(&$db, &$tpl, &$player, $args = 0)
{
    $tpl->append('stylesheet','style.css');
    $tpl->append('stylesheet','default/jquery-ui-1.8.12.custom.css');
    $tpl->append('stylesheet','default/jquery-ui-numeric.css');
    
    return $args;
}
?>