<?php

function cart_calculateTotal(){
	$q = $_REQUEST["q"];
	$p = $_REQUEST["p"];

	$result=$q*$p;

	echo number_format($result, 0, ',', '.');
}

function cart_calculateAll(){
	$all = $_REQUEST["total"];
	echo number_format($all, 0, ',', '.');
}

function cart_list(){
	$data=array();
	if(!isset($_SESSION['cart'])){
		$data['error']='Giỏ trống trơn!';
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
		//var_dump($merge);
		$data['merge']=$merge;
	}
	//Submit cart
	if (isPostRequest()) {
        $postData = postData();
        for($i=1; $i<=count($_SESSION['cart']); $i++){
        	foreach ($_SESSION['cart'] as $key => $cart) {
        		if($postData['bookid'.$i]==$cart['book_id']){
        			$_SESSION['cart'][$key]['quantity']=$postData['quantity'.$i];
        		}
        	}
        }
        redirect('index.php?c=bill&m=view');
    }
	$data['template_file'] = 'cart/list.php';
	render('layout.php', $data);
}

function cart_delete(){
	foreach ($_SESSION['cart'] as $key => $cart) {
		if($cart['book_id']==$_GET['id']){
			unset($_SESSION['cart'][$key]);
			if(count($_SESSION['cart'])==0)
				unset($_SESSION['cart']);
		}
	}
	redirect('index.php?c=cart&m=list');
}

function cart_reset(){
	unset($_SESSION['cart']);
	redirect('index.php?c=cart&m=list');
}