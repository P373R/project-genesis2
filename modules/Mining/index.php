<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Mining Module
 */
class Module_Mining extends Base_Module
{

    /**
     * Renders the mines
    */
    public function start()
    {
        //Require login
        requireLogin();
        $this->tpl->assign('feature','Mining');
        $this->tpl->assign('release','1');
        $this->tpl->assign('SUBMENU','city');
	$this->tpl->display('coming_soon.tpl');
    }

    
}
?>