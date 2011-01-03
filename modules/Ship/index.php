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

     // $db->execute("SELECT `weapon1`,`weapon2`,`weapon3`,`weapon4` FROM `ships` WHERE `id`='".$player->id."'");

      $this->tpl->assign('weapons', $this->db->fetchAll($this->db->execute("SELECT `weapon1`,`weapon2`,`weapon3`,`weapon4` FROM `ships` WHERE `id`='".$this->player->id."'")));
      $this->tpl->assign('cargo', $this->db->fetchAll($this->db->execute("SELECT * FROM `cargo` WHERE `id`='".$this->player->id."'")));

      $this->tpl->display('ship.tpl');
    }
}
?>