{include file="header.tpl" TITLE="Compose mail"}
		<body>
		<br>
		<h1>
		<strong>Compose mail</strong></h1>
&nbsp;<form action="index.php?mod=MailBox&act=send" method="post">
         To: <input type="text" name="to" value="{$rec}"><br>
         Subject: <input type="text" name="subject" value="No Subject"><br>
         <textarea name="message" cols="50" rows="10"></textarea><br>
         <input type="submit" value="Send">
        </form><br>
        </body>
{include file="footer.tpl"}