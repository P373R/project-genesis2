{include file="header.tpl" TITLE="Missions"}

<h1>{$mission->name}</h1>

<table>
<tr>
 <td><small>Description</small></td>
 <td><i>{$mission->description}</i></td>
</tr>
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
</table>
{include file="footer.tpl"}