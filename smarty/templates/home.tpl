{include file="header.tpl" TITLE="Home"}

<h1>Home</h1>

<div class="left">
<p>
<b>News</b>
<ul>
<li><small>04/16/2011</small><br />
    Have a look at the <a href="index.php?mod=Ship">ship upgrades</a>! They have been improoved a lot.</li>
<li><small>02/04/2011</small><br />
    Introducing ship upgrades. Spend your Levelponits improving your <a href="index.php?mod=Ship">ship</a></li>
<li><small>12/10/2010</small><br />
    Introducing the world. Go and look what you can <a href="index.php?mod=Map">find</a></li>
</ul>
<br />
{if $player->stat_points > 0}
You can upgrade your ship! You have {$player->stat_points} points left.
<a href="index.php?mod=Ship"><strong>Spend now!</strong></a>
{/if}
</p>
</div>


<div class="right">
<p>
<strong>Level</strong>: {$player->level}<br />
<strong>Gold</strong>: {$player->money}<br />
<br />
<strong>Strength</strong>: {$player->strength}<br />
<strong>Shield</strong>: {$player->vitality}<br />
<strong>Speed</strong>: {$player->agility}<br />
<strong>Accuracy</strong>: {$player->dexterity}<br />
</p>
</div>

{include file="footer.tpl"}