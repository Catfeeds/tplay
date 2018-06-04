<?php
/**
 * 提现管理
 * Created by PhpStorm.
 * User: gh
 * Date: 2018/5/23
 * Time: 21:11
 */

namespace app\admin\controller;

use \think\Db;
use app\admin\controller\Permissions;
use \think\Cookie;
use \think\Session;
use \think\Cache;
use app\admin\model\WxPaymentLine as withdrawModel;

class Withdraw extends Permissions
{
    /**
     * 提现列表
     */
    public function index()
    {
        //实例化提现模型
        $model = new withdrawModel();
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

        $withdraw = $model->where($where)->select();

        $this->assign('withdraw',$withdraw);
        return $this->fetch();

    }

}