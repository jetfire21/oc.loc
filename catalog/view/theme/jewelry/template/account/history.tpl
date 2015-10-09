<?php echo $header; ?>

<div class="lk structure">
<div class="wrapper-1">
  <div class="container">
   <!-- 
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
     -->

     <?php echo $lk_name; ?>

    <div class="lm-cart">

      <?php echo $column_left; ?>

      			<div class="cart-product">
				<h3>Финансы и история</h3>
				<div class="wrap_table">
				<h4>Упраление счетом</h4>
					<div class="name-block uprav-schet"> 
						<div class="offer-n"><p>Баланс счета: </p><span class="bold">1 200 руб</span></div>
						<div class="offer-n"><p>Всего заработано: </p><span class="bold">108 456 руб</span></div>
						<div class="offer-n"><p>Уже выведено: </p><span class="bold">106 300 руб</span></div>
						<div class="offer-n"><p> Дата создания счета: </p><span>10.09 00:00</span></div>
						<div class="offer-n"><p> Доступно к выводу: </p><span>1 200 руб</span></div>
						<div class="vyvod-money"><a href=""> вывести средства <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/mini-arrow-right.png" alt=""></a></div>
				    </div>
				    <h4>История счета</h4>
				    <table class="history">

					    	<th>Дата</th>
					    	<th>Операция</th>
					    	<th>Имя</th>
					    	<th>Сумма</th>
					    	<th>Остаток</th>
						<tr>
							<td>Сегодня,22:00</td>
							<td>Запроше вывод</td>
							<td>Я (Рубен Меджм.)</td>
							<td>- 102 000 руб</td>
							<td>1 200 руб</td>
						</tr>						
						<tr>
							<td>Сегодня,17:00</td>
							<td>Оплата заказа</td>
							<td>Игорь Новиков</td>
							<td>+ 103 руб</td>
							<td>125 000 руб</td>
						</tr>						
						<tr>
							<td>Сегодня,17:00</td>
							<td>Оплата заказа</td>
							<td>Не указан</td>
							<td>+ 10 000 руб</td>
							<td>0 руб</td>
						</tr>
						<tr>
							<td>Сегодня,22:00</td>
							<td>Запроше вывод</td>
							<td>Я (Рубен Меджм.)</td>
							<td>- 102 000 руб</td>
							<td>1 200 руб</td>
						</tr>	
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