<?php
/**
 * 意见反馈
 * Created by PhpStorm.
 * User: gh
 * Date: 2018/5/23
 * Time: 21:10
 */

namespace app\admin\controller;

use \think\Db;
use app\admin\controller\Permissions;
use \think\Cookie;
use \think\Session;
use \think\Cache;
use app\admin\model\Feedback as feedbackModel;

class Feedback  extends Permissions
{
    public function index()
    {
        $model = new feedbackModel();
        $where = [];
        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['content'] = ['like', '%' . $post['keywords'] . '%'];
        }

        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }

        $user = $model->where($where)->select();

        $this->assign('feed',$user);
        return $this->fetch();

    }

}