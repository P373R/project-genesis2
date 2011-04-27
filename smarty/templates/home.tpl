{include file="header.tpl" TITLE="Home"}

<h1>Home</h1>

<div class="left">
<p>
<b>News</b>
<ul>
<li><small>04/16/2011</small><br />
    Have a look at the <a href="index.php?mod=Ship">ship upgrades</a>! They have been improoved a lot.</li>
<li><small>02/04/2011</small><br />
    Introducing ship upgrades. Spend your Levelponits improving your <a href="index.php?mod=Ship">ship</a></li>
<li><small>12/10/2010</small><br />
    Introducing the world. Go and look what you can <a href="index.php?mod=Map">find</a></li>
</ul>
<br />
{if $player->stat_points > 0}
You can upgrade your ship! You have {$player->stat_points} points left.
<a href="index.php?mod=Ship"><strong>Spend now!</strong></a>
{/if}
</p>
</div>


<div class="right">
<h2>Ship</h2>
<table>
<tr>
<td><strong>Level</strong></td><td>{$player->level}</td>
</tr>
<tr>
<td><strong>Speed</strong></td><td>{$player->ship->speed}</td>
</tr>
<tr>
<td><strong>Accuracy</strong></td><td>{$player->ship->accuracy}</td>
</tr>
<tr>
<td><strong>Shield</strong></td><td>{$player->ship->shield}/{$player->ship->max_shield}</td>
</tr>
</table>
<h2>City</h2>
<table>
<tr>
<td><strong>Location</strong></td><td>{$player->city->x}/{$player->city->y}</td>
</tr>
<tr>
<td><strong>Name</strong></td><td>{$player->city->name}</td>
</tr>
<tr>
<td><strong>Inhabitants</strong></td><td>{$player->city->inhabitants}</td>
</tr>
<tr>
<td><strong>Shield</strong></td><td>{$player->city->shield}</td>
</tr>
<tr>
<th colspan="2">Mining</th>
</tr>
<tr>
<td><strong>Water</strong></td><td>{$player->city->mine_water}/10min</td>
</tr>
<tr>
<td><strong>Iron</strong></td><td>{$player->city->mine_iron}/10min</td>
</tr>
<tr>
<td><strong>Aluminium</strong></td><td>{$player->city->mine_aluminium}/10min</td>
</tr>
<tr>
<td><strong>Titan</strong></td><td>{$player->city->mine_titan}/10min</td>
</tr>
<tr>
<td><strong>Oxygen</strong></td><td>{$player->city->mine_oxygen}/10min</td>
</tr>
</table>
</div>

{include file="footer.tpl"}