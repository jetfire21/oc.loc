<?php
 //print_r($transactions);
// print_r($affiliate_info);
  ?>

<?php echo $header; ?>

<div class="lk structure forgot">
<div class="wrapper-1">
  <div class="container">
   
<!--     <div class="full_name"> 
      <p>Профиль <?php echo $customer_info['firstname'].' '.$customer_info['lastname']; ?></</p>
      <h2>Личный кабинет</h2>
    </div>
    <div class="balans">
      <p>Ваш баланс: <span>1 200 руб</span></p>
      <a href="#">Как заработать?</a> / <a href="#">Куда потратить?</a>
      <a class="karta-out" href="#"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/visa.png" alt="">Вывести на карту</a>
    </div> -->

    <div class="clr"></div>
    

     <?php echo $lk_name; ?>


        <div class="lm-cart j-guest-offer">
      
        <div class="cart-product">
          <h3>Забыли пароль</h3>
          <div class="wrap_table">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <p>Введите адрес электронной почты Вашей учетной записи. Нажмите кнопку Отправить, чтобы получить пароль по электронной почте.</p>
                    <div class="content">
                      <?php if ($error_warning) { ?>
                          <span class="error"><?php echo $error_warning; ?></span>
                      <?php } ?>   
                         <?php if ($this->session->data['success']) { ?>
                          <span class="error"><?php echo $this->session->data['success']; ?></span>
                      <?php } ?>
                      <table class="form">
                        <tr>
                          <td><?php echo $entry_email; ?></td>
                          <td><input type="text" name="email" value="" /></td>
                        </tr>
                      </table>
                    </div>
<!--                    <div class="buttons">
                      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
                      <div class="right">
                        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
                      </div>
                    </div>  -->
                  </form>
          <div class="dop-links">
              <a class="checkout" href="/index.php?route=checkout/checkout">Отправить<img src="catalog/view/theme/jewelry/images/mini-arrow-right.png" alt=""></a>
          </div>
          </div>
        </div>

       <div class="clr"></div>
    </div> <!-- .lm-cart -->



</div>

<div class="lk-article-bg">

      <div class="container">
        <h4>От профессионалов продаж</h4>
        <?php echo $column_right; ?>

      </div>

</div>

<?php echo $footer; ?> 

<script type="text/javascript">
   $(".forgot .checkout").click(function(){
      $(".forgot form").submit();
      return false;
   });
</script>
