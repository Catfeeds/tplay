<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/4 0004
 * Time: 下午 4:48
 */

namespace app\admin\model;


use think\Model;

class Visit extends Model
{
    public function visitline()
    {
        //关联角色表
        return $this->belongsTo('VisitLine');
    }

}