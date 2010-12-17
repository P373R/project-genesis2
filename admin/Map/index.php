<?php
/**
 * Map page for the admin panel. You can see the whole map and the resource
 *
 * @category   AdminModules
 * @author     Bastian Neumann <neumann.bastian@gmail.com>
 *
 * @license    GPL3.0
 * @link       http://dev.project-genesis2.de 
 *
 * @package    Modules
 * @subpackage Admin
 */
defined('IN_EZRPG') or exit;

class Admin_Map extends Base_Module
{
    /**
      Displays Game Map
    */
    public function start()
    {

	$x = 5;
	$y = 1;

	for($i=0; $i<12; $i++){
	  $query = $this->db->execute("SELECT * FROM `map` WHERE `y`=($y-1+$i)");
	  $map[$i] = $this->db->fetchAll($query);
	}

	$field = $this->db->fetchRow("SELECT * FROM `map` WHERE `x`='$x' AND `y`='$y'"); 
	$field->name = id2name('field',$field->type);
	$field->res  = id2name('items',$field->res);
	if($field->owner != 0)	$field->owner_db = $this->db->fetchRow("SELECT * FROM `players` WHERE `id`='".$field->owner."'");
	else $field->owner_db->username = "nobody";

	$this->tpl->assign('fieldinfo', $field);
	$this->tpl->assign('map', $map);
	$this->tpl->assign('player', $this->player);
        $this->tpl->display('admin/map.tpl');
    }
}
?>