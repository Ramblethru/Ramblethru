  $(".tag-input").tagsInput({
    width: '100%',
    height: '1rem',
  });


  $(function(){
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