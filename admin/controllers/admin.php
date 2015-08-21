<?php

function admin_index() {
    redirect('/admin/index.php' . (adminLogged() ? '?c=bill&m=list' : '?c=admin&m=login'));
}

function admin_login(){
	$data = array();
    
    if (isPostRequest()) {
        $postData = postData();
        if (model('admin')->adminLogin($postData)) {
            redirect('/admin/index.php?c=bill&m=list');
        } else {
            $data['error'] = 'Login failed! Please try again!';
        }
    }
    
    $data['template_file'] = 'admin/login.php';
    render('layout.php', $data);
}
function admin_logout() {
    model('admin')->adminLogout();
    redirect('/admin/index.php?c=admin&m=index');
}