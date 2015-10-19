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

var base = $("base").attr("href");

// clipboard no fx
  $('.copy-link').zclip({
    path: base +'catalog/view/theme/jewelry/js/zclip/ZeroClipboard.swf',
    //copy:$('.ref-link').attr("value"),
    copy:function(){ return $('.ref-link').val(); },
    afterCopy:function(){
      $(this).select();
      alert("Текст скопирован в буфер обмена!");
    }
  });

    $('#auth-modal .reg-title').click(function(){
      $('#auth-modal .login').hide();
      $('#auth-modal .reg-form').show();
      $('#auth-modal .login-soc').hide();
      $(this).addClass("pink");
       $('#auth-modal .login-title').removeClass("pink")
  });

   $('#auth-modal .login-title').click(function(){
      $('#auth-modal .login').show();
      $('#auth-modal .reg-form').hide();
      $('#auth-modal .login-soc').show();
      $(this).addClass("pink");
       $('#auth-modal .reg-title').removeClass("pink")

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
  $('.popup-modal3').magnificPopup({
    type: 'inline',
    preloader: false,
     mainClass:"my-phone-popup",
    focus: '#phone',
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

// вывод срредств из лк

  $(".withdrawal").click(function(e){
    e.preventDefault();
    var base = $("base").attr("href");
    var redirect = base + 'index.php?route=account/account/history';

       $.ajax({
           url: base + 'index.php?route=account/account/withdrawal',
           // url: 'http://oc.loc/catalog/controller/account/register.php',
           type: 'post',
           data: 'data=withdrawal',
           dataType: 'json',
           success: function(json) {
              if(json.balans > 0) { 
                alert("Oтправлен запрос на вывод");
                window.location = redirect;
              }else{
                 alert('Нечего выводить! Ваш баланс 0 рублей');
                 return false;
              }
            if(json.error) { alert('Нечего выводить! Ваш баланс 0 рублей');}
              console.log(json);
           },
      error:function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
       });

  });

// zoo-master
$('#ex1').zoom();
  


});