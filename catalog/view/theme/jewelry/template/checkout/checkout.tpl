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
				<h3>Оформление заказа №<?php echo $next_order_id;?> </h3>
				<div class="wrap_table">
          <form action="<?php echo $action;?>" method="post" enctype="multipart/form-data" class="send-form-customer">
					<div class="name-block">
                        <div class="offer-n"><p> * Имя </p>
                              <input type="text" name="firstname" value="<?php echo $firstname; ?>"  class="large-field" />
                              <?php if ($error_firstname) { ?>
                                <div class="error"><?php echo $error_firstname; ?></div>
                              <?php } ?>
                        </div>
                        <div class="offer-n"><p> * <?php echo $entry_lastname; ?></p>
                              <input type="text" name="lastname" value="<?php echo $lastname; ?>"  class="large-field" />
                              <?php if ($error_lastname) { ?>
                                <div class="error"><?php echo $error_lastname; ?></div>
                              <?php } ?>
                        </div>   
                        <div class="offer-n"><p> * Отчество</p>
                              <input type="text" name="middlename" value="<?php echo $middlename; ?>"  class="large-field" />
                              <?php if ($error_middlename) { ?>
                                <div class="error"><?php echo $error_middlename; ?></div>вава
                              <?php } ?>
                        </div>                        
                        <div class="offer-n"><p> * <?php echo $entry_email; ?></p>
                              <input type="text" name="email" value="<?php echo $email; ?>"  class="large-field" />
                              <?php if ($error_email) { ?>
                                <div class="error"><?php echo $error_email; ?></div>
                              <?php } ?>
                        </div>                        
                        <div class="offer-n"><p> * <?php echo $entry_telephone; ?></p>
                              <input type="text" name="telephone" value="<?php echo $telephone; ?>"  class="large-field" />
                              <?php if ($error_telephone) { ?>
                                <div class="error"><?php echo $error_telephone; ?></div>
                              <?php } ?>
                        </div>                        
                        <div class="offer-n"><p> * <?php echo $entry_address_1; ?></p>
                              <input type="text" name="address_1" value="<?php echo $address_1; ?>"  class="large-field" />
                              <?php if ($error_address_1) { ?>
                                <div class="error"><?php echo $error_address_1; ?></div>
                              <?php } ?>
                        </div>
<!--                         <div class="offer-n"><p> * <?php echo $entry_city; ?></p>
                              <input type="text" name="city" value="<?php echo $city; ?>"  class="large-field" />
                              <?php if ($error_city) { ?>
                                <div class="error"><?php echo $error_city; ?></div>
                              <?php } ?>
                        </div>  -->                      
                         <div class="offer-n"><p> * <?php echo $entry_postcode; ?></p>
                              <input type="text" name="postcode" value="<?php echo $postcode; ?>"  class="large-field" />
                              <?php if ($error_postcode) { ?>
                                <div class="error"><?php echo $error_postcode; ?></div>
                              <?php } ?>
                        </div>                                              
