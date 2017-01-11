$(document).on('turbolinks:load', function(){
  $(".scroll").click(function(e){
    console.log("scroll呼ばれた");
    console.log($("body").scrollTop());
    e.preventDefault();
    // $(window).scrollTop(400);
    $("body").animate({scrollTop: 420}, 500);
  });
  $(function(){
    $("input"). keydown(function(e) {
      if ((e.which && e.which === 13) || (e.keyCode && e.keyCode === 13)) {
        return false;
      } else {
        return true;
      }
    });
  });
})
