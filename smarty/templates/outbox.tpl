{include file="header.tpl" TITLE="Outbox"}
<head>
<h1>Outbox</h1>

<p><br><a href="index.php?mod=MailBox">
[Inbox]</a> | <a href="index.php?mod=MailBox&act=compose">[Write]</a></p>

<table width="90%">
  <tr>
    <th style="text-align: left;">To</th>
    <th style="text-align: left;">Subject</th>
    <th style="text-align: left;">Date</th>
  </tr>

{foreach from=$outbox item=outbox}
  <tr>
  	<td>{$outbox->to}</td>
    <td><a href="index.php?mod=MailBox&act=read&id={$mailbox->id}">{$outbox->subject}</a></td>
    <td>{$outbox->date}</td>
  </tr>
{/foreach}
</table>

</head>
{include file="footer.tpl"}