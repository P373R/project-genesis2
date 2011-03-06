<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Class: Module_FBLogin
  Login using the Facebook serverside OAuth 2.0

  User authentication and app authorization are handled at the same time by
  redirecting the user to our OAuth Dialog. When invoking this dialog, you
  must pass in your app id that is generated when you create your application
  in our Developer App (the client_id parameter) and the URL that the user's
  browser will be redirected back to once app authorization is completed (the
  redirect_uri parameter). The redirect_uri must be within the same domain as
  the Site URL you specify in Web site tab of the Developer App
*/
class Module_FBLogin extends Base_Module
{
    /*
      Function: start
      Selects the actions to be taken.
    */
    public function start()
    {
        /*
          You can get an client_id from the Facebook app center
        */
        $client_id    = '';
        /*
          This URI is called after you redirected to facebook. You must direct it to YOURPROJECTSITE.COM/index.php?mod=FBLogin&return=true
          YOURPROJECTSITE.COM has to be registered with facebook.
        */
        $redirect_uri = 'http://project-genesis2.de/index.php?mod=FBLogin&return=true';
        /*
          This can be set in the app center, too
        */
        $client_secret = '';
        /*
          Just use if you need more than basic access. see this page for more infos
          http://developers.facebook.com/docs/authentication/permissions
        */
        $scope        = '';

        if(isset($_GET['connect'])){$_SESSION['fbconnect'] = true;}
        if(isset($_GET['return']) && $_GET['return'] != '') $this->login($client_id, $redirect_uri, $client_secret);
        else $this->redirect($client_id, $redirect_uri, $scope);
    }

    private function redirect($client_id, $redirect_uri, $scope)
    {
        header('Location: https://www.facebook.com/dialog/oauth?client_id='.$client_id.'&redirect_uri='.urlencode($redirect_uri).'&scope='.$scope);
        exit;
    }

    /*
      Function: login
      Logs the player in if FB login worked
    */
    private function login($client_id, $redirect_uri, $client_secret)
    {
        if(isset($_REQUEST['error']) && $_REQUEST['error'] == "access_denied")
        {
            $msg = 'You have to allow access to your Facebook details to use this login.';
            header('Location: index.php?msg='.urlencode($msg));
            exit;
        }
        if(isset($_REQUEST['code']) && $_REQUEST['code'] != '')
        {
            $access_token = file_get_contents('https://graph.facebook.com/oauth/access_token?client_id='.$client_id.'&redirect_uri='.urlencode($redirect_uri).'&client_secret='.$client_secret.'&code='.$_REQUEST['code']);
            $graph_url = "https://graph.facebook.com/me?" . $access_token;
            $user = json_decode(file_get_contents($graph_url));
           
            if($_SESSION['fbconnect']) {
                $this->db->execute('UPDATE `<ezrpg>players` SET `facebook`=? WHERE `id`=?', array($user->id, $this->player->id));
            } else {
                
            
                $query = $this->db->execute('SELECT `id`, `username`, `password`, `secret_key` FROM `<ezrpg>players` WHERE `facebook`=?', array($user->id));
                if ($this->db->numRows($query) == 0)
                {
                    $msg = 'Your Facebook account seems not to be linked to a user account! <br />
                    You have to link them first. You can do that after you logged in in your account settings.';
                    header('Location: index.php?msg='.urlencode($msg));
                    exit;
                }
                $player = $this->db->fetch($query);
                global $hooks;

                //Run login hook
                $player = $hooks->run_hooks('login', $player);
                $query = $this->db->execute('UPDATE `<ezrpg>players` SET `last_login`=? WHERE `id`=?', array(time(), $user->id));
                $hash = sha1($player->id . $_SERVER['REMOTE_ADDR'] . SECRET_KEY);
                $_SESSION['userid'] = $player->id;
                $_SESSION['hash'] = $hash;

                $hooks->run_hooks('login_after', $player);

                header('Location: index.php');
                exit;

            }
        } else {
            $msg = 'There is something wrong with your Facebook account.';
            header('Location: index.php?msg='.urlencode($msg));
             
        }

    }

}
?>