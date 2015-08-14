<?php

class Entry extends Model {
    public $table = 'entrys';
    public $primary_key = 'id';
    
    public function getAllByUserId($user_id) {
        $first_day_this_month = date("Y-m-d", strtotime('first day of this month'));
        $first_day_next_month = date("Y-m-d", strtotime('first day of next month'));
        
        $sql = "SELECT id, title, posted_day, concat(substring(content, 1, 100), '...') as content FROM `{$this->table}`
                    WHERE `user_id` = " . intval($user_id) . "
                            AND `posted_day` >= '" . $first_day_this_month  . "'
                            AND `posted_day` < '" . $first_day_next_month  . "'";
        
        return db_get_all($sql);
    }
    
    public function addToUser($postData, $user_id) {
        $postData['posted_day'] = date("Y-m-d H:i:s");
        $postData['user_id'] = $user_id;
        
        return db_insert($this->table, $postData);
    }

    public function getTenToPublic(){
        $sql="SELECT entrys.id, entrys.title, substring(entrys.content, 1, 300) as dscr, entrys.posted_day, users.name
                from entrys inner join users on entrys.user_id = users.id
                order by entrys.id desc
                limit 10";

        return db_get_all($sql);
    }

    public function getSingle($entry_id){
        $sql="SELECT entrys.id, entrys.title, entrys.content, entrys.posted_day, users.name
                from entrys inner join users on entrys.user_id = users.id
                where entrys.id=".esc($entry_id);

        return db_get_all($sql);
    }

    public function update($postData, $entry_id){
        return db_update($this->table, $postData, 'id='.$entry_id);
    }

    public function delete($entry_id){
        return db_delete($this->table, 'id='.$entry_id);
    }
}
