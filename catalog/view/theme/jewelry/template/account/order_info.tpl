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
        <h3>Заказ №<?php echo $order_id; ?> Дата: <?php echo $date_added; ?></h3>
        <div class="wrap_table">
        <table>

          <tr>
            <th colspan="2">Товар</th>
            <th>Артикул</th>
            <th>Размер</th>
            <th>Кол-во</th>
            <th>Цена</th>
            <th></th>
          </tr>

           <?php foreach ($products as $product): ?>
              <tr class="cart-item">
                <td></td>
                <td class="product_title"><a href="item.html"><?php echo $product['name']; ?></a></td>
                <td><?php echo $product['model']; ?></td>
                <td>
                <?php if($product['option']):?>
                    <?php foreach ($product['option'] as $option): ?>
                      <?php echo $option['value']; ?>
                    <?php endforeach;?>
                <?php else:?>
                  Нет
                <?php endif;?>
                </td>
                <td>
                  <span><?php echo $product['quantity']; ?> шт</span>  
                  <?php $count_prod = $count_prod + $product['quantity']; ?>
                </td>
                <td><?php echo $product['total']; ?></td>
                <td class="del_product"></td>
              </tr>
          <?php endforeach;?>

          <tr>
            <td colspan="3"></td>
            <td>Итого</td>
            <td class="bold"><?php echo $count_prod;?> шт</td>
            <td class="bold"><?php echo $totals[1]['text']; ?></td>
          </tr>    

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

<!-- <?php echo '----'. $stock; print_r($_SESSION); print_r($products);?> -->

