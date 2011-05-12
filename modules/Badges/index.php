<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Badges Module
 */
class Module_Badges extends Base_Module
{
    /**
     * Renders the landing page for badges
    */
    public function start()
    {
        $this->tpl->assign('SUBMENU','ship');
        $this->tpl->display('comming_soon.tpl');
    }
}
?>