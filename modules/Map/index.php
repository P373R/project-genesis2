<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_Map
  This is a map module, which can be used to show a map of the game world.
  See:
  <Base_Module>
*/
class Module_Map extends Base_Module
{
    /*
      Function: start
      This is the function that is called to display the module to the player.
      This is where most of your player-facing code will go.
      
      Since this module extens Module_Base, you can use the following class variables:
      $db - An instance of the database class.
      $tpl - A template smarty object.
      $player - A player result set from the database, or 0 if not logged in.
    */
    public function start()
    {
	// You may call the requireLogin() function if this module is only available to players who are logged in.
        requireLogin();

	(isset($_GET['act']))?$act=$_GET['act']:$act='default';

        if ($this->player->energy == 0) $act="sleep";
        else if (isBusy($this->player)) $act="busy";
        
	switch($act)
        {
          case 'attack':
              $this->attack();
              break;
          case 'seek':
              $this->seek();
              break;
          case 'gather':
              $this->gather();
              break;
          case 'secure':
              $this->secure();
              break;
          case 'go': 
	      if(isset($_GET['dir']))$this->move($_GET['dir']);
              break;
          case 'sleep':
              $this->sleep();
              break;
          case 'busy':
              $this->busy();
              break;
          default:
              $this->render();
              break;
        } 
    }

    /* 
	Function: render

    */
    public function render()
    {
	// Current players X/Y coordinates
	$x_cord = $this->player->x;
	$y_cord = $this->player->y;

	for($i=0; $i<3; $i++){
	  $query = $this->db->execute("SELECT * FROM `map` WHERE `x`<($x_cord+2) AND `x`>=($x_cord-1)  AND `y`=($y_cord-1+$i)");
	  $map[$i] = $this->db->fetchAll($query);
	}

	$field = $this->db->fetchRow("SELECT * FROM `map` WHERE `x`='$x_cord' AND `y`='$y_cord'"); 
	$field->name = id2name('field',$field->type);
	$field->res  = id2name('items',$field->res);
	if($field->owner != 0)	$field->owner_db = $this->db->fetchRow("SELECT * FROM `players` WHERE `id`='".$field->owner."'");
	else $field->owner_db->username = "nobody";

	$query = $this->db->execute("SELECT `id`, `username` from `players` WHERE `x` = '$x_cord' AND `y` = '$y_cord' AND `username`!='".$this->player->username."' LIMIT 10");
	$this->tpl->assign('player_list', $this->db->fetchAll($query));
	$this->tpl->assign('fieldinfo', $field);
	$this->tpl->assign('map', $map);
	$this->tpl->assign('player', $this->player);
        $this->tpl->display('map.tpl');

    }

    /* 
	Function: attack
	This will attack the Field if its not yours. It will lead to a fight if someone else is securing it.

    */
    public function attack()
    {
        $this->tpl->display('coming_soon.tpl');
    }

    /* 
	Function: seek
	This will seek the place. You might find something

    */
    public function seek()
    {
      $luck= rand(1,30);
      $rnd = rand(1,3);
      switch($luck){
	case 1:	  
	  header('Location: index.php?mod=Map&msg=' . urlencode("Du hast $rnd Gold gefunden"));
	  $item = 'money';
	break;
	case 5: case 6: case 7:
	  header('Location: index.php?mod=Map&msg=' . urlencode("Du hast $rnd Aluminium gefunden"));
	  $item = 'aluminium';
	break;
	case 11: case 12: case 13: case 14: case 15: case 16:
	  header('Location: index.php?mod=Map&msg=' . urlencode("Du hast $rnd Wasser gefunden"));
	  $item = 'water';
	break;
	case 17: case 18: case 19:	
	  header('Location: index.php?mod=Map&msg=' . urlencode("Du hast $rnd Eisen gefunden"));
	  $item = 'iron';
	break;
	default:
	  header('Location: index.php?mod=Map&msg=' . urlencode("Du hast leider nichts gefunden"));
	break;
      }
      if(isset($item)){
	$this->db->execute("UPDATE `players` SET `$item` = `$item`+".$rnd." WHERE `id`='".$this->player->id."'");
      }
      redNrg($this->player->id,$this->db,1);
      addExp($this->player->id,$this->db,rand(0,1));

    }

    /* 
	Function: gather
	This will gather one amount of the item and reduces the resource count by one

    */
    public function gather()
    {
	// Current players X/Y coordinates
      $x_cord = $this->player->x;
      $y_cord = $this->player->y;

      $field = $this->db->fetchRow("SELECT * FROM `map` WHERE `x`='$x_cord' AND `y`='$y_cord'"); 
	
      if($field->res != 0){
	$item = id2name("db_fields",$field->res);
      
	$this->db->execute("UPDATE `players` SET `$item` = `$item`+5 WHERE `id`='".$this->player->id."'");
	redNrg($this->player->id,$this->db,1);
	addExp($this->player->id,$this->db,rand(0,1));
	header('Location: index.php?mod=Map&msg=' . urlencode("Du hast 5 ".id2name("items",$field->res)." abgebaut."));
      } else {
	header('Location: index.php?mod=Map&msg=' . urlencode("Du kannst hier nichts abbauen."));
      }
    }

