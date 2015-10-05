<?php echo $header; ?>

<div class="lk structure">
<div class="wrapper-1">
  <div class="container">

    <div class="full_name"> 
      <p>Профиль <?php echo $customer_info['firstname'].' '.$customer_info['lastname']; ?></</p>
      <h2>Личный кабинет</h2>
    </div>
    <div class="balans">
      <p>Ваш баланс: <span>1 200 руб</span></p>
      <a href="#">Как заработать?</a> / <a href="#">Куда потратить?</a>
      <a class="karta-out" href="#"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/visa.png" alt="">Вывести на карту</a>
    </div>

    <div class="clr"></div>

    <div class="lm-cart">

      <?php echo $column_left; ?>
            <div class="cart-product">
                <h3>Структура и регистрации </h3>
                <div class="wrap_table">
                <h4>Моя структура партнеров</h4>
                    <table class="history table-gray">  
                        <?php if (isset($affiliates)) { ?>
                             <tr>                        
                                <th>Имя</th>
                                <th>Дата рег.</th>
                                <th>Телефон</th>
                                <th>Ур.</th>
                                <th>Реф.</th>
                                <th>Мой доход</th>
                            </tr>
                        <?php foreach ($affiliates as $affiliate) { ?>
                        <tr>
                            <td class="level-<?php echo $affiliate['level'];?>"><?php echo $affiliate['affiliate']; ?></td>
                            <td class="d-reg"><?php echo $affiliate['phone3f']['date_added']; ?></td>
                             <?php if( !empty($affiliate['phone3f']['telephone'])): ?>
                                <td class="t-phone"><?php echo $affiliate['phone3f']['telephone']; ?> </td>
                            <?php else:?>
                                <td class="light-gray">Не указан</td>
                            <?php endif;?>
                            <td> <?php echo $affiliate['level']; ?></td>
                            <td><?php echo count($affiliates)-1;?></td>
                            <td class="bold"><?php echo $affiliate['commission']; ?></td>
                        </tr>   

<!--                          <tr>
                                <td><?php echo $affiliate['level']; ?></td>
                                <td><?php echo $affiliate['affiliate']; ?></td>
                                <td><?php echo $affiliate['count_orders']; ?></td>
                                <td><?php echo $affiliate['count_shopping']; ?></td>
                                <td><?php echo $affiliate['sum_orders']; ?></td>
                                <td><?php echo $affiliate['sum_shopping']; ?></td>
                                <td><?php echo $affiliate['commission']; ?></td>
                             </tr> -->
                         <?php } ?>
                        <?php } else { ?>
                        <tr>
                            <td class="center" colspan="7"><?php echo $text_no_results; ?></td>
                        </tr>
                        <?php } ?>
                    </table>
<!--                     <?php foreach ($affiliates as $affiliate) { ?>
                              <tr>
                                <td><?php echo $affiliate['level']; ?></td>
                                <td><?php echo $affiliate['affiliate']; ?></td>
                                <td><?php echo $affiliate['count_orders']; ?></td>
                                <td><?php echo $affiliate['count_shopping']; ?></td>
                                <td><?php echo $affiliate['sum_orders']; ?></td>
                                <td><?php echo $affiliate['sum_shopping']; ?></td>
                                <td><?php echo $affiliate['commission']; ?></td>
                                <td><?php print_r($affiliate['phone3f']); ?></td>
                             </tr>
                               <?php } ?> -->
                
            </div>
                    <div class="clr"></div>
        </div>
    </div>
</div>

<div class="lk-article-bg">

            <div class="container">
                <h4>От профессионалов продаж</h4>

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
            
            </div>

</div>

<?php echo $footer; ?> 