<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/**
 * Module_Ship
 * Shows the details of your ship
 */
class Module_Ship extends Base_Module
{
    /**
     * Renders the Ship overview
     */
    public function start()
    {
        requireLogin(); // Nur wenn eingelogt
        if(isset($_GET['upgrade'])) $this->upgrade($_GET['upgrade']);
        else if(isset($_GET['doupgrade']) && !isBusy($this->player)) $this->doupgrade($_GET['doupgrade']);
        else if(isset($_GET['doupgrade'])) header("Location: index.php?mod=Ship&amp;msg=" . urlencode("Upgrade not possible while busy!"));
        else $this->display();
    }

    /**
     * Redners the overview
     */
    private function display()
    {
        $ship = array();
        $shipvalues = array();
        $shipdb = $this->db->fetchRow('SELECT `propulsion`,`gearbox`,`engine`,`energy`,`navigation`,`sonar`,`weapon1`,`weapon2`,`harvester` FROM `<ezrpg>ships` WHERE id=?',array($this->player->id));
        foreach ($shipdb as $field => $value) {
            $part = $this->db->fetchRow('SELECT * FROM `<ezrpg>ship_parts` WHERE id=? AND type=?',array($value,$field));
            $ship[$field]['name'] = $part->name;
	    $props = unserialize($part->properties);
            $ship[$field]['desc'] = itemInfo($props);
            if(is_array($props)) foreach($props as $key => $prop) {
		$shipvalues[$key] += $prop;
            }
        }
        $this->tpl->assign($ship,'ship');
        $this->tpl->assign('shipvalues',itemInfo($shipvalues, true));
        $this->tpl->display('ship/ship.tpl');
    }

    /**
     * Shows the Upgrade page
     */
    private function upgrade($part)
    {
        $id = $this->db->fetch($this->db->execute("SELECT `$part` FROM `<ezrpg>ships` WHERE id=?", array($this->player->id)));
        $partNew = $this->db->fetchRow('SELECT * FROM `<ezrpg>ship_parts` WHERE type=? AND id=?', array($part, ($id->$part+1)));
        $partHave= $this->db->fetchRow('SELECT * FROM `<ezrpg>ship_parts` WHERE type=? AND id=?', array($part, ($id->$part)));
        if($partNew->properties != '') {
            $partNew->properties = itemInfo(unserialize($partNew->properties));
          
            // Look if the dependecies are met
            $dep = unserialize($partNew->depend);
            $notPossible = false;
            if (isset($dep['propulsion'])      && $this->player->ship->propulsion < $dep['propulsion']) $notPossible = true;
            else if (isset($dep['gearbox'])    && $this->player->ship->gearbox    < $dep['gearbox'])    $notPossible = true;
            else if (isset($dep['engine'])     && $this->player->ship->engine     < $dep['engine'])     $notPossible = true;
            else if (isset($dep['energy'])     && $this->player->ship->energy     < $dep['energy'])     $notPossible = true;
            else if (isset($dep['navigation']) && $this->player->ship->navigation < $dep['navigation']) $notPossible = true;
            else if (isset($dep['sonar'])      && $this->player->ship->sonar      < $dep['sonar'])      $notPossible = true;
            else if (isset($dep['harvester'])  && $this->player->ship->harvester  < $dep['harvester'])  $notPossible = true;

	    $partNew->depend = itemInfo($dep);
            $partHave->properties= itemInfo(unserialize($partHave->properties));

            $this->tpl->assign('partNew',$partNew);
            $this->tpl->assign('partHave',$partHave);

	    if ($notPossible) {
		$this->tpl->assign('msg', 'Dependencies are not met!');
	    }
        } else {
            $this->tpl->assign('msg', 'No upgrade available for '.ucfirst($part));
            $notPossible = false;
        }
        $this->tpl->assign('notPossible', $notPossible);
        $this->tpl->assign('part',$part);
        $this->tpl->display('ship/ship_upgrade.tpl');
    }

    /**
     * performs the actual upgrade and sends the player back to the ship module
     */
    private function doupgrade($part)
    {
	$partNew = $this->db->fetchRow('SELECT depend FROM `<ezrpg>ship_parts` WHERE type=? AND id=?', array($part, $this->player->ship->$part));
	$dep = unserialize($partNew->depend);print_r($dep);
	$possible = true;
	
	if (isset($dep['propulsion']) && $this->player->ship->propulsion < $dep['propulsion']) $possible = false;
	else if (isset($dep['gearbox'])    && $this->player->ship->propulsion < $dep['gearbox'])    $possible = false;
	else if (isset($dep['engine'])     && $this->player->ship->propulsion < $dep['engine'])     $possible = false;
	else if (isset($dep['energy'])     && $this->player->ship->propulsion < $dep['energy'])     $possible = false;
	else if (isset($dep['navigation']) && $this->player->ship->propulsion < $dep['navigation']) $possible = false;
	else if (isset($dep['sonar'])      && $this->player->ship->propulsion < $dep['sonar'])      $possible = false;
	else if (isset($dep['harvester'])  && $this->player->ship->propulsion < $dep['harvester'])  $possible = false;
        
	if ($this->player->stat_points > 0 && $possible){
            $this->db->execute("UPDATE `<ezrpg>ships` SET `$part`=`$part`+1 WHERE `id`=?",array($this->player->id));
            $this->db->execute("UPDATE `<ezrpg>players` SET `stat_points`=`stat_points`-1 WHERE `id`=?",array($this->player->id));

            $level = $this->db->fetchArray($this->db->execute("SELECT `$part` FROM `ships` WHERE `id`=?",array($this->player->id)));
            setBusy($this->player->id,$this->db,$level[0]*600);
            header("Location: index.php?mod=Ship");
        } else {
            header("Location: index.php?mod=Ship&amp;msg=" . urlencode("Upgrade not possible"));
        }
    }

}
?>