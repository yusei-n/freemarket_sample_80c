$(document).on('turbolinks:load', function(){
  Payjp.setPublicKey("pk_test_89a276af1e33dcfa7cdc9931");
  $("#token_submit").click(function(e){
    e.preventDefault();
    const card = {
      number: $("#card_number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: $("#exp_year").val(),
    }
    Payjp.createToken(card, (status, response) => {
      if (status === 200) { //成功した場合
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); //カード情報を自分のサーバにpostせず削除
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        ); //トークンを送信できるように隠しタグを生成
        document.inputForm.submit();
        alert("登録が完了しました");
      } else {
        alert("カード情報が正しくありません");
      }
    })
  })
});