<!--                         <div class="offer-n"><p> * <?php echo $entry_country; ?></p>
                            <select name="country_id" class="large-field">
                                <option value=""><?php echo $text_select; ?></option>
                                <?php foreach ($countries as $country) { ?>
                                <?php if ($country['country_id'] == $country_id) { ?>
                                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                <?php } else { ?>
                                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                <?php } ?>
                                <?php } ?>
                              </select>
                              <?php if ($error_country) { ?>
                                    <div class="error"><?php echo $error_country; ?></div>
                              <?php } ?>
                        </div>
                         <div class="offer-n"><p> * <?php echo $entry_zone; ?></p>
                             <select name="zone_id" class="large-field">
                              </select>
                              <?php if ($error_zone) { ?>
                                    <div class="error"><?php echo $error_zone; ?></div>
                              <?php } ?>
                        </div>  -->                         
          						<div class="offer-n"><p class="sposob-op">Способ оплаты: </p>
          							<div class="radioblock pay-method">
              							<div class="radio"><span>Оплата оналйн</span></div>
              							<div class="radio r-active"><span>Оплата при получении</span> </div>
              							<!-- <input type="hidden" name="time-pay"/> -->
                            <input type="hidden" name="payment_method" value="Оплата при получении" id="payment_method" />
          							</div
          						</div>				
          					</div>

					 <div class="clr"></div>

					<div class="way-pay">

  						<div class="offer-n">
  						<p>Способ доставки: </p>
  							<div class="radioblock">
  								<div class="radio"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/dhl.jpg" alt=""><span>Доставка почтовой службой DHL (Наложенный платеж)</span></div>
  								<!-- <div class="radio"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/mail-ru.jpg" alt=""><span>Доставка Почта России (Наложенный платеж)</span></div> -->
  								<div class="radio r-active"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/mail-ru.jpg" alt=""><span>Доставка Почта России (Наложенный платеж)</span></div>
                  <input type="hidden" name="shipping_method" value="Доставка Почта России (Наложенный платеж)" id="shipping_method" />
  							</div
  						</div>
  					</div>

    				<div class="clr"></div>
        </div>  <!-- .way-pay -->
    				<div class="dop-links">
    					<a class="back-shop" href="index.php?route=checkout/cart"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/mini-arrow-left.png" alt="">Вернуться в корзину товаров</a><a class="popup-modal2 checkout" href="#send-order">Отправить заказ<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/mini-arrow-right.png" alt=""></a>
    				</div>


			</div>     <!-- .name-block -->
           <!-- <input type="submit" value="<?php echo $button_continue; ?>" id="button-guest" class="button" />  -->
      </form>
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
			</div>

</div>

</div> <!-- .lk -->

<?php echo $footer; ?>

  <div id="send-order" class="white-popup-block mfp-hide">
  			<div class="popup-modal-close">X</div>
			<h3>Оплата заказа №<?php echo $next_order_id;?></h3>

      <?php if($this->session->data['balans']):?>
  			<p>
  			На вашем счету в личном кабинете есть <span class="action"><?php echo $this->session->data['balans'];?>,</span>  вы можете использовать 
  			ее для полной или частичной оплаты заказа.
  			</p>
      <?php else: ?>
          <p>
        На вашем счету нет средств для полной или частичной оплаты заказа.
        </p>
      <?php endif;?>

			<div class="summa">
				<div><p>Сумма к оплате заказа: </p><span><?php echo $totals[1]['text']; ?> </span></div>
				<div class="clr"></div>
         <?php if($this->session->data['balans']):?>
				    <div><p>Сумма с учетом <br>бонусных средств с ЛК: </p><span class="pink">
            <?php 
            if( $this->session->data['balans_noformat'] > $totals[1]['value']) {
              echo "0 руб";
           }elseif( $this->session->data['balans_noformat'] < $totals[1]['value']){
             $sum = $totals[1]['value'] - $this->session->data['balans_noformat'];
             echo $sum = $this->currency->format( $sum , $this->config->get('config_currency'));
           }
            ?>
            </span></div>
        <?php else: ?>
          <div><p>Сумма с учетом <br>бонусных средств с ЛК: </p><span class="pink">0 руб</span></div>
        <?php endif;?>
			</div>
			<div class="clr"></div>
			<a href="#" class="pay-bonus">Оплатить с бонусами <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/white-arrow.png" alt=""></a>
			<a href="#" class="bez_bonus">Оплатить без бонусов</a>
		</div>
   </div>

<script type="text/javascript">

$(".pay-method .radio").bind('click',function(){
    var pay = $(this).find('span').text();
    $(this).parent().find("#payment_method").val(pay);
});

$(".way-pay .radio").bind('click',function(){
    var pay = $(this).find('span').text();
    $(this).parent().find("#shipping_method").val(pay);
});

