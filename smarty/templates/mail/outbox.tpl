{include file="header.tpl" TITLE="Outbox"}
<head>
<h1>Messages</h1>
<h2>Outbox</h2>
<p><br><a href="index.php?mod=MailBox">
[Inbox]</a> | <a href="index.php?mod=MailBox&act=compose">[Write]</a></p>

<table width="90%">
  <tr>
    <th style="text-align: left;">To</th>
    <th style="text-align: left;">Subject</th>
    <th style="text-align: left;">Date</th>
  </tr>

{foreach $outbox as $mail}
  <tr>
  	<td>{$mail->to}</td>
    <td><a href="index.php?mod=MailBox&act=read&id={$mail->id}">{$mail->subject}</a></td>
    <td>{$mail->date}</td>
  </tr>
{/foreach}
</table>

</head>
{include file="footer.tpl"}