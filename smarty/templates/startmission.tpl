
{include file="header.tpl" TITLE="Mission Start"}
<body onclick="ggg">

<h2>{$mission->title} | Start</h2>

<div>{$mission->start}</div>
<p>
<a href="index.php?mod=Missions&act=next&id={$mission->id}"><input name="Next" type="button" value="Next" ></a>
{include file="footer.tpl"}