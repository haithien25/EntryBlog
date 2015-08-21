<h3>Giỏ hàng</h3>
<?php if(isset($error)): ?>
    <div id="alert" class="alert alert-success">
      <button type="button" class="close" data-dismiss="alert">×</button>
      <?php echo $error; unset($error); ?>
    </div>
    <button type="button" class="btn btn-normal" onclick="location.href='index.php?c=book&m=list'">Quay lại cửa hàng</button>
<?php endif; ?>

<?php if(isset($merge)): ?>
	<form method="post">
	<table class="table table-bordered">
		<thead>
			<td>Hình ảnh</td>
			<td>Tên</td>
			<td>Giá</td>
			<td>Số lượng</td>
			<td>Thành tiền</td>
		</thead>
<?php $total=0; $i=0;
	foreach ($merge as $m): $i++;?>
	
		<tr>
			<td><img class="img-polaroid" style="height:100px;" src="<?php echo "images/".$m['image']; ?>"></td>
			<td><?php echo $m['name']; ?></td>
			<td><output id="bookPrice<?php echo $i ?>"><?php echo number_format($m['price'], 0, ',', '.'); ?></output></td>
			<td>
				<input name="bookid<?php echo $i ?>" type="hidden" value="<?php echo $m['bookid'] ?>"/>
				<input name="quantity<?php echo $i ?>" id="quantity<?php echo $i ?>" type="number" class="input-mini" onchange="calculateTotal<?php echo $i ?>()" onkeyup="calculateTotal<?php echo $i ?>()" value="<?php echo $m['quantity']; ?>" />
			</td>
			<td>
				<output id="total<?php echo $i ?>" ><?php echo number_format($m['price']*$m['quantity'], 0, ',', '.'); ?></output><br><br>
				<a href="/index.php?c=cart&m=delete&id=<?php echo $m['bookid'] ?>"><img src="images/deleteIcon.jpg" /></a>
			</td>
		</tr>
	
<?php $total+=$m['price']*$m['quantity'];
	endforeach; ?>
		<tr>
			<td colspan="4" class="text-right"><h4>Tổng cộng</h4></td>
			<td><h4><output id="all"><?php echo number_format($total, 0, ',', '.'); ?></output><sup>đ</sup></h4></td>
		</tr>
	</table>
	<div class="text-right">
		<button class="btn btn-success" >Thanh toán</button>
		<button type="button" class="btn btn-normal" onclick="location.href='index.php?c=book&m=list'">Tiếp tục mua hàng</button>
		<button type="button" class="btn btn-danger" onclick="location.href='index.php?c=cart&m=reset'">Xóa giỏ hàng</button>
	</div>
	</form>
<?php endif; ?>

<script>
<?php
	for($index=1; $index<=$i; $index++){
		echo "function calculateTotal".$index."() {
          var quantity=parseInt(document.getElementById('quantity".$index."').value);
          var price=parseInt(document.getElementById('bookPrice".$index."').value)*1000;
          if (quantity.length == 0 || quantity<=0) { 
              document.getElementById('total".$index."').value = '0';
              return;
          } else {
              var xmlhttp = new XMLHttpRequest();
              xmlhttp.onreadystatechange = function() {
                  if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                      document.getElementById('total".$index."').value = xmlhttp.responseText;
                  }
              }
              xmlhttp.open('GET', '/index.php?c=cart&m=calculateTotal&q=' + quantity + '&p=' + price, true);
              xmlhttp.send();
          }
          var allTotal".$index."=0;
          for(var i=1;i<=".$i.";i++){
          	var quan=parseInt(document.getElementById('quantity'+i).value);
          	var pri=parseInt(document.getElementById('bookPrice'+i).value)*1000;
          	if(quan.length==0 || quan<=0){
				quan=0;
          	}else{
          		allTotal".$index."+=quan*pri;
          	}
          }
          var xmlhttp1 = new XMLHttpRequest();
          xmlhttp1.onreadystatechange = function() {
              if (xmlhttp1.readyState == 4 && xmlhttp1.status == 200) {
                  document.getElementById('all').value = xmlhttp1.responseText;
              }
          }
          xmlhttp1.open('GET', '/index.php?c=cart&m=calculateAll&total=' + allTotal".$index.", true);
          xmlhttp1.send();
      }";
	}
?>
</script>