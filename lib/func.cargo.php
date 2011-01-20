<?php
/**
 * This file contains the functions to deal with cargo
 */

/**
 * Adds Cargo to he Ship
 * Checks the ship load at first
 * @param $player Playerobject
 * @param $item Itemobject
 * @param &$db DB Instanz
 */
function addCargo($player, $item, &$db) {
    if(weightCargo($player,$db)+$item->weight <= $player->maxCargo) {
        //inset into db
    }
}

/**
 * Get a List of Cargo on a players ship
 * @param $player Playerobject
 * @param &$db DB Instanz
 */
function getCargo($player, &$db) {
    $result = $db->execute("SELECT * FROM <ezrpg>cargo WHERE uid=`".$player->id."`");
    $db->fetchAll($result); // get everything as object
}

/**
 * Drops a cargo from the ship (delete)
 * @param $item Itemobject
 * @param &$db DB Instanz
 */
function dropCargo($item, &$db) {
    //delete from db
}

/**
 * Get the total weigth of cargo aboard
 * @param $player Playerobject
 * @param &$db DB Instanz
 */
function weightCargo($player, &$db) {
    $result = $db->execute("SELECT SUM(`weight`) FROM <ezrpg>cargo WHERE uid=`".$player->id."`");
}
?>