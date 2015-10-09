<?php echo $header; ?>

<div class="lk structure">
<div class="wrapper-1">
  <div class="container">

    <div class="full_name"> 
      <p>Профиль <?php echo $customer_info['firstname'].' '.$customer_info['lastname']; ?></</p>
      <h2>Личный кабинет</h2>
    </div>
    <div class="balans">
      <p>Ваш баланс: <span><?php echo $sum_comission;?></span></p>
      <!-- <p>Ваш баланс: <span>1 200 руб</span></p> -->
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
//unset($affiliates[0]);
// print_r($affiliates);
?>
   
                            
                           <?php $i = 0; $table = 0; ?>
                         <?php if (isset($affiliates)) { ?>
                            <?php foreach ($affiliates as $k => $affiliate): ?>

                                    <?php if($affiliate['level'] == 0): ?>

                                        <?php $id_lev1 = $affiliate['aff_id'];?>

                                        <?php if($table % 2 == 0):?> 
                                          <table class="history table-gray"> 
                                        <?php else:?>
                                            <table class="history">  
                                         <?php endif;?>
                                         <?php $table++; ?>
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

                                            <?php 
                                                // if($affiliate['level'] == 0) {
                                                //     for($i = $k; $i < count($affiliates); $i++){
                                                //         // $next = $affiliates[$k+1]['affiliate'];
                                                //         if($affiliate['aff_id'] == $affiliates[$k+1]['parent'] )   { 

                                                //                $html = '<div class="switcher s_lev_1 my-plus"></div>';
                                                //         }
                                                //     }
                                                //     $children = "parent";
                                                // }
                                                // else {
                                                //      $html = '';
                                                //     $children = "children";
                                                // }     


                                               //  for($j = $affiliate['level']; $j < $affiliate['level']+1; $j++){
	                                              //   if($affiliate['level'] == $j) {
	                                              //       for($i = $k; $i < count($affiliates); $i++){
	                                              //           // $next = $affiliates[$k+1]['affiliate'];
	                                              //           if($affiliate['aff_id'] == $affiliates[$k+1]['parent'] )   { 

	                                              //                  $html = '<div class="switcher s_lev_'.$j.' my-plus"></div>';
	                                              //           }
	                                              //       }
	                                              //   } 
	                                              // }

                                                // if($affiliate['level'] == 1) {
                                                //     for($i = $k; $i < count($affiliates); $i++){
                                                //         // $next = $affiliates[$k+1]['affiliate'];
                                                //         if($affiliate['aff_id'] == $affiliates[$k+1]['parent'] )   { 

                                                //                $html = '<div class="switcher s_lev_2 my-plus"></div>';
                                                //         }
                                                //     }
                                                // }   

                                             ?>
                                            <tr class="<?php echo $children;?> children-<?php echo $affiliate['level']+1;?>" >
                                                <td class="tabl-first level-<?php echo $affiliate['level']+1;?>">
<!-- 	                                                <?php if($affiliate['level'] < 6):?>
	                                                	<div class="switcher s_lev_<?php echo $affiliate['level']+1;?> my-plus"></div>
	                                                <?php endif;?> -->
	                                                <?php
                                                    for($j = $affiliate['level']; $j < $affiliate['level']+1; $j++){
	                                                if($affiliate['level'] == $j) {
	                                                    for($i = $k; $i < count($affiliates); $i++){
	                                                        // $next = $affiliates[$k+1]['affiliate'];
	                                                        if($affiliate['aff_id'] == $affiliates[$k+1]['parent'] )   { 

	                                                               $html = '<div class="switcher s_lev_'.($j+1).' my-plus"></div>';
	                                                        }
	                                                        else $html = '<div class="switcher-empty">&nbsp;&nbsp;</div>';

	                                                    }
	                                                } 
	                                              }
	                                                ?>
	                                                <?php echo $html. $affiliate['affiliate']; ?>
                                                </td>
                                                <td class="d-reg"><?php echo $affiliate['phone3f']['date_added']; ?></td>
                                                 <?php if( !empty($affiliate['phone3f']['telephone'])): ?>
                                                    <td class="t-phone"><?php echo $affiliate['phone3f']['telephone']; ?> </td>
                                                <?php else:?>
                                                    <td class="light-gray">Не указан</td>
                                                <?php endif;?>
                                                <td class="lev"> <?php echo $affiliate['level']+1; ?></td>
                                                <td class="ref"><?php echo $affiliate['count_aff']; ?></td>
                                                <td class="cash bold"><?php echo $affiliate['commission']; ?></td>
                                            </tr>  
                                            
                                    <?php if( $affiliate['level'] == 0):?>  
                                        
                                        <?php  for($i = $k; $i < count($affiliates); $i++) {
                                            if( $affiliate['aff_id'] != $affiliates[$k+1]['parent'] )   { 
                                                echo "</table>";
                                             }
                                          }   
                                     ?>
                    
                                  <?php endif;?>

                                  <?php if( $i == count($affiliates)-1 ): ?>
                                     </table>
                                  <?php endif;?>
                                            
                                
                             <?php $i++;?>
                            <?php endforeach; ?>
                                <div class="itog">
                                        <div>
                                            <p>Итого</p>
                                            <p><?php echo $count_aff;?></p>
                                            <p class="bold"><?php echo $sum_comission;?></p>
                                        </div>
                                </div>

                        <?php } else { ?>
                        <table class="history">
                        <tr>
                            <td class="center" colspan="7"> У вас пока нет партнеров</td>
                        </tr>
                        </table>
                        <?php } ?> 

                        <?php 
							foreach ($affiliates as $k => $v) {
								if($v['phone3f']['date_added']) $date[$v['phone3f']['date_added']] = $v;
							}
							ksort($date);
                        ?>


                        <h4>История регистраций</h4>
                    <table class="history single-table">

                            <th>Дата рег.</th>
                            <th>Имя</th>
                            <th>Телефон</th>
                            <th>Ур.</th>
                            <th>Реф.</th>
                            <th>Заработал</th>
                            <?php $i=1; foreach ($date as $v): ?>
                                <tr>
                                    <td><?php echo $v['phone3f']['date_added'];?></td>
                                    <td><?php echo $v['affiliate'];?></td>
                                               <?php if($v['phone3f']['telephone']): ?>
                                                    <td class="t-phone"><?php echo $v['phone3f']['telephone']; ?> </td>
                                                <?php else:?>
                                                    <td class="light-gray">Не указан</td>
                                                <?php endif;?>
                                    <td><?php echo $v['level']+1;?></td>
                                    <td><?php echo $v['count_aff'];?></td>
                                    <td><?php echo $v['cash_aff'];?></td>
                                </tr>
								<?php if($i == 10) break; ?>
                            <?php $i++; endforeach;?>
                    </table>


                        
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

