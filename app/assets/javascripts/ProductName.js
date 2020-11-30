$(function(){
  $(document).on('change',".ProductSide__NameBox",function(e){
    var count = $(this).val().length;
    if (count == 0){
      $(this).after('<div id=error>商品名を入力してください</div>')
      $("#error").css({
        color:'red',
        fontSize: '15px',
        padding: '10px',
        margin: '10px 0 0 0',
      });
    }
  })
})