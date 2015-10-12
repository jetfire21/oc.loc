<?php echo $header; ?>
<div class="lk">
<div class="wrapper-1">
  <div class="container">

  <?php // echo $logged; ?>
  <?php if($logged) { ?>
  <!--    
    <div class="full_name"> 
        <p>Профиль Рубен Меджмулян</p>
        <h2>Личный кабинет</h2>
      </div>
      <div class="balans">
        <p>Ваш баланс: <span>1 200 руб</span></p>
        <a href="#">Как заработать?</a> / <a href="#">Куда потратить?</a>
        <a class="karta-out" href="#"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/visa.png" alt="">Вывести на карту</a>
      </div>
    <div class="clr"></div> -->
    <?php echo $lk_name; ?>
  <?php } ?>
    

    <?php if( !$logged) $class_guest = 'j-guest-offer'; ?>
    <div class="lm-cart <?php echo $class_guest; ?>">
      <?php if( $logged) { ?>
        <?php echo $column_left; ?>
      <?php } ?>

      <div class="cart-product">
        <h3>Мои заказы</h3>
        <div class="wrap_table">
        <table class="my-orders">
            <?php if ($orders): ?>
                <tr>
                <th>Номер заказа</th>
                <th colspan="2">Товары в заказе</th>
                <th>Статус</th>
                <th></th>
              </tr>

              <?php foreach ($orders as $order):?>
              <tr class="cart-item">
                <td class="order_id"> №<?php echo $order['order_id']; ?></td>
                <td colspan="2" class="product_title">
                   <?php foreach ($order['detal_prod'] as $k => $v): ?>
                      <p> <img src="<?php echo $home."image/".$v['image'];?>"/><span><?php echo $v['name'];?> x <?php echo $v['quantity'];?>шт</span></p>
                      <div class="clr"></div>
                   <?php endforeach; ?>                  
                </td>
                <td><?php echo $order['status']; ?></td>
                <td><a class="pink" href="<?php echo $order['href']; ?>">Подробнее</a></td>
              </tr>     
              <?php endforeach;?>
          <?php else:?>
              <p>Вы еще не совершали покупок!</p>
          <?php endif;?>         
        </table>
            <div class="dop-links">
            </div>
        </div>        
      </div>

       <div class="clr"></div>
    </div> <!-- .lm-cart -->
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
</div>


<?php

// echo "<pre>";
// print_r($products);
// echo "</pre";
// echo '$_SESSION';
// print_r($_SESSION);
// print_r($totals); 

?>


<?php echo $footer; ?>

<script type="text/javascript">

var sum = 0;
var i = 0;

$('.cart-item').each(function(index){
  $(this).find('#cart-kol').change(function() {
    var up_kol = $(this).val();
    // alert(up_kol);
    $(this).parent().find('.kol').text(up_kol + ' шт');

    $(this).parent().find("#my-q").val(up_kol);
    $('.update_cart input').val(up_kol);
     // console.log( $(this).parent().find('.update_cart').html() );
    $(this).parent().find('.update_cart').submit();
  });

});

</script>

<?php echo '----'. $stock; print_r($_SESSION); print_r($orders);?>

