<?php

session_start();

require 'db.php';
require 'models/model.php';

function model($model) {
    static $models = array();
    $model = strtolower($model);
    if (!isset($models[$model])) {
        include ROOT . DS . 'models' . DS . $model . '.php';
        
        $model_name = ucfirst($model);
        $models[$model] = new $model_name();
    }
    
    return $models[$model];
}

function isLogged() {
    if (empty($_SESSION['logged'])) {
        return false;
    }
    
    return $_SESSION['logged'];
}

function adminLogged(){
    if (empty($_SESSION['adminlogged'])) {
        return false;
    }
    
    return $_SESSION['adminlogged'];
}

function render($file, $data) {
    extract($data);
    ob_start();
    
    include ROOT . DS . 'views' . DS . $file;
    
    ob_end_flush();
}

function isPostRequest() {
    return (strtolower($_SERVER['REQUEST_METHOD']) == 'post');
}

function postData() {
    return $_POST;
}

function redirect($to_url) {
    header('Location: ' . $to_url);
    exit();
}

function uploadImage($target_dir){
    $target_file = $target_dir . basename($_FILES["image"]["name"]);
    $uploadOk = 1;
    $imageFileType = pathinfo($target_file, PATHINFO_EXTENSION);

    if ($_FILES['image']['size'] == 0)
    {
        return "Image is not chosen.";
    }
    // Check if image file is a actual image or fake image
    if(isset($_POST["submit"])) {
        $check = getimagesize($_FILES["image"]["tmp_name"]);
        if($check !== false) {
            return "File is an image - " . $check["mime"] . ".";
            $uploadOk = 1;
        } else {
            return "File is not an image.";
            $uploadOk = 0;
        }
    }
    // Check file size
    else if ($_FILES["image"]["size"] > 500000) {
        return "Sorry, your file > 500Kb.";
        $uploadOk = 0;
    }
    // Allow certain file formats
    else if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
    && $imageFileType != "gif" && $_FILES['image']['size'] != 0) {
        return "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }
    // if everything is ok, try to upload file
    // resize
    else {
        $maxDim = 300;
        list($width, $height, $type, $attr) = getimagesize( $_FILES['image']['tmp_name'] );
        if ( $width > $maxDim || $height > $maxDim ) {
            $target_filename = $_FILES['image']['tmp_name'];
            $fn = $_FILES['image']['tmp_name'];
            $size = getimagesize( $fn );
            $ratio = $size[0]/$size[1]; // width/height
            if( $ratio > 1) {
                $width = $maxDim;
                $height = $maxDim/$ratio;
            } else {
                $width = $maxDim*$ratio;
                $height = $maxDim;
            }
            $src = imagecreatefromstring( file_get_contents( $fn ) );
            $dst = imagecreatetruecolor( $width, $height );
            imagecopyresampled( $dst, $src, 0, 0, 0, 0, $width, $height, $size[0], $size[1] );
            imagedestroy( $src );
            imagepng( $dst, $target_filename ); // adjust format as needed
            imagedestroy( $dst );
        }
        // upload
        if (move_uploaded_file($_FILES["image"]["tmp_name"], $target_file)) {
            return "success";
        } else {
            return "Sorry, there was an error uploading your file.";
        }
    }
}