{include file="header.tpl" TITLE="Ship is busy"}

<div class="worldControlls">
<a href="javascript:parent.worldMap.jumpTo({$player->ship->x},{$player->ship->y});">Ship</a>
{if $player->city->x}
<a href="javascript:parent.worldMap.jumpTo({$player->city->x},{$player->city->y});">City</a>
{/if}
{foreach $player->ship->bookmarks as $bookmark}
<a href="javascript:parent.worldMap.jumpTo({$bookmark->x},{$bookmark->y});">{$bookmark->name}</a>
{/foreach}
</div>

<div id="worldPicture">
  {$worldcode}
</div>

{*<object class="worldMap" name="worldMap" data="modules/World/map.php?x={$player->ship->x}&amp;y={$player->ship->y}" type="text/html" width="500" height="500"></object>*}

{include file="footer.tpl"}