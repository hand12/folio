$(document).on('turbolinks:load', function(){
  $(".cover").click(
    function(){
      var num = this.className.split(" ")[0];
      var image_num = ".extension_image " + "." + num
      $(this).blur();
      $(".image_panel").fadeIn("slow");
      $(".hide_image").hide();
      $(".extension_image").fadeIn("slow");
      $(image_num).fadeIn("slow");
      $("#header").fadeOut("slow");
    })

  $(".image_panel").click(
    function(){
      $(this).fadeOut("slow");
      $("#header").fadeIn("slow");
    })

  // $(".modal-content").on('click', function(e) {
  //   e.stopPropagation();
  // });
})
