<?php echo $header; ?>
<div class="lk">
<div class="wrapper-1">
	<div class="container">

  <?php // echo $logged; ?>
  <?php if($logged) { ?>
<!--       <div class="full_name"> 
        <p>Профиль Рубен Меджмулян</p>
        <h2>Личный кабинет</h2>
      </div>
      <div class="balans">
        <p>Ваш баланс: <span>1 200 руб</span></p>
        <a href="#">Как заработать?</a> / <a href="#">Куда потратить?</a>
        <a class="karta-out" href="#"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/visa.png" alt="">Вывести на карту</a>
      </div>
    <div class="clr"></div> -->
    <?php echo $lk_name;?>
  <?php } ?>
    

    <?php if( !$logged) $class_guest = 'j-guest-offer'; ?>
    <div class="lm-cart <?php echo $class_guest; ?>">
      <?php if( $logged) { ?>
        <?php echo $column_left; ?>
      <?php } ?>

			<div class="cart-product">
				<h3> </h3>
				<div class="wrap_table">
    
					<div class="name-block">

   <?php  

    define(MPAY_WEBSITE_ID, "1756");
    define(MPAY_ORDER_NUMBER, $this->session->data['next_order_id']);
    define(MPAY_PAYMENT_SUM,  $this->session->data['sum']);
    $secret_key = "I8huE5XKwxTwN2Fniv3DU31pyqU8Dy2O";
    $domain = $this->config->get('config_url');

    $signature = strtoupper( md5(
    md5( MPAY_WEBSITE_ID ) .
    md5(MPAY_ORDER_NUMBER) .
    md5(MPAY_PAYMENT_SUM) .
    md5($secret_key)
    ));

    ?>
                                                              
  <form action="https://multipay.bz/api/payments" method="post" class="ex-pay" >
    <input type="hidden" name="MPAY_WEBSITE_ID" value="<?php echo MPAY_WEBSITE_ID;?>">
    <input type="hidden" name="MPAY_PAYMENT_SUM" value="<?php echo MPAY_PAYMENT_SUM;?>">
    <input type="hidden" name="MPAY_CURRENCY" value="RUR">
    <input type="hidden" name="MPAY_ORDER_NUMBER" value="<?php echo MPAY_ORDER_NUMBER;?>">
    <input type="hidden" name="MPAY_PAYER_FIO" value="<?php echo $this->session->data['fio'];?> ">
    <input type="hidden" name="MPAY_PAYER_EMAIL" value="<?php echo $this->session->data['email'];?>">
    <input type="hidden" name="MPAY_PAYER_PHONE" value="<?php echo $this->session->data['telephone'];?>">
    <input type="hidden" name="MPAY_DESCRIPTION" value="Оплата товара">
    <input type="hidden" name="MPAY_SIGNATURE" value="<?php echo $signature;?>">
    <input type="hidden" name="MPAY_RETURN_URL_OK" value="<?php echo $this->url->link('checkout/success');?>">
    <input type="hidden" name="MPAY_RETURN_URL_NO" value="<?php echo $this->url->link('checkout/checkout').'&cart=del';?>">
    <!-- <input type="submit" value="Оплатить"> -->
  </form>

    				<div class="clr"></div>
    				<div class="dop-links">
    				<a class="checkout confirm-pay" href="#">Подтвердить оплату<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/mini-arrow-right.png" alt=""></a>
    				</div>


			</div>     <!-- .name-block -->
           <!-- <input type="submit" value="<?php echo $button_continue; ?>" id="button-guest" class="button" />  -->

     <div class="clr"></div>

		</div> <!-- .wrap_table -->
	</div>  <!-- .cart_product -->
</div>  <!-- .lm-cart -->
</div>
</div>

<div class="lk-article-bg">

			<div class="container">
				<h4>От профессионалов продаж</h4>
        <?php echo $column_right; ?>
	
			</div>

</div>

</div> <!-- .lk -->

<?php echo $footer; ?>


<script type="text/javascript">
$(".confirm-pay").click(function(e){
    e.preventDefault();
      $(".ex-pay").submit();
});

</script> 

<?php
/*
print_r($totals);?>
 echo $this->session->data['balans_noformat'];
echo $this->session->data['affiliate_id'];
print_r($_SESSION);
*/
?>