<?php

require_once '../lib/class.imagebar.php';


class Lib_Class_ImageBarTest extends PHPUnit_Framework_TestCase{

  public function setUp(){
    $this->bar = new ImageBar();
  }

  public function test_setWidthgetWidth(){
    $this->assertObjectHasAttribute('bar_w',$this->bar);
    $this->bar->setWidth(150);
    $this->assertEquals(150,$this->bar->getWidth());
  }

  public function test_setHeightgetHeight(){
    $this->assertObjectHasAttribute('bar_h',$this->bar);
    $this->bar->setHeight(15);
    $this->assertEquals(15,$this->bar->getHeight());
  }
  
  public function test_makeBar(){
    $this->bar->makeBar();
    $this->assertObjectHasAttribute('bar',$this->bar);
    $this->bar->setFillColor('blue'); 
    $this->bar->setData(100, 50);
    $this->bar->setTitle('TST: ');
    $this->bar->setFontSize(10);
    $this->bar->setFileType('GIF');
    $this->bar->generateBar(true);
    $this->bar->makeBar();
    $this->bar->setFileType('PNG');
    $this->bar->generateBar(true);
    $this->bar->makeBar();
    $this->bar->setFileType('JPG');
    $this->bar->generateBar(true);
  }

}

?>