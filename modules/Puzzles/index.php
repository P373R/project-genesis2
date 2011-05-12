<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Puzzles Module
 */
class Module_Puzzles extends Base_Module
{
    /**
     * Renders the landing page for the puzzles
    */
    public function start()
    {
        $this->tpl->assign('SUBMENU','ship');
        $this->tpl->display('coming_soon.tpl');
    }
}
?>