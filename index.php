<?php
$pro_mtime = microtime();
$pro_time  = time();

define('IN_EZRPG', true);

require_once 'init.php';

$default_mod = 'Index';

$module_name = ( (isset($_GET['mod']) && ctype_alnum($_GET['mod'])) ? $_GET['mod'] : $default_mod );

//Header hooks
$module_name = $hooks->run_hooks('header', $module_name);

//Begin module
$module = ModuleFactory::factory($db, $tpl, $player, $module_name);
$module->start();

//Footer hooks
$hooks->run_hooks('footer', $module_name);

$timediv = (time()-$pro_time)+(microtime()-$pro_mtime);

$profiler = file_get_contents('profilertime');
$profiler.= $_SERVER['REQUEST_URI']." .. ".$timediv."\n";
file_put_contents('profilertime',$profiler);
?>