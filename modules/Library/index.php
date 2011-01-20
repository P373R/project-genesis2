<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Knowledge Base for the ship
 */
class Module_Library extends Base_Module
{

    /**
     * Shows the list of books or directs to the book
     */
    public function start()
    {
      requireLogin(); // Nur wenn eingelogt anzeigen
      if (isset($_GET['book'])) $this->show($_GET['book'],$_GET['chapter']);
      else {
          $this->tpl->assign('books',$this->db->fetchAll($this->db->execute("SELECT name,id FROM `<ezrpg>library`")));
          $this->tpl->display('book_library.tpl');
      }
    }

    /**
     * Shows content of book
     */
    private function show($bookId,$chapterId = 0)
    {
        $book = $this->db->fetchRow("SELECT * FROM `<ezrpg>library` WHERE `id`='".$bookId."'");
        if (is_object($book)) {
            $book->chapters = explode(" --- ",$book->book);
            $book->chapter  = $book->chapters[$chapterId];
            $book->chapter  = str_replace("\n","<br />",$book->chapter);
            $book->chapterId = $chapterId;
            $book->chapterCount = count($book->chapters)-1;
            $this->tpl->assign('book',$book);
            $this->tpl->display('book.tpl');
        } else {
            $this->tpl->display('book_not_found.tpl');
        }
    }


}
?>