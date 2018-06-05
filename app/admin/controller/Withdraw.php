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

    /**
     * 标记为已处理
     */
    public function update(){
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        $model = new withdrawModel();
        if($this->request->isPost()) {
            $post = $this->request->post();

            $data['status'] = 'D';
            $data['operate_dt'] = date("Y-m-d H:i:s");
            $data['remark'] =$post['remark'];


            $r = $model ->save($data,['id'=>$post['id']]);
            if(false == $r) {
                return $this->error('处理失败');
            } else {
                return $this->success('处理成功','admin/withdraw/index');
            }
        }else{

            $withdraw = $model ->find($id);
            $this->assign('vo',$withdraw);
            $this->assign('id',$id);
            return $this->fetch();
        }
    }


}