<?php
namespace app\admin\controller;


use app\tool\Tool;
use think\Controller;
use app\common\model\User as UserModel;
use think\facade\Cookie;
use think\Session;
use think\helper\Hash;
use think\Queue;
use think\Request;

class Login extends Controller
{
    public function initialize()
    {
        if (Session::has('user')) {
            return $this->redirect('admin/main/index');
        }
    }

    /**
     * 显示登录表单
     * @return mixed
     */
    public function index()
    {
        return $this->fetch('login');
    }

    /**
     * 执行登录逻辑
     * @param Request $request
     * @return \think\response\Json
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function login(Request $request)
    {
        $data = $request->post();
        $validate = $this->validate($data, "app\\admin\\validate\\Login");
        $username = input("username",'');
        // if(!captcha_check($data['captcha'])){
        //     return Tool::showError('验证码错误', ['token' => $request->token()]);
        // };

        $user = db("manager")->alias("m")
                ->join("auth_group_access ga","ga.uid=m.UserId")
                ->join("auth_group g","g.id=ga.group_id")
                ->where('m.UserName',$username)->find();
        if (null === $user) return Tool::showError('用户名或密码不正确!', ['token' => $request->token()]);
        if (md5($data['password']) != $user['password']) return Tool::showError('用户名或密码不正确!', ['token' => $request->token()]);
        if ($user['status'] !== 1) return Tool::showError('该用户已经被禁用!', ['token' => $request->token()]);

        Session::set('user', $user);
        return Tool::showSuccess('登录成功!', ['url' => url('admin/main/index')]);
    }

}