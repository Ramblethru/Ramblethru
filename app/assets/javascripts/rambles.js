
$(document).bind("ajax:complete", function(event,xhr,status){
  if($("#submit_note").length > 0) {
    $('#note_title').val('');
    $('#note_address').val('');
    $('#note_body').val('');
    $('#note_url').val('');
    $('#note_tag_list').val(destination);
  }
});


