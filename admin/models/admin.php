<?php

class Admin extends Model {
    public $table = 'admins';
    
    public function adminLogin($postData) {
        $ad = static::getOneBy($postData['username'], 'username');
        
        if ($ad && $ad['password'] == md5($postData['password'])) {
            unset($ad['password']);
            $_SESSION['adminlogged'] = $ad;
            return $ad;
        }
        return false;
    }

    public function adminLogout() {
        unset($_SESSION['adminlogged']);
        session_destroy();
    }
}
