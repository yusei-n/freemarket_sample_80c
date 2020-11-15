
$(function(){
  $(document).on("click",".btn_order", function(){
    $(this).after('<div id=error>クレジットカードを登録してください</div>')
    $("#error").css({
      color:'red',
      fontSize: '15px',
      padding: '5px',
      margin: '10px 0 0',
    });
  });
});