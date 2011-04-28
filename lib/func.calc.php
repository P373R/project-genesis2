<?php
/**
 * This file contains the functions to calculate
 */

/**
 * Calculate the shield regeneration for a city on a tick base
 * 
 * 1 + intval($inhabs/1000)
 * 
 * @param int $inhabs Inhabitants of the city
 */
function calculateCityShieldRegen($inhabs) {
    return 1 + intval($inhabs/1000);
}

/**
 * Calculate the shield regeneration for a ship on a tick base
 * 
 * 1 + $energie
 * 
 * @param int $energie
 */
function calculateShipShieldRegen($energie) {
    return 1 + $energie;
}

/**
 * Calculate mining result on a tick base
 * 
 * $mineLevel / 6
 * 
 * @param int $mineLevel
 */
function calculateMineResult($mineLevel) {
    return $mineLevel/6;
}

/**
 * Calculate energy on a tick base
 * 
 * 1 + $level
 * 
 * @param int $level Player level
 */
function calculateEnergyBoost($level) {
    return 1 + $level;
}

/**
 * Calculate needed resouces for power genertation
 *
 * 2 iron + 3 oxygen + 2 aluminium = 10 power
 * 
 * @param int $power Power needed
 */
function calculatePowerNeeds($power) {
    $round = ceil($power/10);
    $round = intval($round);
    $result['iron']      = 2 * $round;
    $result['oxygen']    = 3 * $round;
    $result['aluminium'] = 2 * $round;   
    return $result;
}

/**
 * Calculate power needs of city
 * 
 * 10 power / 100 habitants
 * 
 * @param int $habits inhabitants
 */
function calculateCityPowerNeeds($habits){
    $round = ceil($habits / 100);
    $round = intval($round * 10);
    return $round;
    
}

/**
 * Calculate mining level
 * 
 * 1+workers/100*mineValue
 * 
 * @param int $worker
 * @param flaot $mineValue
 */
function calculateMineLevel($worker,$mineValue) {
    return 1 + floor($worker / 100 * $mineValue);
}

/**
 * Minevalues
 */
define('MINE_OXYGEN',1);
define('MINE_WATER',1);
define('MINE_IRON',1);
define('MINE_ALUMINIUM',0.8);
define('MINE_TITANIUM',0.3);

?>