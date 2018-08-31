<?php
namespace app\admin\controller;

use think\View;
use think\Controller;

class Sms extends Base
{
	// 短信配置
    public function smsConfig()
    {        
    	$list = db("sms_config")->alias("s")->field("s.*,u.unitname")->join("unit u","u.UnitId=s.unitid","left")->select();
    	$this->assign("list",$list);
        return $this->fetch('smsconfig');
    }
    // 短信配置编辑
    public function smsEdit(){
    	$id = input('id',-1);
    	$where = array();
    	
    	$where['id'] = $id;
    	
    	$result = db("sms_config")->where($where)->find();  
    	$this->assign("result",$result);
    	$unit = db("unit")->select();
    	$this->assign("unit",$unit);
    	return $this->fetch('smsEdit');
    }
    // 保存配置
    public function smsSave(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '添加失败';

	    $data['unitid']      = input('unitid',0);
	    $data['number']      = input('number',0);
	    $data['used'] 	   = input('used',0);
	    $data['status']    = input('status',0);
	    $id = input('id',0);

	    $flag = 0;
	    if($id > 0){
	    	$flag = db("sms_config")->where("id",$id)->update($data);
	    	if($flag){
		    	$re_msg['success'] = 1;
	        	$re_msg['msg'] = '更新成功';
		    }else{
		    	$re_msg['msg'] = '更新失败';
		    }
	    }else{
	    	$flag = db("sms_config")->insert($data);
		    if($flag){
		    	$re_msg['success'] = 2;
	        	$re_msg['msg'] = '添加成功';
		    }
	    }
	    echo json_encode($re_msg);
    }
    // 删除配置
    public function smsDel(){

    }
    // 短信日志
    public function smsLog(){
    	$mobile = input("mobile",'');
    	$unitid = input("unitid","");
    	$where = array();
    	if(!empty($mobile)){
    		$where['s.mobile'] = $mobile; 
    	}
    	if(!empty($unitid)){
    		$where['s.unitid'] = $unitid; 
    	}
    	$list = db("sms_log")->alias("s")
    			->field("s.*,u.unitname")
    			->join("unit u","u.UnitId=s.unitid","left")
    			->where($where)
    			->order("addtime desc")
    			->paginate(20);
    	$page = $list->render();
 		$this->assign("page",$page);
    	$this->assign("list",$list);

    	$unit = db("unit")->select();
    	$this->assign("unit",$unit);
    	$this->assign("mobile",$mobile);
    	$this->assign("unitid",$unitid);
        return $this->fetch('smsLog');
    }
}