{include file="header.tpl" TITLE="Read mail"}
<head>


<th><br><strong>From: </strong>{$mailbox2->subject}</th>
<strong>

<th><br>Recieved: </strong> {$mailbox2->date}<br /><a href='index.php?mod=MailBox&act=compose&to={$mailbox2->from}'>Answer</a>

<br>
<br />
<a href='index.php?mod=MailBox&act=delete&id={$mailbox2->id}'>Delete</a>
<br />
<div style="height: 158px">
<tr>{$mailbox2->message}</tr>
</div>
<br>

</head>
{include file="footer.tpl"}