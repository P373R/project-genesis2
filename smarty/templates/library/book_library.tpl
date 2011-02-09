{include file="header.tpl" TITLE=" Library"}
<h1>Library</h1>
<ul>
{foreach from=$books item=book}
<li><a href="index.php?mod=Library&amp;book={$book->id}&amp;chapter=0">{$book->name}</a></li>
{/foreach}
</ul>

{include file="footer.tpl"}