<?php echo $header; ?>
<div class="page">
<div class="wrapper-1">
  <div class="container">

      <div class="breadcrambs"><span>Главная / </span> <?php echo $heading_title; ?> </div>
      <div class="search">
        <form action="">
          <input type="text" placeholder="Поиск по аксесуарам">
          <input type="submit" value="">
        </form>
      </div>
       <div class="clr"></div>

  </div>
</div>
<div class="clr"></div>
<div class="lk-article-bg">

      <div class="container">
        <div class="page-content">
            <div class="page-left">
                <img src="catalog/view/theme/<?php echo $this->config->get('config_template');?>/images/ugol.png" alt="">
                <div class="inner-pl">
                  <?php foreach($informations as $item) { ?>
                    <a href="<?php echo $item['href'];?>"><?php echo $item['title'];?></a>
                  <?php } ?>
                </div>
                <?php  //print_r($informations); ?>
            </div>

            <div class="page-right">
            <div class="article">

             </div> 

                <div class="content-left">
              <?php echo $description;?>
                </div>

                <div class="content-right">
                  <?php if( $news_info['quote'] ) { ?>
                  <div class="quote">
                    <p><?php echo $news_info['quote'];?></p><span><?php echo $news_info['quote_author'];?></span>
                  </div>
                  <?php } ?>
<!--              <p>
              This is Photoshop's version  of Lorem Ipsum. Proin gravida nibh vel velit auctor aliquet. Aenean sollicitudin, lorem quis bibendum auctor, nisi elit consequat ipsum, nec sagittis sem nibh id elit. 
              </p> -->
                </div>
            </div>

         </div>
         <div class="bot-article">
          <h4>другие статьи:</h4>

<!--            <div class="article">
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
             </div> -->
             <?php echo $content_bottom;?>

        </div>
      </div>



</div>
</div>

  <?php 
    // echo '------';
    // var_dump($content_bottom);
    // var_dump($content_top);
    // var_dump($column_right);
    // var_dump($column_left);
    // echo '------';
    // print_r($module);
   ?>

<?php echo $footer; ?>