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

        if(isBusy($this->player)) {
            $this->tpl->assign('reload',$this->player->ship->busy-time());
            $this->tpl->display('busy.tpl');
        } else {
        if(isset($_GET['domission'])) {
            global $ezTranslateLanguage;
            $mission =  $this->db->fetchRow("SELECT * FROM `<ezrpg>missions` WHERE `id`=?",array($_GET['domission']));

            if(isset($_GET['accept'])) {

                $errno = 0;
                $error = array();
                if($this->player->gwp < $mission->min_gwp) {
                    $errno++;
                    $error[] = "Your GWP are to small you need <span>$mission->min_gwp</span> and you have ".$this->player->gwp."</span>";
                }
                if($this->player->energy < $mission->energy) {
                    $errno++;
                    $error[] = "Your have not enough energy left you need <span>$mission->energy</span> and you have <span>".$this->player->energy."</span>";
                }
                if($this->player->hp < $mission->shield) {
                    $errno++;
                    $error[] = "Your shield is to weak you need <span>$mission->shield</span> and you have <span>".$this->player->hp."</span>";
                }
                if($this->player->dexterity < $mission->accuracy) {
                    $errno++;
                    $error[] = "Your accuracy is to small you need <span>$mission->accuracy</span> and you have <span>".$this->player->dexterity."</span>";
                }

                if($errno == 0) {
                    $params = array($this->player->energy-$mission->energy,
                                    $this->player->hp-$mission->shield,
                                    $this->player->gwp+$mission->gwp,
                                    $this->player->money+$mission->gold,
                                    $this->player->exp+$mission->exp,
                                    $this->player->id);
                    $this->db->execute("UPDATE `<ezrpg>players` SET `energy`=?, `hp`=?, `gwp`=?, `money`=?, `exp`=? WHERE `id`=?",$params);
		    // if mission should be done only once
		    if($mission->redo != 1)
		    {
			$arr = unserialize($this->player->ship->missions);
			$arr[] = $_GET['domission'];
			$this->db->execute("UPDATE `<ezrpg>ships` SET `missions`=? WHERE `id`=?",array(serialize($arr),$this->player->id));
		    }
                    // mark ship as busy
                    setBusy($this->player->id,$this->db,$mission->duration);

                    
		    header('Location: index.php?mod=Missions');
                } else {
                    $msg = 'Sorry, there are some problems with this mission:<br />';
                    $msg .= errorBlock($error);
		    header('Location: index.php?mod=Missions&msg=' . urlencode($msg));
                }


            } else {

                if(isset($ezTranslateLanguage['TRANSLATION_MISSION_'.$mission->id])) $mission->description = $ezTranslateLanguage['TRANSLATION_MISSION_'.$mission->id];
                $this->tpl->assign('mission',$mission);
                $this->tpl->display('missions/mission.tpl');

            }

        } else {

            $missions = $this->db->fetchAll($this->db->execute("SELECT * FROM `<ezrpg>missions` WHERE `min_gwp`<=?", array($this->player->gwp)));
            foreach ($missions as $mission)
	    {
		if($mission->redo == 1 || $this->player->ship->missions == '' || !in_array($mission->id,unserialize($this->player->ship->missions))) 
		{
		    $this->tpl->append('missions',$mission);
		}
	    }
            $this->tpl->display('missions/list.tpl');

        }
        }
	
    }
}
?>