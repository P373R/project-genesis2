<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_Ship
  Shows the details of your ship
*/
class Module_Ship extends Base_Module
{
    /*
      Function: start
      Renders  either index.tpl or home.tpl with smarty, depending on if the user is logged in.
    */
    public function start()
    {
      requireLogin(); // Nur wenn eingelogt
      $this->tpl->display('ship.tpl');
    }
}
?>