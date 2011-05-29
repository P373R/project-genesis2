<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Module_Buildings
 * list all the possible buildings for your city or improve them
*/
class Module_Buildings extends Base_Module
{

    /**
     * Renders the building list
    */
    public function start()
    {
        //Require login
        requireLogin();
        $this->tpl->assign('feature','Buildings');
        $this->tpl->assign('release','1');
        $this->tpl->assign('SUBMENU','city');
	$this->tpl->display('coming_soon.tpl');
    }

    
}
?>