<?php

class Bill extends Model{
	public $table = 'bills';
    public $primary_key = 'id';

    public function add($user_id, $cart){
    	$data=array('status' => 'Chờ duyệt',
    				'user_id' => $user_id);

    	if($bill_id = db_insert($this->table, $data)){
            foreach ($cart as $key => $value) {
                $cart[$key]['bill_id']=$bill_id;
                db_insert('bill_details', $cart[$key]);
            }
            return true;
    	}
    	return false;
    }

    public function getByUser($user_id){
        $sql="SELECT * FROM bills WHERE user_id=".$user_id;
        return db_get_all($sql);
    }

    public function getBillDetails($bill_id){
        $sql="SELECT * FROM bill_details WHERE bill_id=".$bill_id;
        return db_get_all($sql);
    }
}