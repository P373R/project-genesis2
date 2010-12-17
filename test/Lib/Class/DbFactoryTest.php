<?php

require_once '../lib/class.dbfactory.php';
require_once '../lib/exception.db.php';


class Lib_Class_DbFactoryTest extends PHPUnit_Framework_TestCase{

  public function test_DbFactory(){
      $db_settings = $GLOBALS['db_settings'];

      $this->setExpectedException('DbException');
      $db1 = DbFactory::factory('wrong_driver',$db_settings['server'],$db_settings['username'],$db_settings['password'],$db_settings['db_name']);
      $this->assertFalse($db2->isConnected, 'DB connection where none should be 2');

      $db2 = DbFactory::factory($db_settings['driver'],$db_settings['server'],$db_settings['username'],$db_settings['password'],$db_settings['db_name']);
      $this->assertTrue($db1->isConnected,'No DB Connection');

      $this->setExpectedException('PHPUnit_Framework_Error');
      $db3 = DbFactory::factory($db_settings['driver'],$db_settings['server'],$db_settings['username'],'wrong_password',$db_settings['db_name']);
      $this->assertFalse($db2->isConnected, 'DB connection where none should be 1');

  }

  public function  test_Execute(){
      $db_settings = $GLOBALS['db_settings'];
      $db = DbFactory::factory($db_settings['driver'],$db_settings['server'],$db_settings['username'],$db_settings['password'],$db_settings['db_name']);
      $query = $db->execute("SHOW TABLES");
      $result = $db->fetch($query);
      $this->assertStringMatchesFormat('%s',$result->Tables_in_ezrpg);
      
      $result = $db->fetchArray($query);
      $this->assertArrayHasKey('Tables_in_ezrpg',$result);

      $result = $db->fetchAll($query);
      $this->assertInternalType('array',$result);

      $result = $db->fetchAll($query,true);
      $this->assertInternalType('array',$result);      

      $result = $db->fetchRow("SHOW TABLES");
      $this->assertStringMatchesFormat('%s',$result->Tables_in_ezrpg);

      $this->assertType('int',$db->numRows($query));

      $query = $db->execute('SELECT username FROM <ezrpg>players WHERE id=?', array(1));
  }

}

?>