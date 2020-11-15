document.addEventListener(
  "DOMContentLoaded", () => {
    Payjp.setPublicKey("pk_test_89a276af1e33dcfa7cdc9931");
    const card_to = document.querySelector('#card_token');
    const btn_to = document.querySelector('#btn_token');
    // console.log("pay.js/")
    // console.log(btn_to)
    card_to.addEventListener("click", (e) => {//ボタンが押されたときに作動します
      e.preventDefault();//ボタンを一旦無効化します
      //カード情報生成
      const card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      };
      //トークン生成
      Payjp.createToken(card, (status, response) => {
        if (status === 200) { //成功した場合
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); //カード情報を自分のサーバにpostせず削除します
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); //トークンを送信できるように隠しタグを生成
          document.inputForm.submit();
          alert("登録が完了しました"); //確認用
        } else {
          alert("カード情報が正しくありません"); //確認用
        }
      });
    });
    btn_to.addEventListener("click", (e) => {//ボタンが押されたときに作動します
      e.preventDefault();//ボタンを一旦無効化
      Payjp.createToken((status, response)=> {
        if (status === 200) {
          $("#btn_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); //トークンを送信できるように隠しタグを生成
          document.inputForm.submit();
        };
      });
    });
  },false);



// $(function(){
//   console.log("pay.js//")
//   $(document).on('ready page:load', function(){
//     console.log("test")
//     Payjp.setPublicKey("pk_test_89a276af1e33dcfa7cdc9931");
//     const card_to = $('#card_token');
//     const btn_to = $('#btn_token');
//     const card = {
//       number: $("#card_number").val(),
//       cvc: $("#cvc").val(),
//       exp_month: $("#exp_month").val(),
//       exp_year: $("#exp_year").val(),
//     };
//     card_to.on("click",(e)=> {
//       e.preventDefault();
//       Payjp.createToken(card, (status, response) => {
//         if (status === 200) { //成功した場合
//           $("#card_number").removeAttr("name");
//           $("#cvc").removeAttr("name");
//           $("#exp_month").removeAttr("name");
//           $("#exp_year").removeAttr("name"); //カード情報を自分のサーバにpostせず削除します
//           $("#card_token").append(
//             $('<input type="hidden" name="payjp-token">').val(response.id)
//           ); //トークンを送信できるように隠しタグを生成
//           document.inputForm.submit();
//           alert("登録が完了しました"); //確認用
//         } else {
//           alert("カード情報が正しくありません"); //確認用
//         }
//       });
//     });
//     btn_to.on("click", (e) => {
//       e.preventDefault();
//       Payjp.createToken((status, response)=> {
//         if (status === 200) {
//           $("#btn_token").append(
//             $('<input type="hidden" name="payjp-token">').val(response.id)
//           ); //トークンを送信できるように隠しタグを生成
//           document.inputForm.submit();
//         };
//       });
//     });
//   },false);
// });
