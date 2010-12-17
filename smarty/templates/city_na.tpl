{include file="header.tpl" TITLE="Home"}

<h1>City</h1>
<b>Du befindest dich nicht in Atlantis.</b><br />

{if $player->energy >= 1} <a href="index.php?mod=City&amp;act=go_atlantis">Fahre jetzt nach Atlantis</a>{/if}

{include file="footer.tpl" TITLE="Home"}