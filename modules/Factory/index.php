<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_Factory
  The Building site for your machines
*/
class Module_Factory extends Base_Module
{
    /*
      Function: start
      switches between modes
    */
    public function start()
    {
      requireLogin(); // Nur wenn der Spieler eingelogt ist
      $mode = ( (isset($_GET['mode']) && ctype_alnum($_GET['mode'])) ? $_GET['mode'] : 'default' );
      switch($mode){
	case 'build':
	break;
	
	default:
	  $this->render_list();
	break;
      }
    }

    /*
      Function render_list
      Generiert die Liste der verfügbaren Maschinen
    */
    public function  render_list()
    {
      $this->tpl->display('factory.tpl');
    }
}
?>