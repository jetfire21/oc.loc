
<div class="clr"></div>

<footer>
  <div class="container">


    <ul class="soc_links">
      <li><a href="">Вконтакте</a></li>
      <li><a href="">Facebook</a></li>
      <li><a href="">Twitter</a></li>
    </ul>

    <ul class="f_menu">
<!-- 
      <li><a href="">Оплата и доставка</a></li>
      <li><a href="">Гарантия</a></li>
      <li><a href="">Контакты</a></li>
      <li><a href="">О нас</a></li>
      <li><a href="">Партнерская программа</a></li>
      <li><a href="">Личный кабинет</a></li>
       -->
       <?php if($informations): ?>
          <?php foreach ($informations as $info): ?>
             <li><a href="<?php echo $info['href'];?>"><?php echo $info['title'];?></a></li>
          <?php endforeach; ?>
        <?php endif; ?>
         <li><a href="#lk">Личный кабинет</a></li>
    </ul>
                    
    <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/payment2.png" alt="">
    <div class="f-text-1">
      This is Photoshop's version  of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. Sed non  mauris vitae erat consequat auctor eu in elit. 
    </div>

    <div class="f-text-2">
      This is Photoshop's version  of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. Duis sed odio sit amet nibh vulputate cursus a sit amet mauris. Morbi accumsan ipsum velit. Nam nec tellus a odio tincidunt auctor a ornare odio. 
    </div>

  </div>
</footer>

<?php //print_r($informations); ?>

</div>
</body></html>