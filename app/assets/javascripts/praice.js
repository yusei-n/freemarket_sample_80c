$(function(){
  $(document).on('keyup',".price__SellingPrice__PriceForm__input",function(e){
    var praice = $(this).val();
    let tax = Math.ceil(praice * 0.1)
    let profit = Math.ceil(praice * 0.9)
    decimal: false
    $(".price__fee__FeePrice").html("¥"+tax);
    $(".price__sales__ProfitAmount").html("¥"+profit);
    
    
  })

  $(document).on('change',".price__SellingPrice__PriceForm__input",function(e){
    var praice = $(this).val();
    let tax = Math.ceil(praice * 0.1)
    let profit = Math.ceil(praice * 0.9)
    decimal: false
    $(".price__fee__FeePrice").html("¥"+tax);
    $(".price__sales__ProfitAmount").html("¥"+profit);

  })
})