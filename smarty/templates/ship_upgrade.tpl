{include file="header.tpl" TITLE="Ship"}

<h1>Ship</h1>

<img src="static/images/gui/sub/{$part}.png" width="550" height="350" />

{if $partHave->name != ''}
Your ship has a <b>{$partHave->name}</b> and can be upgraded to a <b>{$partNew->name}</b>.<br />

<p>
<table id="shiptable">
<tr>
 <td>Values now</td>
 <td>Values then</td>
</tr><tr>
 <td>{$partHave->properties}</td>
 <td>{$partNew->properties}</td>
</tr>
</table>
</p>
{if $player->stat_points > 0}
<a href="index.php?mod=Ship&amp;doupgrade={$part}">Upgrade now</a>
{else}
Not enough points to upgrade.
{/if}
{/if}
<b>{$msg}</b>

{include file="footer.tpl"}