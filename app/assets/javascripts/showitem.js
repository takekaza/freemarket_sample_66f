$(function() {
// $(document).on('turbolinks:load', ()=> {
  $('img.itemzone__content__photo__box__bar__sub').hover(function(){
  // "_thumb"を削った画像ファイル名を取得
  var selectedSrc = $(this).attr('src').replace(/^(.+)(\.gif|\.jpg|\.png+)$/, "$1"+"$2");

  // 画像入れ替え
  $('img.itemzone__content__photo__box__top').stop().fadeOut(50);
  $(function(){
    $('img.itemzone__content__photo__box__top').attr('src', selectedSrc);
    $('img.itemzone__content__photo__box__top').stop().fadeIn(200);

    });
    // サムネイルの枠を変更
    $(this).css({"opacity":"1.2"});
    $(this).css({"box-shadow":" 0 2px 3px 0 #9E9E9E"});
  });
  
  // マウスアウトでサムネイル枠もとに戻す
  $('img.itemzone__content__photo__box__bar__sub').mouseout(function(){
    $(this).css({"opacity":""});
    $(this).css({"box-shadow":""});
  });
// });
});
