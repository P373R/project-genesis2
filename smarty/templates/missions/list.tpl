{include file="header.tpl" TITLE="Missions"}

<h1>Missions</h1>

<table class="list" width="100%">
<tr>
 <th>Name</th>
 <th>Requires</th>
 <th>Reward</th>
 <th>Duration</th>
 <th>Actions</th>
</tr>
{foreach from=$missions item=mission}
<tr>
 <td>{$mission->name}</td>
 <td>
<table class="inlist"><tr><td>Energy <span>:</span></td><td>{$mission->energy}</td></tr>
       <tr><td>Shield <span>:</span></td><td>{$mission->shield}</td></tr>
       <tr><td>Minimal GWP <span>:</span></td><td>{$mission->min_gwp}</td></tr>
</table>
 </td>
 <td>
<table class="inlist"><tr><td>GWP <span>:</span></td><td>{$mission->gwp}</td></tr>
       <tr><td>Gold <span>:</span></td><td>{$mission->gold}</td></tr>
       <tr><td>EXP <span>:</span></td><td>{$mission->exp}</td></tr>
</table>
 <td><span>{$mission->duration} </span>seconds</td>
  <td><a href="index.php?mod=Missions&amp;domission={$mission->id}">Accept Mission</a></td>
</tr>
{/foreach}
</table>
{include file="footer.tpl"}