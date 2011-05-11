<?php 
define('IN_EZRPG',1);
include '../../config.php';
header ('Content-Type: text/javascript; charset=utf-8');
?>
var scrollrows = <?php echo MAP_VISIBLE_ROWS;?>;
var scrollcols = <?php echo MAP_VISIBLE_COLS;?>;
var width = <?php echo MAP_PICTURE_WIDTH;?>;
var height = <?php echo MAP_PICTURE_HEIGHT;?>;
var maxrows = <?php echo MAP_MAX_ROWS;?>;
var maxcols = <?php echo MAP_MAX_COLS;?>;
var xpos = 0;
var ypos = 0;
var offsetx = 0;
var offsety = 0;

var dragging = false;
var dragx = 0;
var dragy = 0;

document.onmousemove = function(e)
{
  if ( dragging )
  {

    xpos += e.pageX - dragx;
    ypos += e.pageY - dragy;

    if ( xpos < 0 )
      xpos = 0;
    if ( ypos < 0 )
      ypos = 0;
    
//     if(!stop) 
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
  console.log("dragx:"+dragx+" dragx:"+dragy);
  return false;  
}

function worldClick(alt){
    var e = window.event;
    var coords = document.getElementById(alt).alt.split('/');
    var xclk = (coords[0]*120)+e.x;
    var yclk = (coords[1]*120)+e.y;
    // x and y coord of clicked point!
}

document.onmouseup = function(e)
{
  dragging = false;
}

function position( x, y )
{
var imgs = [];
<?php
for( $col = 1; $col <= MAP_VISIBLE_COLS+1; $col++ ) {
    echo "imgs[$col] = [];\n";
    for( $row = 1; $row <= MAP_VISIBLE_ROWS+1; $row++ ) {
	$id = sprintf( "img%02d_%02d", $row, $col ); 
	echo "imgs[$col][$row] = document.getElementById( '$id' );\n";
    } 
}
?>
  if ( x < 0 ) x = 0;
  if ( y < 0 ) y = 0;

  startcol = Math.floor( x / width );
  startrow = Math.floor( y / height );

  console.log("startcol: "+startcol+" startrow: "+startrow+" x:"+x+" y:"+y);
  
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
	console.log("Col: "+col+" Row:"+row);								 
	    imgs[row][col].style.left = left-width;
	    imgs[row][col].style.top = top-height;
	    console.log("Left:"+left+" width:"+width+" result:"+(left-width));
	    imgs[row][col].src = "http://genesis/static/images/map/"+(dcol)+"-"+(drow)+".gif";
	    imgs[row][col].alt = dcol+'/'+drow;
	    console.log(imgs[row][col].alt);
	    
	    remainderx = viewwidth - ( left + width );
	    remaindery = viewheight - ( top + height );
//console.log("remx:"+remainderx+" remy:"+remaindery);
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
