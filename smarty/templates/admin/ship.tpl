{include file="admin/header.tpl" TITLE="Ship"}

<h1>Ship parts</h1>
<form action="index.php?mod=Ship" method="POST">
<table>
{foreach from=$list item=item name=item_list}
<tr>
<th>ID</th><th>Type</th><th>Name</th><th>Desc</th><th>Properties</th><th>Depend</th>
</tr>
<tr>
<td><input type="text" name="id[{$smarty.foreach.item_list.iteration}]" style="width: 20px;" value="{$item->id}" /></td>
<td><input type="text" name="type[{$smarty.foreach.item_list.iteration}]" style="width: 70px;" value="{$item->type}" /></td>
<td><input type="text" name="name[{$smarty.foreach.item_list.iteration}]" style="width: 150px;" value="{$item->name}" /></td>
<td><textarea cols="30" rows="5" name="desc[{$smarty.foreach.item_list.iteration}]">{$item->desc}</textarea></td>
<td><textarea cols="30" rows="5" name="properties[{$smarty.foreach.item_list.iteration}]">{$item->properties}</textarea></td>
<td><textarea cols="30" rows="5" name="depend[{$smarty.foreach.item_list.iteration}]">{$item->depend}</textarea></td>
</tr>
{/foreach}
<tr>
<td><input type="text" name="id[{$smarty.foreach.item_list.iteration}]" style="width: 20px;" value="" /></td>
<td><input type="text" name="type[{$smarty.foreach.item_list.iteration}]" style="width: 70px;" value="" /></td>
<td><input type="text" name="name[{$smarty.foreach.item_list.iteration}]" style="width: 150px;" value="" /></td>
<td><textarea cols="30" rows="5" name="desc[{$smarty.foreach.item_list.iteration}]"></textarea></td>
<td><textarea cols="30" rows="5" name="properties[{$smarty.foreach.item_list.iteration}]"></textarea></td>
<td><textarea cols="30" rows="5" name="depend[{$smarty.foreach.item_list.iteration}]"></textarea></td>
</tr>

</table>
<input type="submit" value="SAVE" />
</form>

{include file="admin/footer.tpl"}