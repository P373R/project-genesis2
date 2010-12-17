<?php
/**
 * Modify Map
 *
 * @category AdminModules
 * @author   Bastian Neumann <neumann.bastian@gmail.com>
 * @license  http://www.opensource.org/licenses/gpl-license.php GPL
 * @version  SVN: <svn_id>
 * @link     http://dev.project-genesis2.de
 */

defined('IN_EZRPG') or exit;

/**
 * @package    Modules
 * @subpackage Admin
 */
class Admin_EditField extends Base_Module
{
    /**
      Displays modifies and send back to map module
      @return null
    */
    public function start()
    {
	requireAdmin(); // Nur Admins dürfen das
	if (isset($_POST['id'])) {
	  $this->db->execute("UPDATE `map` SET `x` = '$_POST[x]',
					       `y` = '$_POST[y]',
					       `type` =  '$_POST[type]',
					       `res` = '$_POST[res]',
					       `count` = '$_POST[count]',
					       `accessable` = '$_POST[accessable]',
					       `owner` = '$_POST[owner]',
					       `buildings` = '$_POST[buildings]'
			      WHERE `id` = '$_POST[id]'");
	  header("Location: index.php?mod=Map");
	}

	if (!isset($_GET['x']) OR !isset($_GET['y'])) header("Location: index.php?mod=Map");
	$this->tpl->assign('field', 
	    $this->db->fetchRow("SELECT * FROM `map` WHERE `x`='$_GET[x]' AND `y`='$_GET[y]'"));
        $this->tpl->display('admin/editfield.tpl');
    }
}
?>