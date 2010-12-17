<?php
class Admin_Missions extends Base_Module
{
    public function start()
    {

        if (isset($_GET['act']))
        {
            if ($_GET['act'] == 'add')
                $this->showadd();
            else if ($_GET['act'] == 'edit')
                $this->showedit();
            else if ($_GET['act'] == 'del')
                $this->delete();
            else if ($_GET['act'] == 'doadd')
                $this->doadd();
            else if ($_GET['act'] == 'doedit')
                $this->doedit();
            else
                $this->home();
        }
        else
            $this->home();
    }
    
    private function home()
    {
    	$q = $this->db->execute('SELECT * FROM `<ezrpg>missions`');  
    	
        $mission = Array();
        while ($q2 = $this->db->fetch($q))
        {
            $mission[] = $q2;
        }
        
        $this->tpl->assign('mission', $mission);
        $this->tpl->display('admin/missions.tpl');
    }
    
    private function showadd()
    {
    	
        $this->tpl->display('admin/addmission.tpl');
    	
    }
    
    private function showedit()
    {

    	$mission=$this->db->fetchRow('SELECT * FROM `<ezrpg>missions` WHERE `id`=?', array($_GET['id']));
        
    	if($mission == false)
    	{
    		$msg="you never picked an existing mission to view.";
    		Header('Location: index.php?mod=Missions&msg=' . urlencode($msg));
    		exit;
    	}

        $this->tpl->assign('mission', $mission);
        $this->tpl->display('admin/editmission.tpl');
    }
    
    private function delete()
    {
        if (!isset($_GET['id']))
    	{
    		$msg="you never picked an existing mission to view.";
    		Header('Location: index.php?mod=Missions&msg=' . urlencode($msg));
    		exit;    		
    	}
    	$mission=$this->db->fetchRow('SELECT * FROM `<ezrpg>missions` WHERE `id`=?', array($_GET['id']));
        
    	if($mission == false)
    	{
    		$msg="you never picked an existing mission to view.";
    		Header('Location: index.php?mod=Missions&msg=' . urlencode($msg));
    		exit;
    	}
			$this->db->execute('DELETE FROM `<ezrpg>missions` WHERE `id`=?', array($mission->id));
    		$msg="You have successfully deleted:" . $mission->title;
    		Header('Location: index.php?mod=Missions&msg=' . urlencode($msg));
    		exit;
    }
    
    private function doadd()
    {
            if (empty($_POST['title']) || empty($_POST['description']) || empty($_POST['start']) || empty($_POST['complete']) || empty($_POST['fail']) || empty($_POST['money']) || empty($_POST['difficulty']) || empty($_POST['exp']) || empty($_POST['strneeded']) || empty($_POST['agineeded']) || empty($_POST['energy']) || empty($_POST['vitneeded']) || empty($_POST['dexneeded']) )
            {
  
                $msg .= 'You forgot to fill in part of the form!';
                Header('Location: index.php?mod=Missions&msg=' . urlencode($msg));
    			exit;
            }
    	        $insert['title'] = $_POST['title'];
                $insert['description'] = $_POST['description'];
                $insert['start'] = $_POST['start'];
                $insert['complete'] = $_POST['complete'];
                $insert['fail'] = $_POST['fail'];
                $insert['strneeded'] = $_POST['strneeded'];
                $insert['agineeded'] = $_POST['agineeded'];
                $insert['vitneeded'] = $_POST['vitneeded'];
                $insert['dexneeded'] = $_POST['dexneeded'];
                $insert['difficulty'] = $_POST['difficulty'];
                $insert['money'] = $_POST['money'];
                $insert['energy'] = $_POST['energy'];
                $insert['exp'] = $_POST['exp'];
                $this->db->insert('<ezrpg>missions', $insert);
                $msg="You have successfully added:" . $insert->title;
    			Header('Location: index.php?mod=Missions&msg=' . urlencode($msg));
    		
                
    	
    }
    
    private function doedit()
    {
    	
                if (empty($_POST['title']) || empty($_POST['description']) || empty($_POST['start']) || empty($_POST['complete']) || empty($_POST['fail']) || empty($_POST['money']) || empty($_POST['difficulty']) || empty($_POST['exp']) || empty($_POST['strneeded']) || empty($_POST['agineeded']) || empty($_POST['energy']) || empty($_POST['vitneeded']) || empty($_POST['dexneeded']) )
            {
  
                $msg .= 'You forgot to fill in part of the form!';
                Header('Location: index.php?mod=Missions&msg=' . urlencode($msg));
    			exit;
            }
    			$this->db->execute('UPDATE `<ezrpg>missions` SET `title`=?, `description`=?, `start`=?, `complete`=?, `fail`=?, `strneeded`=?, `agineeded`=?, `vitneeded`=?, `dexneeded`=?, `difficulty`=?, `money`=?, `energy`=?, `exp`=? WHERE `id`=?', array($_POST['title'], $_POST['description'], $_POST['start'], $_POST['complete'], $_POST['fail'], $_POST['strneeded'], $_POST['agineeded'], $_POST['vitneeded'], $_POST['dexneeded'], $_POST['difficulty'], $_POST['money'], $_POST['energy'], $_POST['exp'], $_GET['id']));
    	        $msg="You have successfully edited:" . $_POST['title'];
    			Header('Location: index.php?mod=Missions&msg=' . urlencode($msg));
    }
}
?>