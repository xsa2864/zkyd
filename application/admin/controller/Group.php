<?php
namespace app\admin\controller;

use think\View;
use think\Controller;
use think\Request;
use think\Db;

class Group extends Base
{
	public function listdata()
    {    	
    	$where = array();
        if($this->userid!=1){
            $where['unitId'] = $this->unitid;
        }
    	$list = db("yygroup")->where($where)->select();   
    	$this->assign('list',$list);
        // 模板输出
        return $this->fetch('listdata');
    }
    // 编辑部门
    public function groupEdit(){
    	$id = input('id',0);

        $where = array();
        if($this->userid!=1){
            $where['unitId'] = $this->unitid;
        }
        $unit = db("unit")->where($where)->select();
        $where['id'] = $id;
        $list = db("yygroup")->where($where)->find();
        $this->assign("list",$list);
        $this->assign("unit",$unit);
        return $this->fetch('groupedit');
    }
    // 保存信息
    public function saveGroup(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '保存失败';

	    $data['unitId'] 		= input('unitId',0);	    
	    $data['HallName'] 		= input('hallname','');
	    $data['DispName'] 		= input('hallname','');
        $data['EnableFlag'] 	= input('EnableFlag',0);
        $data['SerInterface'] 	= input('intfaces','');
  		if($data['unitId']>0){
  			$rs = db("unit")->where("UnitId",$data['unitId'])->column('unitname');
  			$data['UnitName'] = $rs[0];
  		}

	    $id = input('id',0);
	    $flag = 0;
	    if($id > 0){
	    	$flag = db("yygroup")->where("id",$id)->update($data);
	    }else{
	    	$data['addtime'] = time();
	    	$flag = db("yygroup")->insert($data);
	    }
	    if($flag){
	    	$re_msg['success'] = 1;
        	$re_msg['msg'] = '保存成功';
	    }
	    echo json_encode($re_msg);
    }
    // 删除数据
    public function groupDel(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '删除失败';
    	$id = input("id",0);
    	$result = db("yygroup")->where("id",$id)->find();
    	if($result){
    		$flag = db("yygroup")->where("id",$id)->delete();
    		if($flag){
    			$re_msg['success'] = 1;
       	 		$re_msg['msg'] = '删除成功';
    		}
    	}else{
    		$re_msg['msg'] = '该数据已经不存在了';
    	}
    	echo json_encode($re_msg);
    }
    // 预约人员配置
    public function memberlist(){
         
        $where = array();
        if($this->userid!=1){
            $where['m.unitId'] = $this->unitid;
        }
        $where['m.Types'] = 2;
        $list = db("manager")->alias("m")
                ->join("auth_group g","g.id=m.group_id")
                ->where($where)->select();   
        $this->assign('list',$list);
        // 模板输出
        return $this->fetch('memberlist');
    }
}