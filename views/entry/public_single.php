<?php foreach ($single as $single): ?>
	<h3><?php echo $single['title'] ?></h3>
	<div class="hero-unit">
	    <p>
	    	<?php echo $single['content'].'<br>' ?>
	    </p>
	    <div class="pull-right">
		    <span class="label"><?php echo $single['posted_day'] ?></span>
		    <span class="label label-info"><?php echo $single['name'] ?></span>
	    </div>
	</div>
<?php endforeach; ?>

<?php foreach ($comments as $c): ?>
	<div class="hero-subunit">
	    <p>
	    	<?php echo $c['comment'].'<br>' ?>
	    </p>
	    <div class="pull-right">
		    <span class="label"><?php echo $c['date'] ?></span>
		    <span class="label label-inverse"><?php echo $c['name'] ?></span>
	    </div>
	</div>
<?php endforeach; ?>

<div class="hero-subunit">
<form class="form-horizontal" method="post">
	<div class="controlls">
      <input class="comment" type="text" placeholder="Your name.." name="name">
    </div>
    <div class="controlls">
      <textarea class="comment" rows="3" placeholder="Comment.." name="comment"></textarea>
    </div>
    <div class="text-right">
		<button class="btn btn-small btn-primary" type="submit">Post</button>
  		<button class="btn btn-small" type="reset">Reset</button>
    </div>
</form>
</div>