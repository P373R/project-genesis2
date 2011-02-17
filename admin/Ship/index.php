<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_About
  lists the ship_parts table and makes it editable
*/
class Admin_Ship extends Base_Module
{
    /*
      Function: start
      Renders edit page
    */
    public function start()
    {	$query = "INSERT INTO `<ezrpg>ship_parts` (`id`, `type`, `name`, `desc`, `properties`, `depend`) VALUES ";
	if(isset($_POST['id'])) {
	    for($i = 0; $i<count($_POST['id']); $i++) {
		if($_POST['id'][$i] != '') $query.="('".$_POST['id'][$i]."','".$_POST['type'][$i]."','".$_POST['name'][$i]."','".$_POST['desc'][$i]."','".$_POST['properties'][$i]."','".$_POST['depend'][$i]."'),";
	    }
	    $query = substr($query,0,-1);
	    $this->db->execute("TRUNCATE TABLE `<ezrpg>ship_parts`");
	    $this->db->execute($query);
	}
	
	
	$list = $this->db->fetchAll($this->db->execute("SELECT * FROM `ship_parts` ORDER BY `type`,`id` ASC"));
	$this->tpl->assign('list',$list);
        $this->tpl->display('admin/ship.tpl');
    }

    
}
?>