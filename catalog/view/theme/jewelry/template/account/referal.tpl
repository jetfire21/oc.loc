<?php echo $header; ?>

<div class="lk">
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
				<h3>Моя реферальная ссылка</h3>
				<div class="wrap_table">
					<div class="ref-text">
						<p>Вам доступна возможность рекомендовать наши любимые аксессуары своим знакомым и друзьям! За каждую рекомендацию вы будете получать сумму на свой счет. В меню структура вы будете всех кто зарегестрировался или оплатил заказ по вашей ссылке. </p>
						<p>
						Система многоуровневая - поэтому вы будете получать деньги и в пасивном режиме, если знакомые начнут давать свои ссылки своим знакомым. Выводите деньги на свою карту в любое время! Подробнее <a href="#" class="pink"> о партенрской программе</a></p>
					</div>
					<div class="my-link">
						<h4>Моя ссылка:</h4>
						<div class="ref-link">http://dbcortal.ru/welcome2342</div><a href="" class="copy-link">скопировать</a>
						<a href="" class="new-link pink">Я хочу чтобы ссылка вела на другую страницу</a>
					</div>
					<div class="stat-vizit">
						<h4>Общая статистика переходов по ссылке:</h4>
						<p>Всего переходов по ссылке - <span>1 345,</span></p>
						<p>Всего регистраций по ссылке - <span>345,</span></p>
						<p>Всего оформили заказ - <span>3</span></p>
					</div>
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