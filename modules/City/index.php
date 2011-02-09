<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_City
  This is a very simple module, designed to simply display a static template page.
*/
class Module_City extends Base_Module
{
    /*
      Function: start
      Displays the city.tpl template. That's all!
    */
    public function start()
    {
	if(isset($_GET['act']) && $_GET['act'] == "go_atlantis") {
	  $this->db->execute("UPDATE `players` SET `x`=".ATLANTIS_X.", `y`=".ATLANTIS_Y.", `energy`=`energy`-1 WHERE `id`='".$this->player->id."'");
	  header('Location: index.php?mod=City');
	}

	//Require the user to be logged in
        requireLogin();
	if($this->player->x != ATLANTIS_X || $this->player->y != ATLANTIS_Y){ // Wir sind nicht in Atlantis
	  $this->tpl->display('city/city_na.tpl');
	} else { // wir sind in Atlantis
	  $this->tpl->display('city/city.tpl');
	}
    }
}
?>