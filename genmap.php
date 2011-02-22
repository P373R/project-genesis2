<?php
define('IN_EZRPG', true);

require_once('init.php');

$db->execute("TRUNCATE TABLE `<ezrpg>map` ");

for($y=0; $y<=(MAX_Y+1); $y++){
  for($x=0; $x<=(MAX_X+1); $x++){
    if($x!=0 AND $x!=MAX_X+1 AND $y!=0 AND $y!=MAX_Y+1)$type = rand(1,5);
    else if ($x==ATLANTIS_X && $y==ATLANTIS_Y) $type=99; //Atlantis
    else $type=0;
    ($x == 1 || $x == MAX_X || $y == 1 || $y == MAX_Y)?$ac=0:$ac=1;
    $db->execute("INSERT INTO `ezrpg`.`<ezrpg>map` (`x` ,`y` ,`type` ,`accessable`) VALUES ('$x', '$y', '$type', '$ac')");
    echo "insert $x/$y<br />";
    ob_flush();
  }
}

?>