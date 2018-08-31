<?php
namespace app\admin\controller;

use think\View;
use think\Controller;
use think\Loader;
use think\Session;
use think\Request;

class Base extends Controller
{
    protected $current_action;
    public $unitid;
    public $userid;
    public function _initialize()
    {
    	$where['status'] = 1;
        $where['ismenu'] = 1;
        $rules = Session::get('user.rules');
        $where['id']     = ['in',$rules];
    	$rs = db("auth_rule")->where($where)->order('sort desc')->select();
    	$listmenu = $this->getc_Rule($rs);
    	$user = Session::get('user');
    	$this->assign("user",$user);
    	$this->assign("listmenu",$listmenu);
        $this->assign("title",Session::get('user.title'));
        $this->unitid = Session::get('user.unitid');
        $this->userid = Session::get('user.UserId');
        if(!Session::get('user')){
            return $this->redirect('admin/login/index');
        }
        Loader::import("org/Auth", EXTEND_PATH);
        $auth=new \Auth();
        $this->current_action = request()->module().'/'.request()->controller().'/'.lcfirst(request()->action());

        $result = $auth->check($this->current_action,Session::get('user.UserId'));
        if(!$result){
            if (Request::instance()->isPost()){
                echo json_encode(array('success'=>0,'msg'=>'没有权限'));
                exit;
            }
            if('admin/Main/index'!=$this->current_action){
                return $this->redirect('admin/Main/index');
            }
        }
    }
    // 递归
    public function getMenu($arr,$pid=0){
    	$data = array();
    	foreach ($arr as $key => $value) {
    		if($value['pid']==$pid){
    			$value['child'] = $this->getMenu($arr,$value['menu_id']);
    			$data[] = $value;
    		}
    	}
    	return $data;
    }
    // 规则递归
    public function getc_Rule($arr,$pid=0,$check=array()){
        $data = array();
        foreach ($arr as $key => $value) {
            if($value['pid']==$pid){
                $value['checked'] = (in_array($value['id'], $check)||$this->userid==1)?1:0;
                $value['child'] = $this->getc_Rule($arr,$value['id'],$check);
                $data[] = $value;
            }
        }
        return $data;
    }
    // 查询操作平台
    public function get_platform(){
        $platform = '4';
        $agent = strtolower($_SERVER['HTTP_USER_AGENT']);
        if(strpos($agent, 'windows nt')){
            $platform = 'windows';
        }else if(strpos($agent, 'mac os')){
            $platform = 'IOS';
        }else if(strpos($agent, 'iphone')){
            $platform = 'iphone';
        }else if(strpos($agent, 'android')){
            $platform = 'android';
        }else if(strpos($agent, 'ipad')){
            $platform = 'ipad';
        }
        return $platform;
    }
}