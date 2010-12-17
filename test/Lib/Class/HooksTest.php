<?php

require_once '../lib/class.hooks.php';


class Lib_Class_HooksTest extends PHPUnit_Framework_TestCase{

  public function setUp(){
      $tmp = 1;
    $this->hook = new Hooks($tmp,$tmp,$tmp);
  }

  public function test_constructor(){
    $this->assertObjectHasAttribute('db',$this->hook);
    $this->assertObjectHasAttribute('tpl',$this->hook);
    $this->assertObjectHasAttribute('player',$this->hook);
  }

  public function test_Hook(){
    $this->hook->add_hook('test','go');
    $this->assertObjectHasAttribute('hooks',$this->hook);
    $this->hook->run_hooks('test');
    
  }
  
}

?>