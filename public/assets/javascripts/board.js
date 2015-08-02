$(document).ready(function(){
  var currentMarker = $('#currentMarker').attr('class');

  $( ".empty" ).hover(
    function() {
      if (currentMarker == "X") {
        $( this ).append( "<span class=\"X\">X</span>" );
      } else {
        $( this ).append( "<span class=\"glyphicon glyphicon-one-fine-empty-dot\"></span>" );
      };
    }, function() {
      $( this ).find( "span" ).remove();
    });
});