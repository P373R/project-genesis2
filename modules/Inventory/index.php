<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_Inventory
  lists the Inventory you can access in the city
*/
class Module_Inventory extends Base_Module
{

    /*
      Function: start
      Renders  either index.tpl or home.tpl with smarty, depending on if the user is logged in.
    */
    public function start()
    {
      requireLogin(); // Nur wenn eingelogt anzeigen
      if($this->player->x != ATLANTIS_X || $this->player->y != ATLANTIS_Y) header('Location: index.php?mod=City&msg=' . urlencode("Du kannst auf dein Inventar nur Zugreifen, wenn du in Atlantis bist"));
      $this->tpl->display('inventory.tpl');
    }

    
}
?>