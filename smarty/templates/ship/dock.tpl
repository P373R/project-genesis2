{include file="header.tpl" TITLE="Ship"}

<h1>Ship</h1>

<img src="static/images/gui/sub.png" width="330" height="74" align="left"/>
{$shipvalues}
<hr />
<table id="shiptable">
<tr>
 <td><b>Propulsion</b> {$player->ship->propulsion} <a href="index.php?mod=Ship&amp;upgrade=propulsion">upgrade</a></td>
 <td><b>Gearbox</b> {$player->ship->gearbox} <a href="index.php?mod=Ship&amp;upgrade=gearbox">upgrade</a></td>
</tr>
<tr>
 <td>{$propulsion->name}<p>Depend on:{$propulsion->desc}</p></td>
 <td>{$gearbox->name}<p>Depend on:{$gearbox->desc}</p></td>
</tr>

<tr>
 <td><b>Energy</b> {$player->ship->energy} <a href="index.php?mod=Ship&amp;upgrade=energy">upgrade</a></td>
 <td><b>Engine</b> {$player->ship->engine} <a href="index.php?mod=Ship&amp;upgrade=engine">upgrade</a></td>
</tr>
<tr>
 <td>{$energy->name}<p>Depend on:{$energy->desc}</p></td>
 <td>{$engine->name}<p>Depend on:{$engine->desc}</p></td>
</tr>

<tr>
 <td><b>Navigation</b> {$player->ship->navigation} <a href="index.php?mod=Ship&amp;upgrade=navigation">upgrade</a></td>
 <td><b>Sonar</b> {$player->ship->sonar} <a href="index.php?mod=Ship&amp;upgrade=sonar">upgrade</a></td>
</tr>
<tr>
 <td>{$navigation->name}<p>Depend on:{$navigation->desc}</p></td>
 <td>{$sonar->name}<p>Depend on:{$sonar->desc}</p></td>
</tr>
{*
<tr>
 <td><b>Harvester</b></td>
 <td><b></b></td>
</tr>
<tr>
 <td>{$harvester.name}<p>{$harvester.desc}</p><a href="index.php?mod=Ship&amp;upgrade=harvester">upgrade</a><br /></td>
 <td>&nbsp;</td>
</tr>

<tr>
 <td><b>Primary Weapon</b></td>
 <td><b>Secondary Weapon</b></td>
</tr>
<tr>
 <td>{$priweapon.name}<br />{$priweapon.desc}<br /></td>
 <td>{$secweapon.name}<br />{$secweapon.desc}<br /></td>
</tr>

<tr>
 <td clospan="2"><b>Cargo</b></td>
</tr>
<tr>
 <td clospan="2">
 <ul>
 {foreach $cargolist as $cargo}
 <li>{$cargo.name}</li>
 {/foreach}
 </ul>
 </td>
</tr>
*}
</table>

{include file="footer.tpl"}