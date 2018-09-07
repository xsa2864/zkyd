<?php
namespace app\app\controller;

use think\Controller;
use think\Cookie;

class Article extends Controller
{
	// 文章内容
    public function content()
    {
        $id         = input("id",0);
        $cate_id    = input("cate_id",0);
        
        if($cate_id){
            $where['a.cate_id'] = $cate_id;
        }else{
            $where['a.id'] = $id;
        }
        
        $where['a.status'] = 1;
        $where['c.status'] = 1;
        if(Cookie::has('unitid')){
            $where['a.unitid'] = Cookie::get('unitid');
        }

        $result = db("article")->alias("a")
                 ->join("article_cate c","c.id=a.cate_id")
                 ->where($where)
                 ->find();
        $this->assign("Subtitle",$result['name']."-详情");
    	$this->assign("result",$result);
        return $this->fetch('content');
    }
    // 文章列表
    public function articleList(){
    	$unitid = 0;
        $cate_id    = input("cate_id",0);
        if(Cookie::has('unitid')){
            $unitid = Cookie::get('unitid');
        }
        $where['a.cate_id'] = $cate_id;
    	if($unitid){
    		$where['a.unitid'] = $unitid;
    	}
    	$where['a.status'] = 1;
        $where['c.status'] = 1;
    	$list = db("article")->alias("a")
                 ->join("article_cate c","c.id=a.cate_id",'LEFT')
                 ->where($where)
                 ->order("a.addtime desc")
                 ->select();
        if(empty($list)){
            $this->assign("Subtitle","数据列表");
        }else{
    	    $this->assign("Subtitle",$list[0]['name']."-列表");
        }
    	$this->assign("list",$list);
    	return $this->fetch('articleList');
    }
}
