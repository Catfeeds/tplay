<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 11:29
 */

namespace app\index\model;

use \think\Model;
class VisitLine extends Model
{
    public function visit()
    {
        //关联问诊表
        return $this->hasOne('Visit');
    }

}