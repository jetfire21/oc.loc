<?php echo $header; ?>

<div class="wrapper-1">
	<div class="cartel-bg">
		<div class="cartel-text">
			<img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/cartel_text.png" alt="">
			<h4>// коллекция акссесуаров для уверенных в себе</h4>
		</div>
	</div>
</div>

<div class="wrapper-2">
	<div class="collection">
		<div class="container">
			<span class="otzyv">Отзыв о коллекции</span>
			<h2>Мы движем этим миром</h2>
			<span class="author">Анжелика Труднова</span>
			<a class="more-otzyv" href="index.php?route=information/information&information_id=9">Читать отзыв о коллекции</a>
			<h3>Популярные акссесуары</h3>
		</div>
	</div>
</div>

<div class="pop-aksess">
	<div class="container">
		<div class="row">
			<div id="owl-demo" class="owl-carousel owl-theme">
<!-- 
				  <div class="item">
				 	  <h2><a href="item.html">Серьги Liquen</a></h2> <span class="">Серьги черные</span> <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/liquen.jpg" alt=""><p class="price">4 490 руб</p> <a href="#" class="buy">купить</a>
				  </div>
		  		  <div class="item">
				 	  <h2><a href="item.html">Серьги Liquen</a></h2> <span class="">Золото</span> <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/sergi-zoloto.jpg" alt=""><p class="price">2 490 руб</p> <a href="#" class="buy">купить</a>
				  </div>
		  		  <div class="item">
				 	  <h2><a href="item.html">Серьги Liquen</a></h2> <span class="">Серебро</span> <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/liquen.jpg" alt=""><p class="price">3 490 руб</p> <a href="#" class="buy">купить</a>
				  </div>
		  		  <div class="item">
				 	  <h2><a href="item.html">Серьги с обвесом</a></h2> <span class="">Серьги черные</span> <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/serg-cilindr.jpg" alt=""><p class="price">5 200 руб</p> <a href="#" class="buy">купить</a>
				  </div>
		  		  <div class="item">
				 	  <h2><a href="item.html">Серьги Liquen</a></h2> <span class="">Серьги черные</span> <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/liquen.jpg" alt=""><p class="price">6 490 руб</p> <a href="#" class="buy">купить</a>
				  </div>
		  		  <div class="item">
				 	  <h2><a href="item.html">Серьги Liquen</a></h2> <span class="">Серьги черные</span> <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/liquen.jpg" alt=""><p class="price">7 490 руб</p> <a href="#" class="buy">купить</a>
				  </div>
		  		  <div class="item">
				 	  <h2><a href="item.html">Серьги Liquen</a></h2> <span class="">Серьги черные</span> <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/liquen.jpg" alt=""><p class="price">8 490 руб</p> <a href="#" class="buy">купить</a>
				  </div>
				  <div class="item">
				 	  <h2><a href="item.html">Серьги Liquen</a></h2> <span class="">Серьги черные</span> <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/liquen.jpg" alt=""><p class="price">9 490 руб</p> <a href="#" class="buy">купить</a>
				  </div>	
				  --> 		  

				<?php if($products_topakses): ?> 
					<?php foreach ($products_topakses as $v): ?>	
					 	 <div class="item">
						  	   <div class="prod-no-btn">
						 	  <h2><a href="<?php echo $this->url->link('product/product', 'product_id='.$v['product_id']);?>"><?php echo $v['name'];?></a></h2>
						 	   <!-- <span class="">Серьги черные</span>  -->
						 	   <span class=""><?php echo $v['color_met']; ?></span> 
						 	   <img src="<?php echo $this->config->get('config_url')."image/".$v['image'];?>" alt="">
						 	   <p class="price"><?php echo round($v['roz_price'])." руб";?></p> 
					 	   </div>
					 	   <a href="<?php echo $this->url->link('product/product', 'product_id='.$v['product_id']);?>" class="buy">купить</a>
					  </div>
					<?php endforeach;?>
				 <?php endif; ?> 

			</div>

	    <?php if(count($products_topakses)>4):?>
	      <div class="customNavigation">
	          <a class="prev"></a>
	          <a class="next"></a>
	      </div>
	     <?php endif; ?> 


			<?php //print_r($products_topakses); ?>		 
	</div>
	</div>
