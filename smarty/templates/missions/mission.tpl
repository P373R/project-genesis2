{include file="header.tpl" TITLE="Missions"}

<h1>{$mission->name}</h1>
<i>{$mission->description}</i>
<table width="100%">
<tr><th colspan="2">Requires</th></tr>
<tr>
 <td><small>Minimal GWP</small></td>
 <td>{$mission->min_gwp}</td>
</tr>
<tr>
 <td><small>Energy</small></td>
 <td>{$mission->energy}</td>
</tr>
<tr>
 <td><small>Shield</small></td>
 <td>{$mission->shield}</td>
</tr>
<tr>
 <td><small>Accuracy</small></td>
 <td>{$mission->accuracy}</td>
</tr>
<tr><th colspan="2">Reward</th></tr>
<tr>
 <td><small>Gold</small></td>
 <td>{$mission->gold}</td>
</tr>
<tr>
 <td><small>GWP</small></td>
 <td>{$mission->gwp}</td>
</tr>
<tr>
 <td><small>EXP</small></td>
 <td>{$mission->exp}</td>
</tr>
<tr><th colspan="2">Duration<span> : {$mission->duration} </span> seconds</th></tr>
<tr><th colspan="2"><a href="index.php?mod=Missions&amp;domission={$mission->id}&amp;accept">Accept Mission</a></th></tr>
</table>
{include file="footer.tpl"}