<?php

namespace app\admin\validate;

use think\Validate;

class Hall extends Validate
{
    protected $rule = [
        'HallName' => 'require',
        'DispName' => 'require',
        'UnitId'    => 'require|gt:0',
    ];

    protected $message = [
        'HallName'    => '请输入大厅全称!',
        'DispName'    => '请输入预约名称',
        'UnitId'      => '请选择所属单位!',
    ];

}