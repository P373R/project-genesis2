{include file="header.tpl" TITLE="Logbuch"}

<h1>Logbuch</h1>

{if $logs}
	<!--<form method="post" action="index.php?mod=EventLog&act=clear">
	<input type="submit" value="Clear Messages" />
	</form>-->
	<span class="space"></span>

	{foreach from=$logs item=log}
		<div class="block">
		{if $log->status == 0}
			<span class="red"><strong>{$log->time|date_format:'%B %e, %Y %l:%M %p'}</strong></span>
		{else}
			{$log->time|date_format:'%B %e, %Y %l:%M %p'}
		{/if}
		<span class="space"></span>
		{$log->message}
		<span class="space"></span>
		</div>
	{/foreach}
	<center>
	{if $next != 0}
	<a href="index.php?mod=EventLog&page={$page+1}">&lt;&lt; vorherige</a>
	{else}
	vorherige
	{/if}
	|
	{if $page != 0}
	<a href="index.php?mod=EventLog&page={$page-1}">neuere &gt;&gt;</a>
	{else}
	neuere
	{/if}
	</center>
{else}
	<p>
	<strong>You have no log messages!</strong>
	</p>
{/if}

{include file="footer.tpl"}