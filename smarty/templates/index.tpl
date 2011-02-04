{include file="header.tpl" TITLE="Home"}

<h1>Home</h1>

<div class="left">
<p>
Welcome to Project-Genesis2!
</p>
<p>
<h2>News</h2><br />
<b>12.12.2010 Start</b><br />
</p>
</div>

<div class="right">
<form method="post" action="index.php?mod=Login">
<label>Username</label>
<input type="text" name="username" />

<label>Password</label>
<input type="password" name="password" />

<input name="login" type="submit" class="button" value="Login!">
</form>
</div>

{include file="footer.tpl"}