/**
 * Relocate the ship
 */
function worldMoveShip(x,y) {
 // Move the ship to the new coords
 console.log(x-offset.left);
 console.log(y-offset.top);
 $("#worldPicture").html($.ajax({
      url: "modules/World/map.php",
      global: false,
      type: "POST",
      data: ({x : x-offset.left, y: y-offset.top}),
      dataType: "html",
      async:false,
      success: function(msg){
         alert(msg);
      }
   }
).responseText);
}

/**
 * Click event for world map
 */
function worldPictureDblClick(position,e) {
  console.log(e);
  
}