{include file="header.tpl" TITLE="Ship"}

<h1>Ship</h1>

<img src="static/images/gui/sub.png" width="550" height="124" />

<table id="shiptable">
<tr>
 <td><b>Propulsion</b></td>
 <td><b>Gearbox</b></td>
</tr>
<tr>
 <td>{$propulsion.name}<p>{$propulsion.desc}</p><a href="index.php?mod=Ship&amp;upgrade=propulsion">upgrade</a><br /></td>
 <td>{$gearbox.name}<p>{$gearbox.desc}</p><a href="index.php?mod=Ship&amp;upgrade=gearbox">upgrade</a><br /></td>
</tr>

<tr>
 <td><b>Energy</b></td>
 <td><b>Engine</b></td>
</tr>
<tr>
 <td>{$energy.name}<p>{$energy.desc}</p><a href="index.php?mod=Ship&amp;upgrade=energy">upgrade</a><br /></td>
 <td>{$engine.name}<p>{$engine.desc}</p><a href="index.php?mod=Ship&amp;upgrade=engine">upgrade</a><br /></td>
</tr>

<tr>
 <td><b>Navigation</b></td>
 <td><b>Sonar</b></td>
</tr>
<tr>
 <td>{$navigation.name}<p>{$navigation.desc}</p><a href="index.php?mod=Ship&amp;upgrade=navigation">upgrade</a><br /></td>
 <td>{$sonar.name}<p>{$sonar.desc}</p><a href="index.php?mod=Ship&amp;upgrade=sonar">upgrade</a><br /></td>
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
 <td clospan="2">Cargolist?</td>
</tr>

</table>

{include file="footer.tpl"}