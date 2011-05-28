<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Badges Module
 */
class Module_Badges extends Base_Module
{
    /**
     * Renders the landing page for badges
    */
    public function start()
    {
        //Require login
        requireLogin();
 
	$badges = $this->db->fetchAll($this->db->execute("SELECT * FROM `<ezrpg>player_badges` LEFT JOIN `<ezrpg>badges` ON `bid` =  `<ezrpg>badges`.`id` WHERE `pid` = ?",
							 array($this->player->id)));
	$this->tpl->assign('badges', $badges);
        $this->tpl->assign('feature','Badges');
	$this->tpl->assign('SUBMENU','ship');
        $this->tpl->display('ship/badges.tpl');
    }
}
?>