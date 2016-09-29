$(window).on("load", function(){
  $(".trigger").click(
    function(){
      $(this).blur();
      $(".panel").fadeIn("slow");
      $(".modal-content").fadeIn("slow")
    })

  $(".panel").click(
    function(){
      $(this).fadeOut("slow");
    })

  $(".modal-content").on('click', function(e) {
    e.stopPropagation();
  });
})
