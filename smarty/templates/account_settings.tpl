{include file="header.tpl" TITLE="Account Settings"}

<h1>Account Settings</h1>

<h2>Change your password</h2>

<form method="post" action="index.php?mod=AccountSettings">

<label>Current Password</label>
<input type="password" size="40" name="current_password" autocomplete="off" />

<label>New Password</label>
<input type="password" size="40" name="new_password" autocomplete="off" />

<label>Verify New Password</label>
<input type="password" size="40" name="new_password2" autocomplete="off" />

<h2>Language</h2>

<input type="radio" name="language" value=""{if $player->language == ''} checked{/if}>English<br />
<input type="radio" name="language" value="de"{if $player->language == 'de'} checked{/if}>German<br />


<br />
<input name="change_password" type="submit" value="Change" class="button" />

<h2>Connect with Facebook</h2>

<p>
Here you can connect your account with Facebook so you can log in with your Facebook account.
</p>
{if $player->facebook == 0}
<a href="index.php?mod=FBLogin&amp;connect=true">Connect now</a>
{else}
Your account is allready connected to {$player->facebook}.
{/if}


</form>
<form method="POST">
<h2>Reset tutorial</h2>
If you want to reset the tutorial simply click on reset.
<input type="submit" name="tutorial" value="reset" />
</form>
{include file="footer.tpl"}