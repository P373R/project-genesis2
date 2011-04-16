{literal}
<script> 
	$(function() {
		$( "#tutorialBox" ).dialog({
			resizable: false,
			height:250,
			modal: false,
			buttons: {
				"skip": function() {
					document.getElementById('tutorialSkip').submit()
				},
				"next": function() {
					document.getElementById('tutorialNext').submit()
				}
			}
		});
	});
</script> 
{/literal}

<div id="tutorialBox" title="Tutorial">
{$tutorial}
</div>

<form method="POST" id="tutorialSkip">
<input type="hidden" name="tutorial" value="skip" />
</form>
<form method="POST" id="tutorialNext">
<input type="hidden" name="tutorial" value="next" />
</form>
