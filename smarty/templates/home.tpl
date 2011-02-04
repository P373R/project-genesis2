{include file="header.tpl" TITLE="Home"}

<h1>Home</h1>

<div class="left">
<p>
<strong>User</strong>: {$player->username}<br />
<strong>Level</strong>: {$player->level}<br />
<strong>Registered</strong>: {$player->registered|date_format:'%B %e, %Y %l:%M %p'}<br />
<strong>Wins/Looses</strong>: {$player->kills}/{$player->deaths}<br />
<br />
{if $player->stat_points > 0}
You can upgrade your ship!<br />
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