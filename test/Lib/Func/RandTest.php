<?php

require_once '../lib/func.rand.php';

class Lib_Func_RandTest extends PHPUnit_Framework_TestCase{
  
  public function test_createKey(){
    $key1 = createKey(5);
    $key2 = createKey(5);
    $key3 = createKey(5,1);
    $this->assertStringMatchesFormat('%c%c%c%c%c',$key1);
    $this->assertStringMatchesFormat('%c%c%c%c%c',$key2);
    $this->assertStringMatchesFormat('%c%c%c%c%c',$key3);
    $this->assertNotSame($key1,$key2);
    $this->assertNotSame($key1,$key3);
    $this->assertNotSame($key2,$key3);
  }

  public function test_randColor(){
    $col1 = randColor();
    $col2 = randColor();

//    $this->assertNotSame($col1,$col2); // ist eigentlich nciht wichtig und failed bei wiederholtem testen öfters
    $this->assertLessThanOrEqual(255,$col1,"Bigger than 255");
    $this->assertLessThanOrEqual(255,$col2,"Bigger than 255");
  }
}

?>
