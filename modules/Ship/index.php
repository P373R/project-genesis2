<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Module_Ship
 * Shows the details of your ship
 */
class Module_Ship extends Base_Module
{
    /**
     * Renders the Ship overview
     */
    public function start()
    {
        requireLogin(); // Only when loged in
        $this->tpl->assign('SUBMENU','ship'); // we are in the Ship sub menu
        
        $this->tpl->display('ship/ship.tpl');
        
    }

}
?>