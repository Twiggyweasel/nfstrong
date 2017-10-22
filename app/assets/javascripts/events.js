$(document).scroll(function() {
  var y = $(this).scrollTop();
  if (y > 400) {
    $('#event-header').fadeIn();
  } else {
    $('#event-header').fadeOut();
  }
});

$(document).on('page:receive', function() {
  return tinymce.remove(); });

