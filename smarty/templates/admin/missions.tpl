{include file="admin/header.tpl" TITLE="Admin Mission"}
<h1>Missions CP</h1>
<a href="index.php?mod=Missions&act=add">[Add New Mission]</a>
<table width="90%">
  <tr>
    <th style="text-align: left;">Title</th>
    <th style="text-align: left;">Description</th>
    <th style="text-align: left;">Action</th> 
  </tr>

{foreach from=$mission item=mission}
  <tr>
    <td>{$mission->title}</td>
    <td>{$mission->description}</td>
    <td><a href="index.php?mod=Missions&act=edit&id={$mission->id}">[Edit]</a> <a href="index.php?mod=Missions&act=del&id={$mission->id}">[Delete]</a></td>
  </tr>
{/foreach}
</table>
{include file="admin/footer.tpl"}