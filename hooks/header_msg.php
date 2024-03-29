<?php
/**
 * Check for msg attribute and assign it to the template
 *
 * @category   Hooks
 *
 * @package    Hooks
 *
 * @author     Bastian Neumann <neumann.bastian@gmail.com>
 * @license    http://www.opensource.org/licenses/gpl-license.php GPL
 *
 * @version    SVN: <svn_id>
 * @link       http://dev.project-genesis2.de
 */
defined('IN_EZRPG') or exit;

$hooks->add_hook('header', 'header_msg', 1);

/**
  If msg is in POST purify and put it in the Session and redirect to the same 
  url without the msg part
  
  @param  DB_mysql  $db Database object
  @param  Smarty    &$tpl Global template object
  @param  StdObject $player Player row from Database
  @param  mixed     $args  Other arguments
  @return StdObject 
*/
function hook_header_msg(&$db, &$tpl, &$player, $args = 0)
{
    //HTML Purifier Config
    $purifier_config = HTMLPurifier_Config::createDefault();
    $purifier_config->set('HTML.Allowed', 'b,a[href],i,br,em,strong,ul,li,font');
    $purifier_config->set('URI.Base', $_SERVER['DOCUMENT_ROOT']);
    $purifier_config->set('URI.MakeAbsolute', true);
    $purifier_config->set('URI.DisableExternal', true);
    $purifier = new HTMLPurifier($purifier_config);

    if (!isset($_SESSION['msg']) && isset($_GET['msg']) && is_string($_GET['msg']))
    {
        $_msg = trim(stripslashes($_GET['msg']));
        $_msg = $purifier->purify($_msg);

        if (!empty($_msg))  $_SESSION['msg'] = $_msg;
	$_url = parse_url($_SERVER['REQUEST_URI']);
	$url = $_url['path'];
	$_url=explode("&",$_url['query']);
	$iterator = 0;
	foreach ($_url as $token)
        {
	    if($iterator == 0) $del = '?';
	    else $del = '&';
            if(substr($token,0,3)!="msg") $url.= $del.$token;
	    $iterator++;
        }
        //Relaod without msg in url
        header ("Location: $url"); 
        exit();
    } 
    else if (isset($_SESSION['msg']))
    {
        $tpl->assign('GET_MSG', $_SESSION['msg']);
        unset($_SESSION['msg']);
    }


    $tpl->assign('SESS',$_SESSION);
    return $args;
}
?>