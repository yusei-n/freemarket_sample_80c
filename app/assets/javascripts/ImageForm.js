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
    
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
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
    }
  });


  $('#').on('click', '.delet-btn', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).parent().remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});
