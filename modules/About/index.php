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
		$item['depend'] = itemInfo(array('propulsion' => $item['dep_propulsion'],
						 'gearbox'    => $item['dep_gearbox'],
						 'energy'     => $item['dep_energy'],
						 'engine'     => $item['dep_engine'],
						 'navigation' => $item['dep_navigation'],
						 'sonar'      => $item['dep_sonar']),
						 false,
						 true,
						 false);
		$item['properties'] = itemInfo(array('shield'   => $item['shield'],
						     'speed'    => $item['speed'],
						     'accuracy' => $item['accuracy'],
						     'energy'   => $item['energy']),
						     false,
						     false,
						     false);
		$this->tpl->append('items',$item);
	    }
	    $this->tpl->display('techtree.tpl');
	    exit;
	}
        $this->tpl->display('credits.tpl');
    }

    
}
?>