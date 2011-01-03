<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

function item_addhp($player, &$db) {
    $db->execute("UPDATE  players SET `max_hp` += 10 WHERE `id`='".$player."'");
}

?>