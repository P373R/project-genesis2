
{include file="header.tpl" TITLE="Mission Briefing"}
<body>

<h1>Mission Briefing</h1>

<br />
	<div style="width: 285px">
		<strong>Mission Title:</strong>"{$mission->title}"</div>

	<strong>Chance of success: </strong>{$chance}<strong><br />
	Strength required: </strong>{$mission->strneeded}<strong><br />
	Agility required: </strong>{$mission->agineeded}<strong><br />
	Vitality required: </strong>{$mission->vitneeded}<strong><br />
	Dexterity required: </strong>{$mission->dexneeded}<strong><br />
	Description:</strong>
	<div style="width: 345px; height: 66px;">
{$mission->description}
	</div>
<a href="index.php?mod=Missions&act=do&id={$mission->id}">[Attempt]</a>

</body>

{include file="footer.tpl"}
