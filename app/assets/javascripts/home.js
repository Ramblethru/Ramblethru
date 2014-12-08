
$(document).ready(function(){
  $('.js-menu-trigger').on('click touchstart', function(e){
    $('.js-menu').toggleClass('is-visible');
    $('.js-menu-screen').toggleClass('is-visible');
    e.preventDefault();
  });

  $('.js-menu-screen').on('click touchstart', function(e){
    $('.js-menu').toggleClass('is-visible');
    $('.js-menu-screen').toggleClass('is-visible');
    e.preventDefault();
  });
});

$(document).ready(function() {
  $('#map-usa').usmap({
    stateStyles: {'fill': '#eff0eb'},
    stateHoverStyles: {fill: '#af703a'},
//    labelBackingStyles: {'fill': '#eff0eb'},
//    labelBackingHoverStyles: {fill: '#af703a'}
     
    'click' : function(event, data) {
      window.location.href = "/state_select?discover[destination]=" + data.name
    }
  });
});

// $(document).ready(function(){
// $(".menu-button").click(function(){
// $(".menu-bar").toggleClass( "open" );
// })
// });

