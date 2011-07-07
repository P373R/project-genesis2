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
<img id="worldShipEntity" src="/static/images/entities/sub.png" width="64" height="15" style="position:absolute;" />

<script>
var entities =  jQuery.parseJSON('{$entities}');
var offset = $("#worldLeftCorner").offset();
var bigoffset = jQuery.parseJSON('{$worldPictureOffset}');
$(".worldTile").dblclick(function(e) { worldMoveShip(e.pageX , e.pageY);  });
$("#worldShipEntity").css('top',(entities.ship.y+offset.top+240-($("#worldShipEntity").height()/2)));
$("#worldShipEntity").css('left',(entities.ship.x+offset.left+240-($("#worldShipEntity").width()/2)));
</script>

{include file="footer.tpl"}