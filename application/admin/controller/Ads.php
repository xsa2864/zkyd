<?php
namespace app\admin\controller;

use think\View;
use think\Controller;
use think\Request;
use think\Db;

class Ads extends Base
{
	// 广告列表
    public function adsList(){
    	$where = array();
        if($this->userid!=1){
            $where['a.unitid'] = $this->unitid;
        }
        $list = db("ads")->alias("a")
        		->field("a.*,u.unitname,t.title as titles")
        		->join("unit u","u.UnitId=a.unitid","left")
                ->join("ads_type t","t.id=a.type","left")
        		->where($where)->paginate(20);
        $page = $list->render();
 		$this->assign("page",$page);
        $this->assign("list",$list);
    	return $this->fetch('adsList');
    }
	// 广告管理
    public function adsEdit()
    {    
    	$id = input("id",0);
    	$where = array();
        $attr = array();
        if($this->userid!=1){
            $where['unitid'] = $this->unitid;
        }
    	$where['id'] = $id;
    	$result = db("ads")->where($where)->find();
        if($result){
            $attr = json_decode($result['attr'],1);
        }
        $type = db("ads_type")->select();
        $this->assign("type",$type);
    	$this->assign("attr",$attr);
    	$this->assign("list",$result);
    	return $this->fetch('adsEdit');
    }
    // 保存广告
    public function adsSave(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '添加失败';

    	$id = input("id",0);
    	$data['title']  = input("title","");
        $data['type']   = input("type",0);
    	$pic            = input("pic/a","");
    	$url            = input("url/a","");
    	$data['status'] = input("status",0);
        $data['unitid'] = $this->unitid;
        
        $arr = array();
        if(!empty($pic)){
            foreach ($pic as $key => $value) {
                $arr[$key]['img'] = $value;
                $arr[$key]['url'] = isset($url[$key])?$url[$key]:'';
            }
        }
        if(!empty($arr)){
            $data['attr'] = json_encode($arr);
        }

    	if($id>0){
    		$rs = db("ads")->where("id",$id)->update($data);
    		if($rs){
    			$re_msg['success'] = 1;
        		$re_msg['msg'] = '更新成功';
    		}else{
    			$re_msg['msg'] = '更新失败';
    		}
    	}else{
	    	$data['unitid'] = $this->unitid;
    		$data['addtime'] = time();
    		$rs = db("ads")->insertGetId($data);
    		if($rs){
    			$re_msg['success'] = 2;
        		$re_msg['msg'] = '添加成功';
    		}
    	}
    	echo json_encode($re_msg);
    }
    // 文章分类列表
    public function cateList(){
    	$where = array();
        if($this->userid!=1){
            $where['a.unitid'] = $this->unitid;
        }
        $list = db("ads")->alias("a")
        		->field("a.*,u.unitname")
        		->join("unit u","u.UnitId=a.unitid","left")
        		->where($where)->paginate(20);
        $page = $list->render();
 		$this->assign("page",$page);
        $this->assign("list",$list);
    	return $this->fetch('adsList');
    }
    // 编辑广告
    public function cateEdit(){
    	$id = input("id",0);
    	$list = db("ads")->where("id=$id")->find();
    	$this->assign("list",$list);
    	return $this->fetch('cateEdit');
    }
    // 广告类保存
    public function cateSave(){
		$re_msg['success'] = 0;
        $re_msg['msg'] = '添加失败';

    	$id = input("id",0);
    	$data['name'] = input("name","");
    	$data['status'] = input("status",0);

    	if($id>0){
    		$rs = db("article_cate")->where("id",$id)->update($data);
    		if($rs){
    			$re_msg['success'] = 1;
        		$re_msg['msg'] = '更新成功';
    		}else{
    			$re_msg['msg'] = '更新失败';
    		}
    	}else{
	    	$data['unitid'] = $this->unitid;
    		$rs = db("article_cate")->insertGetId($data);
    		if($rs){
    			$re_msg['success'] = 2;
        		$re_msg['msg'] = '添加成功';
    		}
    	}
    	echo json_encode($re_msg);
    }
    // 删除广告
    public function adsDel(){
    	$re_msg['success'] = 0;
        $re_msg['msg'] = '删除失败';
    	$id = input("id",0);
    	$where = array();
        if($this->userid!=1){
            $where['unitid'] = $this->unitid;
        }
        $where['id'] = $id;
    	$rs = db("ads")->where($where)->delete();
    	if($rs){
    		$re_msg['success'] = 1;
        	$re_msg['msg'] = '删除成功';
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
        $info = $file->validate(['size'=>506780,'ext'=>'jpg,png,gif'])->move(ROOT_PATH . 'public' . DS . 'uploads' . DS . 'ads');
        if($info){
            $re_msg['success'] = 1;
            $re_msg['msg']  =  $info->getSaveName(); 
        }else{
            // 上传失败获取错误信息
            $re_msg['msg']  = $file->getError();
        }
        echo json_encode($re_msg);
    }
}