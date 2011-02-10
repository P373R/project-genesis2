<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Module_Missions
 *
 * Show available Missions
 */
class Module_Missions extends Base_Module
{
    /**
     * Displays the missions.tpl template. That's all!
     */
    public function start()
    {
	//Require the user to be logged in
        requireLogin();

        if(isset($_GET['domission'])) {

            $mission =  $this->db->fetchRow("SELECT * FROM `<ezrpg>missions` WHERE `id`=?",array($_GET['domission']));
            $this->tpl->assign('mission',$mission);
            $this->tpl->display('missions/mission.tpl');

        } else {

            $missions = $this->db->fetchAll($this->db->execute("SELECT * FROM `<ezrpg>missions`"));
            $this->tpl->assign('missions',$missions);
            $this->tpl->display('missions/list.tpl');

        }
	
    }
}
?>