<?php
namespace app\app\controller;

use think\Controller;
use think\Request;

class Index extends Common
{
    public function index()
    {
    	$where['id'] = ['in',('1,2')];
    	$where['status'] = 1;
    	$result = db("ads")->where($where)->order("type asc")->select();
    	
    	$list1 = isset($result[0])?json_decode($result[0]['attr'],1):array();
    	$list2 = isset($result[1])?json_decode($result[1]['attr'],1):array();
    	
    	$this->assign("list1",$list1);
    	$this->assign("list2",$list2);
        return $this->fetch('index');
    }
}
