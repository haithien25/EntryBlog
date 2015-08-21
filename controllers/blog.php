<?php

function blog_list() {
    $data = array();
    $currentUser = isLogged();
    
    if($currentUser){
        $data['entrys'] = model('entry')->getAllByUserId($currentUser['id']);
        
        $data['template_file'] = 'entry/list.php';
        render('layout.php', $data);
    }else{
        redirect('/index.php?c=auth&m=login');
    }
}

function blog_add() {
    $data = array();
    
    if (isPostRequest()) {
        $postData = postData();
        $currentUser = isLogged();
        if (model('entry')->addToUser($postData, $currentUser['id'])) {
            redirect('/index.php?c=blog&m=list');
        }
    }
    $data['title'] = 'Thêm bài viết mới';
    $data['template_file'] = 'entry/add.php';
    render('layout.php', $data);
}

function blog_listpublic(){
    $data = array();
    $data['puclic_entrys']=model('entry')->getTenToPublic();

    $data['template_file'] = 'entry/puclic_list.php';
    render('layout.php', $data);
}

function blog_single(){
    $dara=array();
    $data['single']=model('entry')->getSingle($_GET['entry']);
    
    if (isPostRequest()) {
        $postData = postData();
        if (model('comment')->addToEntry($postData, $_GET['entry'])) {
            redirect('/index.php?c=blog&m=single&entry='.$_GET['entry']);
        }
    }
    //Lấy comment của entry đó
    $data['comments'] = model('comment')->getAllByEntryId($_GET['entry']);

    $data['template_file'] = 'entry/public_single.php';
    render('layout.php', $data);
}

function blog_update(){
    $data = array();
    
    if (isPostRequest()) {
        $postData = postData();
        $currentUser = isLogged();
        if ($currentUser && model('entry')->update($postData, $_GET['entry'])) {
            redirect('/index.php?c=blog&m=list');
        }
    }else{
        $data['single']=model('entry')->getSingle($_GET['entry']);
    }
    $data['title'] = 'Chỉnh sửa bài viết';
    $data['template_file'] = 'entry/add.php';
    render('layout.php', $data);
 }

function blog_delete(){
    $currentUser = isLogged();
    if ($currentUser && model('entry')->delete($_GET['entry'])) {
        redirect('/index.php?c=blog&m=list');
    }
}