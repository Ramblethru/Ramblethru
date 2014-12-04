$(document).ready(function () {
  $('.accordion-tabs-minimal').each(function(index) {
    $(this).children('li').first().children('a').addClass('is-active').next().addClass('is-open').show();
  });

  $('.accordion-tabs-minimal').on('click', 'li > a', function(event) {
    if (!$(this).hasClass('is-active')) {
      event.preventDefault();
      var accordionTabs = $(this).closest('.accordion-tabs-minimal')
      accordionTabs.find('.is-open').removeClass('is-open').hide();

      $(this).next().toggleClass('is-open').toggle();
      accordionTabs.find('.is-active').removeClass('is-active');
      $(this).addClass('is-active');
    } else {
      event.preventDefault();
    }
  });
});

$(document).ready(function() {
  $('#map-usa').usmap({
  stateStyles: {'fill': '#eff0eb'},
  stateHoverStyles: {fill: '#af703a'},
   
    'click' : function(event, data) {
      $('#alert')
        .text('Click '+data.name+'  copy ')
        .css('color', '#ff0')
        .animate({color: '#ddd'}, 1000);
    }
});
  });

$(document).ready(function(){
$(".menu-button").click(function(){
$(".menu-bar").toggleClass( "open" );
})
})

// 
// $(document).ready(function(){
//   $('.fa-foursquare').mouseenter(function() {
//     $(this).effect('bounce',1000);
//   });
// });
