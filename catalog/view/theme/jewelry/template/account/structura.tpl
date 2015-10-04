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
				    	<tr>				    	
							<th>Имя</th>
					    	<th>Дата рег.</th>
					    	<th>Телефон</th>
					    	<th>Ур.</th>
					    	<th>Реф.</th>
					    	<th>Мой доход</th>
					    </tr>
						<tr>
							<td class="level-1">Михаил Игнатьев</td>
							<td class="d-reg">04.07 22:01</td>
							<td class="t-phone">+7 (495) 000 00 00</td>
							<td>1</td>
							<td>20</td>
							<td class="bold">20 234 руб</td>
						</tr>							
						<tr>
							<td class="level-2">Федор Марков</td>
							<td>04.07 22:01</td>
							<td class="light-gray">Не указан</td>
							<td>2</td>
							<td>1</td>
							<td class="bold">2 234 руб</td>
						</tr>							
						<tr>
							<td class="level-3">Таисия Марковa</td>
							<td>04.07 22:01</td>
							<td class="t-phone">+7 (495) 000 00 00</td>
							<td>3</td>
							<td>0</td>
							<td class="bold"> 234 руб</td>
						</tr>	
						<tr>
							<td class="level-2">Федор Марков</td>
							<td>04.07 22:01</td>
							<td class="light-gray">Не указан</td>
							<td>2</td>
							<td>1</td>
						<td class="bold">2 234 руб</td>
						</tr>	 
    				</table>
    				<table class="history ">	
						<tr>
							<td class="level-1">Михаил Игнатьев</td>
							<td class="d-reg">04.07 22:01</td>
							<td class="t-phone">+7 (495) 000 00 00</td>
							<td class="level">1</td>
							<td>20</td>
							<td class="bold">20 234 руб</td>
						</tr>							
						<tr>
							<td class="level-2">Федор Марков</td>
							<td>04.07 22:01</td>
							<td class="light-gray">Не указан</td>
							<td class="level">2</td>
							<td>1</td>
							<td class="bold">2 234 руб</td>
						</tr>							
						<tr>
							<td class="level-3">Таисия Марковa</td>
							<td>04.07 22:01</td>
							<td class="t-phone">+7 (495) 000 00 00</td>
							<td class="level">3</td>
							<td>0</td>
							<td class="bold"> 234 руб</td>
						</tr>	
						<tr>
							<td class="level-2">Федор Марков</td>
							<td>04.07 22:01</td>
							<td class="light-gray">Не указан</td>
							<td class="level">2</td>
							<td>1</td>
							<td class="bold">2 234 руб</td>
						</tr>
    				</table>
					<div class="itog">
							<div>
		    					<p>Итого</p>
		    					<p>42</p>
		    					<p class="bold">104 000 руб</p>
	    					</div>
					</div>
				    <h4>История регистраций</h4>
				    <table class="history single-table">

					    	<th>Дата рег.</th>
					    	<th>Имя</th>
					    	<th>Телефон</th>
					    	<th>Ур.</th>
					    	<th>Реф.</th>
					    	<th>Заработал</th>
						<tr>
							<td>Сегодня,22:00</td>
							<td>Федор Макров</td>
							<td class="light-gray">не указан</td>
							<td>2</td>
							<td>1</td>
							<td>2 000 руб</td>
						</tr>						
						<tr>
							<td>Сегодня,22:00</td>
							<td>Федор Макров</td>
							<td class="light-gray">не указан</td>
							<td>2</td>
							<td>1</td>
							<td>2 000 руб</td>
						</tr>						
						<tr>
							<td>Сегодня,22:00</td>
							<td>Федор Макров</td>
							<td class="light-gray">не указан</td>
							<td>2</td>
							<td>1</td>
							<td>2 000 руб</td>
						</tr>
						<tr>
							<td>Сегодня,22:00</td>
							<td>Федор Макров</td>
							<td class="light-gray">не указан</td>
							<td>2</td>
							<td>1</td>
							<td>2 000 руб</td>
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