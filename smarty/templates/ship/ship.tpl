{include file="header.tpl" TITLE="Ship"}

<h1>Ship</h1>

<img src="static/images/gui/sub.png" width="330" height="74" align="left"/>
{$shipvalues}
<hr />
<table id="shiptable">
<tr>
 <td><b>Propulsion {$player->ship->propulsion}</b></td>
 <td><b>Gearbox {$player->ship->gearbox}</b></td>
</tr>
<tr>
 <td>{$propulsion.name}<p>{$propulsion.desc}</p><a href="index.php?mod=Ship&amp;upgrade=propulsion">upgrade</a><br /></td>
 <td>{$gearbox.name}<p>{$gearbox.desc}</p><a href="index.php?mod=Ship&amp;upgrade=gearbox">upgrade</a><br /></td>
</tr>

<tr>
 <td><b>Energy {$player->ship->energy}</b></td>
 <td><b>Engine {$player->ship->engine}</b></td>
</tr>
<tr>
 <td>{$energy.name}<p>{$energy.desc}</p><a href="index.php?mod=Ship&amp;upgrade=energy">upgrade</a><br /></td>
 <td>{$engine.name}<p>{$engine.desc}</p><a href="index.php?mod=Ship&amp;upgrade=engine">upgrade</a><br /></td>
</tr>

<tr>
 <td><b>Navigation {$player->ship->navigation}</b></td>
 <td><b>Sonar {$player->ship->sonar}</b></td>
</tr>
<tr>
 <td>{$navigation.name}<p>{$navigation.desc}</p><a href="index.php?mod=Ship&amp;upgrade=navigation">upgrade</a><br /></td>
 <td>{$sonar.name}<p>{$sonar.desc}</p><a href="index.php?mod=Ship&amp;upgrade=sonar">upgrade</a><br /></td>
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
*}
<tr>
 <td clospan="2"><b>Cargo</b></td>
</tr>
<tr>
 <td clospan="2">
 <ul>
 {foreach from=$cargolist item=cargo}
 <li>{$cargo.name}</li>
 {/foreach}
 </ul>
 </td>
</tr>

</table>

{include file="footer.tpl"}