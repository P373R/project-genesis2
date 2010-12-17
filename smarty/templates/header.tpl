<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta name="Description" content="ezRPG Project, the free, open source browser-based game engine!" />
<meta name="Keywords" content="ezrpg, game, game engine, pbbg, browser game, browser games, rpg, ezrpg project" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Distribution" content="Global" />
<meta name="Robots" content="index,follow" />
<link rel="stylesheet" href="static/default/style.css" type="text/css" />	
<script type="text/javascript" src="static/default/jquery-1.4.3.js"></script>    
<script type="text/javascript" src="static/default/system.js"></script>    
<title>Project-Genesis2 :: {$TITLE|default:""}</title>
</head>
<body>

<div id="wrapper">

<div id="header">
	<span id="title"><img src="static/images/gui/header.png" alt="Project Genesis2" /></span>
	<span id="time">{$smarty.now|date_format:'%A %T'}
	<br />
	<strong>Spieler Online</strong>: {$ONLINE}</span>
</div>

<div id="nav">
	<ul>
	{if $LOGGED_IN == 'TRUE'}
	<li><a href="index.php">Home</a></li>
	<li><a href="index.php?mod=EventLog">Logbuch</a></li>
	<li><a href="index.php?mod=Map">Karte</a></li>
	<li><a href="index.php?mod=Ship">Schiff</a></li>
	<li><a href="index.php?mod=MailBox">Mail</a></li>
	<li><a href="index.php?mod=City">City</a></li>
	<li><a href="index.php?mod=Logout">Log Out</a></li>
	{else}
	<li><a href="index.php">Home</a></li>
	<li><a href="index.php?mod=Register">Registrieren</a></li>
	{/if}
	</ul>
</div>

<span class="space"></span>

{if $LOGGED_IN == 'TRUE'}
<div id="sidebar">
<img src="bar.php?width=165&type=exp" alt="EXP: {$player->exp} / {$player->max_exp}" /><br />
<img src="bar.php?width=165&type=hp" alt="HP: {$player->hp} / {$player->max_hp}" /><br />
<img src="bar.php?width=165&type=energy" alt="Energie: {$player->energy} / {$player->max_energy}" /><br />
<img src="bar.php?width=165&type=oxygen" alt="Sauerstoff: {$player->oxygen} / {$player->max_oxygen}" /><br />
<table>
<tr>
  <td><strong>Geld</strong>      </td><td> {$player->money}</td>
</tr><tr>
  <td><strong>Wasser</strong>    </td><td> {$player->water}</td>
</tr><tr>
  <td><strong>Eisen</strong>     </td><td> {$player->iron}</td>
</tr><tr>
  <td><strong>Aluminium</strong> </td><td> {$player->aluminium}</td>
</tr><tr>
  <td><strong>Titan</strong>      </td><td> {$player->titan}</td>
</tr>
</table>

{if $new_logs > 0}
<a href="index.php?mod=EventLog" class="red"><strong>{$new_logs} New Log Events</strong></a>
{/if}
{if $new_mail > 0}
<a href="index.php?mod=Mail" class="red"><strong>{$new_mail} unread Mail</strong></a>
{/if}
</div>
{/if}

<div id="{if $LOGGED_IN == 'TRUE'}gamebody{else}body{/if}">
	{if $GET_MSG != ''}<div class="msg">
	<span class="red"><strong>{$GET_MSG}</strong></span>
	</div>
	<span class="space"></span>{/if}
