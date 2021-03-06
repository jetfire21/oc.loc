$(document).ready(function() {

// carousel при ширине менее 1367px

    var page_h = $("html").height();
    var page_w = $("html").width();

  // console.log(page_w);
  if(page_w < 1340)  {
    $(".customNavigation a.next").addClass("less1200next");
    $(".customNavigation a.prev").addClass("less1200prev");
  }
   if(page_w < 1367 && page_w > 1200)  {
    $(".collection").addClass("less1366px");
  }
   if(page_w < 1201)  {
    $(".collection").addClass("less1200px");
  }


 // owl carousel

  var owl = $("#owl-demo");
 
  owl.owlCarousel({
      items : 4, //10 items above 1000px browser width
      itemsDesktop : [1000,3], //5 items between 1000px and 901px
      itemsDesktopSmall : [900,3], // betweem 900px and 601px
      itemsTablet: [600,2], //2 items between 600 and 0
      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
  });
 
  // Custom Navigation Events
  $(".next").click(function(){
    owl.trigger('owl.next');
  })
  $(".prev").click(function(){
    owl.trigger('owl.prev');
  })
  // $(".play").click(function(){
  //   owl.trigger('owl.play',1000); //owl.play event accept autoPlay speed as second parameter
  // })
  // $(".stop").click(function(){
  //   owl.trigger('owl.stop');
  // })

  $(".preview img").click(function(){
    var val = $(this).attr("src");
    console.log(val);
    $(".main-img img").attr("src",val);
  });

    // RadioButton
  $('.radioblock').find('.radio').each(function(){
    $(this).click(function(){
      // Заносим текст из нажатого дива в переменную
      var valueRadio = $(this).find("span").html();
      // Находим любой активный переключатель и убираем активность
      $(this).parent().find('.radio').removeClass('r-active');
      // Нажатому диву добавляем активность
      $(this).addClass('r-active');
      // Заносим значение объявленной переменной в атрибут скрытого инпута
      $(this).parent().find('input').val(valueRadio);
    });
  });

// clipboard no fx
  $('.copy-link').zclip({
    path:'js/zclip/ZeroClipboard.swf',
    copy:$('.ref-link').text(),
    afterCopy:function(){
      alert("Текст скопирован в буфер обмена!");
    }
  });
 
});

// модальные окна

$(function () {
  $('.popup-modal').magnificPopup({
    type: 'inline',
    preloader: false,
    focus: '#username',
    modal: true,
    closeOnBgClick:true
  });
});

$(function () {
  $('.popup-modal2').magnificPopup({
    type: 'inline',
    preloader: false,
    mainClass:"my-order-popup",
    focus: '#username',
    modal: true,
    closeOnBgClick:true
  });
   $(document).on('click', '.popup-modal-close', function (e) {
    e.preventDefault();
    $.magnificPopup.close();
  });
});