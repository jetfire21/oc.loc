<?php echo $header; ?>

<div class="lk account">
<div class="wrapper-1">
  <div class="container">

<!--     <div class="full_name"> 
      <p>Профиль <?php echo $customer_info['firstname'].' '.$customer_info['lastname']; ?></</p>
      <h2>Личный кабинет</h2>
    </div>
    <div class="balans">
      <p>Ваш баланс: <span><?php echo $this->session->data['balans'];?></span></p>
      <a href="#">Как заработать?</a> / <a href="#">Куда потратить?</a>
      <a class="karta-out" href="#"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/visa.png" alt="">Вывести на карту</a>
    </div>

    <div class="clr"></div> -->
    <?php echo $lk_name; ?>

    <div class="lm-cart">

      <?php echo $column_left; ?>
      <div class="cart-product">
        <h3>Профиль </h3>
        <div class="wrap_table">
          <div class="name-block">
               <img class="lk-foto-customer" src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/foto-customer.jpg" alt="">

            <div class="offer-n">
                <p>Имя: </p>
                <span class="hover-hidden"><?php echo $customer_info['firstname']; ?> </span> 
                <form action="<?php // echo $link_account;?>" class="edit-val firstname" method="post">
                  <input type="text" name="firstname" value="<?php echo $customer_info['firstname']; ?>">
                  <input type="submit" value=" ">
                </form>
            </div>
             <div class="clr"></div>
            <div class="offer-n">
                <p>Фамилия: </p><span> 
                 <span class="hover-hidden"><?php echo $customer_info['lastname']; ?> </span> 
                <form action="<?php // echo $link_account;?>" class="edit-val lastname" method="post">
                  <input type="text" name="lastname" value="<?php echo $customer_info['lastname']; ?>">
                  <input type="submit" value=" ">
                </form>
            </div>
          <div class="clr"></div>
            <div class="offer-n">
            <p>Отчество: </p>
                 <?php if($customer_info['middlename']) { ?>
                      <span class="hover-hidden"><?php echo $customer_info['middlename']; ?></span>
                <?php } else { ?>
                    <span class="hover-hidden lk-gray">Не указано</span> 
                <?php } ?>
                  <form action="<?php // echo $link_account;?>" class="edit-val middlename" method="post">
                    <input type="text" name="middlename" value="<?php echo $customer_info['middlename']; ?>">
                    <input type="submit" value=" ">
                  </form>
            </div>
            <div class="clr"></div>
            <div class="offer-n long-text"><p> Адрес доставки: </p>
                 <?php if($address['address_1']) { ?>
                      <span class="hover-hidden"><?php echo $address['address_1']; ?></span>
                <?php } else { ?>
                    <span class="hover-hidden lk-gray"> Не указано</span> 
                <?php } ?>
                  <form action="<?php // echo $link_account;?>" class="edit-val address_1" method="post">
                    <input type="text" name="address_1" value="<?php echo $address['address_1']; ?>">
                    <input type="submit" value=" ">
                  </form>
            </div>
            <div class="clr"></div>
            <div class="offer-n"><p>Номер телефона: </p>
                 <?php if($customer_info['telephone']) { ?>
                      <span class="hover-hidden"><?php echo $customer_info['telephone']; ?></span>
                <?php } else { ?>
                    <span class="hover-hidden lk-gray">Не указано</span> 
                <?php } ?>
                  <form action="<?php // echo $link_account;?>" class="edit-val telephone" method="post">
                    <input type="text" name="telephone" value="<?php echo $customer_info['telephone']; ?>">
                    <input type="submit" value=" ">
                  </form>
             </div>
            <div class="clr"></div>

            <div class="offer-n"><p>E-mail: </p>
                <?php if($customer_info['email']) { ?>
                      <span class="hover-hidden"><?php echo $customer_info['email']; ?></span>
                <?php } else { ?>
                    <span class="hover-hidden lk-gray">Не указано</span> 
                <?php } ?>
                   
                  <form action="<?php // echo $link_account;?>" class="edit-val email" method="post">
                    <input type="text" name="email" value="<?php echo $customer_info['email']; ?>">
                    <input type="submit" value=" ">
                  </form>
		    	</div>
          <div class="clr"></div>

            <div class="offer-n"><p>Skype: </p>
                <?php if($customer_info['skype']) { ?>
                      <span class="hover-hidden"><?php echo $customer_info['skype']; ?></span>
                <?php } else { ?>
                    <span class="hover-hidden lk-gray">Не указано</span> 
                <?php } ?>
                   
                  <form action="<?php // echo $link_account;?>" class="edit-val skype" method="post">
                    <input type="text" name="skype" value="<?php echo $customer_info['skype']; ?>">
                    <input type="submit" value=" ">
                  </form>
          </div>
          <div class="clr"></div>

            <div class="offer-n"><p>Почтовый индекс: </p>
                <?php if($address['postcode']) { ?>
                      <span class="hover-hidden"><?php echo $address['postcode']; ?></span>
                <?php } else { ?>
                    <span class="hover-hidden lk-gray">Не указано </span> 
                <?php } ?>
                   
                  <form action="<?php // echo $link_account;?>" class="edit-val postcode" method="post">
                    <input type="text" name="postcode" value="<?php echo $address['postcode']; ?>">
                    <input type="submit" value=" ">
                  </form>
            </div>
            <div class="clr"></div>
            <div class="offer-n">
              <p>Моя фотография: </p><span class="lk-gray">Не загружена</span><span class="pink">Загрузить</span>
