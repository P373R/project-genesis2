{include file="header.tpl" TITLE="Home"}

<h1>Home</h1>

<div class="left">
<p>
<strong>Benutzer</strong>: {$player->username}<br />
<strong>Level</strong>: {$player->level}<br />
<strong>Email</strong>: {$player->email}<br />
<strong>Registriert</strong>: {$player->registered|date_format:'%B %e, %Y %l:%M %p'}<br />
<strong>Siege/Niederlagen</strong>: {$player->kills}/{$player->deaths}<br />
<br />
{if $player->stat_points > 0}
Du hast noch Statuspunkte zu vergeben!<br />
<a href="index.php?mod=StatPoints"><strong>Jetzt verteilen!</strong></a>
{/if}
</p>
</div>


<div class="right">
<p>
<strong>Level</strong>: {$player->level}<br />
<strong>Geld</strong>: {$player->money}<br />
<br />
<strong>Stärke</strong>: {$player->strength}<br />
<strong>Schild</strong>: {$player->vitality}<br />
<strong>Geschwindigkeit</strong>: {$player->agility}<br />
<strong>Genauigkeit</strong>: {$player->dexterity}<br />
</p>
</div>

{include file="footer.tpl"}