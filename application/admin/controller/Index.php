<?php
namespace app\admin\controller;

use think\Controller;
use think\facade\Cookie;
use think\Session;

class Index extends Controller
{
    public function index()
    {
        return $this->redirect('admin/Login/index');
    }
    
    /**
     * 退出
     */
    public function logout()
    {
        Session::delete('user');
        echo json_encode(array('success'=>1,'msg'=>'退出成功'));
    }
}


