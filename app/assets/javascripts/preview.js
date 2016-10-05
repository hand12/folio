$(document).on("ready page:load", function(){

  let main_image = "#product_product_images_attributes_0_image"

  var i = 0
  var images = []
  while (i < 4){
    images.push("#product_product_images_attributes_" + i + "_image");
    i++;
  }


  function previewImage(image){
    $(image).change(
      function (){
        let file = $(this).prop('files')[0];
        if (file.type.match('image.*')) {
          setImage(file, image);
        } else {
          alert("画像を選択してください。");
        }
      }
    );
  }

  function setImage(file, image){
    var reader = new FileReader();
    reader.onload = function(){
      $(image).after('<img class="preview_image">');
      $(image).next(".preview_image").attr('src', reader.result);
    }
    reader.readAsDataURL(file);
  }
  for (i = 0; i < images.length; i++){
    previewImage(images[i], i);
  }
})

