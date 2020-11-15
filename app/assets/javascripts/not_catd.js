// $(function(){
//   console.log("商品購入画面カード版")
//   $(document).on("load","#btn_token",function () {
//     console.log("初期動作")
//     let btn_click = $("button")
//     btn_click.on("click",function(){
//       let btn_click = $("button")
//       console.log(btn_click)
//       let card_in = $(".Product__List__Method")
//       console.log(card_in)
//     })
//     if ()
//     if (card_in === )
//   })
// })

// $(function () {
//   let btn_click = $("#btn_token")
//   btn_click.on("click",function(){
//     let card_no = $(".no-card")
//     let btn_click = $("#btn_token")
//     console.log(btn_click)
//     console.log(card_no)
//     if (card_no != null){
//       btn_click.disabled = false;
//       $('.btn_a').click(function() { 
//         return false; 
//       });
//     }
//   })
// })


// const button = document.querySelector('.btn_a')
// button.addEventListener('click', () => 
// console.log('button clicked !'))

$(function(){
  console.log("not_/test")
  $(document).on("click",".btn_order", function(){
    console.log("click/ok")
    let no_card = $(".no-card")
    $(".Contents").after('<div id=error>クレジットカードを登録してください</div>')
    $("#error").css({
      color:'red',
      fontSize: '15px',
      padding: '5px',
      margin: '10px 0 0',
    });
  });
});