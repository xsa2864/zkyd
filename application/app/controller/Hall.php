<?php
namespace app\app\controller;

use think\Controller;
use think\Request;
use think\Db;
use think\Loader;
use think\Cache;

class Hall extends Common
{
	// 医院列表
    public function list()
    {
        $pageNum = 10;
        $list = db("hall")->page(1,$pageNum)->select();
        $num = db('serque')->count();
    	$more = $num>$pageNum?1:'没有更多数据了';
    	$this->assign("more",$more);
        $this->assign("list",$list);
    	$this->assign("Subtitle","就诊科室");
        return $this->fetch('list');
    }
    // 获取更多医院列表
    public function more_list(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '没有更多数据了';

    	$page = input("page",1);
    	$pageNum = 10;
    	$num = db('hall')->count();
    	$flag = $num - ($page-1)*$pageNum;
    	if($flag>0){
    		$list = db("hall")->page($page,$pageNum)->select();
    		if($list){
    			$re_msg['success'] = 1;
       			$re_msg['msg'] = $list;
       			$re_msg['page'] = $flag>$pageNum?($page+1):0;
    		}
    	}
    	echo json_encode($re_msg);
    }
    // 医生列表
    public function getDoctor(){
    	$id = input("id",0);
    	$pageNum = 10;
    	$list = db("serque")->where("HallNo",$id)->page(1,$pageNum)->select();
    	$num = db('serque')->where("HallNo",$id)->count();
    	$more = $num>$pageNum?1:'没有更多数据了';
    	$this->assign("more",$more);
    	$this->assign("list",$list);
    	$this->assign("HallNo",$id);
    	$this->assign("Subtitle","就诊医生");
        return $this->fetch('doctor');
    }
    // 获取更多医院列表
    public function more_doctor(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '没有更多数据了';
        $HallNo = input("HallNo",0);
    	$page = input("page",1);
    	$pageNum = 10;
    	$num = db('serque')->where("HallNo",$HallNo)->count();
    	$flag = $num - ($page-1)*$pageNum;
    	if($flag>0){
    		$list = db("serque")->where("HallNo",$HallNo)->page($page,$pageNum)->select();
    		if($list){
    			$re_msg['success'] = 1;
       			$re_msg['msg'] = $list;
       			$re_msg['page'] = $flag>$pageNum?($page+1):0;
    		}
    	}
    	echo json_encode($re_msg);
    }
    // 预约
    public function getMark(){
    	$id = input("id",0);
    	$list = db("serque")->alias('s')
                ->join('hall h','s.HallNo = h.HallNo')
                ->where("s.QueId",$id)
                ->find();
    	Loader::import("own/Work", EXTEND_PATH);
        $work=new \Work();
        $result = $work->checktime($list);
        $this->assign("date",$result['data']);
    	$this->assign("list",$list);

    	$this->assign("Subtitle","填写预约信息");
        return $this->fetch('mark');
    }
    // 获取时间点
    public function getTime(){
    	$id = input("id",0);
    	$date = input("date",'');

        $re_msg['success'] = 0;
        $re_msg['msg'] = '查询失败';
        $data = array();
        if (Request::instance()->isPost())
        {
            $result = db("serque")->where("QueId",$id)->find();
            // 获取上班时间
            Loader::import("own/Work", EXTEND_PATH);
            $work=new \Work();
            $data = $work->getCheckTimes($result,$date);
            
            if($result){
                $re_msg['success'] = 1;
                $re_msg['msg'] = $data;
            }
        }
        echo json_encode($re_msg);
    }
    // 保存预约
    public function markSave(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '预约失败';
    	$data['idcard'] = input("idcard","");
	    $data['mobile'] = input("mobile","");
	    $data['despeakDate'] = input("mktime","");
	    $radio1 = input("radio1","");
	    $data['time_Part_S'] = '';
		$data['time_Part_O'] = '';
	    if(!empty($radio1)){
	    	$ra = explode('-', $radio1);
	    	$data['time_Part_S'] = $ra[0].":00";
	    	$data['time_Part_O'] = $ra[1].":00";
	    }
	    
	    $data['queId'] = input("QueId",0);
	    $data['hallNo'] = input("HallNo",0);
	    $data['inTime'] = date("Y-m-d H:i:s",time());
	    $data['addtime'] = time();
	    $validate = Loader::validate('Token');
		if(!$validate->check($data)){
		  $re_msg['msg'] = $validate->getError();
		}else{		
			$where['mobile'] = $data['mobile'];
			$where['idcard'] = $data['idcard'];
			$where['despeakDate'] = $data['despeakDate'];
			$where['time_Part_S'] = $data['time_Part_S'];
			$where['time_Part_O'] = $data['time_Part_O'];
            
			$result = db("despeak")->where($where)->select();	
			if($result){
				$re_msg['msg'] = '已经预约过';
			}else{				
			    $rs = db("despeak")->insertGetId($data);
			    if($rs){
			    	$re_msg['success'] = 1;
		        	$re_msg['msg'] = '预约成功';
                    $re_msg['id'] = $rs;
			    }
			}
		}
	    echo json_encode($re_msg);
    }
    // 显示预约结果
    public function markResult(){
        $id = input("id",194);
        $mobile = input('mobile','15377907108');
        $wh['despeak_id'] = $id;
        $wh['mobile'] = $mobile;
        $result = db("despeak")->alias("d")
                    ->field("d.*,h.HallName,s.QueName")
                    ->join("hall h","h.HallNo=d.hallNo",'LEFT')
                    ->join("serque s","s.QueId=d.queId",'LEFT')
                    ->where($wh)->find();
        $this->assign("result",$result);
        $this->assign("Subtitle","预约结果");
        return $this->fetch('result');
    }
    // 查询预约
    public function selectMark(){
        $status = input("status","");
        $this->assign("status",$status);
        $this->assign("Subtitle","查询预约信息");
        return $this->fetch('select');
    }
    // 查询预约内容
    public function getDataMark(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '查询失败';
        $idcard = input("idcard",'');
        $mobile = input("mobile",'');
        $status = input("status",'');
        $where = array();
        if(!empty($idcard)){
            $where['d.idcard'] = $idcard;
        }
        if(!empty($mobile)){
            $where['d.mobile'] = $mobile;
        }
        if(!empty($status)){
            $where['d.status'] = $status;
        }
        if(!empty($where)){
            $result = db("despeak")->alias("d")
                    ->field("d.*,h.HallName,s.QueName")
                    ->join("hall h","h.HallNo=d.hallNo",'LEFT')
                    ->join("serque s","s.QueId=d.queId",'LEFT')
                    ->order('d.despeak_id desc')
                    ->where($where)->select();  
        }
        if($result){
            $re_msg['success']  = 1;
            $re_msg['msg']      = $result;
        } 
        echo json_encode($re_msg);
    }
    // 取消预约
    public function cancelMark(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '取消失败';

        $id = input("id");
        $rs = db("despeak")->where("despeak_id",$id)->update(['status'=>0]);
        if($rs){
            $re_msg['success'] = 1;
            $re_msg['msg'] = '取消成功';
        }
        echo json_encode($re_msg);
    }
}
