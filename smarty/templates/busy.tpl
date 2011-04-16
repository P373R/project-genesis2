{include file="header.tpl" TITLE="Ship is busy"}
<center>
<img id="busyBar" src="/static/images/loading.gif" alt="Ship is busy"/>
<img src="/static/images/loading.gif" width=0 height=0 onload="reloadBar('bar.php?width=350&height=30&type=busy&busy={$player->ship->busy}&start={$player->ship->start}','busyBar');">

<p>Busy until: <b>{$player->ship->busy|date_format:'%T'}</b></p>
</center>
{include file="footer.tpl"}