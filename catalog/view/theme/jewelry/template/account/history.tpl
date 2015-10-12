<?php
 //print_r($transactions);
print_r($affiliate_info);
  ?>

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
				<h4>Управление счетом</h4>
					<div class="name-block uprav-schet"> 
						<div class="offer-n"><p>Баланс счета: </p><span class="bold"><?php echo $this->session->data['balans'];?></span></div>
						<div class="offer-n"><p>Всего заработано: </p><span class="bold"><?php echo $affiliate_info['total_sum'];?></span></div>
						<div class="offer-n"><p>Уже выведено: </p><span class="bold"><?php echo $affiliate_info['total_out'];?></span></div>
						<div class="offer-n"><p> Дата создания счета: </p><span><?php echo $affiliate_info['date_added'];?></span></div>
						<div class="offer-n"><p> Доступно к выводу: </p><span><?php echo $this->session->data['balans'];?></span></div>
						<div class="vyvod-money"><a href="" class="withdrawal"> вывести средства <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/mini-arrow-right.png" alt=""></a></div>
				    </div>
				    <h4>История счета</h4>
				    <table class="history">
							
							<?php if($transactions):?>
						    	<th>Дата</th>
						    	<th>Операция</th>
						    	<th>Имя</th>
						    	<th>Сумма</th>
						    	<th>Остаток</th>
						    	<?php $i = 1; ?>
								<?php foreach($transactions as $item):?>
								<tr>
									<td><?php echo $item["date_added"];?></td>
									<td><?php echo $item["operation"];?></td>
									<td><?php echo $item["name"];?></td>
									<?php if($item['withdrawal'] == 1): ?>
										<td>- <?php echo $item["amount"];?></td>
										<td><?php echo $item["ostatok"];?></td>
									<?php elseif($item['payment'] == 1): ?>
										<td>+ <?php echo $item["amount"];?></td>
										<td><?php echo $item["ostatok"];?></td>
									<?php endif; ?>
									
								</tr>
								<?php 
									if($i == 10) break;
									$i++;
								?>
								<?php endforeach;?>
							<?php else:?>
								<p>У вас еще не было транзакций!</p>
							<?php endif;?>

<!-- 					<tr>
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
						</tr>	 -->
    				</table>				
			</div>
			        <div class="clr"></div>
		</div>

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

<?php echo $footer; ?> 


<script type="text/javascript">
	$(".withdrawal").click(function(e){
		e.preventDefault();
		var redirect = 'http://oc.loc/index.php?route=account/account/history';

     	 $.ajax({
	         url: 'http://oc.loc/index.php?route=account/account/withdrawal',
	         // url: 'http://oc.loc/catalog/controller/account/register.php',
	         type: 'post',
	         data: 'data=withdrawal',
	         dataType: 'json',
	         success: function(json) {
	          	if(json.balans) { 
	          	  // alert(json.balans); 
	          	  alert("Oтправлен запрос на вывод");
	          	  window.location = redirect;
	          	}
		        if(json.error) { alert('Нечего выводить! Ваш баланс 0 рублей');}
		          console.log(json);
	         },
			error:function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
	     });

	});
</script>