<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_Buildings
  lists the posible buildings you can build on the current field
*/
class Module_Buildings extends Base_Module
{

    /*
      Function: start
      Renders  either index.tpl or home.tpl with smarty, depending on if the user is logged in.
    */
    public function start()
    {
      requireLogin(); // Nur wenn eingelogt anzeigen
      $this->tpl->display('buildings.tpl');
    }

    
}
?>