$(document).on('turbolinks:load', function(){
  $(".scroll").click(function(e){
    console.log("scroll呼ばれた");
    console.log($("body").scrollTop());
    e.preventDefault();
    // $(window).scrollTop(400);
    $("body").animate({scrollTop: 420}, 500);
  });
})
