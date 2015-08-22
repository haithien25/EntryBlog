<h3>Quản lý đơn hàng</h3>
<?php if(isset($error)): ?>
	<div id="alert" class="alert alert-error">
	  <button type="button" class="close" data-dismiss="alert">×</button>
	  <?php echo $error; unset($error); ?>
	</div>
<?php endif; ?>

<div class="pagination text-right">
  <ul>
    <li><a href="/admin/index.php?c=bill&m=list&page=<?php if($page==0){echo 0;}else{echo $page-1;} ?>"><<</a></li>
    <?php for ($i=1; $i<=$pages ; $i++): ?>
        <li><a href="/admin/index.php?c=bill&m=list&page=<?php echo $i-1 ?>"><?php echo $i ?></a></li>
    <?php endfor; ?>
    <li><a href="/admin/index.php?c=bill&m=list&page=<?php if($page==$pages-1){echo $pages-1;}else{echo $page+1;} ?>">>></a></li>
  </ul>
</div>

<?php if(isset($bills)): ?>
	<table class="table">
		<thead>
			<th>#</th>
			<th>Ngày đặt</th>
			<th>Tên sản phẩm</th>
			<th>Tình trạng</th>
		</thead>
	<?php foreach ($bills as $b): ?>
		<tr <?php switch ($b['status']) {
			case 'Chờ duyệt':
				echo "class='warning'";
				break;

			case 'Đang giao hàng':
				echo "class='info'";
				break;

			case 'Đã giao hàng':
				echo "class='success'";
				break;

			case 'Hủy':
				echo "class='error'";
				break;
			
			default:
				break;
		} ?>>
			<td><a href="index.php?c=bill&m=detail&id=<?php echo $b['id'] ?>"><?php echo $b['id'] ?></a></td>
			<td><?php echo $b['booked_date'] ?></td>
			<td><?php echo $b['product']; if($b['number']>1){echo ' <strong>('.$b['number'].' sản phẩm)</strong>';} ?></td>
			<td><?php echo $b['status'] ?></td>
		</tr>
	<?php endforeach; ?>
	</table>
<?php endif; ?>

<div class="pagination text-right">
  <ul>
    <li><a href="/admin/index.php?c=bill&m=list&page=<?php if($page==0){echo 0;}else{echo $page-1;} ?>"><<</a></li>
    <?php for ($i=1; $i<=$pages ; $i++): ?>
        <li><a href="/admin/index.php?c=bill&m=list&page=<?php echo $i-1 ?>"><?php echo $i ?></a></li>
    <?php endfor; ?>
    <li><a href="/admin/index.php?c=bill&m=list&page=<?php if($page==$pages-1){echo $pages-1;}else{echo $page+1;} ?>">>></a></li>
  </ul>
</div>