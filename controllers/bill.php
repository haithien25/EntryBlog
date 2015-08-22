<?php
function bill_view(){
	$data=array();
	if(!isset($_SESSION['cart'])){
		redirect('index.php?c=cart&m=list');
	}else{
		$data['cart']=$_SESSION['cart'];
		$fromDB=model('book')->getCartList($data['cart']);
		$merge=array();
		foreach ($data['cart'] as $cart) {
			foreach ($fromDB as $value) {
				if(intval($value['id'])==$cart['book_id']){
					$merge[]=array_merge($cart, $value);
				}
			}
		}
		$total=0;
		foreach ($merge as $m) {
			$total += $m['quantity']*$m['price'];
		}
		$data['total']=$total;
	}
	if(isLogged()){
		$data['user'] = $_SESSION['logged'];
	}
	if(isset($_GET['update'])){
		$data['update']=1;
	}
	if(isPostRequest()){
		$postData=postData();
		if(model('user')->update($postData, $postData['email'])){
			$data['user']=model('user')->getOneBy($postData['email'], 'email');
			unset($data['user']['password']);
			$_SESSION['logged']=$data['user'];
			unset($_GET['update']);
			redirect('index.php?c=bill&m=view');
		}
	}
	$data['template_file'] = 'bill/view.php';
	render('layout.php', $data);
}

function bill_add(){
	$data=array();
	//lấy id và cart gọi hàm add trong model Bill.
	$user=isLogged();
	if(model('bill')->add($user['id'], $_SESSION['cart'])){
		$data['info']='Đơn hàng của bạn đã lưu thành công, đang chờ duyệt. Bạn có thể xem lại đơn hàng của mình trong profile.';
		unset($_SESSION['cart']);
	}else{
		$data['info']='Có lỗi xảy ra. Vui lòng thử lại.';
	}
	$data['template_file'] = 'bill/success.php';
	render('layout.php', $data);
}

function bill_user(){
	$data=array();
	$user=isLogged();
	if(model('bill')->getByUser($user['id'])){
		$data['bills']=model('bill')->getByUser($user['id']);
		foreach ($data['bills'] as $key => $bill) {
			//Lấy tên sản phẩm đầu tiên trong đơn hàng
			$bill_detail=model('bill')->getBillDetails($bill['id']);
			$data['bills'][$key]['product']=model('book')->getSingle($bill_detail[0]['book_id'])['name'];
			//Lấy số lượng sản phẩm trong đơn hàng
			$data['bills'][$key]['number']=count($bill_detail);
		}
	}else if(!isLogged()){
		$data['error']='Bạn cần đăng nhập!';
	}else{
		$data['error']='Bạn chưa có đơn hàng nào.';
	}
	$data['template_file'] = 'bill/user.php';
	render('layout.php', $data);
}

function bill_detail(){
	$data=array();
	$user=isLogged();
	if(!isLogged()){
		$data['error']='Bạn cần đăng nhập!';
	}else{
		$bill_detail=model('bill')->getBillDetails($_GET['id']);
		foreach ($bill_detail as $key => $b) {
			$book=model('book')->getSingle($b['book_id']);
			$bill_detail[$key]['name']=$book['name'];
			$bill_detail[$key]['price']=intval($book['price']);
			$bill_detail[$key]['total']=$book['price']*$b['quantity'];
			$bill_detail[$key]['image']=$book['image'];
		}
		$data['bill_detail']=$bill_detail;
	}
	$data['template_file'] = 'bill/detail.php';
	render('layout.php', $data);
}