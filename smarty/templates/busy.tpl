{include file="header.tpl" TITLE="Ship is busy"}
<center>

<img src="bar.php?width=350&amp;height=30&amp;type=busy&amp;busy={$player->ship->busy}&amp;start={$player->ship->start}" alt="Ship is busy"/>

<div id="shipBusyBar"></div>
<p>Busy until: {$player->ship->busy|date_format:'%T'}</p>
</center>
{include file="footer.tpl"}