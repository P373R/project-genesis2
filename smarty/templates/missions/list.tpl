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
 <td>{$mission->name}<br /><i>
 {if $mission->redo == '1'}redoable{else}one time{/if}
 </i>
 </td>
 <td>
<table class="inlist"><tr><td>Energy</td><td>{$mission->energy}</td></tr>
       <tr><td>Shield</td><td>{$mission->shield}</td></tr>
       <tr><td>Minimal GWP </td><td>{$mission->min_gwp}</td></tr>
       <tr><td>Minimal Accuracy </td><td>{$mission->accuracy}</td></tr>
</table>
 </td>
 <td>
<table class="inlist"><tr><td>GWP</td><td>{$mission->gwp}</td></tr>
       <tr><td>Gold</td><td>{$mission->gold}</td></tr>
       <tr><td>EXP</td><td>{$mission->exp}</td></tr>
</table>
 <td><span>{$mission->duration} </span>seconds</td>
  <td><a href="index.php?mod=Missions&amp;domission={$mission->id}">Accept Mission</a></td>
</tr>
{/foreach}
</table>
{include file="footer.tpl"}