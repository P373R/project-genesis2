{include file="header.tpl" TITLE="Email schreiben"}
		<body>
		<br>
		<h1>
		<strong>Email schreiben</strong></h1>
&nbsp;<form action="index.php?mod=MailBox&act=send" method="post">
         An: <input type="text" name="to" value="Name"><br>
         Betreff: <input type="text" name="subject" value="No Subject"><br>
         <textarea name="message" cols="50" rows="10"></textarea><br>
         <input type="submit" value="Send">
        </form><br>
        </body>
{include file="footer.tpl"}