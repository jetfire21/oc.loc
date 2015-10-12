<?php echo $header; ?>

<div class="wrapper-1">
  <div class="container">
  <div class="clr"></div>
    <div class="inner-wrap">

		<div class="breadcrambs">
		<?php  //print_r($breadcrumbs); ?>
			<?php $i = 0;?>
			    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
			    <?php if($i == 0) { ?>
			    	<span><?php echo $breadcrumb['text']; ?> / </span>
			    <?php } ?>			    
          <?php if($i == 1) { ?>
            <a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?> </a> 
             <?php if(count($breadcrumbs) == 3) echo "/"; ?>
          <?php } ?>	
         <?php if($i == 2) { ?>
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
      <div class="clr"></div>

	 <?php // print_r($categories); ?>

	  <?php if ($categories) { ?>
	      <?php for ($i = 0; $i < count($categories);) { ?>
	      <ul class="category">
	        <?php $j = $i + ceil(count($categories) / 4); ?>
	        <?php for (; $i < $j; $i++) { ?>
	            <?php if (isset($categories[$i])) { ?>
	            <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a><span><?php echo $categories[$i]['prod_count']; ?></span></li>
	            <?php } ?>
	        <?php } ?>
	      </ul>
	      <?php } ?>
	  <?php } else { ?>
	  	<!-- <div><p class="j-warning"> В данной категории нет подкатегорий</p></div> -->
	  <?php } ?>

<!-- вывод всех категорий на странице подкатегории -->

      <?php if ($all_cat) { ?>
      <?php for ($i = 0; $i < count($all_cat);) { ?>
      <ul class="category">
        <?php $j = $i + ceil(count($all_cat) / 4); ?>
        <?php for (; $i < $j; $i++) { ?>
            <?php if (isset($all_cat[$i])) { ?>
                <?php if($all_cat[$i]['cat_id'] == $subcat_id): ?>
                  <li class="active">
                  <a href="<?php echo $all_cat[$i]['href']; ?>"><?php echo $all_cat[$i]['name']; ?></a><span><?php echo $all_cat[$i]['prod_count']; ?></span>
                  </li>
                <?php else: ?>
                  <li>
                  <a href="<?php echo $all_cat[$i]['href']; ?>"><?php echo $all_cat[$i]['name']; ?></a><span><?php echo $all_cat[$i]['prod_count']; ?></span>
                  </li>
                <?php endif;?>
            <?php } ?>
        <?php } ?>
      </ul>
      <?php } ?>
  <?php } else { ?>
    <!-- <div><p class="j-warning"> В данной категории нет подкатегорий</p></div> -->
  <?php } ?>


<?php //print_r($categories); ?>
<?php // print_r($all_cat); ?>
<?php //echo $subcat_id; ?>

    </div>
  </div>
</div>

<div class="clr"></div>


<div class="catalog">
  <div class="container">
  <!-- <?php print_r($products);?> -->
  <?php $i = 0; $j = 1; ?>
  <?php if ($products) { ?> 
  <?php foreach ($products as $product) { ?>
      
      <?php if($i%4 == 0) { ?>
          <?php if ($j == 1) { ?> 
              <div class="wrap-product blok-4 first-4">
          <?php } else { ?>
              <div class="wrap-product blok-4">
          <?php } ?>
          
       <?php } ?>
          <?php if( $product['special_end']) { ?>
          <div class="product action-border">
              <!-- <div class="prod-in-cart"></div> -->
              <div class="prod-no-buy-link">
              <h2><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
              <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" >
              <?php 
                $product['special_end'] = substr($product['special_end'], 5);
                 $product['special_end'] = str_replace("-", ".",  $product['special_end']);
                  $product['special_end'] = explode(".", $product['special_end']);
                  $product['special_end'] = array($product['special_end'][1], ".",  $product['special_end'][0]);
                   $product['special_end'] = implode(",",  $product['special_end']);
                   $product['special_end'] = str_replace(",", "",  $product['special_end']);
              ?>
              <div><span class="action"> Акция до <?php echo $product['special_end']; ?></span></div>
              <p class="price pink"><?php echo $product['special']; ?></p>
              <p class="old-price"><?php echo $product['price']; ?> </p>
              </div>
               <a href="<?php echo $product['href']; ?>" class="buy button">купить</a>
          </div> 
          <?php } else { ?>
          <div class="product">
              <!-- <div class="prod-in-cart"></div> -->
              <div class="prod-no-buy-link">
              <h2><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h2>
              <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" >
              <p class="price no-old-price"><?php echo $product['price']; ?></p>
              </div>
               <a href="<?php echo $product['href']; ?>" class="buy button">купить</a>
          </div> 
          <?php } ?>

       <?php if($i%4 == 3) { ?>
          </div>
          <div class="clr"></div>
       <?php } ?>
       <?php $i++; $j++ ?>
  <?php } ?>
  <?php } else { ?>
  	<p class="j-warning"> В данной категории нет продуктов</p>
  <?php } ?>



	   <div class="clr"></div>
	  
	  <?php if ($products) { ?> 
	     <!-- <div class="show-more"><a href="#">Показать еще</a></div> -->
	     <div class="pagination"><?php echo $pagination; ?></div>
	  <?php } ?>


  </div>
</div>


<div class="pop-aksess only-catalog">
  <div class="container">
    <div class="row">
    <h4>Самое покупаемое</h4>
		<?php // echo $content_top;?>
		<?php echo $topsell_bottom;?>

  </div>
  </div>
</div>



<?php echo $footer; ?>