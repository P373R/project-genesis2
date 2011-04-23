<?php
define('IN_EZRPG', true);
define('AJAX', true);

require_once 'init.php';


if(isset($_GET['mod']) && ctype_alnum($_GET['mod'])) {
    $module_name = $_GET['mod'];
} else {
    // No Module? Forbidden!
    header("Status: 403");
    exit;
}


if(!defined('AJAX') || isset($_REQUEST['hookHeader'])) {
    $module_name = $hooks->run_hooks('header', $module_name);
}
//Begin module
$module = ModuleFactory::factory($db, $tpl, $player, $module_name);
$module->start();

if(!defined('AJAX') || isset($_REQUEST['hookFooter'])) {
    $module_name = $hooks->run_hooks('footer', $module_name);
}




?>