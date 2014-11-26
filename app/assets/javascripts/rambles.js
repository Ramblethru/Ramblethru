  $(".tag-input").tagsInput({
    width: '100%',
    height: '1rem',
  });



$(function(){
        // Check the initial Poistion of the Sticky Header
        var stickyHeaderTop = $('.ramble-notes').offset().top;

        $(window).scroll(function(){
                if( $(window).scrollTop() > stickyHeaderTop ) {
                        $('.ramble-notes').css({position: 'fixed', top: '0px'});
                        $('.end').css('display', 'block');
                } else {
                        $('.ramble-notes').css({position: 'static', top: '0px'});
                        $('.end').css('display', 'none');
                }
        });
  });


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
