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
        <div id="headerTitle">
	    <img src="static/images/gui/header_beta.png" alt="Project Genesis2" width="565" height="55"/>
	    <img id="ajaxLoading" src="/static/images/loading.gif" width="16" heigth="16" />
	</div>
        <div id="headerTimebar">
	    Time <span id="theTime"></span> | 
	    Next round {$TICK|date_format:'%T'} | Round {$TICKCOUNT} |
	    <strong>Player online</strong>: {$ONLINE}
	</div>
</div>

<div id="nav">
        <ul>
        <li><a href="index.php">Home</a></li>
    {if $LOGGED_IN == 'TRUE'}
        <li><a href="index.php?mod=Ship">Ship</a></li>
        <li><a href="index.php?mod=City">City</a></li>
        <li><a href="index.php?mod=Stock">Stock</a></li>
        <li><a href="index.php?mod=MailBox">Messages</a></li>
	<li><a href="index.php?mod=AccountSettings">Settings</a></li>
        <li><a href="index.php?mod=Logout">Log Out</a></li>
    {else}
	<li><a href="index.php?mod=Register">Register</a></li>
    {/if}
	<li><a href="index.php?mod=Community">Community</a></li>
	</ul>
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
    <div id="progressExp" class="ProgressBar"></div>

    Energy: {$player->energy} / {$player->max_energy}<br />
    <div id="progressEnergy" class="ProgressBar"></div>

    GWP: {$player->gwp}<br />
    <div id="progressGWP" class="ProgressBar"></div>

    Ship: {$player->ship->shield} / {$player->ship->max_shield}<br />
    <div id="progressShip" class="ProgressBar"></div>

    City: {$player->city->shield} / {$player->city->max_shield}<br />
    <div id="progressCity" class="ProgressBar"></div>


    <ul>
	{if $SUBMENU == 'ship'}
	<li><a href="index.php?mod=Dock">Dock</a></li> 
	<li><a href="index.php?mod=World">World</a></li>
	<li><a href="index.php?mod=Missions">Missions</a></li>
	<li><a href="index.php?mod=Puzzles">Puzzles</a></li>
	<li><a href="index.php?mod=Battle">Battle</a></li>
	<li><a href="index.php?mod=Badges">Badges</a></li>
	{elseif $SUBMENU == 'city'}
	<li><a href="index.php?mod=Buildings">Buildings</a></li>
	<li><a href="index.php?mod=Mining">Mining</a></li> 
	<li><a href="index.php?mod=Library">Library</a></li>
	{else}
	{/if}
    </ul>



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

