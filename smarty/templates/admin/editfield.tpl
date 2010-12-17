{include file="admin/header.tpl" TITLE="Home"}

<h1>Feld bearbeiten</h1>
<form action="index.php?mod=EditField" method="post">
<table>
<tr>
<td>X</td><td><input type="text" name="x" value="{$field->x}" size="3" /></td>
</tr> <tr>
<td>Y</td><td><input type="text" name="y" value="{$field->y}" size="3" /></td>
</tr> <tr>
<td>Type</td><td><input type="text" name="type" value="{$field->type}" size="3" /></td>
</tr> <tr>
<td>Res</td><td><input type="text" name="res" value="{$field->res}" size="3" /></td>
</tr> <tr>
<td>Count</td><td><input type="text" name="count" value="{$field->count}" size="3" /></td>
</tr> <tr>
<td>Accessable</td><td><input type="text" name="accessable" value="{$field->accessable}" size="3" /></td>
</tr> <tr>
<td>Owner</td><td><input type="text" name="owner" value="{$field->owner}" size="3" /></td>
</tr> <tr>
<td>Buildings</td><td><textarea name="buildings">{$field->buildings}</textarea></td>
</tr>
</table>
<input type="hidden" value="{$field->id}" name="id" />
<input type="submit" />
</form>
{include file="admin/footer.tpl"}