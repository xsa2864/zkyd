<?php
namespace app\admin\controller;

use think\View;
use think\Controller;
use think\Request;
use think\Db;

class Hall extends Base
{
	// 部门数据列表
    public function listdata()
    {    	
    	$id = input("id",0);
    	$where = array();
        if($this->userid!=1){
            $where['u.UnitId'] = $this->unitid;
        }elseif ($id!=0) {
        	$where = array("u.UnitId"=>$id);
        }
    	$list = db("hall")->alias("h")
                ->field('h.*,u.unitname')
                ->join("unit u","u.UnitId=h.UnitId",'LEFT')
                ->where($where)->paginate(20);
    	$page = $list->render();
 		$this->assign("page",$page);
    	$this->assign("list",$list);
        return $this->fetch('listdata');
    }
    // 部门详细信息
    public function hallDetail(){
    	$id = input("id",0);
    	
    	$list = db("hall")->where("HallNo",$id)->find();
    	$this->assign("list",$list);
    	$where = array();
        if($this->userid!=1){
            $where['UnitId'] = $this->unitid;
        }	
        $where['EnableFlag'] = 1;
    	$unit = db("unit")->where($where)->select();
    	$this->assign("unit",$unit);
    	return $this->fetch('edithall');
    }
    // 保存信息
    public function saveHall(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '保存失败';
	    $data['HallName']      = input('hallname');
	    $data['DispName']      = input('dispname');
	    $data['UnitId'] 	   = input('UnitId');
	    $data['EnableFlag']    = input('EnableFlag');
	    $data['AlternateField1'] 	= input('synopsis');
	    $data['WorkTime1']     = input('stime1');
	    $data['WorkTime2']     = input('etime1');
	    $data['WorkTime3']     = input('stime2');
	    $data['WorkTime4']     = input('etime2');
	    $data['Despeak_Part']  = input('Despeak_Part');
	    $data['SerInterface']  = input('intfaces','');
	    $hallno = input('hallno',0);
        $validate = validate('Hall');
        if(!$validate->check($data)){
          $re_msg['msg'] = $validate->getError();
          echo json_encode($re_msg);exit;
        }

	    $flag = 0;
	    if($hallno > 0){
	    	$flag = db("hall")->where("HallNo",$hallno)->update($data);
	    }else{
	    	$data['InTime'] = date("Y-m-d H:i:s",time());
	    	$flag = db("hall")->insert($data);
	    }
	    if($flag){
	    	$re_msg['success'] = 1;
        	$re_msg['msg'] = '保存成功';
	    }
	    echo json_encode($re_msg);
    }
    // 删除数据
    public function hallDel(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '删除失败';
    	$id = input("id",0);
    	$result = db("hall")->where("HallNo",$id)->find();
    	if($result){
    		$flag = db("hall")->where("HallNo",$id)->delete();
    		if($flag){
    			$re_msg['success'] = 1;
       	 		$re_msg['msg'] = '删除成功';
    		}
    	}else{
    		$re_msg['msg'] = '该数据已经不存在了';
    	}
    	echo json_encode($re_msg);
    }
}