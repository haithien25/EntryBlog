<?php

class Bill extends Model {
    public $table = 'bills';
    public $primary_key = 'id';

    public function getTenBills($page){
    	$sql="SELECT * FROM bills LIMIT 10 OFFSET ".$page*10;
    	return db_get_all($sql);
    }

    public function getCount(){
        $sql="SELECT COUNT(*) as count FROM bills";
        $rows = db_get_all($sql);
        
        return isset($rows[0]) ? $rows[0]['count'] : false;
    }

    public function getBillDetails($bill_id){
        $sql="SELECT * FROM bill_details WHERE bill_id=".$bill_id;
        return db_get_all($sql);
    }

}
