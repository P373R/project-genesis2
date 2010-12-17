<?php
// Testsuite
define('IN_EZRPG',1);
define('TEST_ENVIRONMENT', TRUE);

require_once '../config.php';
require_once '../lib/const.errors.php';



define('LIB_DIR','../lib');


require_once 'PHPUnit/Autoload.php';

require_once 'Lib/Func/TextTest.php';
require_once 'Lib/Func/RandTest.php';
require_once 'Lib/Func/ValidateTest.php';
require_once 'Lib/Func/PlayerTest.php';
require_once 'Lib/Func/LogTest.php';
require_once 'Lib/Func/MailTest.php';

require_once 'Lib/Class/DbFactoryTest.php';
require_once 'Lib/Class/HooksTest.php';
require_once 'Lib/Class/ImageBarTest.php';


$GLOBALS['db_settings'] = array(
  'driver'=>'mysql',
  'server'=>'localhost',
  'username'=>'root',
  'password'=>'root',
  'db_name'=>'ezrpg'
);


class GenesisTest
{
    public static function suite()
    {
        $suite = new PHPUnit_Framework_TestSuite('Genesis2');
 
        // Funktionen testen
	$suite->addTestSuite('Lib_Func_TextTest');
        $suite->addTestSuite('Lib_Func_RandTest');
        $suite->addTestSuite('Lib_Func_ValidateTest');
        $suite->addTestSuite('Lib_Func_PlayerTest');
        $suite->addTestSuite('Lib_Func_LogTest');
        $suite->addTestSuite('Lib_Func_MailTest');
        // Klassen testen
	$suite->addTestSuite('Lib_Class_DbFactoryTest');
	$suite->addTestSuite('Lib_Class_HooksTest');
	$suite->addTestSuite('Lib_Class_ImageBarTest');
        // ...
 
        return $suite;
    }
}

?>