<?php
// News Module for Opencart v1.5.5, modified by villagedefrance (contact@villagedefrance.net)
?>

<?php if($news) { ?> 
	<?php $i = 0; ?>
	<?php foreach ($news as $news) { ?>

		<?php  if($i > 0) { ?>
		     <?php if($i%3 == 1) { ?> 
			 <div>
		     <?php } ?>
			
			<? if($i == 1) { ?>
			<div class="article">
				 <div class="icon-new"></div>
				 <?php if(!$news['thumb']) { ?> 
				 	<img src="catalog/view/theme/jewelry/images/no-img.png" alt="">
				 <?php } else { ?> 
					 <img src="<?php echo $base."image/".$news['thumb'];?>" alt="">
				 <?php } ?>
				 <div class="a-text">
				    <h2><a href="<?php echo $news['href'];?>"><?php echo $news['title'];?></a></h2>
				    <span><?php echo $news['author'];?></span>
				 </div>
			</div>	
			<?php } else {?>
			    <div class="article mini-img">
			  		  <img src="<?php echo $base."image/".$news['thumb'];?>" alt="">
			  		 <div class="a-text">
			  		 	  <h2><a href="<?php echo $news['href'];?>"><?php echo $news['title'];?></a></h2>	  		    
			  		    <span><?php echo $news['author'];?></span>
			  		 </div>	    
			     </div>
		     <?php if($i%3 == 0) { ?> 
		     </div>
		     <div class="clr"></div> 
		     <?php } ?>
			<?php } ?>
		<?php } ?>

		<?php $i++; ?>	
	<?php } ?> <!-- endforeach; ?>
<?php } ?>

<!--
<?php if ($news) { ?>
<?php if($box) { ?>
	<div class="box">
		<div class="box-heading">
			<?php if($icon) { ?>
				<div style="float: left; margin-right: 8px;"><img src="catalog/view/theme/default/image/message.png" alt="" /></div>
			<?php } ?>
			<?php if($customtitle) { ?>
				<?php echo $customtitle; ?>
			<?php } ?>
		</div>
		<div class="box-content">
		<?php foreach ($news as $news_story) { ?>
			<div class="box-news">

				<?php if ($show_headline) { ?>
					<h4><?php echo $news_story['title']; ?></h4>
				<?php } ?>
 -->
<!-- 				мой код

					<p>
				   <a class="newsa" href="<?php echo $news_story['href']; ?>">
				   <img style="margin-bottom: 1px; vertical-align: middle;" src="catalog/view/theme/default/image/message-news.png" alt="" />
				   </a> 
				   <span><?php echo $news_story['posted']; ?></span>
				</p>
 -->
 <!-- 
				<p><a class="newsimage" href="<?php echo $news_story['href']; ?>"><?php if ($news_story['thumb']) { ?><img  src="<?php echo $news_story['thumb']; ?>"><?php } ?></a><?php echo $news_story['description']; ?> .. </p>
				<p><a class="button" href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a></p>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
		</div>
	</div>
<?php } else { ?>
	<div style="margin-bottom:10px;">
		<?php foreach ($news as $news_story) { ?>
			<div class="box-news">
				<img  src="<?php echo $news_story['thumb']; ?>">
				<?php if ($show_headline) { ?>
					<h4><?php echo $news_story['title']; ?></h4>
				<?php } ?>
				<?php echo $news_story['description']; ?> .. <br />
				<a href="<?php echo $news_story['href']; ?>"> <?php echo $text_more; ?></a>
				</p>
				<a class="newsa" href="<?php echo $news_story['href']; ?>"><img src="catalog/view/theme/default/image/message-news.png" alt="" /></a> 
				<span><b><?php echo $text_posted; ?></b> <?php echo $news_story['posted']; ?></span>
			</div>
		<?php } ?>
		<?php if($showbutton) { ?>
			<div style="text-align:right;">
				<a href="<?php echo $newslist; ?>" class="button"><span><?php echo $buttonlist; ?></span></a>
			</div>
		<?php } ?>
	</div>
<?php } ?>
<?php } ?>
-->