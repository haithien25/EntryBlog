<?php

class Book extends Model {
    public $table = 'books';
    public $primary_key = 'id';

    public function get12($page_number){
        $offset=$page_number*12;
        $sql="SELECT id, name, price, image, substring(name, 1, 45) as miname, description from books
                order by id desc
                limit 12
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

    public function getCartList($cart){
        $str="";
        foreach ($cart as $c) {
            if($c['bookid']==end($cart)['bookid']){
                $str.=$c['bookid'];
            }else{
                $str.=$c['bookid'].',';
            }
        }
        $sql="SELECT id, name, image, price FROM books where id in (".$str.")";
        return db_get_all($sql);
    }
}
