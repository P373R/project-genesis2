<?php
/**
  Counting the active players in the last 5 minutes
  @package Hooks
*/
defined('IN_EZRPG') or exit;

$hooks->add_hook('header', 'online_players');
/**
  Hohle Anzahl der aktiven SPieler aus der DB und speichere im Template
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 

*/
function hook_online_players(&$db, &$tpl, &$player, $args = 0)
{
    $query = $db->fetchRow('SELECT COUNT(`id`) AS `count` FROM `<ezrpg>players` WHERE `last_active`>?', array(time() - (60*5)));
    $tpl->assign('ONLINE', $query->count);

    
    return $args;
}
?>