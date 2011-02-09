<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Module_Missions
 *
 * Show available Missions
 */
class Module_Missions extends Base_Module
{
    /**
     * Displays the missions.tpl template. That's all!
     */
    public function start()
    {
	//Require the user to be logged in
        requireLogin();

        $this->tpl->display('coming_soon.tpl');
	
    }
}
?>