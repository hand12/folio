$(document).on("ready page:load", function(){
    var image = "#requested_project_project_images_attributes_";

    function uploadImage(image, i){
      let image_id = image + i + "_image";
      $(image_id).change(function(){
        let file = $(this).prop('files')[0];
        if (file.type.match('image.*')) {
          setImage(file,image,image_id);
        } else {
          alert("画像を選択してください。");
        }
      })
    }

    function setImage(file,image,image_id){
      var reader = new FileReader();
      reader.onload = function(){
        $(image_id + "_preview").attr('src', reader.result);
      }
      reader.readAsDataURL(file);
    }

    uploadImage(image, 0);
    uploadImage(image, 1);
    uploadImage(image, 2);
})
