<h3>Bài đăng gần đây</h3>
    <?php
        $i = 0;
        foreach ($puclic_entrys as $e):
        $i++;
    ?>
	    <div class="hero-unit">
		    <h1><?php echo $e['title'] ?></h1>    
		    <p>
		    	<?php echo $e['dscr'] ?>
		    	<a href="index.php?c=blog&m=single&entry=<?php echo $e['id'] ?>">...Xem thêm</a>
		    </p>
		    <div class="pull-right">
			    <span class="label"><?php echo $e['posted_day'] ?></span>
			    <span class="label label-info"><?php echo $e['name']; ?></span>
		    </div>
		</div>
    <?php
        endforeach;
    ?>