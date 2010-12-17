{include file="header.tpl" TITLE="Postausgang"}
<head>
<h1>Outbox</h1>

<p><br><a href="index.php?mod=MailBox">
[Inbox]</a> | <a href="index.php?mod=MailBox&act=compose">[Schreiben]</a></p>

<table width="90%">
  <tr>
    <th style="text-align: left;">An</th>
    <th style="text-align: left;">Betreff</th>
    <th style="text-align: left;">Datum</th>
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