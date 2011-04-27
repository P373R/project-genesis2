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
	<a href="index.php?mod=EventLog">Event Log</a><br />
	<a href="index.php?mod=AccountSettings">Account Settings</a><br />
	</p>
    </div>

    <div id="tabs-world">
	<p>
	<a href="index.php?mod=Library">Library</a>
	<a href="index.php?mod=Members">Members List</a><br />
	<a href="index.php?mod=Members&amp;sort=top">Top Players</a><br />
	Game Statistics<br />
	</p>
    </div>

    <div id="tabs-mining">
	<p>
		Mining content...
	</p>
    </div>

</div>

{include file="footer.tpl"}