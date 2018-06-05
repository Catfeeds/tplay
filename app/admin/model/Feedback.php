<?php
/**
 * Created by PhpStorm.
 * User: gh
 * Date: 2018/6/3
 * Time: 20:33
 */

namespace app\admin\model;


use think\Model;

class Feedback extends  Model
{
    public function user()
    {
        //关联用户表
        return $this->belongsTo('User');
    }

}