</div>


<div class="hot-product">
	<div class="container">

	<h4>Горячие товары</h4>

  	  <?php if($all_products) { ?>
	  	  <div class="wrap-product blok-3-center-1">
	  	   <?php for($j = 0; $j < 3; $j++) {?>
	  	   		<?php if($j == 1) { ?>
				 	<div class="special-product">
				 		<div class="s-left">
				 			<div class="sprod-no-btn">
					 			<h2><a href="<?php echo $this->url->link('product/product', 'product_id='.$all_products[$j]['product_id']);?>"><?php echo $all_products[$j]['name']; ?></a></h2>
					 			 <!-- <span class="spec-marbot">Черный родий с серебром</span> -->
					 			 <span class="spec-marbot"><?php echo $all_products[$j]['color_met'];?></span>
					 			 <?php if(!empty($all_products[$j]['special'])) { ?>
									<span class="action">Акция до <?php echo $all_products[$j]['date_end'];?></span>
						 			 <p class="price green"><?php echo round($all_products[$j]['special']) ." руб";?></p> 
						 			 <p class="old-price"><?php echo round($all_products[$j]['roz_price']) ." руб";?></p>
					 			 <?php } else { ?>
					 			 	<p class="price green"><?php echo round($all_products[$j]['roz_price']) ." руб";?></p> 
					 			 <?php } ?>
					 			 </div>
				 			 <a href="#" class="buy">купить</a>
				 		</div>		 	 
					 	 <div class="s-right">
					 	 	<img src="<?php echo $this->config->get('config_url')."image/".$all_products[$j]['image'];?>" alt="">
					 	 </div>
					 	 <div class="clr"></div>
				   </div>
	  	   		<?php } else {?>
	  	   		<?php if($all_products[$j]) {  ?>
		  		  <div class="product">
		  		  		<div class="prod-no-btn">
			  		  		<h2><a href="<?php echo $this->url->link('product/product', 'product_id='.$all_products[$j]['product_id']);?>"><?php echo $all_products[$j]['name']; ?></a></h2>
			  		  		 <!-- <span class="">Серьги черные</span>  -->
			  		  		   <span class=""><?php echo $all_products[$j]['color_met']; ?></span> 
			  		  		 <img src="<?php echo $this->config->get('config_url')."image/".$all_products[$j]['image'];?>" alt="">
			  		  		 <?php if(!empty($all_products[$j]['special'])) { ?>
			  		  			  <p class="price pink"><?php echo round($all_products[$j]['special']);?> руб</p> 
			  		  			  <p class="old-price"><?php echo round($all_products[$j]['roz_price']);?> руб</p> 
			  		  		  <?php } else { ?>
			  		  			 <p class="price no-old-price"><?php echo round($all_products[$j]['roz_price']) ." руб";?></p>
			  		  		 <?php } ?>
		  		  		 </div>
		  		  		  <a href="<?php echo $this->url->link('product/product', 'product_id='.$all_products[$j]['product_id']);?>" class="buy">купить</a>
		     	  </div>
		     	  <?php } ?>
			   <?php } ?>
		     <?php } ?>
			</div>
	  <?php } ?>

  	  <div class="clr"></div>

		  <div class="wrap-product blok-3-left-1">

			<?php if($only_home_news): ?>
