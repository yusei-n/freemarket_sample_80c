$(function(){
  $(document).on('keyup',".price__SellingPrice__PriceForm__input",function(e){
    var praice = $(this).val();
    let tax = Math.ceil(praice * 0.1)
    let profit = Math.ceil(praice * 0.9)
    decimal: false
    $(".price__fee__FeePrice").html(tax);
    $(".price__sales__ProfitAmount").html(profit);
    if (praice == 0){
      $(this).after('<div id=error>金額を入力してください</div>')
      $("#error").css({
        color:'red',
        fontSize: '15px',
        padding: '10px',
        margin: '10px 0 0 0',
      });
    }
  })
})