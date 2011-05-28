{include file="header.tpl" TITLE="Ship"}

<h1>Badges</h1>

{foreach $badges as $badge name=badgelist}
<div class="left badges">
<h2>{$badge->name}</h2>
<img src="/static/images/gui/badges/{$badge->id}.png"></br>
{$badge->description}
</div>
{if $smarty.foreach.badgelist.iteration %3 == 0}<span class="space"></span> {/if}
{foreachelse}
<p><b>You do not have any badges yet.</b></p>
You can earn badges while you are solving Missions, winning Battles or solving Puzzles. There are a couple of badges out there in the sea to explore!
{/foreach}

{include file="footer.tpl"}