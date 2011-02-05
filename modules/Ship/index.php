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
        requireLogin(); // Nur wenn eingelogt
        $ship = array();
        $shipdb = $this->db->fetchRow('SELECT `propulsion`,`gearbox`,`engine`,`energy`,`navigation`,`sonar`,`weapon1`,`weapon2` FROM `<ezrpg>ships` WHERE id=?',array($this->player->id));
        foreach ($shipdb as $field => $value) {
            $part = $this->db->fetchRow('SELECT * FROM `<ezrpg>ship_parts` WHERE id=? AND type=?',array($value,$field));
            $ship[$field]['name'] = $part->name;
            $ship[$field]['desc'] = itemInfo(unserialize($part->properties));
        }
        $this->tpl->assign($ship,'ship');
        $this->tpl->display('ship.tpl');
    }

    /**
     * Shows the Upgrade page
     */
    private function upgrade($part)
    {
        $id   = $this->db->fetch($this->db->execute("SELECT `$part` FROM `<ezrpg>ships` WHERE id=?", array($this->player->id)));
        $partNew = $this->db->fetchRow('SELECT * FROM `<ezrpg>ship_parts` WHERE type=? AND id=?', array($part, ($id->$part+1)));
        $partHave= $this->db->fetchRow('SELECT * FROM `<ezrpg>ship_parts` WHERE type=? AND id=?', array($part, ($id->$part)));
        if($partNew->properties != '') {
            $partNew->properties = itemInfo(unserialize($partNew->properties));
            $partHave->properties= itemInfo(unserialize($partHave->properties));
            $this->tpl->assign('partNew',$partNew);
            $this->tpl->assign('partHave',$partHave);
        } else {
            $this->tpl->assign("msg","No upgrade available for ".ucfirst($part));
        }
        $this->tpl->assign('part',$part);
        $this->tpl->display('ship_upgrade.tpl');
    }

    /**
     * performs the actual upgrade and sends the player back to the ship module
     */
    private function doupgrade($part)
    {
        if ($this->player->stat_points > 0){
            $this->db->execute("UPDATE `<ezrpg>ships` SET `$part`=`$part`+1 WHERE `id`=?",array($this->player->id));
            $this->db->execute("UPDATE `<ezrpg>players` SET `stat_points`=`stat_points`-1 WHERE `id`=?",array($this->player->id));

            // Recompute the players values not elegant but working ;)
            $compute[] = $this->db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.propulsion AND type = 'propulsion'",array($this->player->id));
            $compute[] = $this->db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.gearbox AND type = 'gearbox'",array($this->player->id));
            $compute[] = $this->db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.energy AND type = 'energy'",array($this->player->id));
            $compute[] = $this->db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.engine AND type = 'engine'",array($this->player->id));
            $compute[] = $this->db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.navigation AND type = 'navigation'",array($this->player->id));
            $compute[] = $this->db->fetchRow("SELECT ship_parts.properties FROM ship_parts LEFT JOIN ships ON ships.id=? where ship_parts.id=ships.sonar AND type = 'sonar'",array($this->player->id));

            $result= array();
            
            foreach($compute as $com) {
                $com = unserialize($com->properties);
                $result['strength'] += $com['strength'];
                $result['vitality'] += $com['vitality'];
                $result['agility'] += $com['agility'];
                $result['dexterity'] += $com['dexterity'];
                $result['energy'] += $com['energy'];
            }

            $this->db->execute("UPDATE `<ezrpg>players` SET `strength`='$result[strength]',
                                                            `vitality`='$result[vitality]',
                                                            `agility`='$result[agility]',
                                                            `dexterity`='$result[dexterity]',
                                                            `max_energy`='$result[energy]',
                                                            `energy` = `max_energy`
                                WHERE `id`=?", array($this->player->id));
            $level = $this->db->fetchArray($this->db->execute("SELECT `$part` FROM `ships` WHERE `id`=?",array($this->player->id)));
            setBusy($this->player->id,$this->db,$level[0]*600);
            header("Location: index.php?mod=Ship");
        } else {
            header("Location: index.php?mod=Ship&amp;msg=" . urlencode("Upgrade not possible"));
        }
    }

}
?>