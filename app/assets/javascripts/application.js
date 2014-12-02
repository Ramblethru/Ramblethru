// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs
//= require jquery.tagsinput
//= require jquery-ui/effect-highlight
//= require jquery-ui/effect-bounce
//= require_tree .
//= require mapbox.js
//= require moment
//= require jquery-ui/datepicker
//= require jquery.modal
//= require best_in_place

$(document).ready(function() {
  jQuery(".best_in_place").best_in_place();
});

$(document).ready(function(){
$(".menu-button").click(function(){
$(".menu-bar").toggleClass( "open" );
})
});
$(function (){
      $('input.datepicker').data({behaviour: "datepicker"}).datepicker();

        $('#start_date').datepicker( {
           showButtonPanel: true,
           defaultDate: "+1w",
           numberOfMonths: 3,
           onClose: function( selectedDate ) {
            $( "#end_date" ).datepicker( "option", "minDate", selectedDate );
      }

        });
        $('#end_date').datepicker( {
           showButtonPanel: true,
           defaultDate: "+1w",
           changeMonth: true,
           numberOfMonths: 3,
           onClose: function( selectedDate ) {
            $( "#from" ).datepicker( "option", "maxDate", selectedDate );
      }
        });

});