<!-- 			  <div class="article">
			  	 <div class="icon-new"></div>
		  		 <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/women-kak-pod-akses.jpg" alt="">
		  		 <div class="a-text">
			  	    <h2><a href="">Как подобрать аксессуары?</a></h2>
		  		    <span>Статья от стилиста с телеканала дождь</span>
		  		 </div>
		  	 </div>	 -->	
			  <div class="article">
			  	 <div class="icon-new"></div>
		  		 <img src="<?php echo $base."image/".$only_home_news[0]['image'];?>" alt="">
		  		 <div class="a-text">
			  	    <h2><a href="<?php echo $only_home_news[0]['href'];?>"><?php echo $only_home_news[0]['title'];?></a></h2>
		  		    <span> <?php echo $only_home_news[0]['author'];?></span>
		  		 </div>
		  	 </div>
		  	 <?php endif; ?>


		  <?php if($all_products) { ?>
		  <?php for($j = 3; $j < 5; $j++) {?> 
		  	<?php if($all_products[$j]) {  ?>
	  		  <div class="product">
	  		  		<div class="prod-no-btn">
		  		  		<h2><a href="<?php echo $this->url->link('product/product', 'product_id='.$all_products[$j]['product_id']);?>"><?php echo $all_products[$j]['name']; ?></a></h2>
		  		  		 <!-- <span class="">Серьги черные</span>  -->
		  		  		 <span class=""><?php echo $all_products[$j]['color_met']; ?></span> 
		  		  		 <img src="<?php echo $this->config->get('config_url')."image/".$all_products[$j]['image'];?>" alt="">
		  		  		 <p class="price no-old-price"><?php echo round($all_products[$j]['roz_price']) ." руб";?></p>
	  		  		 </div>
	  		  		  <a href="<?php echo $this->url->link('product/product', 'product_id='.$all_products[$j]['product_id']);?>" class="buy">купить</a>
	     	  </div>
	     	  <?php } ?>			  
	 	   <?php } ?>
	  </div>
	  <?php } ?>

	   <div class="clr"></div>

	  <?php $i = 0; ?>
	  <?php if($all_products) { ?>
	  
		  <?php for($j = 5; $j < count($all_products); $j++) {?> 
			<?php if($i%4 == 0) { ?>
			<div class="wrap-product blok-4">
			<?php } ?>
	  		  <div class="product">
	  		  		<div class="prod-no-btn">
		  		  		<h2><a href="<?php echo $this->url->link('product/product', 'product_id='.$all_products[$j]['product_id']);?>"><?php echo $all_products[$j]['name']; ?></a></h2>
		  		  		 <!-- <span class="">Серьги черные</span>  -->
		  		  		 <span class=""><?php echo $all_products[$j]['color_met']; ?></span> 
		  		  		 <img src="<?php echo $this->config->get('config_url')."image/".$all_products[$j]['image'];?>" alt="">
		  		  		 <p class="price no-old-price"><?php echo round($all_products[$j]['roz_price']) ." руб";?></p>
	  		  		 </div>
	  		  		  <a href="<?php echo $this->url->link('product/product', 'product_id='.$all_products[$j]['product_id']);?>" class="buy">купить</a>
	     	  </div>
  			<?php if($i%4 == 3) { ?>
			</div>
			<?php } ?>
	      <?php $i++;?>
		  <?php } ?>
	  <?php } ?>

	
	</div>
</div> <!-- .hot-product -->


<div class="most-buy">
	<div class="wrap-bg-left">
		<div class="wrap-bg-right">
			<div class="container">
				<h4>Самое покупаемое</h4>
<!-- 					
				<div>
					  <div class="article">
					  	 <div class="icon-new"></div>
				  		 <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/sitting-girl.jpg" alt="">
				  		 <div class="a-text">
					  	    <h2><a href="">Кто мужчина в моей жизни?</a></h2>
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
				</div>
				<div class="clr"></div>

				  <div class="article mini-img">
			  		 <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/girl-remen.jpg" alt="">
			  		 <div class="a-text">
				  	    <h2><a href="">7 способов вдохновить себя</a></h2>		  		    
			  		    <span>Рудактор портала DB News</span>
			  		 </div>
			  	 </div> -->

			  	<?php echo $content_bottom;?>
			
			</div>
		</div>
	</div>
</div>



<?php 
// echo "<pre>"; print_r($all_products); echo "</pre>";
?>

	<?php 
		// echo '------';
		// var_dump($content_bottom);
		// var_dump($content_top);
		// var_dump($column_right);
		// var_dump($column_left);
		//echo '------';
		//print_r($only_home_news);
	 ?>


<div class="clr"></div>
<?php echo $footer; ?>