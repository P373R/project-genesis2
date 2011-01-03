{include file="header.tpl" TITLE="Schiff"}

<h1>Schiff</h1>

<div id="game-left">
<table>
 <tr><td colspan="2"><h3>Waffen</h3></td></tr>

 {foreach from=$weapons.0 item=weapon}
 <tr><td>Slot</td><td>{$weapon}</td></tr>
 {/foreach}

</table>
</div>

<div id="game-right">
<table>
 <tr><td colspan="3"><h3>Cargo</h3></td></tr>
{foreach from=$cargo item=carg}
 <tr><td>{$iteration}</td><td></td><td>use</td></tr>
{/foreach}
</table>
</div>



{include file="footer.tpl"}