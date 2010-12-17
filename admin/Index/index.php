<?php
/**
 * INFO
 *
 * @category   AdminModules
 *
 *
 * @author     Bastian Neumann <neumann.bastian@gmail.com>
 * @license    http://www.opensource.org/licenses/gpl-license.php GPL
 *
 * @version    SVN: <svn_id>
 * @link       http://dev.project-genesis2.de
 */
defined('IN_EZRPG') or exit;
/**
 * Index for the Admin Website
 * @package    Modules
 * @subpackage Admin
 */
class Admin_Index extends Base_Module
{
    /**
      Displays admin/index.tpl
      @return null
    */
    public function start()
    {
        $this->tpl->display('admin/index.tpl');
    }
}
?>