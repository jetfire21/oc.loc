<?php echo $header; ?>

<div class="wrapper-1">
  <div class="container">
  <div class="clr"></div>
    <div class="inner-wrap">

    <div class="breadcrambs b-search">
    <?php // print_r($breadcrumbs); ?>

      <?php $i = 0;?>
          <?php foreach ($breadcrumbs as $breadcrumb) { ?>
          <?php if($i == 0) { ?>
            <span><?php echo $breadcrumb['text']; ?> / </span>
          <?php } ?>          
          <?php if($i > 0) { ?>
            <!-- <?php echo $breadcrumb['text']; ?> -->
             <?php echo $heading_title; ?>
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
              <p class="price pink"><?php echo $product['price']; ?></p>
              <p class="old-price"><?php echo $product['special']; ?></p>
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
    <div><p class="j-warning"> <?php echo $text_empty; ?></p></div>
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
      <div id="owl-demo" class="owl-carousel owl-theme">
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
      </div>

      <div class="customNavigation">
          <a class="prev"></a>
          <a class="next"></a>
      </div> 
       
  </div>
  </div>
</div>

<?php echo $footer; ?>


<script type="text/javascript"><!--
$('#content input[name=\'search\']').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#button-search').trigger('click');
	}
});

$('select[name=\'filter_category_id\']').bind('change', function() {
	if (this.value == '0') {
		$('input[name=\'sub_category\']').attr('disabled', 'disabled');
		$('input[name=\'sub_category\']').removeAttr('checked');
	} else {
		$('input[name=\'sub_category\']').removeAttr('disabled');
	}
});

$('select[name=\'filter_category_id\']').trigger('change');

$('#button-search').bind('click', function() {
	url = 'index.php?route=product/search';
	
	var search = $('#content input[name=\'search\']').attr('value');
	
	if (search) {
		url += '&search=' + encodeURIComponent(search);
	}

	var filter_category_id = $('#content select[name=\'filter_category_id\']').attr('value');
	
	if (filter_category_id > 0) {
		url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
	}
	
	var sub_category = $('#content input[name=\'sub_category\']:checked').attr('value');
	
	if (sub_category) {
		url += '&sub_category=true';
	}
		
	var filter_description = $('#content input[name=\'description\']:checked').attr('value');
	
	if (filter_description) {
		url += '&description=true';
	}

	location = url;
});

function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
						
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';
						
			$(element).html(html);
		});		
		
		$('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
		
		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}	
					
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('list');
}
//--></script> 