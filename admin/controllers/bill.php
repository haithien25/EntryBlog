<?php

function bill_list(){
	$data = array();
    $currentUser = adminLogged();
    if(isset($_GET['page'])){
        $page=$_GET['page'];
    }else{
        $page=0;
    }
    if($currentUser){
    	if($data['bills']=model('bill')->getTenBills($page)){
			foreach ($data['bills'] as $key => $bill) {
				//Lấy tên sản phẩm đầu tiên trong đơn hàng
				$bill_detail=model('bill')->getBillDetails($bill['id']);
				$data['bills'][$key]['product']=model('book')->getSingle($bill_detail[0]['book_id'])['name'];
				//Lấy số lượng sản phẩm trong đơn hàng
				$data['bills'][$key]['number']=count($bill_detail);
			}
			//Lấy phân trang
			if(model('bill')->getCount()%10===0)
	            $data['pages'] = intval(model('bill')->getCount())/10;
	        else
	            $data['pages'] = intval(model('bill')->getCount()/10)+1;
	        $data['page'] = $page;
		}else if(!isLogged()){
			redirect('/index.php?c=admin&m=login');
		}else{
			$data['error']='Chưa có đơn hàng nào.';
		}
    }else{
    	$data['error']='Cần đăng nhập admin!';
    }
    $data['template_file'] = 'bill/list.php';
    render('layout.php', $data);
}

function bill_detail(){
	$data=array();
	$user=adminLogged();
	if(!adminLogged()){
		redirect('/index.php?c=admin&m=login');
	}else{
		$bill_detail=model('bill')->getBillDetails($_GET['id']);
		$data['total']=0;
		foreach ($bill_detail as $key => $b) {
			$book=model('book')->getSingle($b['book_id']);
			$bill_detail[$key]['name']=$book['name'];
			$bill_detail[$key]['price']=intval($book['price']);
			$bill_detail[$key]['total']=$book['price']*$b['quantity'];
			$bill_detail[$key]['image']=$book['image'];
			$data['total']+=$book['price']*$b['quantity'];
		}
		$data['bill_detail']=$bill_detail;
	}
	$data['statuses']=array('Chờ duyệt', 'Đang giao hàng', 'Đã giao hàng', 'Hủy');
	$data['stt']=model('bill')->getOneBy($_GET['id'], null)['status'];
	if(isPostRequest()){
		$postData=postData();
		db_update('bills', $postData, 'id='.$_GET['id']);
		$data['stt']=$postData['status'];
		$data['error']='Tình trạng đơn hàng update thành công.';
	}
	$data['user']=model('user')->getOneBy(model('bill')->getOneBy($_GET['id'], null)['user_id'], null);
	$data['template_file'] = 'bill/detail.php';
	render('layout.php', $data);
}
