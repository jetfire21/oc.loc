<?php echo $header; ?>
<div class="map-product">

<div class="wrapper-1">
	<div class="container">
	<div class="clr"></div>
		<div class="inner-wrap">

			 <?php // print_r($breadcrumbs); ?>

			<div class="breadcrambs">
			<?php $i = 0;?>
			    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
			    <?php if($i == 1) { ?>
			    	<span><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a> / </span>
			    <?php } ?>			    
			    <?php if($i > 1) { ?>
			    	<?php echo $breadcrumb['text']; ?>
			    <?php } ?>
			    <?php  $i++; ?>
			 <?php } ?>
			 </div> 

			      <div class="search">
			        <!-- <form action="" method=""> -->
			          <input type="text" name="search" placeholder="Поиск по аксесуарам">
			          <input type="submit" value="" class="button-search">
			        <!-- </form> -->
			      </div>
     		</div>
		
		<div class="dp-title">
			<h2><?php echo $heading_title; ?></h2>
			<span class="artikul"><?php echo $model; ?>dd</span>
		</div>
	</div>
</div>

<div class="data-product-parent">
	<div class="container">
			<div class="empty">
			<div class="data-product-child">

				<div class="ugol"></div>
				<!-- <div class="prod-in-cart"></div> -->
				<div class="dp-left">
					<div class="main-img">
					<div class="zoom" id='ex1'>	
					<?php if($thumb) { ?>
						<img src="<?php echo $thumb; ?>" alt="" width="200">
					<?php } ?>
					</div>
					</div>
					<div class="preview" id='ex1'>
					
					<?php if ($images) { ?>
						<?php foreach ($images as $image) { ?>
							<img src="<?php echo $image['popup']; ?>" data-rel="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>">
						<?php } ?>
					<?php } ?>
					
					</div>
				</div>

				<div class="dp-right">
					<div class="dp-desc">
						<span class="gray">Описание:</span>
						<?php echo $description; ?>
					</div>
					<div class="dp-price">
						<span class="gray">Цена:</span>
						<?php if($special) { ?>
							<span class="action">Акция до 30.09</span>
							<p class="price"><?php echo $special; ?></p>
							<p class="old-price"><?php echo $price; ?></p>
						<?php } else { ?>
							<p class="price"><?php echo $price; ?></p>
						<?php } ?>

					</div>
					<div class="dp-param">
					<?php $i = 0; ?>
					<?php if($options) { ?>
					<?php foreach ($options as $option) { ?>
      					  <?php if ($option['type'] == 'select') { ?>
      					  	  <?php //if($i == 1) {  $kol = "kol"; } else { $kol = "";} ?>
      					  	  <select name="option[<?php echo $option['product_option_id']; ?>]" id="option-<?php echo $option['product_option_id']; ?>" class="option <?php echo $kol;?>">
						            <?php foreach ($option['option_value'] as $option_value) { ?>
						            	<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
						             <?php } ?>
      					  	  </select>     					        					  	 
      					      <?php $i++; ?>
      					  <?php } ?>
					<?php } ?>
					<?php } ?>
        				
						<?php $stock = (int)$stock; ?>
        				<?php if($stock > 0 ) { ?>
							<select name="sel-kol" class="option kol">
								<?php for($i = 1; $i <= $stock; $i++) {?> 
									<?php if($i == 1):?>
									 	<option selected="selected"><?php echo $i;?> шт</option>
									<?php else:?>
										<option><?php echo $i;?> шт</option>
									<?php endif;?>
								  <?php if($i == 5) break;?>
								  <?php } ?>
	  							<!-- 							 
								 <option class="first-option" selected="selected">1 шт</option>
								  <option>2 шт</option>
								  <option>3 шт</option> 
								  -->
							</select>
						 <?php } ?>
						 <input class="my-quanty" type="hidden" name="quantity" size="2" value="2" />
         			 	<input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
						<a class="add-to-cart" href="#" id="button-cart"><img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/cart-pink.png" alt="">В корзину</a>
						<?php if($stock < 1 ) { ?>
							<span class="gray">Товара нет в наличии!</span>
						<?php } ?>
						
					</div>
				</div>

				<div class="clr"></div>

	   </div>
		</div>
	</div>
</div>  <!-- .data-product-parent -->

<div class="clr"></div>

<div class="pop-aksess only-catalog">
	<div class="container">
		<div class="row">

		<!-- С этим товаром покупают также -->
		<?php echo $content_bottom; ?>
			 
	</div>
	</div>
</div>

<div class="clr"></div>

<div class="most-buy">
	<div class="wrap-bg-left">
		<div class="wrap-bg-right">
			<div class="container">
				<h4>Наши редакторы рекомендуют</h4>
				<?php echo $articleprod_bottom; ?>
<!-- 
				  <div class="article">
				  	 <div class="icon-new"></div>
			  		 <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/women-kak-pod-akses.jpg" alt="">
			  		 <div class="a-text">
				  	    <h2><a href="">Как подобрать аксессуары?</a></h2>
			  		    <span>Статья от стилиста с телеканала дождь</span>
			  		 </div>
			  	 </div>	

				  <div class="article mini-img">
			  		 <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/girl-military.jpg" alt="">
			  		 <div class="a-text">
			  		 	 <h2><a href="">Почему милитари считается самым агрессивным?</a></h2>		  		    
			  		    <span>Рудактор портала DB News</span>
			  		 </div>	    
			     </div>	

				  <div class="article mini-img">
			  		 <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/girl-remen.jpg" alt="">
			  		 <div class="a-text">
				  	    <h2><a href="">7 способов вдохновить себя</a></h2>		  		    
			  		    <span>Рудактор портала DB News</span>
			  		 </div>
			  	 </div>
			
 -->			</div>
		</div>
	</div>
</div>

<?php echo $footer; ?>

<script type="text/javascript"><!--

$('#button-cart').bind('click', function(e) {
	e.preventDefault();
	// console.log($(".my-quanty").html());
	var kol = $('.data-product-child .kol option:selected').text();
	// alert(parseInt(kol));
	$(".my-quanty").attr("value", kol);
	// console.log($(".my-quanty").html());
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.data-product-child input[type=\'text\'], .data-product-child input[type=\'hidden\'], .data-product-child input[type=\'radio\']:checked, .data-product-child input[type=\'checkbox\']:checked, .data-product-child select, .data-product-child textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$(".data-product-child").prepend('<div class="prod-in-cart"></div>');
				if( $(".dp-param span.gray").text() == ""){
					$(".dp-param").append('<span class="gray">Товар добавлен в корзину</span>');
				}
			}	
		}
	});
});

$("select.kol").change(function(){
	var total = '<?php echo $stock; ?>';
	total = parseInt(total);
	console.log(total);
	var sel_kol = parseInt( $(this).val() );
	if( sel_kol > total) {	alert('Данного товара нет в нужном количестве,пожалуйста измените количество'); }
});
</script>

