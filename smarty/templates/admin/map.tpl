{include file="admin/header.tpl" TITLE="Home"}

<h1>Karte</h1>

<div class="left">
  <table id="map">
    {foreach from=$map item=mapline}
      <tr>
      {foreach from=$mapline item=field}
	
	<td background="../static/images/map/{$field->type}.png" valign="middle" align="center" width="10" height="10">
	  <a href="index.php?mod=EditField&amp;x={$field->x}&amp;y={$field->y}"><img src="../static/images/fields/{$field->res}.png" alt="{$field->x}/{$field->y}" /></a>
	</td>
	
      {/foreach}
      </tr>
    {/foreach}
  </table>
</div>


{include file="admin/footer.tpl"}