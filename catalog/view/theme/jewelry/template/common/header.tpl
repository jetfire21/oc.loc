<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/css/fonts.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/magnific-popup/magnific-popup.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/css/style.css" />
<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
<meta property="og:type" content="website" />
<meta property="og:url" content="<?php echo $og_url; ?>" />
<?php if ($og_image) { ?>
<meta property="og:image" content="<?php echo $og_image; ?>" />
<?php } else { ?>
<meta property="og:image" content="<?php echo $logo; ?>" />
<?php } ?>
<meta property="og:site_name" content="<?php echo $name; ?>" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/owl-carousel/owl.carousel.css" />

<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/owl-carousel/owl.carousel.css" />

  <script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/jquery-1.11.3.min.js"></script>
  <script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/zclip/jquery.zclip.js"></script>
  <script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js//owl-carousel/owl.carousel.js"></script>
  <script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/magnific-popup/jquery.magnific-popup.min.js"></script>
  <script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/custom.js"></script>
  <script src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/js/oc-common.js"></script>

<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
</head>
<body>

<div class="top-pattern">
    <div class="container">
    <div class="inner-nav">
      
      <?php if ($logo) { ?>
      <div class="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>"></a></div>
      <?php } ?>
      
    <?php if ($categories) { ?>
        <ul class="menu">
        <?php foreach ($categories as $category) { ?>
            <li><?php if ($category['active']) { ?>
                <a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a>
            <?php } else { ?>
                <a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
            <?php } ?>
          <?php } ?>
        </div>
    <?php } ?>

       <div class="right-nav">
           <?php if (!$logged) { ?>
               <a class="popup-modal" href="#auth-modal" name="lk">Кабинет</a> 
          <?php } else { ?>
               <a href="<?php echo $login; ?>" class="pink customer-name"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/foto-customer.png" alt=""><?php echo $firstname; ?></a>
          <?php } ?>
            <!-- <a class="popup-modal" href="#auth-modal">Кабинет</a> -->

            <div class="cart"><a href="index.php?route=checkout/cart">Корзина</a></div>
         <div class="phone"> </div>
       </div>

    </div>
  </div>
</div>

<div class="clr"></div>

  <div id="auth-modal" class="white-popup-block mfp-hide">
      <img class="treugol" src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/treugol.png" alt="">
      <div class="wrap-auth">
        <div class="wrap-form">
      <h3><span class="pink login-title">Вход</span> / <span class="reg-title">Регистрация</span></h3>

        <div class="login">
          <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <input class="gray-btn" type="text" placeholder="Введите ваш e-mail" name="email">
            <input class="gray-btn" type="password" placeholder="Ваш пароль" name="password">
            <input type="submit" value="Войти" class="send-login">
            <a href="#">Забыли?</a>
          </form>
        </div>

        <div class="reg-form">
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
              <div class="firstname">
                 <input class="gray-btn" type="text" placeholder="Имя"  name="firstname" value="<?php echo $firstname; ?>">
              </div>
              <div class="lastname">
                 <input class="gray-btn" type="text" placeholder="Фамилия"  name="lastname" value="<?php echo $lastname; ?>">
              </div>
              <div class="email">
              <input class="gray-btn" type="text" placeholder="E-mail"  name="email" value="<?php echo $email; ?>">
              </div>   

<!--              <input class="gray-btn" type="text" placeholder="Телефон"  name="telephone" value="<?php echo $telephone; ?>">
              <?php if ($error_telephone) { ?>
             <span class="error"><?php echo $error_telephone; ?></span>
              <?php } ?>

             <input class="gray-btn" type="text" placeholder="Адрес доставки"  name="address_1" value="<?php echo $address_1; ?>">
              <?php if ($error_address_1) { ?>
             <span class="error"><?php echo $error_address_1; ?></span>
              <?php } ?>             

              <input class="gray-btn" type="text" placeholder="Адрес доставки"  name="city" value="<?php echo $city; ?>">
              <?php if ($error_city) { ?>
             <span class="error"><?php echo $error_city; ?></span>
              <?php } ?>                 
-->            
             <div class="password">
              <input class="gray-btn" type="password" placeholder="Пароль"  name="password" value="<?php echo $password; ?>">
              </div>
                <div class="confirm">
              <input class="gray-btn" type="password" placeholder="Подтвердите пароль"  name="confirm" value="<?php echo $confirm; ?>">
                </div>

              <input type="submit" value="Регистрация" class="send-reg">
            </form>
         </div>

      </div>
      <div class="login-soc">
        <span>Войти через соц сети:</span>
        <!-- <a href="/index.php?route=account/register/reg_vk" class="social"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/soc.jpg" alt=""></a> -->
        <div><a href="/index.php?route=account/register/reg_vk" class="social"></a></div>
      </div>
    </div>
   </div>


<script type="text/javascript">

$(".send-reg").click(function(e){
      e.preventDefault();
      var data = $('.reg-form form').serialize();

      $.ajax({
         url: '/index.php?route=account/register/my_validate',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
            
          // console.log(json.firstname);
          // console.log(json.lastname);
          // console.log(json.email);
          // console.log(json.warning);
          // console.log(json.success);
          // console.log(json.s_name);
          // console.log(json.password);
          // console.log(json.confirm);

          if(json.firstname) { 
            if( $('.reg-form .firstname span').hasClass('error') ) { }
            else { $('.reg-form .firstname').prepend('<span class="error">'+ json.firstname + '<span>'); }
          }
           else { $('.reg-form .firstname span').remove(); }

          if(json.lastname) { 
             if( $('.reg-form .lastname span').hasClass('error') ) { }
              else { $('.reg-form .lastname').prepend('<span class="error">'+ json.lastname + '<span>'); }
          }
           else { $('.reg-form .lastname span').remove(); }

          if(json.email) { 
             if( $('.reg-form .email span').hasClass('error') ) { }
              else { $('.reg-form .email').prepend('<span class="error">'+ json.email + '<span>'); }
          }
           else { $('.reg-form .email span').remove(); }

          if(json.password) { 
             if( $('.reg-form .password span').hasClass('error') ) { }
              else { $('.reg-form .password').prepend('<span class="error">'+ json.password + '<span>'); }
          }
           else { $('.reg-form .password span').remove(); }

          if(json.confirm) { 
             if( $('.reg-form .confirm span').hasClass('error') ) { }
              else { $('.reg-form .confirm').prepend('<span class="error">'+ json.confirm + '<span>'); }
          }
           else { $('.reg-form .confirm span').remove(); }



           if(json.success == 'ok') window.location.href = "/index.php?route=account/success";
          

         },
         error:function(){
          alert('error!');
        }

      });
});

$(".send-login").click(function(e){
      e.preventDefault();
      var data = $('.login form').serialize();

      $.ajax({
         url: '/index.php?route=account/login/validate_login',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
            // console.log(json.warning);
            // console.log(json.success);
            if(json.success == 'ok') {  window.location.href = "/index.php?route=account/account";}
            else{

                    if(json.warning) { 
                    if( $('.login form span').hasClass('error') ) { }
                    else { $('.login form').prepend('<span class="error">'+ json.warning + '<span>'); }
                  }
                   else { $('.login form span').remove(); }
            }
         },
         error:function(){
          alert('error!');
        }

   });
});
</script>

