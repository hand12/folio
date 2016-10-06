$(document).on('turbolinks:load', function(){

  function previewImage(){
    $("#user_avatar").change(
      function (){
        let file = $(this).prop('files')[0];
        if (file.type.match('image.*')) {
          setImage(file);
        } else {
          alert("画像を選択してください。");
        }
      }
    );
  }

  function setImage(file){
    var reader = new FileReader();
    reader.onload = function(){
      $("#user_avatar").after('<img class="preview_image">');
      $("#user_avatar").next(".preview_image").attr('src', reader.result);
    }
    reader.readAsDataURL(file);
  }

  previewImage();
})

