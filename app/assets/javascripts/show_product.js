$(document).on('turbolinks:load', function() {
  $('.ItemBox__photo-sub').click(function () {
    var $src = $(this).attr('src');
    $('.ItemBox__photo-main').attr('src', $src);
  });
});