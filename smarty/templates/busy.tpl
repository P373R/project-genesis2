{include file="header.tpl" TITLE="Map"}
<h1>Map</h1>
<center>
<img src="http://genesis/bar.php?width=350&amp;height=30&amp;type=busy" width="350" height="30" alt="Ship is busy"/>
<p>Busy until: {$player->ship->busy|date_format:'%T'}</p>
</center>
{include file="footer.tpl"}