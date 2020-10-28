$(function(){
  $("select").click(function(){
    let error;
    var select = $(this).val();
    if (select == "") {
      $(this).after('<div id=error>選択してください</div>')
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