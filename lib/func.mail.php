<?php
//This file cannot be viewed, it must be included
defined('IN_EZRPG') or exit;

/*
  Title: Log Functions
  This file contains functions that may be used with the Event Log module.

  See Also:
  - <Module_EventLog>
*/

/*
  Function: checkMail
  Checks the database for new mail messages.

  Parameters:
  $player - The ID number of the player.
  $db - The database object.

  Returns:
  The number of new log messages.

  Example Usage:
  > echo 'New Mails: ', checkLog($player->id, $db);
*/
function checkMail($player, &$db)
{
    $result = $db->fetchRow('SELECT COUNT(`id`) AS `count` FROM `mail` WHERE `to`=? AND `read`=0', array($player));
    return $result->count;
}
?>
