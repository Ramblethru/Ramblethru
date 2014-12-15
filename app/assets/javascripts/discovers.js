$(function (){
        $('#start_date').datepicker( {
           dateFormat: "mm-dd-yy",
           showButtonPanel: true,
           inline: true,  
           defaultDate: "+1w",
           numberOfMonths: 3,
           onClose: function( selectedDate ) {
            $( "#end_date" ).datepicker( "option", "minDate", selectedDate );
      }

        });
        $('#end_date').datepicker( {
           dateFormat: "mm-dd-yy",
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