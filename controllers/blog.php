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
        $data['error']=$postData['content'];
        if (model('entry')->addToUser($postData, $currentUser['id'])) {
            $data['error']='Vo day roi ne!';
            redirect('/index.php?c=blog&m=list');
        }
    }
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
    $entry_id=1;
    $data['single']=model('entry')->getSingle($entry_id);

    $data['template_file'] = 'entry/public_single.php';
    render('layout.php', $data);
}
