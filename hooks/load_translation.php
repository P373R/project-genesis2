<?php
/**
 * Loads translation file
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
/**
 *
 * @package Hooks
 */
//Add a player object hook - check the user language and load translation file, priority 5
$hooks->add_hook('player', 'load_translation', 5);

/**
  Player hook to check the session and get player data

  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_load_translation($db, &$tpl, $player, $args = 0)
{
    if($args->language != '') {
        $_SESSION['language'] = $args->language;
        global $ezTranslateLanguage;
        include 'static/languages/'.$args->language.'.php';
    }
    
    return $args;
}
?>
