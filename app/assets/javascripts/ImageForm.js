$(document).on('turbolinks:load',()=>{
  const  buildFileField = (index)=> {
   const html =`<div data-index="${index}" class="ImageFile_group">
                <input class="ImageFile" type="file"
                name="product[images_attributes][${index}][image]"
                id="product_images_attributes_${index}_image"
                data-index="${index}"><br>
              </div>`;
    return html;
  }

    const buildImg = (num, url)=> {
      const html = `<div class="show-image" id="image_box_${num}">
                      <img data-index="${num}" src="${url}" class="image-file" width="100px" height="100px">
                        <div class="cotent">
                          <div id="delet_btn_${num}" class="delet-btn" data-index="${num}" >削除</div>
                          <div id="edit_btn_${num}" class="eidt-btn" data-index="${num}" >編集</div>
                        </div>
                    </div>`;
      return html;
    }

    const buildForm = ()=> {
      const html = `<div class="ImageForm-under">  
                      <div class="ImageFormBox-under">
                        <div class="ImageSide__form__icon-under">
                        <i class="fa fa-camera"></i>
                          <div class="ImageSide__form__icon__text-under">
                            ドラックアンドドロップ
                            <br>またはクリックしてファイルをアップロード<br>
                          </div>
                          <div id="image-box"></div>
                        </div>
                      </div>
                    </div>`;
      return html;
    }
    
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
    //クリックしたらファイルフィールドが選択される
  $('.ImageSide__form__icon').on('click', function(e){
    // インプットボックスの最後のカスタムデータID取得
    const file_field = $('input[type="file"]:last');
    //クリックによって最後のフォームが選択される
    file_field.trigger('click');
    
  });

  $('.ImageSide__PhotoNumber').on('change','.ImageFile',function(e){
    const targetIndex = $(this).data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    if (img = $(`img[data-index="${targetIndex}"]`)[0]){
      img.setAttribute('src',blobUrl);
    } else{
    $('#previews').append(buildImg(targetIndex, blobUrl));

    const next_index = $('input[type="file"]:last').data('index') +1;
    $('.ImageSide__PhotoNumber').append(buildFileField(next_index));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length -1] + 1);
    var count = $('.image-file').length;
    if (count == 1){
      $('.NotImage').remove();
    }
    if (count == 5){
      $('.ImageSide__form__icon').toggle(false);
      }
    }
  });
  $('#previews').on('click', '.delet-btn', function(e){
    //画像の削除
    const image = $(this).parent().parent();
    image.remove();
    //データインデックスの取得
    const data_index = $(this).data('index');
    // データインデックスのカスタムデータ属性をfile_fieldに定義
    const file_field = $(`input[type="file"][data-index="${data_index}"]`);
    file_field.remove();
    var count = $('.image-file').length;
    if (count == 0){
       $('.ImageSide__PhotoNumber').after(`<div class="NotImage">イメージをアップロードしてください</div>`)
       $('.NotImage').css({
        color:'red',fontSize: '15px',padding: '10px',margin: '10px 0 0 0',
       })
    }
    // 画像が4以下になった時に5枚投稿された時発動した.toggle(else)を解除
    if (count == 4){
      $('.ImageSide__form__icon').toggle(true);
    } 
  });

  $('#previews').on('click','.eidt-btn',function(){
    const data_index = $(this).data('index');
    // データインデックスのカスタムデータ属性をfile_fieldに定義
    const file_field = $(`input[type="file"][data-index="${data_index}"]`);
    file_field.trigger('click');
  });
  $('#previews').on('mouseenter', '.delet-btn', function() {
    $(this).css('cursor','pointer');
  });
  $('#previews').on('mouseenter', '.eidt-btn', function() {
    $(this).css('cursor','pointer');
  });
});


