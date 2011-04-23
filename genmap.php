<?php
$time = time();
define('IN_EZRPG', true);

require_once('init.php');

$db->execute("TRUNCATE TABLE `<ezrpg>map` ");
echo "Generate map from 0-".MAX_X."X and 0-".MAX_Y."Y values\n";
echo "This should generate ".((MAX_X+2)*(MAX_Y+2))." fields\n";
for($y=0; $y<=(MAX_Y+1); $y++){
    
  for($x=0; $x<=(MAX_X+1); $x++){
    $ac=1;
    // there is no atlantis on this field
    if($x!=0 AND $x!=MAX_X+1 AND $y!=0 AND $y!=MAX_Y+1) {
	$type = rand(1,5); // random type of image
	if(rand(0,10)== 10) {
	    // we put some stuff there
	    $res = rand(1,5);
	}
    }
    else if ($x==ATLANTIS_X && $y==ATLANTIS_Y) {
	$type=99; //Atlantis is buid here
	$res = 99;
    }
    else {
	$type=0; // field not accessable
	$res = 0;
	$ac=0;
    }
    $insert = array(
	'x' => $x,
	'y' => $y,
	'type' => $type,
	'accessable' => $ac,
	'res' => $res,
	);
    
    //$db->execute("INSERT INTO `ezrpg`.`<ezrpg>map` (`x` ,`y` ,`type` ,`accessable`, `res`) VALUES ('$x', '$y', '$type', '$ac', '$res')");
    $db->insert('<ezrpg>map',$insert);
  }
}
echo "time taken: ".(time()-$time). "seconds";
?>