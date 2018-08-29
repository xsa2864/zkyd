<?php
namespace app\admin\validate;

use think\Validate;

class Login extends Validate
{
    protected $rule = [
        'captcha' => 'token|require|captcha',
        'account' => 'require',
        'password' => 'require',
    ];

    protected $message = [
        'captcha.token' => '表单错误!',
        'captcha.require' => '请输入验证码!',
        'captcha.captcha' => '验证码有误',
        'account' => '请输入登录账户!',
        'password' => '请输入登录密码!',
    ];
}