$("#send-order .bez_bonus").click(function(e){
    e.preventDefault();
    $(".send-form-customer").submit();
});


  $("#send-order .pay-bonus").click(function(e){

    e.preventDefault();

    var redirect = 'http://oc.loc/index.php?route=account/account/history';
    <?php if($this->session->data['balans_noformat']): ?>
      var bonus = <?php echo $this->session->data['balans_noformat'];?>
    <?php else: ?>
      var bonus = 0;
    <?php endif;?>
    
    console.log(bonus);
    if(bonus > 0){
      console.log(bonus);
         $(".send-form-customer").submit();
    }
    else{
      alert("У вас нет бонусов!");
      return false;
    }

      //  $.ajax({
      //      url: 'http://oc.loc/index.php?route=account/account/withdrawal',
      //      // url: 'http://oc.loc/catalog/controller/account/register.php',
      //      type: 'post',
      //      data: 'data=withdrawal',
      //      dataType: 'json',
      //      success: function(json) {
      //         if(json.balans) { 
      //           // alert(json.balans); 
      //           alert("Oтправлен запрос на вывод");
      //           window.location = redirect;
      //         }
      //       if(json.error) { alert('Нечего выводить! Ваш баланс 0 рублей');}
      //         console.log(json);
      //      },
      // error:function(xhr, ajaxOptions, thrownError) {
      //   alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      // }
      //  });

  });


// $('input[name=\'customer_group_id\']:checked').live('change', function() {
//   var customer_group = [];
  
// <?php foreach ($customer_groups as $customer_group) { ?>
//   customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
//   customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
//   customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
//   customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
//   customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
// <?php } ?>  

//   if (customer_group[this.value]) {
//     if (customer_group[this.value]['company_id_display'] == '1') {
//       $('#company-id-display').show();
//     } else {
//       $('#company-id-display').hide();
//     }
    
//     if (customer_group[this.value]['company_id_required'] == '1') {
//       $('#company-id-required').show();
//     } else {
//       $('#company-id-required').hide();
//     }
    
//     if (customer_group[this.value]['tax_id_display'] == '1') {
//       $('#tax-id-display').show();
//     } else {
//       $('#tax-id-display').hide();
//     }
    
//     if (customer_group[this.value]['tax_id_required'] == '1') {
//       $('#tax-id-required').show();
//     } else {
//       $('#tax-id-required').hide();
//     } 
//   }
// });

// $('input[name=\'customer_group_id\']:checked').trigger('change');
// //--></script> 
// <script type="text/javascript"><!--
// $('select[name=\'country_id\']').bind('change', function() {
//   if (this.value == '') return;
//   $.ajax({
//     url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
//     dataType: 'json',
//     beforeSend: function() {
//       // $('select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
//     },
//     complete: function() {
//       $('.wait').remove();
//     },      
//     success: function(json) {
//       if (json['postcode_required'] == '1') {
//         $('#payment-postcode-required').show();
//       } else {
//         $('#payment-postcode-required').hide();
//       }
      
//       html = '<option value=""><?php echo $text_select; ?></option>';
      
//       if (json['zone'] != '') {
//         for (i = 0; i < json['zone'].length; i++) {
//               html += '<option value="' + json['zone'][i]['zone_id'] + '"';
            
//           if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
//                 html += ' selected="selected"';
//             }
  
//             html += '>' + json['zone'][i]['name'] + '</option>';
//         }
//       } else {
//         html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
//       }
      
//       $('select[name=\'zone_id\']').html(html);
//     },
//     error: function(xhr, ajaxOptions, thrownError) {
//       alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
//     }
//   });
// });

// $('select[name=\'country_id\']').trigger('change');




//--></script> 

<?php print_r($totals);?>
<?php echo $this->session->data['balans_noformat'];?>
<?php echo $this->session->data['affiliate_id'];?>
<?php print_r($_SESSION);?>