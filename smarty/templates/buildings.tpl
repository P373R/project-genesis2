{include file="header.tpl" TITLE="Gebäude"}

<h1>Infrastruktur auf {$player->x}/{$player->y}</h1>

<table>
{foreach from=$buildings item=build}
<tr>
  <td>Bild</td>
  <td>{$build->name}</td>
</tr>
{/foreach}
</table>
{include file="footer.tpl" TITLE="Home"}