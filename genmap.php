<?php
define('IN_EZRPG', true);

require_once('init.php');

for($y=0; $y<=(MAX_Y+1); $y++){
  for($x=0; $x<=(MAX_X+1); $x++){
    if($x!=0 AND $x!=11 AND $y!=0 AND $y!=11)$type = rand(1,5);
    else $type=0;
    ($x == 1 || $x == 10 || $y == 1 || $y == 10)?$ac=0:$ac=1;
    echo "start...<br/>";
    $db->execute("INSERT INTO `ezrpg`.`<ezrpg>map` (`x` ,`y` ,`type` ,`accessable`) VALUES ('$x', '$y', '$type', '$ac')");
    echo "ende!<br/>";
  }
}

?>