<style type="text/css">
</style>
{include file="header.tpl" TITLE="Missions"}
<head>
<h1>Missions</h1>

<table width="90%" style="height: 77" frame="border" bordercolor="#0000FF">
  <tr>
    <th style="text-align: left; height: 33px;">Name</th>
    <th style="text-align: left; height: 33px;">Description</th>
    <th style="text-align: left; height: 33px;">Requirement</th>
    <th style="text-align: left; height: 33px;"> Action</th>
  </tr>

{foreach from=$mission item=mission}
  <tr>
  	<td>{$mission->title}</td>
    <td>{$mission->description}</td>
    <td><strong>Strength:</strong>{$mission->strneeded} <br /><strong>Agility:</strong> {$mission->agineeded} <br /> 
	<strong>Dexterity:</strong> {$mission->dexneeded} <br /><strong>Vitality:</strong> {$mission->vitneeded}</td>
    <td><a href="index.php?mod=Missions&act=do&id={$mission->id}">[Attempt]</a><a href="index.php?mod=Missions&act=show&id={$mission->id}">[Details]</a></td>
  </tr>
{/foreach}
</table>

</head>
{include file="footer.tpl"}
