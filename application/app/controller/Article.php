<?php
namespace app\app\controller;

use think\Controller;

class Article extends Controller
{
	// 文章内容
    public function content()
    {
        $id = input("id",1);
        $result = db("article")->where("id=$id")->find();
        $this->assign("Subtitle","内容详情");
    	$this->assign("result",$result);
        return $this->fetch('content');
    }
    // 文章列表
    public function articleList(){
    	$unitid = input("unitid",0);
    	if($unitid){
    		$where['unitid'] = $unitid;
    	}
    	$where['status'] = 1;
    	$list = db("article")->where($where)->order("addtime desc")->select();
    	$this->assign("Subtitle","新闻列表");
    	$this->assign("list",$list);
    	return $this->fetch('articleList');
    }
}
