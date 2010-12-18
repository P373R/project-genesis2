<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_Inventory
  lists the Inventory you have on your ship
*/
class Module_Inventory extends Base_Module
{

    /*
      Function: start
      Renders inventory
    */
    public function start()
    {
      requireLogin(); // Nur wenn eingelogt anzeigen

    }

    
}
?>