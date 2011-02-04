<?
define('IN_EZRPG', true);

//require_once('init.php');

require_once 'config.php';

//Show errors?
(SHOW_ERRORS == 0)?error_reporting(0):error_reporting(E_ALL);

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


$db->execute("UPDATE `players` SET `energy`=`energy`+1, `hp`=`hp`+2");

$tk = file_get_contents('tickcount');
$tk++;
file_put_contents('tickcount',$tk);
$tk = time();
file_put_contents('ticktime',$tk);

?>