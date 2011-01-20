{include file="header.tpl" TITLE=" Library"}

<h1>{$book->name}</h1>

<p>
{if $book->chapterId != 0}<a href="index.php?mod=Library&amp;book={$book->id}&amp;chapter={$book->chapterId-1}">&lt; Chapter {$book->chapterId}</a>{/if}

Chapter {$book->chapterId+1}

{if $book->chapterId < $book->chapterCount}<a href="index.php?mod=Library&amp;book={$book->id}&amp;chapter={$book->chapterId+1}">Chapter {$book->chapterId+2} &gt;</a>{/if}
</p>
<p>
{$book->chapter}
</p>
{include file="footer.tpl"}