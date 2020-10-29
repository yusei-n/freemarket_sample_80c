$(document).on('turbolinks:load',()=>{
  const  buildFileField = (index)=> {
   const html =`<div data-index="${index}" class="ImageFile_group">
                <input class="ImageFile" type="file" multiple= "multiple"
                name="product[images_attributes][${index}][image]"
                id="product_images_attributes_${index}_image"><br>
                <div class="js-remove">削除</div>
              </div>`;
    return html;
  }

    const buildImg = (num, url)=> {
      const html = `<div class="show-image" id="image_box_${num}">
                      <img data-index="${num}" src="${url}" class="image-file" width="100px" height="100px">
                        <div class="cotent">
                          <div id="delet_btn_${num}" class="delet-btn">削除</div>
                        </div>
                    </div>`;
      return html;
    }
    
  let fileIndex = [1,2,3,4,5];
  lastIndex = $('.ImageFile_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.ImageDestroy').hide();

  $('#image-box').on('change','.ImageFile',function(e){
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]){
      img.setAttribute('src',blobUrl);
    } else{
    $('#previews').append(buildImg(targetIndex, blobUrl));
    $('#image-box').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length -1] + 1);
    var count = $('.image-file').length;
    if (count == 5){
      $(".ImageSide__form__icon").toggle(false);
      }
    }
    const hiddenCheck = $(`input[data-index="${targetIndex}"].ImageDestroy`);
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().toggle(false);

  });


  $("#previews").on('click', '.delet-btn', function() {
    //画像の削除
    
    $(this).parent().parent().remove();
    
    var count = $('.image-file').length;
    // 画像が4以下になった時に5枚投稿された時発動した.toggle(else)を解除
    if (count == 4){
      $(".ImageSide__form__icon").toggle(true);
    } 
  });
  $("#previews").on('mouseenter', '.delet-btn', function() {
    $(this).css("cursor","pointer");
  });
});
