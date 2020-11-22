$(document).on('turbolinks:load',function(){
  function build_Children(){
    let child_select = `<select name="product[category_id]"class="child_category_id">
                          <option value="">---</option>
                        </select>`
      return child_select;
  }
  function buildOption(children){
    let option_html = `
                  <option value=${children.id}>${children.name}</option>`
      return option_html;
  }
  function build_grandchild(){
    let grandchild_select= `
    <select name="product[category_id]"class="grandchild_category_id">
    <option value="">---</option>
    </select>`
    return grandchild_select
  }
  $("#product_category_id").change(function(){
    let parent = $("#product_category_id").val();
    if (parent.length != 0) {
      $.ajax({
        url: "/products/search",
        type: "GET",
        data: { parent_id: parent},
        dataType: "json",
      })
      .done(function (data){
        $(".child_category_id").remove();
        $(".grandchild_category_id").remove();    
        let child_select = build_Children
        $(".form").append(child_select);
        data.forEach(function(e){
          let option_html = buildOption(e)
          $(".child_category_id").append(option_html);
        })
      })
      .fail(function(){
        alert("error")
      });
    } else{
      $(".child_category_id").remove();
      $(".grandchild_category_id").remove();
    }
  });
  $(document).on("change",".child_category_id",function(){
    let children = $(".child_category_id").val();
    if (children.length != 0) {
      $.ajax({
        url: "/products/search",
        type: "GET",
        data: { children_id: children},
        dataType: "json",
      })
      .done(function (data){
        $(".grandchild_category_id").remove();
        let grandchild_select = build_grandchild
        $(".form").append(grandchild_select);
        data.forEach(function(e){
          let option_html = buildOption(e)
          $(".grandchild_category_id").append(option_html);
        })
      })
      .fail(function(){
        alert("error")
      });
    } else{
      $(".grandchild_category_id").remove();
    }
  });
})