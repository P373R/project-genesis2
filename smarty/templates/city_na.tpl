{include file="header.tpl" TITLE="Home"}

<h1>City</h1>
<b>You are not in Atlantis.</b><br />

{if $player->energy >= 1} <a href="index.php?mod=City&amp;act=go_atlantis">Return to Atlantis now</a>{/if}

{include file="footer.tpl" TITLE="Home"}