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
                    <?php 
unset($affiliates[0]);
// print_r($affiliates);
?>
   
                            
                           <?php $i = 0; ?>
                         <?php if (isset($affiliates)) { ?>
                            <?php foreach ($affiliates as $affiliate): ?>

                                    <?php if($affiliate['level'] == 1): ?>

                                        <?php $id_lev1 = $affiliate['aff_id'];?>

                                        <?php if($i%2 == 0):?> 
                                          <table class="history table-gray"> 
                                        <?php else:?>
                                            <table class="history">  
                                         <?php endif;?>

                                    <?php endif;?>


                                       <?php if($i == 0):?>
                                             <tr>                        
                                                <th class="tabl-first">Имя</th>
                                                <th class="d-reg">Дата рег.</th>
                                                <th class="t-phone">Телефон</th>
                                                <th class="lev">Ур.</th>
                                                <th class="ref">Реф.</th>
                                                <th class="cash">Мой доход</th>
                                            </tr>
                                        <?php endif;?>


                                            <tr>
                                                <td class="tabl-first level-<?php echo $affiliate['level'];?>"><?php echo $affiliate['affiliate']; ?></td>
                                                <td class="d-reg"><?php echo $affiliate['phone3f']['date_added']; ?></td>
                                                 <?php if( !empty($affiliate['phone3f']['telephone'])): ?>
                                                    <td class="t-phone"><?php echo $affiliate['phone3f']['telephone']; ?> </td>
                                                <?php else:?>
                                                    <td class="light-gray">Не указан</td>
                                                <?php endif;?>
                                                <td class="lev"> <?php echo $affiliate['level']; ?></td>
                                                <td class="ref"><?php echo $affiliate['count_aff']; ?></td>
                                                <td class="cash bold"><?php echo $affiliate['commission']; ?></td>
                                            </tr>  
                                    <?php if( ($affiliate['level'] == 1 and $affiliate['aff_id'] != $id_lev1) or ($i == count($affiliates)-1) ): ?>   
                                    </table>
                                  <?php endif;?>
                                            
                                
                             <?php $i++;?>
                            <?php endforeach; ?>

                        <?php } else { ?>
                        <table class="history">
                        <tr>
                            <td class="center" colspan="7"> У вас пока нет партнеров</td>
                        </tr>
                        </table>
                        <?php } ?> 
                        <!-- </table> -->
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