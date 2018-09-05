<?php
namespace app\admin\controller;

use think\View;
use think\Controller;
use think\Config;
use alisms\SendSms;
use think\Loader;

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
        $re_msg['success'] = 0;
        $re_msg['msg'] = '删除失败';
        $id = input("id",0);
        $rs = db("sms_config")->where("id",$id)->delete();
        if($rs){
            $re_msg['success'] = 1;
            $re_msg['msg'] = '删除成功';
        }
        echo json_encode($re_msg);
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
    // 批量发送短信
    public function sendBatchSms(){
        return $this->fetch('sendBatchSms');
    }
    // 执行批量发送
    public function sendSms(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '发送失败';

        $data['mobile']  = input("mobile",'');
        $data['content'] = input("content","");
        $data['code']    = trim(input("code",""));
        $data['signs']   = input("sign","");

        $validate = Loader::validate('Vsms');
        if(!$validate->check($data)){
            $re_msg['msg'] = $validate->getError();
            echo json_encode($re_msg);
            exit;
        }

        if(!empty($data['mobile']) && !empty($data['content'])){
            $mob = array();
            $temp = array();
            $sign = array();
            $mobile = explode(',', trim($data['mobile']));
            foreach (array_unique($mobile) as $key => $value) {
                if(preg_match("/^1[345678]{1}\d{9}$/",$value)){
                    $mob[] = $value;
                    $temp[] = $data['content'];
                    $sign[] = $data['signs'];
                }
            }
            if(count($mob)>0){     
                $templateCode   = $data['code'];
                $templateParam  = $temp;        
                $signName       = $sign;
                $fs = $this->writeSms($mob,$data['content'],$templateCode,$data['signs']);
                $sms = new SendSms();
                $rs = $sms::sendBatchSms($mob,$signName,$templateCode,$templateParam);
                $rs = json_encode($rs);
                $result = json_decode($rs,1);
                if($result['Message'] == 'OK'){
                    $re_msg['success'] = 1;
                    $re_msg['msg'] = '发送成功';
                    $this->updateSms($mob,$templateCode);
                }else{
                    $re_msg['msg'] = $result['Message'];
                }
            }else{
                $re_msg['msg'] = '手机号码错误';
            }
        }
        echo json_encode($re_msg);
    }
    // 发送短信写到日志
    public function writeSms($mobile=array(),$content='',$temp='',$sign=''){
        $rs = 0;
        if(!empty($mobile)){
            $data = array();
            foreach ($mobile as $key => $value) {
                $data[$key]['mobile']  = $value;
                $data[$key]['temp']    = $temp;
                $data[$key]['sign']    = $sign;
                $data[$key]['content'] = $content;
                $data[$key]['unitid']  = $this->unitid;
                $data[$key]['addtime'] = time();
            }
            $rs = db("sms_log")->insertAll($data);
        }
        return $rs;
    }
    // 更新短信状态
    public function updateSms($mobile=array(),$temp=''){
        $rs = 0;
        $wh = array();
        if(!empty($mobile)){            
            foreach ($mobile as $key => $value) {
                $wh['temp'] = $temp;
                $wh['mobile'] = $value;
                $rs = db("sms_log")->where($wh)->update(['status'=>1]);
            }
        }
        return $rs;
    }
    // 重新发送短信
    public function reSend(){
        $re_msg['success'] = 0;
        $re_msg['msg'] = '发送失败';

        $id = input("id",0);
        $where['id'] = $id;
        $where['status'] = 0;
        $rs = db("sms_log")->where($where)->find();

        if($rs){
            $sms = new SendSms();
            $templateParam = array("code"=>$rs['content']);
            $m = $sms::sendSms($rs['mobile'],$rs['sign'],$rs['temp'],$templateParam);
            $js = json_encode($m);
            $arr = json_decode($js,1);
            if($arr['Message']=="OK"){
                $rs = db("sms_log")->where("id",$id)->update(['status'=>1,'error'=>'']);
            }else{
                $rs = 0;
            }
            $re_msg['msg'] = $arr['Message'];
        }
        if($rs){
            $re_msg['success'] = 1;
        }
        echo json_encode($re_msg);
    }
    // 单个发送短信
    public function send(){ 
        $sms = Loader::model('SmsModel');
        $mobile = input("mobile",'17095989213');       
        $sms->remind_sms(3,$mobile);
        exit;
        //获取对象，如果上面没有引入命名空间，可以这样实例化：$sms = new \alisms\SendSms()
        $sms = new SendSms();
        //$mobile为手机号
        $signName = '福州总院';
        $templateCode = 'SMS_137780004';

        //模板参数，自定义了随机数，你可以在这里保存在缓存或者cookie等设置有效期以便逻辑发送后用户使用后的逻辑处理
        $code = mt_rand();
        $templateParam = array("code"=>$code);
        $m = $sms::sendSms($mobile,$signName,$templateCode,$templateParam);
        print_r($m);
        // $m = array(
        //     "Message" => 'OK' ,
        //     "RequestId" => '5CEF9808-8C24-4700-B74D-2A9DAF0096A8' ,
        //     "BizId" => '496524036029272812^0',
        //     "Code" => 'OK' );
        //类中有说明，默认返回的数组格式，如果需要json，在自行修改类，或者在这里将$m转换后在输出
        $data = array();
        $rs = 0;
        $js = json_encode($m);
        $arr = json_decode($js,1);
        if($arr['Message']=="OK"){
            $data['mobile']  = $mobile;
            $data['temp']    = $templateCode;
            $data['sign']    = $signName;
            $data['content'] = $code;
            $data['unitid']  = $this->unitid;
            $data['addtime'] = time();
            $rs = db("sms_log")->insert($data);
        }
        echo $rs;
    }
}