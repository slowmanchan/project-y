$(function() {
  $('[id^="conversation-item"]').click(function(e) {
    if($(e.target).is(':not(.conversation-names)'))
      $('.conversation-names', this).click();
      $(".current-link").removeClass('current-link');
      $(this).addClass("current-link");
  });
});
