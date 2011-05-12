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
	requireLogin(); // ONly for people loged in
        $this->tpl->assign('SUBMENU','ship'); // we are in the Ship sub menu
	
	switch ($_GET['action']) {
	    case 'entities':
		// return the entities around the requested area
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
	
	$rows = 3;
	$this->tpl->assign('rows',$rows);
	$cols = 3;
	$this->tpl->assign('cols',$cols);

	$maxrows = 23;
	$this->tpl->assign('maxrows', $maxrows);
	$maxcols = 74;
	$this->tpl->assign('maxcols', $maxcols);
	$width = 120;
	$this->tpl->assign('width', $width);
	$height = 120;
	$this->tpl->assign('height', $height);
		
	for( $row = 1; $row < $rows + 2; $row++ ) {
	    for( $col = 1; $col < $cols + 2; $col++ ) {
		$id = sprintf( "img%02d_%02d", $row, $col );
		$list.="<img src=\"http://genesis/static/images/loading.gif\" style=\"position:absolute;cursor:hand;\" id=\"".$row."_".$col."\" ondblclick=\"worldClick('$id');\"/>\n";
	    }
	}


	
	$this->tpl->assign('world',$list);
	$this->tpl->display('world/site.tpl');
    }
}
?>