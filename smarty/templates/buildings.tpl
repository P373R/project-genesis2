{include file="header.tpl" TITLE="Buidings"}

<h1>Buildings on {$player->x}/{$player->y}</h1>

<table>
{foreach from=$buildings item=build}
<tr>
  <td>Picture</td>
  <td>{$build->name}</td>
</tr>
{/foreach}
</table>
{include file="footer.tpl"}