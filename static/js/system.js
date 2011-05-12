/*
 * Get a running clock
 */
function localTime() {
  now=new Date();
  hour=now.getHours();
  min=now.getMinutes();
  sec=now.getSeconds();

if (min<=9) { min="0"+min; }
if (sec<=9) { sec="0"+sec; }

time = ((hour<=9) ? "0"+hour : hour) + ":" + min + ":" + sec;

if (document.getElementById) { document.getElementById('theTime').innerHTML = time; }
else if (document.layers) {
 document.layers.theTime.document.write(time);
 document.layers.theTime.document.close(); }

setTimeout("localTime()", 1000);
}

window.onload = localTime;

function reloadBar(url,name) {
    bar = new Image();
    bar.src = url+"&"+(new Date()).getTime();

    if (document.getElementById) { 
	document.getElementById(name).src = bar.src;
    }

    setTimeout("reloadBar('"+url+"','"+name+"');", 5000);
}



$(document).ready(function() {
    // Hide loading globe
   
/*   $.ajaxStart(function() {
    $("img#ajaxLoading").css('display','inline');
    });
   
   $.ajaxComplete(function() {
    $("img#ajaxLoading").css('display','none');
    });
*/   // if any error occours reload the entire page
    $("body").ajaxError(
        function(e,request) {
            if (request.status == 403) {
                window.location.reload();
            }
        }
    );
    
    $("img#ajaxLoading").css('display','none');

});

