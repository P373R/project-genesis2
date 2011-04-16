<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta name="Description" content="ezRPG Project, the free, open source browser-based game engine!" />
<meta name="Keywords" content="ezrpg, game, game engine, pbbg, browser game, browser games, rpg, ezrpg project" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Distribution" content="Global" />
<meta name="Robots" content="index,follow" />
{if $reload != ''} <meta http-equiv="refresh" content="{$reload}" > {/if}
<script src="/static/default/system.js" type="text/javascript"></script>
<link rel="stylesheet" href="static/default/style.css" type="text/css" />       
<title>Project-Genesis2 :: {$TITLE|default:""}</title>
</head>
<body>

<div id="wrapper">

<div id="header">
        <span id="title"><img src="static/images/gui/header_beta.png" alt="Project Genesis2" /></span>
        <center>Time <span id="theTime"></span> | 
		Next round {$TICK|date_format:'%T'} | Round {$TICKCOUNT} |
		<strong>Player online</strong>: {$ONLINE}</center>
</div>

<div id="nav">
        <ul>
        {if $LOGGED_IN == 'TRUE'}
        <li><a href="index.php">Home</a></li>
        <li><a href="index.php?mod=Map">Map</a></li>
        <li><a href="index.php?mod=Ship">Ship</a></li>
        <li><a href="index.php?mod=Missions">Missions</a></li>
        <!--<li><a href="index.php?mod=MailBox">Mail</a></li>-->
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
<img src="bar.php?width=135&amp;type=exp&amp;max_exp={$player->max_exp}&amp;exp={$player->exp}" alt="EXP: {$player->exp} / {$player->max_exp}" /><br />
<img src="bar.php?width=135&amp;type=hp&amp;hp={$player->hp}&amp;vitality={$player->vitality}" alt="HP: {$player->hp} / {$player->vitality}" /><br />
<img src="bar.php?width=135&amp;type=energy&amp;energy={$player->energy}&amp;max_energy={$player->max_energy}" alt="Energy: {$player->energy} / {$player->max_energy}" /><br />
<img src="bar.php?width=135&amp;type=manual&amp;val1=100&amp;val2={$player->gwp}&amp;color={if $player->gwp >= 50}green{else}red{/if}&amp;title=GWP&amp;numbers=true" alt="GWP: {$player->gwp}" /><br />
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
{if $BUSY}
<img src="/static/images/loading.gif" width=0 height=0 onload="reloadBar('bar.php?width=135&height=15&type=busy&busy={$player->ship->busy}&start={$player->ship->start}','busyBarSmall');">
<img onerror="document.getElementById('busyBarSmall').style.display = 'none';" id="busyBarSmall" src="bar.php?width=135&amp;height=15&amp;type=busy&amp;busy={$player->ship->busy}&amp;start={$player->ship->start}" alt="Ship is busy"/>
{/if}
{if $new_logs > 0}
<a href="index.php?mod=EventLog" class="red"><strong>{$new_logs} new Events</strong></a>
{/if}
<h3>Shortmessages</h3>
<form method="POST">
<input class="shortinput" type="text" name="shout" /><br />
<input class="shortinput" type="submit" value="SHOUT"/>
</form>
<div id="shoutbox">
{foreach from=$shouts item=shout}
<small>{$shout.time|date_format:'%m/%d/%y %R'}</small><br/>
<b><a href="http://genesis/index.php?mod=MailBox&act=compose&rec={$shout.from}">{$shout.from}</a></b>:
{$shout.text}<br />
{/foreach}
</div>
</div>
{/if}

<div id="{if $LOGGED_IN == 'TRUE'}gamebody{else}body{/if}">

{if $GET_MSG != ''}
<div class="msg">
    <span class="red"><strong>{$GET_MSG}</strong></span>
</div>
<span class="space"></span>
{/if}

{if $tutorial}
 {include file='tutorial.tpl'}
{/if}
