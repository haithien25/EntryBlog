<?php

function book_list() {
    $data = array();
    $currentUser = adminLogged();
    if(isset($_GET['pagenum'])){
        $pagenum=$_GET['pagenum'];
    }else{
        $pagenum=0;
    }
    if($currentUser){
        $data['books'] = model('book')->getTen($pagenum);
        if(model('book')->getCount()%10===0)
            $data['pages'] = intval(model('book')->getCount())/10;
        else
            $data['pages'] = intval(model('book')->getCount()/10)+1;
        $data['pagenum'] = $pagenum;
        
        $data['template_file'] = 'book/list.php';
        render('layout.php', $data);
    }else{
        redirect('/index.php?c=admin&m=login');
    }
}

function book_add() {
    $data = array();
    
    if (isPostRequest()) {
        $postData = postData();
        $currentUser = adminLogged();

        if ($currentUser && model('book')->add($postData, $_SERVER['DOCUMENT_ROOT'].'/images/')==='success') {
            redirect('/admin/index.php?c=book&m=list');
        }else{
            $data['error']=model('book')->add($postData, $_SERVER['DOCUMENT_ROOT'].'/images/');
        }
    }
    $data['title'] = 'Thêm sách mới';
    $data['template_file'] = 'book/add.php';
    render('layout.php', $data);
}

function book_update() {
    $data = array();
    
    if (isPostRequest()) {
        $postData = postData();
        $currentUser = adminLogged();

        if ($currentUser && model('book')->update($postData, $_GET['bookid'], $_SERVER['DOCUMENT_ROOT'].'/images/')==='success') {
            redirect('/admin/index.php?c=book&m=list');
        }else{
            $data['error']=model('book')->update($postData, $_GET['bookid'], $_SERVER['DOCUMENT_ROOT'].'/images/');
            $data['single']=model('book')->getSingle($_GET['bookid']);
        }
    }else{
        $data['single']=model('book')->getSingle($_GET['bookid']);
        $_SESSION['oldImage']=$data['single']['image'];
    }
    $data['title'] = 'Chỉnh sửa sách';
    $data['template_file'] = 'book/add.php';
    render('layout.php', $data);
}

function book_delete(){
    $currentUser = adminLogged();
    if($currentUser && model('book')->delete($_GET['bookid'])){
        redirect('/admin/index.php?c=book&m=list');
    }
}