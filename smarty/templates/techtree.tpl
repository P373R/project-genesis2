{include file="header.tpl" TITLE="Credits"}

<table>
<tr><td>
<h1>Technologie</h1>
</td></tr>
{foreach from=$items item=item name=loop1}
{if $item.type != $lastType}
 {assign var=lastType value=$item.type}
</table>
<br />
<table class="list" width="100%">
<tr>
<th colspan="4">{$lastType}</th>
</tr>
{/if}
<tr>
<td width="5%">ID:</td>
<td width="10%">{$item.id}</td>
<td width="10%">Name:</td>
<td><b>{$item.name}</b></td>
</tr>
<tr>
<td colspan="2" width="15%">Description:</td>
<td colspan="2" width="75%">{$item.desc}</td>
</tr>
<tr>
<td colspan="2">Properties:</td>
<td colspan="2">{$item.properties}</td>
</tr>
<tr>
<td colspan="2">Depend:</td>
<td colspan="2">{$item.depend}</td>
</tr>
<tr><td colspan="4">&nbsp;</td></tr>
{/foreach}
</table>

{include file="footer.tpl"}