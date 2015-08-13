<?php

class Comment extends Model {
    public $table = 'comments';
    public $primary_key = 'id';
    
    public function getAllByEntryId($entry_id) {
        $sql = "SELECT * FROM `{$this->table}`
                    WHERE `entry_id` = " . intval($entry_id);
        
        return db_get_all($sql);
    }
    
    public function addToEntry($postData, $entry_id) {
        $postData['date'] = date("Y-m-d H:i:s");
        $postData['entry_id'] = $entry_id;
        
        return db_insert($this->table, $postData);
    }
}
