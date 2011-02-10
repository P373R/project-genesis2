{include file="header.tpl" TITLE="Account Settings"}

<h1>Account Settings</h1>

<p>
Here you can change your password.
</p>

<form method="post" action="index.php?mod=AccountSettings">

<label>Current Password</label>
<input type="password" size="40" name="current_password" autocomplete="off" />

<label>New Password</label>
<input type="password" size="40" name="new_password" autocomplete="off" />

<label>Verify New Password</label>
<input type="password" size="40" name="new_password2" autocomplete="off" />

<label>Language</label>
<input type="radio" name="language" value=""{if $player->language == ''} checked{/if}>English<br />
<input type="radio" name="language" value="de"{if $player->language == 'de'} checked{/if}>German<br />

<br />
<input name="change_password" type="submit" value="Change" class="button" />

</form>

{include file="footer.tpl"}