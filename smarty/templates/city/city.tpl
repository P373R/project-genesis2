{include file="header.tpl" TITLE="Atlantis"}

<h1>City</h1>

<img src="static/images/gui/city.png" width="330" height="74" align="left"/><br />

<p>Welcome to your city! </p>

{literal}
	<script> 
	$(function() {
	    $( "#tabs" ).tabs();
	});
	</script>
{/literal}

<div id="tabs">

	<ul> 
		<li><a href="#tabs-habitats">Habitats</a></li> 
		<li><a href="#tabs-factories">Factories</a></li> 
		<li><a href="#tabs-farms">Farms</a></li> 
		<li><a href="#tabs-university">University</a></li> 
		<li><a href="#tabs-storage">Storage</a></li> 
		<li><a href="#tabs-power">Power</a></li> 
	</ul> 

    <div id="tabs-habitats">
	<p>Habitats
	{$views->habitat}
	</p>
    </div>
    <div id="tabs-factories">
	<p>Factories
	{$views->factories}
	</p>
    </div>
    <div id="tabs-farms">
	<p>Farms
	{$views->farms}
	</p>
    </div>
    <div id="tabs-university">
	<p>University
	{$views->university}
	</p>
    </div>
    <div id="tabs-storage">
	<p>Storage
	{$views->storage}
	</p>
    </div>
    <div id="tabs-power">
	<p>Power
	{$views->power}
	</p>
    </div>

</div>
{include file="footer.tpl"}