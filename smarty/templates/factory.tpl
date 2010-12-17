{include file="header.tpl" TITLE="Modifikationen"}

<h1>Factory</h1>

<table>
<tr>
  <td colspan="2" align="center"><b>Modifikationen</b></td>
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
  <td colspan="2">keine Modifikationen verf&uuml;gbar</td>
</tr>
{/if}
</table>
{include file="footer.tpl" TITLE="Home"}