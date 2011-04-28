<?php

require_once '../lib/func.calc.php';

class Lib_Func_CalcTest extends PHPUnit_Framework_TestCase{

    public function test_calculateCityShieldRegen() {
	$this->assertEquals(1, calculateCityShieldRegen(0));
	$this->assertEquals(1, calculateCityShieldRegen(200));
	$this->assertEquals(1, calculateCityShieldRegen(800));
	$this->assertEquals(2, calculateCityShieldRegen(1000));
	$this->assertEquals(2, calculateCityShieldRegen(1200));
	$this->assertEquals(2, calculateCityShieldRegen(1800));
    }
    
    public function test_calculateShipShieldRegen() {
	$this->assertEquals(1, calculateShipShieldRegen(0));
	$this->assertEquals(2, calculateShipShieldRegen(1));
	$this->assertEquals(3, calculateShipShieldRegen(2));
    }

    public function test_calculateMineResult() {
	$this->assertEquals(1/6, calculateMineResult(1));
	$this->assertEquals(1,   calculateMineResult(6));
	$this->assertEquals(2,   calculateMineResult(12));
	$this->assertEquals(1/3, calculateMineResult(2));
    }
    
    public function test_calculateEnergyBoost() {
	$this->assertEquals(1, calculateEnergyBoost(0));
	$this->assertEquals(2, calculateEnergyBoost(1));
	$this->assertEquals(3, calculateEnergyBoost(2));
    }
    
    public function test_calculatePowerNeeds() {
	$exp = array(
	    "iron"      => 2,
	    "oxygen"    => 3,
	    "aluminium" => 2,
	    );
	$this->assertEquals($exp, calculatePowerNeeds(10));

	$exp = array(
	    "iron"      => 4,
	    "oxygen"    => 6,
	    "aluminium" => 4,
	    );
	$this->assertEquals($exp, calculatePowerNeeds(13));
    }
    
    public function test_calculateCityPowerNeeds() {
	$this->assertEquals(10, calculateCityPowerNeeds(100));
	$this->assertEquals(10, calculateCityPowerNeeds(80));
	$this->assertEquals(20, calculateCityPowerNeeds(101));
    }
    
    public function test_calculateMineLevel() {
	$this->assertEquals(1, calculateMineLevel(10,MINE_OXYGEN));
	$this->assertEquals(2, calculateMineLevel(100,MINE_OXYGEN));
	$this->assertEquals(2, calculateMineLevel(150,MINE_OXYGEN));
	$this->assertEquals(1, calculateMineLevel(10,MINE_IRON));
	$this->assertEquals(2, calculateMineLevel(190,MINE_IRON));
	$this->assertEquals(3, calculateMineLevel(200,MINE_IRON));
	$this->assertEquals(1, calculateMineLevel(10,MINE_ALUMINIUM));
	$this->assertEquals(1, calculateMineLevel(100,MINE_ALUMINIUM));
	$this->assertEquals(2, calculateMineLevel(125,MINE_ALUMINIUM));
	$this->assertEquals(1, calculateMineLevel(10,MINE_TITANIUM));
	$this->assertEquals(1, calculateMineLevel(100,MINE_TITANIUM));
	$this->assertEquals(2, calculateMineLevel(334,MINE_TITANIUM));
    }
}

?>
