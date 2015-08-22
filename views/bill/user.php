<h3>Đơn hàng của bạn</h3>
<?php if(isset($error)): ?>
	<div id="alert" class="alert alert-error">
	  <button type="button" class="close" data-dismiss="alert">×</button>
	  <?php echo $error; unset($error); ?>
	</div>
<?php endif; ?>
<?php if(isset($bills)): ?>
	<table class="table table-hover">
		<thead>
			<th>#</th>
			<th>Ngày đặt</th>
			<th>Tên sản phẩm</th>
			<th>Tình trạng</th>
		</thead>
	<?php foreach ($bills as $b): ?>
		<tr>
			<td><a href="index.php?c=bill&m=detail&id=<?php echo $b['id'] ?>"><?php echo $b['id'] ?></a></td>
			<td><?php echo $b['booked_date'] ?></td>
			<td><?php echo $b['product']; if($b['number']>1){echo ' <strong>('.$b['number'].' sản phẩm)</strong>';} ?></td>
			<td><?php echo $b['status'] ?></td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>