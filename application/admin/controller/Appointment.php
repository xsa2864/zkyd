<?php
namespace app\admin\controller;

use think\View;
use think\Controller;
use think\Request;
use think\Db;
use think\Session;
use think\Loader;
use PHPExcel_IOFactory;
use PHPExcel;

class Appointment extends Base
{
    
    public function listdata()
    {
        // 模板输出
        return $this->fetch('listdata');
    }
    // 查询数据
    public function getdata(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '查询失败';
        if (Request::instance()->isPost())
        {
            // $idcards = input('idcards','');
            // $bodnums = input('bodnums','');
            // $hallname = input('hallname','');
            // $quename = input('quename','');
            // $stime = input('stime',0);
            // $etime = input('etime',0);
            // $vagues = input('vagues','');

            // $where = '';
            // if($this->userid!=1){
            //     $where = 'unitId='.$this->unitid;
            // }
            // $where .= empty($idcards)?'':(empty($where)?'':' and ')."idcard like '%" . $idcards . "%'";
            // $where .= empty($bodnums)?'':(empty($where)?'':' and ')."BodNo like '%" . $bodnums . "%'";
            // $where .= empty($stime)?'':(empty($where)?'':' and ')." addtime>=".strtotime($stime);
            // $where .= empty($etime)?'':(empty($where)?'':' and ')." addtime<=".strtotime($etime);
            // $where .= empty($hallname)?'':(empty($where)?'':' and ')."HallName like '%" . $hallname . "%'";
            
            // if($where != ''){
                // $html = '';
                $result = $this->getDespeakData(input());             
                // $result = db("despeak")->where($where)->select();
                if($result['success'] == 1){
                    $re_msg['success'] = 1;
                    $re_msg['msg'] = $result['msg'];
                }else{
                    $re_msg['msg'] = $result['msg'];
                
                }
            // }else{
            //     $re_msg['msg'] = '请填写查询条件';
            // }
        }
        echo json_encode($re_msg);
    }
    //获取数据列表
    public function getDespeakData($arr=[]){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '未查询到数据';
        $idcards    = isset($arr['idcards'])?$arr['idcards']:'';
        $mobile    = isset($arr['bodnums'])?$arr['bodnums']:'';
        $hallname   = isset($arr['hallname'])?$arr['hallname']:'';
        $quename    = isset($arr['quename'])?$arr['quename']:'';
        $stime      = isset($arr['stime'])?$arr['stime']:'';
        $etime      = isset($arr['etime'])?$arr['etime']:'';
        $vagues     = isset($arr['vagues'])?$arr['vagues']:'';

        $where = array();
        if($this->userid!=1){
            $where['d.unitId'] = $this->unitid;
        }
        if(!empty($mobile)){
            $where['d.mobile'] = $mobile;
        }
        if(!empty($idcards)){
            $where['d.idcard'] = ['like','%'.$idcards.'%'];
        }
        if(!empty($hallname)){
            $where['d.HallName'] = ['like','%'.trim($hallname).'%'];
        }
        if(!empty($quename)){
            $where['d.QueName'] = ['like','%'.trim($quename).'%'];
        }
        if(!empty($stime)){
            $where['d.addtime'] = ['>=',strtotime($stime)];
        }elseif (!empty($etime)) {
           $where['d.addtime'] = ['<',strtotime($etime)];
        }elseif (!empty($stime) && !empty($etime)) {
            $where['d.addtime'] = ['between time',[strtotime($stime),strtotime($etime)]];
        }

        if(!empty($where)){
            $result = db("despeak")->alias("d")
                    ->field("d.*,h.HallName,s.QueName")
                    ->join("hall h","h.HallNo=d.hallNo",'LEFT')
                    ->join("serque s","s.QueId=d.queId",'LEFT')
                    ->where($where)->select();
            if($result){
                $re_msg['success'] = 1;
                $re_msg['msg'] = $result;
            }
        }else{
            $re_msg['msg'] = '缺少查询条件';
        }
        return $re_msg;
    }
    //  导出报表
    public function getExcel(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '导出失败';
        $result = $this->getDespeakData(input());
        if($result['success']!=1){
            echo json_encode($re_msg);
            exit;
        }
        $path = $_SERVER['DOCUMENT_ROOT']; //找到当前脚本所在路径
        $PHPExcel = new PHPExcel(); //例化PHPExcel类，类似于在桌面上新建一个Excel表格
        $PHPSheet = $PHPExcel->getActiveSheet(); //获得当前活动sheet的操作对象
        $PHPSheet->setTitle('数据报表'); //给当前活动sheet设置名称
        // $PHPSheet->setCellValue('A1','姓名')->setCellValue('B1','分数');
        //给当前活动sheet填充数据，数据填充是按顺序一行一行填充的，假如想给A1留空，可以直接setCellValue(‘A1’,’’);
        // $PHPSheet->setCellValue('A2','张三')->setCellValue('B2','50');
        $arrHeader = array('序号','预约科室','预约医生','身份证','手机号','就诊日期','就诊时间','预约时间');
        //填充表头信息
        $letter = explode(',',"A,B,C,D,E,F,G,H");
        $lenth =  count($arrHeader);
        for($i = 0;$i < $lenth;$i++) {
            $PHPSheet->setCellValue($letter[$i]."1",$arrHeader[$i]);
        };
        foreach ($result['msg'] as $key => $value) {
            $k = $key+2;
            $PHPSheet->setCellValue("A".$k,$value["despeak_id"]);
            $PHPSheet->setCellValue("B".$k,$value["hallName"]);
            $PHPSheet->setCellValue("C".$k,$value["queName"]);
            $PHPSheet->setCellValue("D".$k,$value["idcard"]);
            $PHPSheet->setCellValue("E".$k,$value["mobile"]);
            $PHPSheet->setCellValue("F".$k,$value["despeakDate"]);
            $PHPSheet->setCellValue("G".$k,$value["time_Part_S"]."-".$value["time_Part_O"]);
            $PHPSheet->setCellValue("H".$k,$value["inTime"]);
        }

        $PHPWriter = PHPExcel_IOFactory::createWriter($PHPExcel,'Excel2007');
        //按照指定格式生成Excel文件，‘Excel2007’表示生成2007版本的xlsx，‘Excel5’表示生成2003版本Excel文件
        //header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        //告诉浏览器输出07Excel文件
        //header('Content-Type:application/vnd.ms-excel');
        //告诉浏览器将要输出Excel03版本文件
        //header('Content-Disposition: attachment;filename="'.time().'.xlsx"');
        //告诉浏览器输出浏览器名称
        //header('Cache-Control: max-age=0');//禁止缓存
        //$PHPWriter->save("php://output");
        $url = "/excel/".time().".xlsx";
        $all_url = $path.$url;
        //表示在$path路径下面生成demo.xlsx文件
        $rs = $PHPWriter->save($all_url); 
        if(file_exists($all_url)){
            $re_msg['success'] = 1;
            $re_msg['msg'] = $url;
        }
        echo json_encode($re_msg);
    }
    // 预约记录
    public function registration(){
        
        $where = array();
        if($this->userid!=1){
            $where['UnitId'] = $this->unitid;
        }
        $where['EnableFlag'] = 1;
        $result = db("hall")->where($where)->select();
        $this->assign('list',$result);
        // 模板输出
        return $this->fetch('registration');
    }
    // 获取专家名字
    public function getName(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '查询失败';
        if (Request::instance()->isPost())
        {
            $hallno = input('id',0);
            $result = db("serque")->where("HallNo",$hallno)->select();
            if($result){
                $re_msg['success'] = 1;
                $re_msg['msg'] = $result;
            }
        }
        echo json_encode($re_msg);
    }
    // 获取时间
    public function getTime(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '查询失败';
        if (Request::instance()->isPost())
        {
            $hallno = input('hallno',0);
            $queid = input('queid',0);
            $result = db("serque")->alias('s')
                        ->join('hall h','s.HallNo = h.HallNo')
                        ->where("s.HallNo",$hallno)
                        ->find();
            Loader::import("own/Work", EXTEND_PATH);
            $work=new \Work();
            $data = $work->checktime($result);

            // $data = $this->checktime($result);
            if($result){
                $re_msg['success'] = 1;
                $re_msg['msg'] = $data;
            }
        }
        echo json_encode($re_msg);
    }
    // 获取预约时间
    public function getCheckTime(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '查询失败';
        $data = array();
        if (Request::instance()->isPost())
        {
            $queid = input('queid',0);
            $ndata = input('ndata','');
            $result = db("serque")->where("QueId",$queid)->find();
            // 获取上班时间
            Loader::import("own/Work", EXTEND_PATH);
            $work=new \Work();
            $data = $work->getCheckTimes($result,$ndata);
            if($result){
                $re_msg['success'] = 1;
                $re_msg['msg'] = $data;
            }
        }
        echo json_encode($re_msg);
    }
    
