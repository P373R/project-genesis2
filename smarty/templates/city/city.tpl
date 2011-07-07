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
	<p>Habitats<br />
		A Habitat gives room to 50 Inhabitants. Those people will be able o do waork in your city.<br />
		<br />
		You have {$player->city->habitats} habitats wich will come to a total of {$player->city->habitats*50} habitants.
	</p>
    </div>
    <div id="tabs-factories">
	<p>Factories<br />
		Factories are used to create stuff. When people are working here they will produce goods out of resources.
	</p>
    </div>
    <div id="tabs-farms">
	<p>Farms<br />
		To feed the people in your habitats you need food that is produced here.
	</p>
    </div>
    <div id="tabs-university">
	<p>University<br />
		You have to teach you Habitants to produce better stuff. You can educate them here.
	</p>
    </div>
    <div id="tabs-storage">
	<p>Storage<br />
		To store resources, goods and food you have to build storage space.
	</p>
    </div>
    <div id="tabs-power">
	<p>Power<br />
		To power your city you have to build a power plant.
	</p>
    </div>

</div>
{include file="footer.tpl"}