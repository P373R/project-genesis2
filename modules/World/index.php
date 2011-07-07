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
		$this->entities(true);
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
	// Get the entities around the position from the db
	$x = $this->player->ship->x;
	$y = $this->player->ship->y;
	$html = $this->renderMap($x,$y);

	$this->tpl->assign('worldcode',$html);
	$this->tpl->assign('entities', json_encode($this->entities()));
	//$pos = $this->db->fetchRow("SELECT * FROM ` world` WHERE");
	$this->tpl->display('world/site.tpl');
    }
    
    /**
     * rendering the world map html code
     */
    public function renderMap($x,$y)
    {
	// cast in grid
	$load_x = ($x - $x % WORLD_IMG_X) / WORLD_IMG_X; 
	$load_y = ($y - $y % WORLD_IMG_Y) / WORLD_IMG_Y; 
	if($load_x < ceil(WORLD_MAP_X/2)) $load_x = 3;
	if($load_y < ceil(WORLD_MAP_Y/2)) $load_y = 3;

	  $worldcode = '';
	for($count_y = 0; $count_y < (WORLD_MAP_Y); $count_y++) {
	  $worldcode .= '<p>';
	  for($count_x = 0; $count_x < (WORLD_MAP_X); $count_x++) {
	    	$worldcode .= '<img ';
		if($count_x + $count_y == 0) $worldcode .= 'id="worldLeftCorner" ';
		$worldcode .= 'class = "worldTile" src="/static/images/map2/'.($load_x-floor(WORLD_MAP_X/2)+$count_x).'-'.($load_y-floor(WORLD_MAP_Y/2)+$count_y).'.gif" width="'.WORLD_IMG_X.'" height="'.WORLD_IMG_Y.'"/>';
	  }
	  $worldcode .= '</p>';
	}
	return $worldcode;
      
    }

      
    /**
     * return a JSON object of all the entities around the current point of view.
     */
    private function entities($json = false) 
    {
	$offset_x = $this->player->ship->x % WORLD_IMG_X;
	$offset_y = $this->player->ship->y % WORLD_IMG_Y;

	


	$response = array("ship" => array("x" => $offset_x, 
					  "y" => $offset_y));
 	if($json) {
	  echo json_encode($response);
	} else {
	  return $response;
	}
    }
}
?>