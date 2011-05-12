{include file="header.tpl" TITLE="Read mail"}

<h1>Messages</h1>
<h2>Read Mail</h2>
<strong>From: </strong>{$mailbox2->subject}<br />
<strong>Recieved: </strong>{$mailbox2->date}<br />
<a href='index.php?mod=MailBox&act=compose&to={$mailbox2->from}'>Answer</a> | <a href='index.php?mod=MailBox&act=delete&id={$mailbox2->id}'>Delete</a>
<br />
<div>
<tr>{$mailbox2->message}</tr>
</div>

{include file="footer.tpl"}