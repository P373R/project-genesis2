<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_EventLog
  The module is the player's event log, which keeps track of everything that happens to the user.
*/
class Module_EventLog extends Base_Module
{
    /*
      Function: start()
      Grabs the log data, assigns it to the template and displays the page.
    */
    public function start()
    {
        //Require the user to be logged in
        requireLogin();
	
	/* As of Version 0.2 The Log stays permanent. 
        if (isset($_GET['act']) && $_GET['act'] == 'clear')
        {
            $this->clear();
        }
        else
        {*/
            (isset($_GET['page']))?$page=$_GET['page']:$page=0;
	    $count = $this->db->fetchRow("SELECT COUNT(`time`) as `count` FROM `player_log` WHERE `player`=?", array($this->player->id));
	    if(($count->count-(($page+1)*5)) > 0) $this->tpl->assign('next',1);
	    $this->tpl->assign('page',$page);
	    //Retrieve all log messages
            $query = $this->db->execute('SELECT `time`, `message`, `status` FROM `<ezrpg>player_log` WHERE `player`=? ORDER BY `time` DESC LIMIT '.(5*$page).', 5', array($this->player->id));
            $logs = $this->db->fetchAll($query);
            
            //Update log message statuses to old/read (status value: 1)
            $this->db->execute('UPDATE `<ezrpg>player_log` SET `status`=1 WHERE `player`=?', array($this->player->id));
            
            $this->tpl->assign('logs', $logs);
            $this->tpl->display('log.tpl');
        /*}*/
    }
    
    /*
      Function: clear
      Deletes all log entries belonging to the player.

      Deprecated as of Version 0.2
    */
    private function clear()
    {
        $query = $this->db->execute('DELETE FROM `<ezrpg>player_log` WHERE `player`=?', array($this->player->id));
        
        $msg = 'You have cleared your event log!';
        header('Location: index.php?mod=EventLog&msg=' . urlencode($msg));
        exit;
    }
}
?>
