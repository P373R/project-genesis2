<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_About
  lists the credits
*/
class Module_About extends Base_Module
{
    /*
      Function: start
      Renders credits
    */
    public function start()
    {
	if($_GET['page'] == 'technologie') 
	{
	    $res = $this->db->execute("SELECT * FROM `<ezrpg>ship_parts` ORDER BY `type` ASC");
	    $list = $this->db->fetchAll($res, true);
	    foreach($list as $item){
		$item['depend'] = itemInfo(unserialize($item['depend']));
		$item['properties'] = itemInfo(unserialize($item['properties']));
		$this->tpl->append('items',$item);
	    }
	    $this->tpl->display('techtree.tpl');
	    exit;
	}
        $this->tpl->display('credits.tpl');
    }

    
}
?>