{include file="header.tpl" TITLE="Ship"}

<h1>Ship</h1>

<img src="static/images/gui/sub/{$part}.png" width="330" height="219" />

{if $partHave->name != ''}
<p>Your ship has a <b>{$partHave->name}</b> and can be upgraded to a <b>{$partNew->name}</b>.
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
{if $partNew->depend !=''}
<p><b>This upgrade depends on</b><br >
{$partNew->depend}</p>
{/if}
<br />
The Upgrade will take <b>{$partNew->id*10}</b> minutes and you can not move or use the map during that time!<br />
</p>
<br />
{if $player->stat_points > 0 && !$notPossible}
<a href="index.php?mod=Ship&amp;doupgrade={$part}">Upgrade now</a>
{else}
No upgrade possible.
{/if}
</p>
{/if}
<b>{$msg}</b>

{include file="footer.tpl"}