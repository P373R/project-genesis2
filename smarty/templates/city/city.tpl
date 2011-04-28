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
		<li><a href="#tabs-player">Player</a></li> 
		<li><a href="#tabs-world">World</a></li> 
		<li><a href="#tabs-mining">Mining</a></li> 
	</ul> 

    <div id="tabs-player">
	<p>
	<ul>
	    <li><a href="index.php?mod=EventLog">Event Log</a></li>
	    <li><a href="index.php?mod=AccountSettings">Account Settings</a></li>
	</ul>
	</p>
    </div>

    <div id="tabs-world">
	<p>
	<ul>
	    <li><a href="index.php?mod=Library">Library</a></li>
	    <li><a href="index.php?mod=Members">Members List</a></li>
	    <li><a href="index.php?mod=Members&amp;sort=top">Top Players</a></li>
	    <li>Game Statistics</li>
	<ul>
	</p>
    </div>

    <div id="tabs-mining">
	<p>
	    <table>
	    <th>
		<td>Mine</td>
		<td>Actions</td>
	    </th>
	    <tr>
		<td>Oxygen Mine</td>
		<td></td>
	    </tr>
	    <tr>
		<td>Water Mine</td>
		<td></td>
	    </tr>
	    <tr>
		<td>Iron Mine</td>
		<td></td>
	    </tr>
	    <tr>
		<td>Aluminium Mine</td>
		<td></td>
	    </tr>
	    <tr>
		<td>Titanium Mine</td>
		<td></td>
	    </tr>
	    </table>
	</p>
    </div>

</div>

{include file="footer.tpl"}