{include file="header.tpl" TITLE="Atlantis"}

<h1>City</h1>

{literal}
	<script> 
	$(function() {
	    $( "#tabs" ).tabs();
	});
	</script>
{/literal}

<div id="tabs">

	<ul> 
		<li><a href="#tabs-mining">Mining</a></li> 
		<li><a href="#tabs-world">World</a></li> 
		<li><a href="index.php?mod=AccountSettings">Accounts Settings</a></li> 
	</ul> 

    <div id="tabs-world">
	<p>
	    <a href="index.php?mod=EventLog">Event Log</a><br />
	    <a href="index.php?mod=Library">Library</a><br />
	    <a href="index.php?mod=Members">Members List</a><br />
	    <a href="index.php?mod=Members&amp;sort=top">Top Players</a><br />
	    Game Statistics<br />
	</p>
    </div>

    <div id="tabs-mining">
	<p><form action="index.php?mod=City" method="POST">
	    <table>
	    <tr>
		<td>Oxygen Mine</td>
		<td>
		    <input class="shortinput" type="text" name="mine_oxygen]" value="{$player->city->mine_oxygen}" />
		</td>
	    </tr>
	    <tr>
		<td>Water Mine</td>
		<td>
		    <input class="shortinput" type="text" name="mine_water" value="{$player->city->mine_water}" />
		</td>
	    </tr>
	    <tr>
		<td>Iron Mine</td>
		<td>
		    <input class="shortinput" type="text" name="mine_iron" value="{$player->city->mine_iron}" />
		</td>
	    </tr>
	    <tr>
		<td>Aluminium Mine</td>
		<td>
		    <input class="shortinput" type="text" name="mine_aluminium" value="{$player->city->mine_aluminium}" />
		</td>
	    </tr>
	    <tr>
		<td>Titanium Mine</td>
		<td>
		    <input class="shortinput" type="text" name="mine_titan" value="{$player->city->mine_titan}" />
		</td>
	    </tr>
	    </table>
	    </form>
	</p>
    </div>

</div>

{include file="footer.tpl"}