    /* 
	Function: secure
	This will protect the field from others. If you win the fight.

    */
    public function secure()
    {
      $x_cord = $this->player->x;
      $y_cord = $this->player->y;
      $res = $this->db->fetchRow("SELECT `owner` FROM `map` WHERE `x`='$x_cord' AND `y`='$y_cord'");
echo $res->owner;
      if($res->owner != 0 && $res->owner != $this->player->id) {
	header('Location: index.php?mod=Map&msg=' . urlencode("Du kannst dieses Feld nicht beschützen, es gehört jemand anderem!"));
      } else if($res->owner == $this->player->id) {
	header('Location: index.php?mod=Buildings');
      } else {
	// since Version 0.2,1 you are allowed to secure more than one spot
	//$this->db->execute("UPDATE `map` SET `owner` = 0 WHERE `owner`= '".$this->player->id."'");
	$this->db->execute("UPDATE `map` SET `owner` = '".$this->player->id."' WHERE `x`='$x_cord' AND `y`='$y_cord'");
	header('Location: index.php?mod=Buildings&msg=' . urlencode("Du bewachst jetzt Kartenabschnitt $x_cord/$y_cord"));
      }
    }

    /* 
	Function: go
	This will move the player in the specified direction.

    */
    public function move($dir)
    {
      $error1 = false;
      $error2 = false;
      switch ($dir) {
       case 'n':
	if($this->player->y > 1){
	  $this->db->execute("UPDATE `players` SET `y`=`y`-1 WHERE `id`='".$this->player->id."'");
	} else {
            $error1 = true; $error2 = true;
        }
       break;
       case 'e':
	if($this->player->x < MAX_X){
	  $this->db->execute("UPDATE `players` SET `x`=`x`+1 WHERE `id`='".$this->player->id."'");
        } else {
            $error1 = true; $error2 = true;
	} 
       break;
       case 'w':
	if($this->player->x > 1){
	  $this->db->execute("UPDATE `players` SET `x`=`x`-1 WHERE `id`='".$this->player->id."'");
        } else {
            $error1 = true; $error2 = true;
	} 
       break;
       case 's':
	if($this->player->y < MAX_Y){
	  $this->db->execute("UPDATE `players` SET `y`=`y`+1 WHERE `id`='".$this->player->id."'");
        } else {
            $error1 = true; $error2 = true;
	} 
       break;
       case 'ne':
        if($this->player->y > 1){
          $this->db->execute("UPDATE `players` SET `y`=`y`-1 WHERE `id`='".$this->player->id."'");
        } else {
            $error1 = true;
        }
        if($this->player->x < MAX_X){
          $this->db->execute("UPDATE `players` SET `x`=`x`+1 WHERE `id`='".$this->player->id."'");
        } else {
            $error2 = true;
        }
       break;
       case 'nw':
        if($this->player->y > 1){
          $this->db->execute("UPDATE `players` SET `y`=`y`-1 WHERE `id`='".$this->player->id."'");
        } else {
            $error1 = true;
        }
        if($this->player->x > 1){
          $this->db->execute("UPDATE `players` SET `x`=`x`-1 WHERE `id`='".$this->player->id."'");
        } else {
            $error2 = true;
        }
       break;
       case 'se':
        if($this->player->y < MAX_Y){
          $this->db->execute("UPDATE `players` SET `y`=`y`+1 WHERE `id`='".$this->player->id."'");
        } else {
            $error1 = true;
        }
        if($this->player->x < MAX_X){
          $this->db->execute("UPDATE `players` SET `x`=`x`+1 WHERE `id`='".$this->player->id."'");
        } else {
            $error2 = true;
        }
       break;
       case 'sw':
        if($this->player->y < MAX_Y){
          $this->db->execute("UPDATE `players` SET `y`=`y`+1 WHERE `id`='".$this->player->id."'");
        } else {
            $error1 = true;
        }
        if($this->player->x > 1){
          $this->db->execute("UPDATE `players` SET `x`=`x`-1 WHERE `id`='".$this->player->id."'");
        } else {
            $error2 = true;
        }
       break;
      }
      if(!$error1 && !$error2) {
        redNrg($this->player->id,$this->db,1);
        setBusy($this->player->id,$this->db,(100-$this->player->agility));
      }
      header('Location: index.php?mod=Map');
    }

    private function sleep()
    {
        $this->tpl->display('tired.tpl');
    }

    private function busy()
    {
        $this->tpl->assign('reload',$this->player->ship->busy-time());
        $this->tpl->display('busy.tpl');
    }
}
?>