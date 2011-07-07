<?php

define('IN_EZRPG', 1);

require_once '../../init.php';
require_once 'index.php';

$module = new Module_World(&$db, &$tpl, &$player);
//echo $_POST['x'].":".$_POST['y'];
if(isset($_POST['x']) && isset($_POST['y'])) {
  $x = $_POST['x'] - 240 + $player->ship->x;
  $y = $_POST['y'] - 240 + $player->ship->y;
  $db->execute("UPDATE `ships` SET `x_new` = ? , `y_new`  = ? WHERE `id` = ?",array($x, $y, $player->ship->id));
}
echo $module->renderMap($player->ship->x, $player->ship->y);
?>