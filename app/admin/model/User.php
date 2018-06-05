<?php
/**
 * Created by PhpStorm.
 * User: gh
 * Date: 2018/6/3
 * Time: 19:05
 */

namespace app\admin\model;


use think\Model;

class User extends Model
{
    public function feedback()
    {
        //关联反馈表
        return $this->hasOne('Feedback');
    }

}