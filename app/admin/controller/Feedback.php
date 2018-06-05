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

        $user = $model->field('me_feedback.id,me_feedback.create_time,me_feedback.content,me_feedback.operate_dt,me_feedback.status,me_user.name')
            ->join('me_user','me_user.code = me_feedback.user_code')
            ->where($where)->select();

        $this->assign('feed',$user);
        return $this->fetch();

    }

    /**
     * 标记为已处理
     */
    public function done(){
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            $model = new feedbackModel();
            $data['status'] = 'D';
            $data['operate_dt'] = date("Y-m-d H:i:s");
            $r = $model ->save($data,['id'=>$id]);
            if(false == $r) {
                return $this->error('处理失败');
            } else {
                return $this->success('处理成功','admin/feedback/index');
            }
        }
    }

}