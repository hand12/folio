$(document).on('turbolinks:load', function(){

  function createLike(){
    var url = location.href;
    var product_id = location.href.split('/')[url.length -  1];
    $.ajax({
      url: url + '/likes.json',
      type: 'POST',
      data: product_id,
      dataType: 'json'
    }).done(
    function(data){
      console.log("成功");
      buildLike(data.num);
    }).fail(function(data){
      console.log("失敗");
    });
  }
  
  function buildLike(num){
    var html = num + 'イイネ';
    $('.like_count_comment').empty();
    $('.like_count_comment').append(html);
  }

  $('#js-like').on('click', function(){
    createLike();
    $(this).addClass('animation-target-big');
    var timer = setInterval(function(){
      $('#js-like').removeClass('animation-target-big');
      console.log("戻った");
      clearInterval(timer);
    }, 1000);
  })

})


