$(function(){
  $(document).on('keyup',".price__SellingPrice__PriceForm__input",function(e){
    var price = $(this).val();
    let tax = Math.ceil(price * 0.1)
    let profit = Math.ceil(price * 0.9)
    decimal: false
    var upperCaseText
    $(".price__fee__FeePrice").html("¥"+tax.toLocaleString());
    $(".price__sales__ProfitAmount").html("¥"+profit.toLocaleString());
    if (price <= 300 || price >= 9999999){
    }else{
      $("#PriceError").remove();
    }
  })

  $(document).on('change',".price__SellingPrice__PriceForm__input",function(e){
    $("#PriceError").remove();
    var price = $(this).val();
    let tax = Math.ceil(price * 0.1.toLocaleString())
    let profit = Math.ceil(price * 0.9.toLocaleString())
    decimal: false
    $(".price__fee__FeePrice").html("¥"+tax);
    $(".price__sales__ProfitAmount").html("¥"+profit);
    if (price < 300 || price > 9999999){
      $(this).val("");
      $(".price__fee__FeePrice").html("ー");
      $(".price__sales__ProfitAmount").html("ー");
      $(this).after('<div id=PriceError>金額は300~9999999以内でお願いします</div>')
      $("#PriceError").css({
        color:'red',
        fontSize: '15px',
        padding: '10px',
        margin: '10px 0 0 0',
      });
    }else{
      $("#PriceError").remove();
    }
  })
  $(document).on('turbolinks:load', function(){
    var price = $(".price__SellingPrice__PriceForm__input").val();
    let tax = Math.ceil(price * 0.1)
    let profit = Math.ceil(price * 0.9)
    decimal: false
    $(".price__fee__FeePrice").html("¥"+tax.toLocaleString());
    $(".price__sales__ProfitAmount").html("¥"+profit.toLocaleString());
  });
});