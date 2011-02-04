{include file="header.tpl" TITLE="Inventar"}

<h1>Inventory</h1>

<table>
{foreach from=$inventory item=item}
<tr>
  <td>{$item->name}</td>
  <td>sell {$item->id}</td>
</tr>
{/foreach}
</table>
{include file="footer.tpl"}