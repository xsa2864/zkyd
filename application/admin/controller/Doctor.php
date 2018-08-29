<?php
namespace app\admin\controller;

use think\View;
use think\Controller;
use think\Request;
use think\Db;

class Doctor extends Base
{
	// 医生数据列表
    public function listdata()
    {    	
    	$id = input("id",0);
        $where = array();
        if($this->userid!=1){
            $where['s.UnitId'] = $this->unitid;
        }elseif ($id!=0) {
            $where['s.UnitId'] = $id;
        }
    	$list = db("serque")->alias("s")
                ->field('s.*,u.unitname,h.HallName')
                ->join('unit u','u.UnitId=s.UnitId','LEFT')
                ->join('hall h','h.HallNo=s.HallNo','LEFT')
                ->where($where)->paginate(20);
        $page = $list->render();
    	$this->assign("lists",$list);
        $this->assign("page",$page);
        return $this->fetch('listdata');
    }
    // 医生详细信息
    public function editDoctor(){
    	$id = input("id",0);    
        $result = array();
        $work = array();

        $where = array();
        if($this->userid!=1){
            $where['UnitId'] = $this->unitid;
        }
        $unit = db("unit")->where($where)->select();
        $where['QueId'] = $id;
    	$result = db("serque")->where($where)->find();

        if(isset($result['ClassesTime'])){
            $work = explode('-', $result['ClassesTime']);
        }
        $this->assign("unit",$unit);
    	$this->assign("list",$result);
        $this->assign("work",$work);
    	return $this->fetch('editdoctor');
    }
    // 保存信息
    public function saveDoctor(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '保存失败';
	    $data['HallNo']     = input('hallno',0);
	    $data['UnitId'] 	= input('unitid',0);
        $data['NoChar']     = input('NoChar','');
        $data['StarNo']     = input('StarNo','');
        $data['pic']        = input('pic','');
        $data['DispName']   = input('dispname','');
        $data['QueName']    = input('quename','');
	    $data['EnableFlag'] = input('EnableFlag',0);
        $data['QueForm']    = input('QueForm',0);
        $data['WorkTime1']  = input('stime1');
        $data['WorkTime2']  = input('etime1');
        $data['WorkTime3']  = input('stime2');
        $data['WorkTime4']  = input('etime2');
        $data['HourSum']    = input('HourSum',0);
        $data['FetchTime']  = input('FetchTime','');
        $data['ClassesTime'] = implode('-', input('ClassesTime/a',''));
        $data['InterfaceID'] = input('intfaces','');
	    $data['AlternateField1'] 	= input('AlternateField1','');
	    $queid = input('queid',0);
	    $flag = 0;
	    if($queid > 0){
	    	$flag = db("serque")->where("QueId",$queid)->update($data);
            if($flag){
                $re_msg['success'] = 2;
                $re_msg['msg'] = '更新成添';
            }
	    }else{
	    	$data['InTime'] = date("Y-m-d H:i:s",time());
	    	$flag = db("serque")->insert($data);
    	    if($flag){
    	    	$re_msg['success'] = 1;
            	$re_msg['msg'] = '加成功功';
    	    }
        }
	    echo json_encode($re_msg);
    }
    // 删除数据
    public function doctorDel(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '删除失败';
    	$id = input("id",0);
    	$result = db("serque")->where("QueId",$id)->find();
    	if($result){
    		$flag = db("serque")->where("QueId",$id)->delete();
    		if($flag){
    			$re_msg['success'] = 1;
       	 		$re_msg['msg'] = '删除成功';
    		}
    	}else{
    		$re_msg['msg'] = '该数据已经不存在了';
    	}
    	echo json_encode($re_msg);
    }
    // 上传图片
    public function upload(){
        $re_msg['success'] = 0;
        $re_msg['msg']  = '上传失败';
        // 获取表单上传文件 例如上传了001.jpg
        $file = request()->file('image');
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate(['size'=>156780,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads');
        if($info){
            // 成功上传后 获取上传信息
            // 输出 jpg
            // echo $info->getExtension();
            // 输出 20160820/42a79759f284b767dfcb2a0197904287.jpg
            // echo $info->getSaveName();
            // 输出 42a79759f284b767dfcb2a0197904287.jpg
            // echo $info->getFilename();
            $re_msg['success'] = 1;
            $re_msg['msg']  =  $info->getSaveName(); 
        }else{
            // 上传失败获取错误信息
            $re_msg['msg']  = $file->getError();
        }
        echo json_encode($re_msg);
    }
}