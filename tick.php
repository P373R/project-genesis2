<?
define('IN_EZRPG', true);

//require_once('init.php');

require_once 'config.php';

//Show errors?
error_reporting(E_ALL);

//Constants
define('CUR_DIR', realpath(dirname(__FILE__)));
define('MOD_DIR', CUR_DIR . '/modules');
define('ADMIN_DIR', CUR_DIR . '/admin');
define('LIB_DIR', CUR_DIR . '/lib');
define('EXT_DIR', LIB_DIR . '/ext');
define('HOOKS_DIR', CUR_DIR . '/hooks');

require_once(CUR_DIR . '/lib.php');

try
{
    $db = DbFactory::factory($config_driver, $config_server, $config_username, $config_password, $config_dbname);
}
catch (DbException $e)
{
    $e->__toString();
}


$query = $db->execute("SELECT * FROM `<ezrpg>players` WHERE `id` > 1000");
 
$result = $db->fetchAll($query);


foreach($result as $player) {
    $player->ship = $db->fetchRow('SELECT * FROM `<ezrpg>ships` WHERE `id`=?', array($player->id));
    $player->city = $db->fetchRow('SELECT * FROM map_cities WHERE `owner`=?',array($player->id));
    // Formular for shield regen: 1 + city inhabs/1000
    $update_city['shield'] = $player->city->shield + 1 + intval($player->city->inhabitants/1000);
    if($update_city['shield'] > $player->city->max_shield) $update_city['shield'] = $player->city->max_shield;
    $update_player['energy'] = $player->energy+1;
    if($update_player['energy'] > $player->max_energy) $update_player['energy'] = $player->max_energy;
      
    $update_city['water']     = $player->city->water     + ($player->city->mine_water     / 6);
    $update_city['oxygen']    = $player->city->oxygen    + ($player->city->mine_oxygen    / 6);
    $update_city['iron']      = $player->city->iron      + ($player->city->mine_iron      / 6);
    $update_city['titan']     = $player->city->titan     + ($player->city->mine_titan     / 6);
    $update_city['aluminium'] = $player->city->aluminium + ($player->city->mine_aluminium / 6);

    $db->update('<ezrpg>map_cities', $update_city,   array("owner" => $player->id));
    $db->update('<ezrpg>players',   $update_player, array("id" => $player->id));

}


$tk = file_get_contents('tickcount');
$tk++;
file_put_contents('tickcount',$tk);
$tk = time();
file_put_contents('ticktime',$tk);

?>