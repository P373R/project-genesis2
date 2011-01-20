{include file="header.tpl" TITLE=" Library"}

<ul>
{foreach from=$books item=book}
<li><a href="index.php?mod=Library&amp;book={$book->id}">{$book->name}</a></li>
{/foreach}
</ul>

{include file="footer.tpl"}