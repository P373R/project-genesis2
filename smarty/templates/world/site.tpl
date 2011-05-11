{include file="header.tpl" TITLE="Ship is busy"}

<script language="Javascript">

$(document).ready(function() { 
    console.log("start "+{$player->ship->x}+"/"+{$player->ship->y}); 
    position({$player->ship->x},{$player->ship->y}); 
});

</script>
<div id="world" style="width:360px; height:360px;overflow:hidden;">
{$world}
</div>

{include file="footer.tpl"}