{include file="header.tpl" TITLE="Map"}

<h1>Map</h1>

<div class="left">
  <table id="map">
    {foreach from=$map item=mapline}
      <tr>
      {foreach from=$mapline item=field}
	<td background="static/images/map/{$field->type}.png" width="65" height="65" valign="middle" align="center">
	  <img src="static/images/fields/{$field->res}.png" alt="{$field->x}/{$field->y}" /><br />
	  {if $field->owner != 0}<small>{$field->owner}</small>{/if}
	</td>
      {/foreach}
      </tr>
    {/foreach}
  </table>
  <form action="index.php?mod=Map" method="POST">
    Drive to <input class="smallinput" type="text" name="newX" size="2" /> / <input class="smallinput" type="text" name="newY" size="2" />
    <input class="smallinput" type="submit" value="go" />
  <form>
</div>

<div class="right">
<strong>Actions</strong><br />
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
<small>Coordinates<span>: {$player->x}/{$player->y} </span><br />
Area<span>: {$fieldinfo->name}</span><br />
Resource<span>: {$fieldinfo->res}</span><br />
Claimed by<span>: {$fieldinfo->owner_db->username}</span><br />
</small>
<ul>
 {if $fieldinfo->owner == $player->id || $fieldinfo->owner == 0}
  <li><a href="index.php?mod=Map&amp;act=seek">search area</a></li>
  <li><a href="index.php?mod=Map&amp;act=gather">gather resource</a></li>
 {/if}
</ul>

Player on this field<span>:</span><br />
<ul>
{foreach from=$player_list item=pl}
<li><a href="index.php?mod=MailBox&amp;act=compose&amp;rec={$pl->username}">{$pl->username}</a></li>
{/foreach}
</ul>
</div>

{include file="footer.tpl"}