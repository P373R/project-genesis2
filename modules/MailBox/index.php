<?php
defined('IN_EZRPG') or exit;
class Module_MailBox extends Base_Module
{
    public function start()
    {
        requireLogin();

        if (isset($_GET['act']))
        {
            switch($_GET['act'])
            {
            case 'read':
                $this->readmail();
                break;
            case 'compose':
                $this->compose();
                break;
            case 'delete':
                $this->delete();
                break;
            case 'showmail':
                $this->showmail();
                break;
            case 'install':
                $this->install();
                break;
            case 'send':
                $this->send();
                break;
            case 'outbox':
                $this->outbox();
                break;  
            case 'delall':
                $this->deleteall();
                break;  
            default:
                $this->showmail();
                break;
            }
        }
        else
        {
            $this->showmail();
        }
        

    }
    
    private function showmail()
    {
    	$mail = $this->db->execute('SELECT `id`, `to`, `from`, `subject`, `date`, `isread`, `message` FROM `<ezrpg>mail` WHERE `to`=? ORDER BY `date` ASC', array($this->player->username));
    	
        $mailbox = Array();
        while ($m = $this->db->fetch($mail))
        {
            $mailbox[] = $m;
        }

        $this->tpl->assign('mailbox', $mailbox);
        $this->tpl->display('mail/listmail.tpl');
    }
    
    private function delete()
    {
    	if (!isset($_GET['id']))
    	{
    	  	$msg="Next time try the delete button.";
    	  	Header("Location: index.php?mod=MailBox&msg=" . urlencode($msg));
    	  	exit;
    	  	
    	}
    	else
    	{
		$res=$this->db->execute('DELETE FROM `mail` WHERE `id`=? AND `to`=?', array($_GET['id']), $this->player->username);
        	$msg=$this->db->numRows($res)." Message Deleted";
        	Header("Location: index.php?mod=MailBox&msg=" . urlencode($msg));
        	exit;
    	}  
    }
    
    private function readmail()
    {
    	if (!isset($_GET['id']))
    	{
    	  	$msg="Next time try and read existing mail.";
    	  	Header("Location: index.php?mod=MailBox&msg=" . urlencode($msg));
    	  	exit;
    	}
    	else
    	{
    		$mailbox2 = $this->db->fetchRow('SELECT `id`, `to`, `from`, `subject`, `date`, `isread`, `message` FROM `<ezrpg>mail` WHERE `id`=?', array($_GET['id']));
	    	
	        $this->tpl->assign('mailbox2', $mailbox2);
	        $this->tpl->display('mail/readmail.tpl');
    	}
    }
    
    private function compose()
    {
        if (isset($_GET['rec'])) $this->tpl->assign('rec',$_GET['rec']);
        else $this->tpl->assign('rec','Name');
    	$this->tpl->display('mail/sendmail.tpl');
    }
    
    private function send()
    {
    	if (!isset($_POST['to']))
    	{
    		$msg="Please specify an actual person";
        	Header("Location: index.php?mod=MailBox&act=compose&msg=" . urlencode($msg));
        	exit;
    	}
    	elseif (!isset($_POST['subject']))
    	{
    		$msg="Please specify a subject";
        	Header("Location: index.php?mod=MailBox&act=compose&msg=" . urlencode($msg));
        	exit;
    	}
    	elseif (!isset($_POST['message']))
    	{
    		$msg="You can\'t send a message without a message\!";
        	Header("Location: index.php?mod=MailBox&act=compose&msg=" . urlencode($msg));
        	exit;
    	}
    	else
    	{
    		//so people can't send html.
    		$message = str_replace(array("\n"),array("<br />"),strip_tags($_POST['message']));
      		$subject = str_replace(array("\n"),array("<br />"),strip_tags($_POST['subject']));
      		//
      		$tosql = $this->db->fetchRow('SELECT `id` FROM `<ezrpg>players` WHERE `username`=?', array($_POST['to']));
    	        if ($tosql == false)
		        {
		    		$msg="You can\'t send a message to someone who doesnt exist\!";
		        	Header("Location: index.php?mod=MailBox&act=compose&msg=" . urlencode($msg));
		            exit;
		        }
    		$this->db->execute("INSERT INTO `<ezrpg>mail` (`id`, `to`, `from`, `subject`, `date`, `isread`, `message`) VALUES (NULL, '{$_POST['to']}', '{$this->player->username}', '{$subject}', CURRENT_TIMESTAMP, '0', '{$message}')");
    		$msg="Message Sent\!";
		    Header("Location: index.php?mod=MailBox&msg=" . urlencode($msg));
    	}
    
    }
    
   	private function outbox()
   	{
   		$outmail = $this->db->execute('SELECT `id`, `to`, `from`, `subject`, `date`, `isread`, `message` FROM `<ezrpg>mail` WHERE `from`=? ORDER BY `date` ASC', array($this->player->username));
    	
        $outbox = Array();
        while ($o = $this->db->fetch($outmail))
        {
            $outbox[] = $o;
        }
        
        $this->tpl->assign('outbox', $outbox);
        $this->tpl->display('mail/outbox.tpl');
   	}
   	
   	private function deleteall()
   	{
   		$this->db->execute('DELETE FROM `mail` WHERE `to`=?', array($this->player->username));
        	$msg="All Messages Deleted";
        	Header("Location: index.php?mod=MailBox&msg=" . urlencode($msg));
        	exit;
   	}
   	
   	private function install()
   	{
   		        requireAdmin($this->player);
        
        $table_prefix = DB_PREFIX;
        $create_table = <<<SQL
CREATE TABLE IF NOT EXISTS `<ezrpg>mail` (
`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
`to` VARCHAR( 50 ) NOT NULL ,
`from` VARCHAR( 50 ) NOT NULL ,
`subject` VARCHAR( 45 ) NOT NULL ,
`date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
`isread` INT( 1 ) NOT NULL ,
`message` VARCHAR( 5000 ) NOT NULL 
) ENGINE = InnoDB;
SQL;
        $this->db->execute($create_table);
        
        $msg = 'You have installed MailBox by JesterC.';
        header('Location: index.php?mod=MailBox&msg=' . urlencode($msg));
        exit;
   	}
    
}