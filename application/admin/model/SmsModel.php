<?php
namespace app\admin\model;

use think\Model;
use alisms\SendSms;

class SmsModel extends Model
{
	// 是否发送短信
	public function remind_sms($unitid=0,$mobile)
	{
		$rs = db("sms_config")->where("unitid=$unitid")->find();
		if($rs){
			if($rs['is_mark']==1 && $rs['number']>$rs['used']){
				$this->send($unitid,$mobile);
			}
		}
	}
	// 发送短信
	public function send($unitid,$mobile){
        $sms = new SendSms();
        
        $signName = '中科易达';
        $templateCode = 'SMS_137780004';
        $code = mt_rand(1000,9999);

        $data['mobile']  = $mobile;
        $data['temp']    = $templateCode;
        $data['sign']    = $signName;
        $data['content'] = $code;
        $data['unitid']  = $unitid;
        $data['addtime'] = time();
        $id = db("sms_log")->insertGetId($data);

        $templateParam = array("code"=>$code);
        $m = $sms::sendSms($mobile,$signName,$templateCode,$templateParam);       
        $data = array();
        $rs = 0;
        $js = json_encode($m);
        $arr = json_decode($js,1);
        if($arr['Message']=="OK"){
            $rs = db("sms_log")->where("id",$id)->update(['status'=>1]);
            db('sms_config')->where('unitid', $unitid)->setInc('used');
        }
        return $rs;
	}
}