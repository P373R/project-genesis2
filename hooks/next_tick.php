<?php
/**
  * Puts the timestamp of the next tick into the template system
  * @package Hooks
  */
defined('IN_EZRPG') or exit;

$hooks->add_hook('header', 'next_tick');
/**
  * Load the last tick timestamp add 600 and put it as TICK into the template system
  * @param  DB_mysql  $db Database object
  * @param  Smarty    &$tpl Global template object
  * @param  StdObject $player Player row from Database
  * @param  mixed     $args  Other arguments
  * @return StdObject 
  */
function hook_next_tick(&$db, &$tpl, &$player, $args = 0)
{
    $tpl->assign('TICK', file_get_contents('ticktime')+600);
    return $args;
}
?>