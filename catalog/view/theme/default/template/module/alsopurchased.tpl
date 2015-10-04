<?php if($products): ?> 
      <h4>С этим товаром покупают также</h4> 
      <div id="owl-demo" class="owl-carousel owl-theme">  
          <?php foreach ($products as $v): ?>  
             <div class="item">
                   <div class="prod-no-btn">
                <h2><a href="<?php echo $this->url->link('product/product', 'product_id='.$v['product_id']);?>"><?php echo $v['name'];?></a></h2>
                 <!-- <span class="">Серьги черные</span>  -->
                 <span class=""><?php echo $v['color_met']; ?></span> 
                 <img src="<?php echo $v['thumb'];?>" alt="">
                 <p class="price"><?php echo $v['price'];?></p> 
               </div>
               <a href="<?php echo $this->url->link('product/product', 'product_id='.$v['product_id']);?>" class="buy">купить</a>
            </div>
          <?php endforeach;?>
      </div>
      
    <?php if(count($products)>4):?>
      <div class="customNavigation">
          <a class="prev"></a>
          <a class="next"></a>
      </div>
     <?php endif; ?> 

<?php endif; ?> 
<?php // print_r($products);?>