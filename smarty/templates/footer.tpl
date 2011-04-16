</div>

<div id="footer">
        <strong><a href="https://code.google.com/p/project-genesis2/">Project</a> | <a href="https://code.google.com/p/project-genesis2/w/list">Wiki</a> | <a href="https://code.google.com/p/project-genesis2/issues/list">Forum</a></strong><br />
	Copyright &copy; 2010 <a href="index.php?mod=About" target="_parent"><strong>Project Genesis2</strong></a> Version {$VERSION}<br />
<hr />

{if $SERVER != 'local'}
{literal}
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-7692558-5']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<script type="text/javascript"><!--
google_ad_client = "ca-pub-2048116130551513";
/* Genesis */
google_ad_slot = "5067188065";
google_ad_width = 468;
google_ad_height = 60;
//-->
</script>
<script type="text/javascript"
src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
</script>
{/literal}
{/if}
</div>

</div>

{if $GET_MSG != ''}
 {include file='msg.tpl'}
{/if}

{if $tutorial != ''}
 {include file='tutorial.tpl'}
{/if}

</body>

</html>