<h3>Thanh toán đơn hàng</h3>
<?php if(isset($error)): ?>
    <div id="alert" class="alert alert-error">
      <button type="button" class="close" data-dismiss="alert">×</button>
      <?php echo $error; unset($error); ?>
    </div>
<?php endif; ?>
<?php if(isLogged()): ?>
	<div class="well" style="height:140px;">
		<div class="span6">
		  <h4>Thông tin giao hàng</h4>
		 	<p>Tên: <?php echo $user['name'] ?></p>
		 	<p>Email: <?php echo $user['email'] ?></p>
		 	<p>SĐT: <?php if($user['phone']==''){echo '(chưa có)';}else{echo $user['phone'];} ?></p>
		 	<p>Địa chỉ: <?php if($user['address']==''){echo '(chưa có)';}else{echo $user['address'];} ?></p>
		</div>
		<div class="span6">
			<h4>Chi tiết đơn hàng</h4>
				<p>Tiền thanh toán: <strong><?php echo number_format($total, 0, ',', '.') ?><sup>đ</sup></strong></p>
		</div>
	</div>
		<p class="text-right">
		 	<button type="button" class="btn btn-normal" onclick="location.href='index.php?c=bill&m=view&update=1'">Chỉnh sửa thông tin</button>
		 	<button type="button" class="btn btn-success" onclick="location.href='index.php?c=bill&m=add'">Xác nhận thông tin</button>
		</p>
<?php endif; ?>
<?php if(!isLogged()): ?>
	<div id="alert" class="alert alert-error">
      <button type="button" class="close" data-dismiss="alert">×</button>
      Bạn chưa đăng nhập!
    </div>
<?php endif; ?>
<?php if(isset($update)): ?>
	<div class="well">
	<form class="form-horizontal" method="post" action="">
	  <div class="control-group">
	    <label class="control-label" for="inputEmail">Email</label>
	    <div class="controls">
	      <input type="text" id="inputEmail" placeholder="Email" name="email" value="<?php echo $user['email'] ?>" readonly="true"/>
	    </div>
	  </div>
	  <div class="control-group">
	    <label class="control-label" for="inputName">Tên</label>
	    <div class="controls">
	      <input type="text" id="inputName" placeholder="Name" name="name" value="<?php echo $user['name'] ?>" />
	    </div>
	  </div>
	  <div class="control-group">
	    <label class="control-label" for="inputPhone">SĐT</label>
	    <div class="controls">
	      <input type="text" id="inputPhone" placeholder="Phone" name="phone" value="<?php echo $user['phone'] ?>" />
	    </div>
	  </div>
	  <div class="control-group">
	    <label class="control-label" for="inputAddress">Address</label>
	    <div class="controls">
	      <input type="text" id="inputAddress" placeholder="Address" name="address" value="<?php echo $user['address'] ?>" />
	    </div>
	  </div>
	  <div class="control-group">
	    <div class="controls">
	      <button type="submit" class="btn btn-success">Xác nhận</button>
	      <button type="button" class="btn btn-normal" onclick="location.href='index.php?c=bill&m=view'">Hủy</button>
	    </div>
	  </div>
	</form>
	</div>
<?php endif; ?>