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
					<h3>Корзина товаров</h3>
					<div class="wrap_table">
					<table>
						<tr>
							<th colspan="2">Товар</th>
							<th>Артикул</th>
							<th>Размер</th>
							<th class="kolvo-unic">Кол-во</th>
							<th>Цена</th>
							<th></th>
						</tr>
						<?php  //echo "<pre>"; print_r($products); echo "</pre>";?>
						<?php foreach ($products as $product) { ?>
							<tr class="cart-item">
								<td><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a></td>
								<td class="product_title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
								<td><?php echo $product['model']; ?></td>
								<td><?php if(!empty($product['option'])) { echo $product['option'][0]['value']; } else { echo "не указан"; } ?></td>
								<td class="kolvo">
<!-- 
									<?php if(!empty($product['option'])) { ?>
									<span><?php echo $product['option'][1]['value']; ?></span>
									<?php $kolvo = $kolvo +  $product['option'][1]['value']; ?>
									<select name="" id="">
										<option value="">1 шт</option>
										<option value="">2 шт</option>
										<option value="">3 шт</option>
										<option value="">4 шт</option>
									</select>
									<?php } else { ?>
									не указан
									<?php } ?>
									 -->
									 <?php $kolvo = $kolvo +  $product['quantity']; ?>
									<span class="kol"><?php echo $product['quantity']; ?> шт</span>
 									<select name="cart-kol" id="cart-kol">
										<option value="1" <?php if($product['quantity'] == 1) echo 'selected="selected"'; ?> >1 шт</option>
										<option value="2" <?php if($product['quantity'] == 2) echo 'selected="selected"'; ?> >2 шт</option>
										<option value="3" <?php if($product['quantity'] == 3) echo 'selected="selected"'; ?>>3 шт</option>
										<option value="4" <?php if($product['quantity'] == 4) echo 'selected="selected"'; ?>>4 шт</option>
									</select>
									<form action="/index.php?route=checkout/cart" method="post" class="update_cart">
										<input type="hidden" name="quantity[<?php echo $product['key']; ?>]" value="7" size="1" />
									</form>
								</td>							
								<td><?php echo $product['price']; ?></td>
								<!-- <td><?php echo $product['quantity']; ?></td> -->
								<td class="del_product"><a href="<?php echo $product['remove']; ?>"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/delete.png" alt=""></a></td>

							</tr>
						<?php } ?>
						<tr>
							<td colspan="3"></td>
							<td>Итого</td>
							<td class="kolvo-unic bold"><?php echo $kolvo; ?> шт</td>
							<td class="bold"><?php echo $totals[0]['text'];?></td>
						</tr>
					</table>
					<div class="dop-links">
						<a class="back-shop" href="<?php echo $this->url->link('common/home');?>"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/mini-arrow-left.png" alt="">Вернуться в магазин</a><a class="checkout" href="/index.php?route=checkout/checkout">Оформить заказ<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/mini-arrow-right.png" alt=""></a>
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

