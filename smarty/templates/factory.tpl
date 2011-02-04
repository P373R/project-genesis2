{include file="header.tpl" TITLE="Factory"}

<h1>Factory</h1>

<table>
<tr>
  <td colspan="2" align="center"><b>Modifications</b></td>
</tr>
{if $mods}
  {foreach from=$mods item=mod}

<tr>
  <td><img src="$mod->img" alt="$mod->name" /></td>
  <td><b>$mod->name</b><br />
      $mod->cost Gold<br />
      $mod->time Ticks<br />
  </td>
</tr>

  {/foreach} 
{else}
<tr>
  <td colspan="2">No modifications available</td>
</tr>
{/if}
</table>
{include file="footer.tpl"}