    //添加预约信息
    public function addDespeak(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '预约失败';
        $data['mobile']     = input("mobile",0);
        $data['name']       = input("name",'');
        $data['queName']    = input("quename",'');
        $data['idcard']     = input("idcard",0);
        $data['hallNo']     = input("hallno",0);
        $data['hallName']   = input("hallname",'');
        $data['queId']      = input("queid",0);
        $data['despeakDate'] = input("date1",'');
        $time1 = input("time1",'');
        $arr = explode('-', $time1);
        $data['time_Part_S'] = $arr[0].':00';
        $data['time_Part_O'] = $arr[1].':00';
        $data['remark']      = input("remark",'');
        $data['inTime']      = date("Y-m-d",time());
        $data['addtime']     = time();
        $data['unitId']      = $this->unitid;
        $data['manager_id']  = $this->userid;
        $where = array(
            'idcard'    =>$data['idcard'],
            'hallNo'    =>$data['hallNo'],
            'despeakDate'=>$data['despeakDate'],
            );
        $result = db("despeak")->where($where)->find();
        if(empty($result)){
            $data['platform'] = $this->get_platform();
            $id = db("despeak")->insertGetId($data);
            if($id){
                $re_msg['success'] = 1;
                $re_msg['msg'] = db("despeak")->where('despeak_id',$id)->find();
            }
        }else{
            $re_msg['msg'] = '已经预约';
        }
        echo json_encode($re_msg);
    }
    // 医院单位
    public function listunit(){

        $where = array();
        if($this->userid!=1){
            $where["UnitId"] = $this->unitid;
        }
        $result = db("unit")->where($where)->paginate(20);

        $manage = db("manager")->where("group_id",1)->select();
        $page = $result->render();
        $this->assign("page",$page);
        $this->assign('list',$result);
        $this->assign('manage',$manage);
        // 模板输出
        return $this->fetch('listunit');
    }
    // 添加单位
    public function saveUnit(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '新增失败';
        if (Request::instance()->isPost()){
            $arr = input();
            if(empty($arr['unitname']) || empty($arr['dispname'])){
                $re_msg['msg'] = '信息请填完整';
                echo json_encode($re_msg);exit;
            }            

            $arr['InTime'] = date("Y-m-d H:i:s",time());
            if($arr['UnitId']>0){
                $id = $arr['UnitId'];
                unset($arr['UnitId']);
                $flag = db("unit")->where('UnitId',$id)->update($arr);
                if($flag){
                    $re_msg['success'] = 1;
                    $re_msg['msg'] = '更新成功';
                }else{
                    $re_msg['msg'] = '更新失败';
                }
            }else if($this->userid==1){
                unset($arr['UnitId']);
                $flag = db("unit")->insert($arr);
                if($flag){
                    $re_msg['success'] = 2;
                    $re_msg['msg'] = '新增成功';
                }
            }else{
                $re_msg['msg'] = '没有权限添加';
            }     
        }
        echo json_encode($re_msg);
    }
    // 编辑单位
    public function editUnit(){
        $id = input('id',0);        
        $result = array();
        $result = db("unit")->where("UnitId",$id)->find();
        $this->assign('list',$result);
        // 模板输出
        return $this->fetch('editunit');
    }
    // 删除单位
    public function unitDel(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '删除失败';
        $id = input("id",0);
        $result = db("unit")->where("UnitId",$id)->find();
        if($result){
            if($this->userid==1){                
                $flag = db("unit")->where("UnitId",$id)->delete();
                if($flag){
                    $re_msg['success'] = 1;
                    $re_msg['msg'] = '删除成功';
                }
            }else{
                $re_msg['msg'] = '没有权限删除';
            }
        }else{
            $re_msg['msg'] = '该数据已经不存在了';
        }
        echo json_encode($re_msg);
    }

