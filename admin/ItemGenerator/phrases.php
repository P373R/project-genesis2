<?php
/**
 * Generate Item Names for DB Items
 * 
 * File that contains the phrases to build item names form
 *
 * @category   AdminModules
 * @author     Bastian Neumann <neumann.bastian@gmail.com>
 *
 * @license    GPL3.0
 * @link       http://dev.project-genesis2.de 
 *
 * @package    Modules
 * @subpackage Admin
 */
//defined('IN_EZRPG') or exit;

$name[] = "Helm";
$name[] = "Sword";
$name[] = "Stone";
$name[] = "Lump";
$name[] = "Cartidge";
$name[] = "Hook";
$name[] = "Tristar";
$name[] = "Feather";
$name[] = "Cap";
$name[] = "Crystal";
$name[] = "Wire";
$name[] = "Disc";
$name[] = "Tube";
$name[] = "Book";
$name[] = "Map";

$adj[] = "great";
$adj[] = "super";
$adj[] = "awesome";
$adj[] = "infinite";
$adj[] = "unbeatable";
$adj[] = "nuclear";
$adj[] = "crystalised";
$adj[] = "normal";
$adj[] = "greater";
$adj[] = "materialised";
$adj[] = "alien";
$adj[] = "strange";

$nomen[] = "Destiny";
$nomen[] = "Strength";
$nomen[] = "Liability";
$nomen[] = "Power";
$nomen[] = "Freedom";
$nomen[] = "Energy";

//$phrase = $name[rand(0,(count($name)-1))]." of ".$adj[rand(0,(count($adj)-1))]." ".$nomen[rand(0,(count($nomen)-1))]."\n";

$count = 0;
for($i=0; $i<count($name); $i++) {
	for($j=0; $j<count($adj); $j++) {
		for($k=0; $k<count($nomen); $k++) {
		    echo $name[$i]." of ".$adj[$j]." ".$nomen[$k]."\n";
		    $count++;
		    echo ucfirst($adj[$j])." ".$name[$i]." of ".$nomen[$k]."\n";
		    $count++;
		}
	}
}
echo $count."\n";
?>