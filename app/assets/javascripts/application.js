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
//= require_tree .
//= require mapbox.js
//= require moment
//= require jquery-ui/datepicker



// Calendar
$(function (){
        $('#start_date').datepicker( {
           dateFormat: "yy-mm-dd",
           showButtonPanel: true,
           inline: true,  
           defaultDate: "+1w",
           numberOfMonths: 3,
           onClose: function( selectedDate ) {
            $( "#end_date" ).datepicker( "option", "minDate", selectedDate );
      }

        });
        $('#end_date').datepicker( {
           dateFormat: "yy-mm-dd",
           showButtonPanel: true,
           inline: true,  
           defaultDate: "+1w",
           changeMonth: true,
           numberOfMonths: 3,
           onClose: function( selectedDate ) {
            $( "#from" ).datepicker( "option", "maxDate", selectedDate );
      }
        });

});
// $(function (){
//         $('#end_date').datepicker(

//         	);
// });