<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Stock Excange Module
 */
class Module_Stock extends Base_Module
{
    /**
     * Renders the landing page for the stock excange
    */
    public function start()
    {
        $this->tpl->display('coming_soon.tpl');
    }
}
?>