{include file="header.tpl" TITLE="Map"}

<h1>Map</h1>

<div class="left">
  <table id="map">
    {foreach from=$map item=mapline}
      <tr>
      {foreach from=$mapline item=field}
	<td background="static/images/map/{$field->type}.png" width="80" height="80" valign="middle" align="center">
	  <img src="static/images/fields/{$field->res}.png" alt="{$field->x}/{$field->y}" /><br />
	  {if $field->owner != 0}<small>{$field->owner}</small>{/if}
	  <!--<small>{$field->x}/{$field->y}</small>-->
	</td>
      {/foreach}
      </tr>
    {/foreach}
  </table>
</div>

<div class="right">
<small>Coordinates: {$player->x}/{$player->y} <br />
Area: {$fieldinfo->name}<br />
Resource: {$fieldinfo->res}<br />
Claimed by: {$fieldinfo->owner_db->username}<br />
</small>
<strong>Actions</strong><br />
<ul>
 {if $fieldinfo->owner == $player->id || $fieldinfo->owner == 0}
  <li><a href="index.php?mod=Map&amp;act=seek">search area</a></li>
  <li><a href="index.php?mod=Map&amp;act=gather">gather resource</a></li>
 {/if}
</ul>
<table>
<tr>
  <td><a href="index.php?mod=Map&amp;act=go&amp;dir=nw"><img src="static/images/gui/leftup.png" /></a></td>
  <td><a href="index.php?mod=Map&amp;act=go&amp;dir=n"><img src="static/images/gui/up.png" /></a></td>
  <td><a href="index.php?mod=Map&amp;act=go&amp;dir=ne"><img src="static/images/gui/rightup.png" /></a></td>
</tr>
<tr>
  <td><a href="index.php?mod=Map&amp;act=go&amp;dir=w"><img src="static/images/gui/left.png" /></a></td>
  <td>
   {if $player->energy>1 && $field->id == 0}
     <a href="index.php?mod=Map&amp;act=secure"><img src="static/images/gui/guard.png" /></a>
   {else if $player->hp>9 && $player->id != $field->ower}
     <a href="index.php?mod=Map&amp;act=attack"><img src="static/images/gui/attack.png" /></a>
   {/if}
  </td>
  <td><a href="index.php?mod=Map&amp;act=go&amp;dir=e"><img src="static/images/gui/right.png" /></a></td>
</tr>
<tr>
  <td><a href="index.php?mod=Map&amp;act=go&amp;dir=sw"><img src="static/images/gui/leftdown.png" /></a></td>
  <td><a href="index.php?mod=Map&amp;act=go&amp;dir=s"><img src="static/images/gui/down.png" /></a></td>
  <td><a href="index.php?mod=Map&amp;act=go&amp;dir=se"><img src="static/images/gui/rightdown.png" /></a></td>
</tr>
</table>
Player on this field:<br />
<ul>
{foreach from=$player_list item=pl}
<li><a href="index.php?mod=MailBox&amp;act=compose&amp;rec={$pl->username}">{$pl->username}</a></li>
{/foreach}
</ul>
</div>

{include file="footer.tpl"}