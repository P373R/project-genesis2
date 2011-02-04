{include file="header.tpl" TITLE="Mailbox"}
<head>
<h1>Mailbox</h1>

<p><br><a href="index.php?mod=MailBox&act=compose">[Write]</a> | <a href="index.php?mod=MailBox&act=outbox">
[Outbox]</a> | <a href="index.php?mod=MailBox&act=delall">[Delete All]</a></p>

<table width="90%">
  <tr>
    <th style="text-align: left;">From</th>
    <th style="text-align: left;">Subject</th>
    <th style="text-align: left;">Date</th>
    <th style="text-align: left;"></th>
  </tr>

{foreach from=$mailbox item=mailbox}
  <tr>
  	<td>{$mailbox->from}</td>
    <td><a href="index.php?mod=MailBox&act=read&id={$mailbox->id}">{$mailbox->subject}</a></td>
    <td>{$mailbox->date}</td>
    <td><a href="index.php?mod=MailBox&act=delete&id={$mailbox->id}"><img height="16" src="static/images/delete.jpg" width="16" alt="Delete"></a></td>
  </tr>
{/foreach}
</table>

</head>
{include file="footer.tpl"}
