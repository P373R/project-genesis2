<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
  The base class for modules. Every module must extend this class.

  @package Modules
*/
abstract class Base_Module
{
    /**
      Contains the database object.
    */
    protected $db;
    
    /**
      The smarty template object.
    */
    protected $tpl;
    
    /**
      The currently logged in player. Value is 0 if no user is logged in.
    */
    protected $player;
    
    /**
      The constructor the every module. Saves the database, template and player variables as class variables.
      
      Parameters:
      The parameters are passed by reference so that all modules and other code use the same objects.
      
      @param Db_mysql $db     An instance of the database class.
      @param Smarty   $tpl    A smarty object.
      @param object   $player A player result set from the database, or 0 if not logged in.
    */
    public function __construct(&$db, &$tpl, &$player = 0)
    {
        $this->db = $db;
        $this->tpl = $tpl;
        $this->player = $player;
    }
}
?>