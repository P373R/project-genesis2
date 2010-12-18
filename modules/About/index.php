<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_About
  lists the credits
*/
class Module_About extends Base_Module
{
    /*
      Function: start
      Renders credits
    */
    public function start()
    {
        $this->tpl->display('home.tpl');
    }

    
}
?>