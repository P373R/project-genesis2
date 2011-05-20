<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
  Show the world
  
  This module will show the world the player is acting in.
*/
class Module_World extends Base_Module
{

    /**
     * Module Entry point
     *
     * Here it will be decided what function of the mdule is requested    
    */
    public function start()
    {
	requireLogin(); // Only for people loged in
        $this->tpl->assign('SUBMENU','ship'); // we are in the Ship sub menu
	
	switch ($_GET['action']) {
	    case 'entities':
		// return the entities around the requested area
		$this->entities();
		break;
	    case 'move':
		// move the ship to this points
		break;
	    default:
		$this->renderWorld();   
	}
    }

    /**
     * Render the world map
     * All HTML needed for the page
     */
    private function renderWorld() 
    {
	$this->tpl->display('world/site.tpl');
    }
    
    /**
     * return a JSON object of all the entities around the current point of view.
     */
    private function entities() 
    {
	// search in a 500 pixel area around the map
	$smallx = $_GET['x']-250;
	$bigx = $smallx + 500;
	$smally = $_GET['y']-250;
	$bigy = $smally + 500;
	
	$response['meta'] = array('token'=>$_GET['token']);
	$response['entities'] = $this->db->fetchAll($this->db->execute("SELECT * FROM `<ezrpg>map_entities` WHERE '$smallx' < `x` < '$bigx' AND '$smally' < `y` < '$bigy'"));
	$response['cities'] = $this->db->fetchAll($this->db->execute("SELECT `x`,`y`,`name`,`owner` FROM `<ezrpg>map_cities` WHERE `x` > $smallx AND `x` < $bigx AND `y` > $smally AND `y` < $bigy"));
 	echo json_encode($response);
    }
}
?>