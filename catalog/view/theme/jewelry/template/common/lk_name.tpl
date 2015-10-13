    <div class="full_name"> 
      <p>Профиль <?php echo $this->session->data['name_fam'] ?></</p>
      <h2>Личный кабинет</h2>
    </div>
    <div class="balans">
      <p>Ваш баланс: <span><?php echo $this->session->data['balans'];?></span></p>
      <a href="/index.php?route=information/information&information_id=10">Как заработать?</a> / <a href="/index.php?route=information/information&information_id=11">Куда потратить?</a>
      <a class="karta-out withdrawal" href="#"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/visa.png" alt="">Вывести на карту</a>
    </div>

    <div class="clr"></div>