<div id="tutorialBox">
<a href="javascript:document.getElementById('tutorialSkip').submit()" style="float:left;">skip</a>
<a href="javascript:document.getElementById('tutorialNext').submit()" style="float:right;">next</a>
<center><b>Tutorial</b></center>
 <br />
{$tutorial}
<form method="POST" id="tutorialSkip">
<input type="hidden" name="tutorial" value="skip" />
</form>
<form method="POST" id="tutorialNext">
<input type="hidden" name="tutorial" value="next" />
</form>
</div>
