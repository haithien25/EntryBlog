<?php

class Book extends Model {
    public $table = 'books';
    public $primary_key = 'id';

    public function add($postData, $target_dir) {
        if(uploadImage($target_dir)==='success'){
            $postData['image']=basename($_FILES["image"]["name"]);
            db_insert($this->table, $postData);
            return 'success';
        }else{
            return uploadImage($target_dir);
        }
    }

    public function update($postData, $book_id, $target_dir){
        if(uploadImage($target_dir)!=='success' && uploadImage($target_dir)!=='Image is not chosen.'){
            return uploadImage($target_dir);
        }else{
            $postData['image']=basename($_FILES["image"]["name"]);
            if($postData['image']==='') {
                $postData['image']=$_SESSION['oldImage'];
            }
            db_update($this->table, $postData, 'id='.$book_id);
            return 'success';
        }
    }

    public function delete($book_id){
        return db_delete($this->table, 'id='.$book_id);
    }

    public function getTen($page_number){
        $offset=$page_number*10;
        $sql="SELECT id, name, price, image, substring(description, 1, 150) as description from books
                order by id desc
                limit 10
                offset ".esc($offset);

        return db_get_all($sql);
    }

    public function getSingle($book_id){
        $book = static::getOneBy($book_id, null);
        return $book;
    }

    public function getCount(){
        $sql="SELECT COUNT(*) as count FROM books";
        $rows = db_get_all($sql);
        
        return isset($rows[0]) ? $rows[0]['count'] : false;
    }
}