<!--                <form action="" enctype="multipart/form-data">
                <input type="file">
                <input type="submit" value="Загрузить">
              </form> -->
            </div>
            <div class="clr"></div>
            <div class="offer-n">
                <p>Пароль для входа: </p>
                <span class="pink hover-hidden">Изменить</span>  
                  <form action="<?php // echo $link_account;?>" class="edit-val password" method="post">
                    <input type="text" name="password" value="">
                    <input type="submit" value=" ">
                  </form>
            </div>
            <div class="clr"></div>
        </div>        
      </div>
         <div class="clr"></div>
    </div>

  </div> <!-- lm-cart -->
</div>  <!--container-->

<div class="lk-article-bg">

      <div class="container">
        <h4>От профессионалов продаж</h4>


     <?php echo $column_right; ?>
<!--   
        <div class="article">
             <div class="icon-new"></div>
             <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/women-kak-pod-akses.jpg" alt="">
             <div class="a-text">
                <h2><a href="">Подруге может быть интересно</a></h2>
                <span>Статья от стилиста с телеканала дождь</span>
             </div>
           </div> 

          <div class="article mini-img">
             <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/girl-military.jpg" alt="">
             <div class="a-text">
               <h2><a href="">Мы продаем то что в тренде - заработайте на этом!</a></h2>              
                <span>Рудактор портала DB News</span>
             </div>     
           </div> 

          <div class="article mini-img">
             <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/girl-remen.jpg" alt="">
             <div class="a-text">
                <h2><a href="">10 советов по постингу ссылки</a></h2>             
                <span>Рудактор портала DB News</span>
             </div>
           </div>
 -->

           <!-- <?php echo $articleprod_bottom; ?>  -->
      
      </div>

</div>
</div>

<?php // echo $text_new_customer; print_r($_SESSION); print_r($customer_info); ?>

<?php echo $footer; ?> 

<script type="text/javascript">

  $(".name-block .firstname input[type='submit'").click(function(e){
      e.preventDefault();

      var redirect = "/index.php?route=account/account";
      var data = $(".name-block .firstname").serialize();
      console.log(data);

      $.ajax({
         url: '/index.php?route=account/account/edit_profile',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
          if(json.success == "ok") {  window.location.href = redirect;}
          if(json.error_firstname) { $(".name-block .firstname").parent().append('<span class="error">' + json.error_firstname + '</span>');}
          console.log(json);
         },
         error:function(){
          alert('error!');
        }
     });

  });

    $(".name-block .lastname input[type='submit'").click(function(e){
      e.preventDefault();

      var redirect = "/index.php?route=account/account";
      var data = $(".name-block .lastname").serialize();
      console.log(data);

      $.ajax({
         url: '/index.php?route=account/account/edit_profile',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
          if(json.success == "ok") {  window.location.href = redirect;}
          if(json.error_lastname) { $(".name-block .lastname").parent().append('<span class="error">' + json.error_lastname + '</span>');}
          console.log(json);
         },
         error:function(){
          alert('error!');
        }
     });

  });

  $(".name-block .telephone input[type='submit'").click(function(e){
      e.preventDefault();

      var redirect = "/index.php?route=account/account";
      var data = $(".name-block .telephone").serialize();
      console.log(data);

      $.ajax({
         url: '/index.php?route=account/account/edit_profile',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
          if(json.success == "ok") {  window.location.href = redirect;}
          if(json.error_telephone) { $(".name-block .telephone").parent().append('<span class="error">' + json.error_telephone + '</span>');}
          console.log(json);
         },
         error:function(){
          alert('error!');
        }
     });

  });

