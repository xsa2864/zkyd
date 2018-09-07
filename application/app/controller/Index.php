<?php
namespace app\app\controller;

use think\Controller;
use think\Request;
use think\Cookie;

class Index extends Common
{
    public function index()
    {
        $unitid = input("unitid",0);
        if($unitid){
            Cookie::set('unitid',$unitid,3600*24*30);
        }
        if(Cookie::has('unitid')){
            $unitid = Cookie::get('unitid');
            $where['unitid'] = ['in',("0,$unitid")];
        }else{
            $where['unitid'] = $unitid;
        }
    	$where['type'] = ['in',('1,2')];
    	$where['status'] = 1;
    	$result = db("ads")->where($where)->order("unitid desc,type asc")->select();
        if($result){
            
        }
    	
    	$list1 = isset($result[0])?json_decode($result[0]['attr'],1):array();
    	$list2 = isset($result[1])?json_decode($result[1]['attr'],1):array();
     
    	$this->assign("list1",$list1);
    	$this->assign("list2",$list2);
        return $this->fetch('index');
    }
}
