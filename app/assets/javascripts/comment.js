$(function(){
  function buildHTML(comment){
    let html = `<div class="CommentDisplay__contents__list">
                  <div class="CommentDisplay__contents__list__user">
                    ニックネーム：${comment.user_nickname}
                  </div>
                    <div class="CommentDisplay__contents__list__comment">
                    コメント：${comment.comment}
                  </div>
                  <div class="CommentDisplay__contents__list__day">
                  投稿日：${comment.created_at}
                  </div>
                </div>`
    return html
  }

  $('#new_comment').on('submit',function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data)
      $(".CommentSide").prepend(html);
      $(".CommentForm").val("");
    })
    .fail(function(){
      alert('送信を失敗しました');
    })
  });
});
