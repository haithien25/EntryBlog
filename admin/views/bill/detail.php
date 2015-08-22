<h3>Chi tiết đơn hàng</h3>
<?php if(isset($error)): ?>
	<div id="alert" class="alert alert-success">
	  <button type="button" class="close" data-dismiss="alert">×</button>
	  <?php echo $error; unset($error); ?>
	</div>
<?php endif; ?>
<?php if(isset($bill_detail)): ?>
	<h4 class="text-right"><?php echo '#'.$bill_detail[0]['bill_id'] ?></h4>
	<div class="well" style="height:140px;">
		<div class="span6">
		  <h4>Thông tin giao hàng</h4>
		 	<p>Tên: <?php echo $user['name'] ?></p>
		 	<p>Email: <?php echo $user['email'] ?></p>
		 	<p>SĐT: <?php echo $user['phone'] ?></p>
		 	<p>Địa chỉ: <?php echo $user['address'] ?></p>
		</div>
		<div class="span6">
			<h4>Chi tiết đơn hàng</h4>
				<p>Tiền thanh toán: <strong><?php echo number_format($total, 0, ',', '.') ?><sup>đ</sup></strong></p>
				<p>Tình trạng: 
					<form method="post">
						<select name="status">
						  <?php
						  	foreach($statuses as $status):
						  		if($status==$stt)
						  			echo '<option selected>'.$status.'</option>';
						  		else
						  			echo '<option>'.$status.'</option>';
						  	endforeach;

						  ?>
						</select>
						<button style="margin-top:-11px" type="submit" class="btn btn-success">Xác nhận</button>
					</form>
				</p>
		</div>
	</div>
	<table class="table table-striped">
		<thead>
			<th>Hình</th>
			<th>Tên</th>
			<th>Giá</th>
			<th>Số lượng</th>
			<th>Thành tiền</th>
		</thead>
		<?php foreach ($bill_detail as $b): ?>
			<tr>
				<td><img class="img-rounded" style="height:150px" src="../../../images/<?php echo $b['image'] ?>"></td>
				<td><?php echo $b['name'] ?></td>
				<td><?php echo number_format($b['price'], 0, ',', '.') ?></td>
				<td><?php echo $b['quantity'] ?></td>
				<td><?php echo number_format($b['total'], 0, ',', '.') ?></td>
			</tr>
		<?php endforeach; ?>
		<tr>
			<td colspan="4"><strong>Tổng cộng:</strong></td>
			<td><strong><?php echo number_format($total, 0, ',', '.') ?><sup>đ</sup></strong></td>
		</tr>
	</table>
<?php endif; ?>