<script type="text/javascript">
$(document).ready(function() {

$(".s_lev_1").click(function(){
    $(this).parent().parent().parent().find(".children-2").toggle();
    $(this).toggleClass("my-minus")
});

$(".s_lev_2").click(function(){
	 $(this).parent().parent().parent().find(".children-3").toggle();
	 $(this).toggleClass("my-minus")
});

$(".s_lev_3").click(function(){
	 $(this).parent().parent().parent().find(".children-4").toggle();
	 $(this).toggleClass("my-minus")
});

$(".s_lev_4").click(function(){
	 $(this).parent().parent().parent().find(".children-5").toggle();
	 $(this).toggleClass("my-minus")
});

$(".s_lev_5").click(function(){
	 $(this).parent().parent().parent().find(".children-6").toggle();
	 $(this).toggleClass("my-minus")
});

$(".s_lev_6").click(function(){
	 $(this).parent().parent().parent().find(".children-7").toggle();
	 $(this).toggleClass("my-minus")
});

// $("td.level-1").each(function(){
//     var child = $(this).parent().next().find(".level-2");
//    console.log( child.is('.level-2') ); 
//    if(child.is('.level-2')){
//     // $(this).prepend('<div class="switcher my-plus"></div>');
//    }
//    // console.log( $(this).is(".level-1") ); 
//   // if( $(this).is(".level-1") ) {
//   //   $(this).parent().next().is(".level-2");
//   //    console.log( 'lev2 ' + $(this).is(".level-2") );
//   // }
//   // console.log($(this).html());
// });


});
</script>

