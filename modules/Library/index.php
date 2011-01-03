<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Class: Module_Library
 * Knowledge Base for the ship
 */
class Module_Library extends Base_Module
{

    /**
     * Function: start
     * shows the list of books or direts to the book
     */
    public function start()
    {
      requireLogin(); // Nur wenn eingelogt anzeigen
      if(isset($_GET['book'])) $this->show($_GET['book']);
      else {
          $this->tpl->assign('library',$this->db->execute("SELECT * FROM `<ezrpg>library` WHERE `uid`='".$this->player->id."'"));
          $this->tpl->display('library.tpl');
      }
    }

    /**
     * Function show
     * shows content of book
     */
    private function show($bookId)
    {
        include "modules/Library/books/$bookId.php";
        $this->tpl->assign('book',$book);
    }


}
?>