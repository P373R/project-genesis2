{include file="header.tpl" TITLE="Mailbox"}
<h1>Messages</h1>
<h2>Inbox</h2>
<p><br>[<a href="index.php?mod=MailBox&act=compose">Write</a>] | [<a href="index.php?mod=MailBox&act=outbox">Outbox</a>] | [<a href="index.php?mod=MailBox&act=delall">Delete All</a>]</p>

{if $mailbox}
<table width="90%">
  <tr>
    <th style="text-align: left;">From</th>
    <th style="text-align: left;">Subject</th>
    <th style="text-align: left;">Date</th>
    <th style="text-align: left;"></th>
  </tr>
{foreach $mailbox as $mail}
  <tr>
  	<td>{$mail->from}</td>
    <td><a href="index.php?mod=MailBox&act=read&id={$mail->id}">
    {if $mail->isread == 0}<b>{/if}
    {$mail->subject}
    {if $mail->isread == 0}</b>{/if}
    </a></td>
    <td>{$mail->date}</td>
    <td><a href="index.php?mod=MailBox&act=delete&id={$mail->id}"><img height="16" src="static/images/gui/delete.png" width="16" alt="Delete"></a></td>
  </tr>
{/foreach}
</table>
{else}
You have no new Mail
{/if}

{include file="footer.tpl"}
