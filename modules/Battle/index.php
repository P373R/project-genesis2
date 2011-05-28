<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Battle Module
 */
class Module_Battle extends Base_Module
{
    /**
     * Renders the landing page for battles
    */
    public function start()
    {
        //Require login
        requireLogin();
        
        $this->tpl->assign('feature','Battles'); 
	$this->tpl->assign('SUBMENU','ship');
        $this->tpl->display('coming_soon.tpl');
    }
}
?>