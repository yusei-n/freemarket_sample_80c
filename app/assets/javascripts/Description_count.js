$(function(){
  $(document).on('keyup',".ProductSide__form",function(e){
    var count = $(this).val().length;
    $(".ProductSide__LengthCount").text(count+"/1000");
  
  $(document).on('change',".ProductSide__form",function(){
    if (count == ""){
      $(this).after('<div id=texterror>説明文を入力してください</div>')
      $("#texterror").css({
        color:'red',
        fontSize: '15px',
        padding: '10px',
        margin: '10px 0 0 0',
      });
    }else{
      $("#texterror").remove();
      }
    })
  })
})