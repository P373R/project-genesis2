{literal}
<script> 
	$(function() {
		$( "#msg" ).dialog({
			resizable: false,
			height:150,
			modal: true,
			buttons: {
				"close": function() {
				    $( this ).dialog( "close" );
				    
				},
			}
		});
	});
</script> 
{/literal}

<div id="msg" title="Message">
    <span class="red"><strong>{$GET_MSG}</strong></span>
</div>
<span class="space"></span>
