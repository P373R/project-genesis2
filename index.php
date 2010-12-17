<?php
define('IN_EZRPG', true);

require_once 'init.php';

$default_mod = 'Index';

$module_name = ( (isset($_GET['mod']) && ctype_alnum($_GET['mod'])) ? $_GET['mod'] : $default_mod );

// Energy hook
if($player->id != 0){
  $res = $db->fetchRow("SELECT `energy` FROM `players` WHERE `id`='".$player->id."'"); 
  ($res->energy == 0)?$player->tired = 1:$player->tired = 0;
}

//Header hooks
$module_name = $hooks->run_hooks('header', $module_name);

//Begin module
$module = ModuleFactory::factory($db, $tpl, $player, $module_name);
$module->start();

//Footer hooks
$hooks->run_hooks('footer', $module_name);
?>