$(".name-block .email input[type='submit'").click(function(e){
      e.preventDefault();

      var redirect = "/index.php?route=account/account";
      var data = $(".name-block .email").serialize();
      console.log(data);

      $.ajax({
         url: '/index.php?route=account/account/edit_profile',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
          if(json.success == "ok") {  window.location.href = redirect;}
          if(json.error_email) { $(".name-block .email").parent().append('<span class="error">' + json.error_email + '</span>');}
          console.log(json);
         },
         error:function(){
          alert('error!');
        }
     });

});


$(".name-block .skype input[type='submit'").click(function(e){
      e.preventDefault();

      var redirect = "/index.php?route=account/account";
      var data = $(".name-block .skype").serialize();
      console.log(data);

      $.ajax({
         url: '/index.php?route=account/account/edit_profile',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
          if(json.success == "ok") {  window.location.href = redirect;}
          if(json.error_skype) { $(".name-block .skype").parent().append('<span class="error">' + json.error_skype + '</span>');}
          console.log(json);
         },
         error:function(){
          alert('error!');
        }
     });

});

$(".name-block .postcode input[type='submit'").click(function(e){
      e.preventDefault();

      var redirect = "/index.php?route=account/account";
      var data = $(".name-block .postcode").serialize();
      console.log(data);

      $.ajax({
         url: '/index.php?route=account/account/edit_profile',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
          if(json.success == "ok") {  window.location.href = redirect;}
          if(json.error_postcode) { $(".name-block .postcode").parent().append('<span class="error">' + json.error_postcode + '</span>');}
          console.log(json);
         },
         error:function(){
          alert('error!');
        }
     });

});

$(".name-block .password input[type='submit'").click(function(e){
      e.preventDefault();

      var redirect = "/index.php?route=account/account";
      var data = $(".name-block .password").serialize();
      console.log(data);

      $.ajax({
         url: '/index.php?route=account/account/edit_profile',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
          if(json.success == "ok") {  alert("Ваш пароль успешно изменен!"); window.location.href = redirect;}
          if(json.error_password) { $(".name-block .password").parent().append('<span class="error">' + json.error_password + '</span>');}
          console.log(json);
         },
         error:function(){
          alert('error!');
        }
     });

});

$(".name-block .middlename input[type='submit'").click(function(e){
      e.preventDefault();

      var redirect = "/index.php?route=account/account";
      var data = $(".name-block .middlename").serialize();
      console.log(data);

      $.ajax({
         url: '/index.php?route=account/account/edit_profile',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
          if(json.success == "ok") {  window.location.href = redirect;}
          if(json.error_middlename) { $(".name-block .middlename").parent().append('<span class="error">' + json.error_middlename + '</span>');}
          console.log(json);
         },
         error:function(){
          alert('error!');
        }
     });

});

$(".name-block .address_1 input[type='submit'").click(function(e){
      e.preventDefault();

      var redirect = "/index.php?route=account/account";
      var data = $(".name-block .address_1").serialize();
      console.log(data);

      $.ajax({
         url: '/index.php?route=account/account/edit_profile',
         // url: 'http://oc.loc/catalog/controller/account/register.php',
         type: 'post',
         data: data,
         dataType: 'json',
         success: function(json) {
          if(json.success == "ok") {  window.location.href = redirect;}
          if(json.error_address_1) { $(".name-block .address_1").parent().append('<span class="error">' + json.error_address_1 + '</span>');}
          console.log(json);
         },
         error:function(){
          alert('error!');
        }
     });

});

</script>