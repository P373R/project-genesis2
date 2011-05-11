<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<meta name="Description" content="ezRPG Project, the free, open source browser-based game engine!" />
<meta name="Keywords" content="ezrpg, game, game engine, pbbg, browser game, browser games, rpg, ezrpg project" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Distribution" content="Global" />
<meta name="Robots" content="index,follow" />
{if $reload != ''} <meta http-equiv="refresh" content="{$reload}" > {/if}

{foreach $stylesheet as $css}
<link rel="stylesheet" href="static/css/{$css}" type="text/css" />
{/foreach}
{foreach $javascript as $js}
<script src="static/js/{$js}" type="text/javascript"></script>
{/foreach}
<title>Project-Genesis2 :: {$TITLE|default:""}</title>
</head>
<body>

<div id="wrapper">

<div id="header">
        <span id="title"><img src="static/images/gui/header_beta.png" alt="Project Genesis2" width="565" height="55"/>
			 <img id="ajaxLoading" src="/static/images/loading.gif" width="16" heigth="16" /></span>
        <center>Time <span id="theTime"></span> | 
		Next round {$TICK|date_format:'%T'} | Round {$TICKCOUNT} |
		<strong>Player online</strong>: {$ONLINE}
	</center>
</div>

<div id="nav">
        {if $LOGGED_IN == 'TRUE'}
        <ul>
        <li><a href="index.php">Home</a></li>
        <li><a href="index.php?mod=Ship">Ship</a></li>
        <li><a href="index.php?mod=City">City</a></li>
        <li><a href="index.php?mod=Community">Community</a></li>
        <li><a href="index.php?mod=AccountSettings">Settings</a></li>
        <li><a href="index.php?mod=Logout">Log Out</a></li>
        </ul>
<span class="space"></span>
	<ul>
	{if $NAVIGATION == 'ship'}
        <li><a href="index.php?mod=Bridge">Bridge</a></li>
	<li><a href="index.php?mod=Map">Map</a></li>
        <li><a href="index.php?mod=Missions">Missions</a></li>
        <li><a href="index.php?mod=Badges">Badges</a></li>
	{else if $NAVIGATION == 'city'}
        <li><a href="index.php?mod=Buildings">Buildings</a></li>
	<li><a href="index.php?mod=Mining">Mining</a></li>
        <li><a href="index.php?mod=Library">Library</a></li>
	{else}
        <li><a href="index.php?mod=Forum">Forum</a></li>
	{/if}
	</ul>
    {else}
    <ul>
    <li><a href="index.php">Home</a></li>
    <li><a href="index.php?mod=Register">Register</a></li>
    </ul>
    {/if}
</div>

<span class="space"></span>

{if $LOGGED_IN == 'TRUE'}
<div id="sidebar">

<style> 
	#progressEnergy>div { 
	    {if ($player->energy / $player->max_energy * 100) <= 5} background: red; {else} background: green; {/if} 
	}

	#progressGWP>div { 
	    {if ($player->gwp) < 50} background: black; {else} background: blue; {/if} 
	}

	#progressShip>div { 
	    {if ($player->ship->shield / $player->ship->max_shield * 100) <= 30} background: red; {else} background: green; {/if} 
	}

	#progressCity>div { 
	    {if ($player->city->shield / $player->city->max_shield * 100) <= 30} background: red; {else} background: green; {/if} 
	}
</style> 

<script> 
	$(function() {	$( "#progressExp" )   .progressbar({ value: {$player->exp / $player->max_exp * 100} });	});
	$(function() {	$( "#progressEnergy" ).progressbar({ value: {$player->energy / $player->max_energy * 100} });	});
	$(function() {	$( "#progressGWP" )   .progressbar({ value: {$player->gwp} });	});
	$(function() {	$( "#progressShip" )  .progressbar({ value: {$player->ship->shield / $player->ship->max_shield * 100} });	});
	$(function() {	$( "#progressCity" )  .progressbar({ value: {$player->city->shield / $player->city->max_shield * 100} });	});
</script> 

EXP: {$player->exp} / {$player->max_exp}<br />
<div id="progressExp"></div>

Energy: {$player->energy} / {$player->max_energy}<br />
<div id="progressEnergy"></div>

GWP: {$player->gwp}<br />
<div id="progressGWP"></div>

Ship: {$player->ship->shield} / {$player->ship->max_shield}<br />
<div id="progressShip"></div>

City: {$player->city->shield} / {$player->city->max_shield}<br />
<div id="progressCity"></div>

<table>
<tr>
  <td><strong>Gold</strong>      </td><td> {$player->money}</td>
</tr><tr>
  <td><strong>Oxygen</strong>    </td><td> {$player->city->oxygen}</td>
</tr><tr>
  <td><strong>Water</strong>    </td><td> {$player->city->water}</td>
</tr><tr>
  <td><strong>Iron</strong>     </td><td> {$player->city->iron}</td>
</tr><tr>
  <td><strong>Aluminium</strong> </td><td> {$player->city->aluminium}</td>
</tr><tr>
  <td><strong>Titanium</strong>      </td><td> {$player->city->titan}</td>
</tr>
</table>
{if $BUSY}
Ship is busy
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

