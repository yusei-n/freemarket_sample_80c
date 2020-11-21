$(function(){
  $(document).on('keyup',".ProductSide__form",function(e){
    var count = $(this).val().length;
    $(".ProductSide__LengthCount").text(count+"/1000");
    if (count == 0){
      $(this).after('<div id=error>説明文を入力してください</div>')
      $("#error").css({
        color:'red',
        fontSize: '15px',
        padding: '10px',
        margin: '10px 0 0 0',
      });
    }else{
      $("#error").remove();
    }
  })
})