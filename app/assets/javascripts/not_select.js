$(document).on("change","#product_category_id",function(){
  let error;
  var select = $(this).val();
  if (select == "") {
    $(document).on("click",document,function(){
      $("#error_category").remove()
      $("#product_category_id").after('<div id=error_category>カテゴリーを選択してください</div>')
    $("#error_category").css({color:'red',fontSize: '15px',padding: '10px',margin: '10px 0 0 0',
    });
    })
  }else{
    $("#error_category").remove()
  }
})

$(document).on("change","#product_product_status_id",function(){
  let error;
  var select = $(this).val();
  if (select == "") {
    $(document).on("click",document,function(){
      $("#error_status").remove()
      $("#product_product_status_id").after('<div id=error_status>商品の状態を選択してください</div>')
    $("#error_status").css({color:'red',fontSize: '15px',padding: '10px',margin: '10px 0 0 0',});
    })
  }else{
    $("#error_status").remove()
  }
})

$(document).on("change","#product_delivery_burden_id",function(){
  let error;
  var select = $(this).val();
  if (select == "") {
    $(document).on("click",document,function(){
      $("#error_burden").remove()
      $("#product_delivery_burden_id").after('<div id=error_burden>配送料の負担を選択してください</div>')
    $("#error_burden").css({color:'red',fontSize: '15px',padding: '10px',margin: '10px 0 0 0',});
    })
  }else{
    $("#error_burden").remove()
  }
})

$(document).on("change","#product_postal_prefectures_id",function(){
  let error;
  var select = $(this).val();
  if (select == "") {
    $(document).on("click",document,function(){
      $("#error_prefectures").remove()
      $("#product_postal_prefectures_id").after('<div id=error_prefectures>発送地域を選択してください</div>')
    $("#error_prefectures").css({color:'red',fontSize: '15px',padding: '10px',margin: '10px 0 0 0',});
    })
  }else{
    $("#error_prefectures").remove()
  }
})
$(document).on("change","#product_estimated_shipping_id",function(){
  let error;
  var select = $(this).val();
  if (select == "") {
    $(document).on("click",document,function(){
      $("#error_shipping").remove()
      $("#product_estimated_shipping_id").after('<div id=error_shipping>発送までの日時を選択してください</div>')
    $("#error_shipping").css({color:'red',fontSize: '15px',padding: '10px',margin: '10px 0 0 0',});
    })
  }else{
    $("#error_shipping").remove()
  }
})