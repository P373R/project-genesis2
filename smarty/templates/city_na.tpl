{include file="header.tpl" TITLE="Home"}

<h1>City</h1>
<b>You are not in Atlantis.</b><br />

{if $player->energy >= 1} <a href="index.php?mod=City&amp;act=go_atlantis">Return to Atlantis now</a>{/if}
<p>
<a href="index.php?mod=Library">Access the Library</a>
</p>
{include file="footer.tpl" TITLE="Home"}