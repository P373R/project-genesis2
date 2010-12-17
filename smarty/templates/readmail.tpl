{include file="header.tpl" TITLE="Lese Mail"}
<head>


<th><br><strong>Von: </strong>{$mailbox2->subject}</th>
<strong>

<th><br>Empfangen: </strong> {$mailbox2->date}<br /><a href='index.php?mod=MailBox&act=compose&to={$mailbox2->from}'>Antworten</a>

<br>
<br />
<a href='index.php?mod=MailBox&act=delete&id={$mailbox2->id}'>Löschen</a>
<br />
<div style="height: 158px">
<tr>{$mailbox2->message}</tr>
</div>
<br>

</head>
{include file="footer.tpl"}