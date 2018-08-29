<?php
/**
 * User: 李昊天
 * Date: 18/7/13
 * Time: 上午4:50
 * Email: haotian0607@gmail.com
 */

namespace app\tool\exception;


class Http extends Base
{
    public $status = 0;
    public $data = [];
    public $msg = "没有数据!";
    public $code = 200;
}