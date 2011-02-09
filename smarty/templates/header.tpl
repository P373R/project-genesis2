<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta name="Description" content="ezRPG Project, the free, open source browser-based game engine!" />
<meta name="Keywords" content="ezrpg, game, game engine, pbbg, browser game, browser games, rpg, ezrpg project" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Distribution" content="Global" />
<meta name="Robots" content="index,follow" />
{if $reload != ''} <meta http-equiv="refresh" content="{$reload}" > {/if}
<link rel="stylesheet" href="static/default/style.css" type="text/css" />       
<script type="text/javascript" src="static/default/jquery-1.4.3.js"></script>    
<script type="text/javascript" src="static/default/system.js"></script>    
<title>Project-Genesis2 :: {$TITLE|default:""}</title>
</head>
<body>

<div id="wrapper">

<div id="header">
        <span id="title"><img src="static/images/gui/header_beta.png" alt="Project Genesis2" /></span>
        <span id="time">
        <table><tr><td>Server time</td><td>{$smarty.now|date_format:'%T'}</td></tr>
               <tr><td>Next round</td><td>{$TICK|date_format:'%T'}</td></tr></table>
        <strong>Player online</strong>: {$ONLINE}</span>
</div>

<div id="nav">
        <ul>
        {if $LOGGED_IN == 'TRUE'}
        <li><a href="index.php">Home</a></li>
        <li><a href="index.php?mod=Map">Map</a></li>
        <li><a href="index.php?mod=Ship">Ship</a></li>
        <li><a href="index.php?mod=Missions">Missions</a></li>
        <li><a href="index.php?mod=MailBox">Mail</a></li>
        <li><a href="index.php?mod=City">City</a></li>
        <li><a href="index.php?mod=Logout">Log Out</a></li>
        {else}
        <li><a href="index.php">Home</a></li>
        <li><a href="index.php?mod=Register">Register</a></li>
        {/if}
        </ul>
</div>

<span class="space"></span>

{if $LOGGED_IN == 'TRUE'}
<div id="sidebar">
<img src="bar.php?width=165&type=exp" alt="EXP: {$player->exp} / {$player->max_exp}" /><br />
<img src="bar.php?width=165&type=hp" alt="HP: {$player->hp} / {$player->vitality}" /><br />
<img src="bar.php?width=165&type=energy" alt="Energy: {$player->energy} / {$player->max_energy}" /><br />
<table>
<tr>
  <td><strong>Gold</strong>      </td><td> {$player->money}</td>
</tr><tr>
  <td><strong>Water</strong>    </td><td> {$player->water}</td>
</tr><tr>
  <td><strong>Iron</strong>     </td><td> {$player->iron}</td>
</tr><tr>
  <td><strong>Aluminium</strong> </td><td> {$player->aluminium}</td>
</tr><tr>
  <td><strong>Titan</strong>      </td><td> {$player->titan}</td>
</tr>
</table>

{* Disabling new Log messages. Importent messages willbe received by mail
{if $new_logs > 0}
<a href="index.php?mod=EventLog" class="red"><strong>{$new_logs} New Log Events</strong></a>
{/if}*}
{if $new_mail > 0}
<a href="index.php?mod=Mail" class="red"><strong>{$new_mail} unread Mail</strong></a>
{/if}
</div>
{/if}

{if $GET_MSG != ''}<span class="red"><strong>{$GET_MSG}</strong></span>{/if}


<div id="{if $LOGGED_IN == 'TRUE'}gamebody{else}body{/if}">

