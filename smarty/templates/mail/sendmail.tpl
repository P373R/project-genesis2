{include file="header.tpl" TITLE="Compose mail"}

<h1>Messages</h1>
<h2>Compose Mail</h2>
<form action="index.php?mod=MailBox&act=send" method="post">
    <table>
	<tr><td>To</td><td><input type="text" name="to" value="{$rec}"></td></tr>
	<tr><td>Subject</td><td><input type="text" name="subject" value="{if $sub}{$sub}{else}No Subject{/if}"></td></tr>
    </table>
         <textarea name="message" cols="50" rows="10"></textarea><br>
         <input type="submit" value="Send">
</form>

{include file="footer.tpl"}