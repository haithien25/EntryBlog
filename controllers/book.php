<?php

function book_list() {
    $data = array();
    if(isset($_GET['pagenum'])){
        $pagenum=$_GET['pagenum'];
    }else{
        $pagenum=0;
    }
    $data['books'] = model('book')->get12($pagenum);
    if(model('book')->getCount()%12===0)
        $data['pages'] = intval(model('book')->getCount())/12;
    else
        $data['pages'] = intval(model('book')->getCount()/12)+1;
    $data['pagenum'] = $pagenum;

    //Thêm vào giỏ hàng:
    if (isPostRequest()) {
        $postData = postData();
        $id=intval($postData['aidi']);
        $quantity=intval($postData['quantity']);

        if($quantity<=0){
            $data['info'] = 'Số lượng không đúng!';
        }
        else if(!isset($_SESSION['cart'])){
            $_SESSION['cart'][0]=array('bookid' => $id,
                                    'quantity' => $quantity);
        }else{
            $flag=false;
            foreach ($_SESSION['cart'] as $cart) {
                if($cart['bookid']===$id){
                    //$cart['quantity'] += $quantity;
                    $flag=true;
                    $data['info'] = 'Sách này đã có trong giỏ hàng!';
                    break;
                }
            }
            if($flag==false){
                $_SESSION['cart'][]=array('bookid' => $id,
                                    'quantity' => $quantity);

                $data['info'] = 'Thêm sách vào giỏ hàng thành công!';
            }
        }
    }
    //var_dump($_SESSION['cart']);
    $data['template_file'] = 'book/list.php';
    render('layout.php', $data);
}