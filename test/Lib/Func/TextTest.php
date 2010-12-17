<?php

require_once '../lib/func.text.php';

class Lib_Func_TextTest extends PHPUnit_Framework_TestCase{
  
  public function test_shorten(){
     $this->assertEquals('blablabla long...',shorten('blablabla long string here',15));
     $this->assertEquals('blablabla',shorten('blablabla',15));
  }
  
  public  function test_id2name(){
     global $id2names;
     $id2names = array('field'=>array('test'=>'ok'));
     $this->assertEquals('ok',id2name('field','test'));
  }
}

?>
