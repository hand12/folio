$(document).on('turbolinks:load', function(){
  $("#js-menu").hide();
  $("#trigger").on("click", function(){
    $(this).hide();
    $("#js-menu").slideDown();
  })
  $("#js-close").on("click", function(){
    $("#js-menu").slideUp();
    $("#trigger").show();
  })
})

