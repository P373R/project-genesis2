{include file="header.tpl" TITLE="Coming Soon!"}

<h1>{$feature}</h1>

<p>
This feature is coming soon!
</p>

<b>
{if $release}
In fact it is planed for Release <span>{$release}</span>!
{else}
There is no fixed release date for this feature!
{/if}
</b>

{include file="footer.tpl"}