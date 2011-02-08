{include file="header.tpl" TITLE="Home"}

<h1>Home</h1>

<div class="left">
<p>
Welcome to Project-Genesis2!
</p>
<p>
This is the preview for Project Genesis2. Please be aware that this software is in development and might change without notice.
You are welcome to have a look at the features.
Try logging in with the test account
<br /><br />
<img src="bar.php?width=200&amp;height=25&amp;type=manual&amp;val1=100&amp;val2=10&amp;color=blue&amp;title=Over%20all%20Progress&amp;numbers=true" alt="Progressbar" />
<h2>News</h2><br />
<b>12.12.2010 Start</b><br />
</p>
</div>

<div class="right">
<form method="post" action="index.php?mod=Login">
<label>Username</label>
<input type="text" name="username" value="test" />

<label>Password</label>
<input type="password" name="password" value="test" />

<input name="login" type="submit" class="button" value="Login!">
</form>
</div>

{include file="footer.tpl"}