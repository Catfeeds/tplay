<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 10:58
 */
namespace app\index\model;
use \think\Model;

class Visit extends Model
{

    public function visitline(){
        //关联问诊明细表
        return $this->hasMany('VisitLine');
    }


}