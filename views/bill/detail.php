<h3>Chi tiết đơn hàng</h3>
<?php if(isset($error)): ?>
	<div id="alert" class="alert alert-error">
	  <button type="button" class="close" data-dismiss="alert">×</button>
	  <?php echo $error; unset($error); ?>
	</div>
<?php endif; ?>
<?php if(isset($bill_detail)): $total=0; ?>
	<h4 class="text-right"><?php echo '#'.$bill_detail[0]['bill_id'] ?></h4>
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
				<td><img class="img-rounded" style="height:150px" src="/images/<?php echo $b['image'] ?>"></td>
				<td><?php echo $b['name'] ?></td>
				<td><?php echo number_format($b['price'], 0, ',', '.') ?></td>
				<td><?php echo $b['quantity'] ?></td>
				<td><?php echo number_format($b['total'], 0, ',', '.') ?></td>
			</tr>
		<?php $total+=$b['price']*$b['quantity']; endforeach; ?>
		<tr>
			<td colspan="4"><strong>Tổng cộng:</strong></td>
			<td><strong><?php echo number_format($total, 0, ',', '.') ?><sup>đ</sup></strong></td>
		</tr>
	</table>
<?php endif; ?>