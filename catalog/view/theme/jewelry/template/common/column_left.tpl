<?php 
    if( $_SERVER['QUERY_STRING'] == 'route=account/account' ) $active_account = "active";
    if( $_SERVER['QUERY_STRING'] == 'route=checkout/cart' ) $active_cart = "active";
    if( $_SERVER['QUERY_STRING'] == 'route=account/account/referal') $active_referal = "active";
    if( $_SERVER['QUERY_STRING'] == 'route=affiliate/statisticsmyaffiliate' ) $active_structura = "active";
    // if( $_SERVER['QUERY_STRING'] == 'route=account/account/structura' ) $active_structura = "active";
    if( $_SERVER['QUERY_STRING'] == 'route=account/account/history' ) $active_history = "active";
 ?>

      <div class="left-menu">
        <h3>Меню</h3>
        <div>
          <ul class="shop">
          <li>Интернет-магазин</li>
            <li><a href="<?php echo $link_account;?>" class="<?php echo $active_account;?>" >Профиль</a></li>
            <li><a href="<?php echo $link_cart;?>" class="<?php echo $active_cart;?>" >Корзина</a></li>
            <li><a href="<?php echo $link_logout;?>">Выход</a></li>
          </ul>
          <div class="separator"></div>
          <ul class="partner">
            <li>Партнерская программа</li>
            <li><a href="<?php echo $link_referal;?>" class="<?php echo $active_referal;?>">Моя ссылка</a></li>
            <li><a href="<?php echo $link_structura;?>" class="<?php echo $active_structura;?>">Структура</a></li>
            <li><a href="<?php echo $link_history;?>" class="<?php echo $active_history;?>">Финансы</a></li>
          </ul>
        </div>
      </div>
