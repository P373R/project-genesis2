<div id="tutorialBox">
{$tutorial}
<hr />
<form method="POST" id="tutorialSkip" style="float:left;">
<input type="hidden" name="tutorial" value="skip" />
<a href="javascript:document.getElementById('tutorialSkip').submit()">skip</a> 
</form>
<form method="POST" id="tutorialNext" style="float:right;">
<input type="hidden" name="tutorial" value="next" />
<a href="javascript:document.getElementById('tutorialNext').submit()">next</a>
</form>
</div>