    // 管理员列表
    public function listmanage(){
        $where = array();
        if($this->userid!=1){
            $where['s.UnitId'] = $this->unitid;
        }
        $manage = db("manager")->alias('s')
                    ->field('s.*,g.title,u.unitname,h.HallName')
                    ->join('auth_group_access ga','ga.uid = s.UserId','LEFT')
                    ->join('auth_group g','g.id = ga.group_id','LEFT')
                    ->join('unit u','u.UnitId=s.unitid','LEFT')
                    ->join('hall h','h.HallNo=s.hallid','LEFT')
                    ->where($where)
                    ->order("s.UserId asc")
                    ->paginate(20);
        $page = $manage->render();

        $this->assign("page",$page);
        $this->assign('manage',$manage);
        // 模板输出
        return $this->fetch('listmanage');
    }
    // 管理员管理
    public function manageAdd(){
        $id = input('id',0);
        $type = input("type",0);
        $where = array();
        $list = db("manager")->where("UserId",$id)->find();
        if($this->userid!=1){
            $where['UnitId'] = $this->unitid;
        }
        $where['EnableFlag'] = 1;
        $unit = db("unit")->where($where)->select();
        $group = db("auth_group")->where("status",1)->select();        
        $group_id = db("auth_group_access")->where("uid",$id)->value("group_id");

        $this->assign('unit',$unit);        
        $this->assign('list',$list);
        $this->assign('group',$group);
        $this->assign('group_id',$group_id);
        return $this->fetch('manageadd');
    }
    // 删除管理员
    public function manageDel(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '删除失败';
        $id = input("id",'');
        if (Request::instance()->isPost()){
            if($id == 1){
                $re_msg['msg'] = '超级管理员不能删除';
                echo  json_encode($re_msg);exit;
            }
            $flag = db("manager")->delete($id);
            if($flag){
                $re_msg['success'] = 1;
                $re_msg['msg'] = '删除成功';
            }
        }
        echo json_encode($re_msg);
    }
    // 获取大厅数据
    public function gethall(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '获取失败';
        $id = input('id',0);
        $where = array();
        if($this->userid!=1){
            $where['UnitId'] = $this->unitid;
        }else if($id!=0){
            $where['UnitId'] = $id;
        }        
        $result = db("hall")->where($where)->select();
        if($result){
            $re_msg['success'] = 1;
            $re_msg['msg'] = $result;
        }
        
        echo json_encode($re_msg);
    }
    // 保存管理员信息
    public function manageSave(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '保存失败';
        if (Request::instance()->isPost()){
            $data = input();
            if($data['password']!=$data['password1']){
                $re_msg['msg'] = '两次输入的密码不一样';
                echo json_encode($re_msg);exit;
            }
            $group = input("group_id",'');
            $uid = 0;
            unset($data['password1']);
            unset($data['group_id']);
            $data['password'] = md5($data['password']);
            if($data['id']>0){            
                $uid = $data['id'];
                $where['UserId'] = $data['id'];
                unset($data['id']);
                $flag = db("manager")->where($where)->update($data);
                $flag2 = db("auth_group_access")->where("uid",$where['UserId'])->delete();
                if($flag || $flag2){
                    $re_msg['success'] = 2;
                    $re_msg['msg'] = '更新成功';
                }else{
                    $re_msg['msg'] = '更新失败';
                }
            }else{
                unset($data['id']);
                $rs = db("manager")->where("UserName",input("UserName"))->find();
                if($rs){
                    $re_msg['msg'] = '用户名已存在,请更换';
                }else{                    
                    $data['InTime'] = date("Y-m-d H:i:s",time());
                    $flag = db("manager")->insertGetId($data);
                    $uid = $flag;
                    if($flag){
                        $re_msg['success'] = 1;
                        $re_msg['msg'] = '添加成功';
                    }
                }
            }
            if(!empty($group)){
                $arr['uid'] = $uid;
                $arr['group_id'] = $group;                
                $rs = db("auth_group_access")->insert($arr);
            }            
        }
        echo json_encode($re_msg);
    }
}