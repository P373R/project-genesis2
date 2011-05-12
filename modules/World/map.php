<?php
$rows = 5;
$cols = 5;

$maxrows = 23;
$maxcols = 74;
$width = 120;
$height = 120;


($_SERVER['SERVER_ADDR'] == '127.0.0.1')?define('URL','genesis'):define('URL','www.project-genesis2.de');
?>
<html>
<head>
<script src="http://<?php echo URL ?>/static/js/jquery-1.5.2.js" type="text/javascript"></script>
<script language="Javascript">

var imgs = [];

function startup(startx,starty)
{
<?php 
for( $col = 1; $col <= $cols+1; $col++ ) {
?>
imgs[<?php echo($col) ?>] = [];
<?php
for( $row = 1; $row <= $rows+1; $row++ ) {
  $id = sprintf( "img%02d_%02d", $row, $col ); 
?>
imgs[<?php echo($col) ?>][<?php echo($row) ?>] = document.getElementById( "<?php
echo( $id ); ?>" );
<?php
} }
?>
  position(startx,starty);
}

var scrollrows = <?php echo( $rows ); ?>;
var scrollcols = <?php echo( $cols ); ?>;
var width = <?php echo( $width ); ?>;
var height = <?php echo( $height ); ?>;
var maxrows = <?php echo( $maxrows ); ?>;
var maxcols = <?php echo( $maxcols ); ?>;
var xpos = <?php echo( intval($_GET['x']) ); ?>;
var ypos = <?php echo( intval($_GET['y']) ); ?>;
var offsetx = 0;
var offsety = 0;
var oldx = 0;
var oldy = 0;
var world = [];


document.onmousemove = function(e)
{
  if ( dragging )
  {

    xpos -= e.pageX - dragx;
    ypos -= e.pageY - dragy;

    if ( xpos < 0 )
      xpos = 0;
    if ( ypos < 0 )
      ypos = 0;
    
	position( xpos, ypos );

	dragx = e.pageX;
	dragy = e.pageY;
   }
    

}

document.onmousedown = function(e)
{
  dragging = true;
  dragx = e.pageX;
  dragy = e.pageY;

  return false;  
}

function worldClick(alt){
    var e = window.event;
    var coords = document.getElementById(alt).alt.split('/');
    var xclk = (coords[0]*120)+e.x;
    var yclk = (coords[1]*120)+e.y;
    // x and y coord of clicked point!    
}

// draw the entities on the map
function drawWorld(ent){
 console.log(ent);   
 world = ent;
}

document.onmouseup = function(e)
{
  dragging = false;
}

function position( x, y )
{
    if(Math.abs(oldx - x) > 150 || Math.abs(oldy - y) > 150) {
	var url = "http://<?php echo URL; ?>/index.php?mod=World&action=entities&x="+xpos+"&y="+ypos;
	$.getJSON(url,function(jqhrx,code) {drawWorld(jqhrx);});
	oldx = x;
	oldy = y;
    }
    
    $("#entities").empty();
    if(world.cities) $.each(world.cities, function(i,item){
	console.log("go");
	startcol = Math.floor( item.x / width );
	startrow = Math.floor( item.y / height );
	offsetx = Math.abs( item.x - ( startcol * width ) ) * -1;
	offsety = Math.abs( item.y - ( startrow * height ) ) * -1;
	$("<img/>").attr({"alt": item.name,"top":offsetx,"left":offsety,"src": "http://<?php echo URL ?>/static/images/entities/city.png"}).appendTo("#entities");
    });


  if ( x < 0 ) x = 0;
  if ( y < 0 ) y = 0;

  startcol = Math.floor( x / width );
  startrow = Math.floor( y / height );
  
  offsetx = Math.abs( x - ( startcol * width ) ) * -1;
  offsety = Math.abs( y - ( startrow * height ) ) * -1;

  viewheight = ( scrollrows + 1 ) * height;
  viewwidth = ( scrollcols + 1 ) * width;

  for( var row = 1; row < scrollrows + 2; row++)
  {
    for( var col = 1; col < scrollcols + 2; col++)
	{

	var left = offsetx + ( col * width );
	var top = offsety + ( row * height );

	    dcol = startcol+col;
	    drow = startrow+row;
        if(dcol > maxcols) {
	    dcol = dcol-((Math.floor(dcol / maxcols))*maxcols);
	    if(dcol == 0) dcol = maxcols;
	}
	if(drow > maxrows) {
	    drow = drow-((Math.floor(drow / maxrows))*maxrows);
	    if(drow == 0) drow = maxrows;
	}
									 
	if(imgs[row][col]) {
	    imgs[row][col].style.left = left-width;
	    imgs[row][col].style.top = top-height;
	    imgs[row][col].src = "http://<?php echo URL ?>/static/images/map/"+(dcol)+"-"+(drow)+".gif";
	    imgs[row][col].alt = dcol+'/'+drow;

	    remainderx = viewwidth - ( left + width );
	    remaindery = viewheight - ( top + height );

	    if ( remainderx > width )
		remainderx = width;
	    if ( remainderx < 0 )
		remainderx = 0;
	    if ( remaindery > height )
		remaindery = height;
	    if ( remaindery < 0 )
		remaindery = 0;
	    imgs[row][col].style.clip = "rect( 0px 0px "+remaindery+"px"+remainderx+"px )";
	}
	}
  } 
}

var dragging = false;
var dragx = 0;
var dragy = 0;

</script>
</head>
<body onload="startup(<?php echo( intval($_GET['x']) ); ?>,<?php echo( intval($_GET['y']) ); ?>);">
<div id="world" style="width:450px; height:450px;position:fixed;left:20px;top:20px;overflow:hidden;">
<?php
for( $row = 1; $row < $rows + 2; $row++ ) {
for( $col = 1; $col < $cols + 2; $col++ ) {
  $id = sprintf( "img%02d_%02d", $row, $col );
?>
<img src="http://<?php echo URL ?>/static/images/loading.gif" style="position:absolute;left:0;top:0;cursor:hand;" id="<?php echo($id) ?>" ondblclick="worldClick('<?php echo $id;?>');"/>
<?php
} }
?>
</div>
<div id="entities"></div>
</body>
</html>
