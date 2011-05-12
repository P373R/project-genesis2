<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Community Module
 */
class Module_Community extends Base_Module
{
    /**
     * Renders the overview of community features
    */
    public function start()
    {
        $this->tpl->display('coming_soon.tpl');
    }
}
?>