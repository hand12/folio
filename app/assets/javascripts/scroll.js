$(document).on('turbolinks:load', function(){
  var scrollHeight = $(".background-image").height();
  $(window).scroll(function(){
    var currentPos = $(this).scrollTop();
    if (currentPos > 50){
      $(".background-image").fadeOut();
    } else {
      $(".background-image").fadeIn();
    }
  });
})
