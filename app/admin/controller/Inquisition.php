<?php
/**
 * 问诊管理
 * Created by PhpStorm.
 * User: gh
 * Date: 2018/5/23
 * Time: 21:02
 */

namespace app\admin\controller;

use \think\Db;
use app\admin\controller\Permissions;
use \think\Cookie;
use \think\Session;
use \think\Cache;
use app\admin\model\Visit;

class Inquisition extends Permissions
{
    public function index()
    {
        //实例化问诊模型
        $model = new Visit();
        $where = [];
        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['name'] = ['like', '%' . $post['keywords'] . '%'];
        }

        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }

        $inquisition = $model->where($where)->order('create_time desc')->paginate(20);;

        $this->assign('inquisition',$inquisition);
        return $this->fetch();


    }

}