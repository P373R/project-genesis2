<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_Fight
  An fight between two players

*/
class Module_Fight extends Base_Module
{
    /*
      Function: start
      Displays a page using another class method.

      Since this module extens Module_Base, you can use the following class variables:
      $db - An instance of the database class.
      $tpl - A template smarty object.
      $player - A player result set from the database, or 0 if not logged in.
    */
    public function start()
    {
      requireLogin(); // Wenn der Spieler eingeloggt ist
      if(isset($_GET['op'])) $this->fight();
      $this->tpl->display('war.tpl');
    }

    /*
      Function: fight
    */
    public function fight()
    {
	  $msg = "<strong>Kampfbereicht:</strong><br />";
	  $winner=0;
	  // wir setzen die Spieler auf kämpfend
	  $this->db->execute("UPDATE `players` SET `infight` = 1 WHERE `id`='".$_GET['op']."' OR `id`='".$this->player->id."'");
	  while($winner == 0){ // So lange kämpfen, bis ein Sieger fest steht
	    // aktualisieren der infos
	    $def = $this->db->fetchRow("SELECT * FROM `players` WHERE `id`='".$_GET['op']."'");
	    $atk = $this->db->fetchRow("SELECT * FROM `players` WHERE `id`='".$this->player->id."'");

	    // wir schauen ob jemandem die energie ausgegangen ist
	    if($def->energy == 0){ $winner = "atk"; $looser = "def"; $msg.=$def->username." hat keine Energie mehr<br />"; break;}
	    if($atk->energy == 0){ $winner = "def"; $looser = "atk"; $msg.=$atk->username." hat keine Energie mehr<br />"; break;}

	    // wir schauen, ob jemand keine hp mehr hat
	    if($def->hp <= 10){ $winner = "atk"; $looser = "def"; $msg.=$def->username." hat keine Lebenspunkte mehr<br />"; break;}
	    if($atk->hp <= 10){ $winner = "def"; $looser = "atk"; $msg.=$atk->username." hat keine Lebenspunkte mehr<br />"; break;}
	    
	    //der angreifer hat einen schlag
	    // Berechnung: Schaden = strength-vitality
	    $dmg = ($atk->strength)-($def->vitality)+rand(0,3);
	    if($dmg <= 0)$dmg=1;
	    // ausweichen? wenn dex größer als agi vom verteidiger
	    $dodge = ($atk->dexterity)-($def->agility);
	    if($dodge >= 0 || rand(1,3) == 3){ // treffer wenn dex>=agi oder zufall 33%
	      if($dmg > $def->hp) $dmg=$def->hp; // wir gehen nur auf 0 nicht weiter
	      $this->db->execute("UPDATE `players` SET `hp` = `hp`-'".intval($dmg)."' WHERE `id` = '".$_GET['op']."'");
	      $msg.="<strong>".$atk->username."</strong> hat mit <strong>$dmg</strong> Schaden getroffen<br />";
	    } else {
	      $msg.="<strong>".$atk->username."</strong> hat nicht getroffen<br />";
	    }

	    //der verteigiger hat einen schlag
	    // Berechnung: Schaden = strength-vitality
	    $dmg = ($def->strength)-($atk->vitality);
	    ($dmg <= 0)?$dmg=1:
	    // ausweichen? wenn dex größer als agi vom verteidiger
	    $dodge = ($def->dexterity)-($atk->agility);
	    if($dodge >= 0 || rand(1,3) == 3){ // treffer wenn dex>=agi oder zufall 33%
	      if($dmg > $atk->hp) $dmg=$atk->hp; // wir gehen nur auf 0 nicht weiter
	      $this->db->execute("UPDATE `players` SET `hp` = `hp`-'".intval($dmg)."' WHERE `id` = '".$this->player->id."'");
	      $msg.="<strong>".$def->username."</strong> hat mit <strong>$dmg</strong> Schaden getroffen<br />";
	    } else {
	      $msg.="<strong>".$def->username."</strong> hat nicht getroffen<br />";
	    }
	    // einen energiepunkt abziehen
	    redNrg($atk->id,$this->db,1);
	    redNrg($def->id,$this->db,1);

	  }
	  $msg.="<strong>".$$winner->username." hat gewonnen</strong><br />";
	  $this->tpl->assign('warlog',$msg);
	  addLog($_GET['op'], $msg, $this->db);
	  $this->db->execute("UPDATE `map` SET `owner` = '".$$winner->id."' WHERE `x`='".$$winner->x."' AND `y`='".$$winner->y."'");
	  $this->db->execute("UPDATE `players` SET `infight` = 0 WHERE `id`='".$_GET['op']."' OR `id`='".$this->player->id."'");	  
	  $this->db->execute("UPDATE `players` SET `kills` = `kills`+1, `exp`=`exp`+'".$$looser->level."' WHERE `id`='".$$winner->id."'");
	  $this->db->execute("UPDATE `players` SET `deaths` = `deaths`+1 WHERE `id`='".$$looser->id."'");
	  return $winner;
    }

}
?>