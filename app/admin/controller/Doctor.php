<?php
/**
 * 医生管理
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
use app\admin\model\Doctor as doctorModel;//医生模型

class Doctor extends Permissions
{
    /**
     * 医生列表
     * @return mixed
     */
    public function index()
    {

        //实例化医生模型
        $model = new doctorModel();
        $where = ['status'=>'A'];
        $where['code'] = ['eq',''];
        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['name'] = ['like', '%' . $post['keywords'] . '%'];
        }

        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }

        $doctor = $model->where($where)->select();
        var_dump($doctor);
        $this->assign('doctor',$doctor);
        return $this->fetch();


    }

    /**
     * 添加
     */
    public function  add(){
        if($this->request->isPost()) {
            $post = $this->request->post();

            $user = new doctorModel();

            if(false == $user->save($post)) {
                return $this->error('添加失败');
            } else {

                return $this->success('添加成功','admin/doctor/index');
            }


        }
        else {
            $hospital =  Db::name('hospital')->select();
            $this->assign('hospital',$hospital);
            return $this->fetch();
        }
    }

    /**
     * 修改
     */
    public function update(){
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

        if($this->request->isPost()) {
            $post = $this->request->post();

            $user = new doctorModel();

            if(false == $user->save($post,['id'=>$id])) {
                return $this->error('修改失败');
            } else {

                return $this->success('修改成功','admin/customer/index');
            }


        }
        else {
            $user = new doctorModel();
            $vo = $user->find($id)->toArray();
            $this->assign('vo',$vo);
            $this->assign('id',$id);
            return $this->fetch();
        }
    }

}