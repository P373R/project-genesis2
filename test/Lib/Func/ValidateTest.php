<?php

require_once '../lib/func.validate.php';

class Lib_Func_ValidateTest extends PHPUnit_Framework_TestCase{

  public function test_isUsername(){
    $this->assertTrue(isUsername('ValidUser'),"Valid Username");
    $this->assertFalse(isUsername('InValidUser!'), "Invalid Username - Special Chars");
    $this->assertFalse(isUsername('in'), "Invalid Username - To short");

  }

  public function test_isPassword(){
    $this->assertTrue(isPassword('ValidPassword $§%'),"Valid Password");
    $this->assertFalse(isPassword('in'), "Invalid Password");
  }

  public function test_isEmail(){
    $this->assertTrue(isEmail('this.is_an_email_123@gmail.com'),"Valid Email");
    $this->assertFalse(isEmail('No.Email@all'), "Invalid Email - no Domain extension");
    $this->assertFalse(isEmail('No.Email.at.all'), "Invalid Email - no @");
    $this->assertFalse(isEmail('email_"!§@gmail.com'), "Invalid Email - Special Chars");
    $this->assertFalse(isEmail('em'), "Invalid Email - To short");

  }
}

?>
