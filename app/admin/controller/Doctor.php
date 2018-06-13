<?php
/**
 * 医生管理
 * Created by PhpStorm.
 * User: gh
 * Date: 2018/5/23
 * Time: 21:02
 */

namespace app\admin\controller;

use app\admin\model\Account;
use app\admin\model\Visit;
use \think\Db;
use app\admin\controller\Permissions;
use \think\Cookie;
use \think\Session;
use \think\Cache;
use app\admin\model\Doctor as doctorModel;//医生模型
use app\admin\model\User;//用户模型

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

        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['name'] = ['like', '%' . $post['keywords'] . '%'];
            $map['phone'] = ['like', '%' . $post['keywords'] . '%'];

        }

        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }

        $doctor = $model->where($where)->order('create_time desc')->paginate(20);

        foreach ($doctor as $k=>$v){
            //查询该医生的总收入SELECT SUM(AMOUNT) WHERE TYPE='DT' AND CODE=USER_CODE
            $account = new Account();
            $w['type'] = 'DT';
            $w['code'] = $v['code'];
            $doctor[$k]['amount']=$account->where($w)->sum('amount');
            //查询该医生的问诊量
            $visit = new Visit();
            $ww['doctor_code']= $v['code'];
            $doctor[$k]['count']=$visit->where($ww)->count();

        }



        $this->assign('doctor',$doctor);
        return $this->fetch();


    }

    /**
     * 添加
     */
    public function  add(){
        if($this->request->isPost()) {
            $post = $this->request->post();

            $model = new doctorModel();

            //验证  唯一规则： 表名，字段名，排除主键值，主键名
            $validate = new \think\Validate([
                ['code', 'require', '医生编号不能为空'],
                ['name', 'require', '姓名不能为空'],
                ['tag', 'require', '标签不能为空'],
                ['info', 'require', '个人简介不能为空'],
                ['phone', 'require|max:11|/^1[3-8]{1}[0-9]{9}$/', '手机号不能为空手机号码最多不能超过11个字符|手机号码格式不正确'],
                ['original_price', 'require', '原价格不能为空'],
                ['hospital_code', 'require', '请选择所属医院'],
                ['title', 'require', '请选择所属职位'],
                ['user_id', 'require', '请选择关联用户'],
                ['head_img', 'require', '请上传头像'],
            ]);

            //验证部分数据合法性
            if (!$validate->check($post)) {
                $this->error('提交失败：' . $validate->getError());
            }
            //验证医生编号是否存在
            $name = $model->where(['code'=>$post['code']])->select();
            if(!empty($name)) {
                return $this->error('提交失败：该医生编号已经存在');
            }

            if(false == $model->save($post)) {
                return $this->error('添加失败');
            } else {

                return $this->success('添加成功','admin/doctor/index');
            }


        }
        else {
            $hospital =  Db::name('hospital')->select();
            $user = Db::name('user')->where(['code'=>'','status'=>'A'])->select();
            foreach ($user as $k=>$u) {
                $r = Db::name('doctor')->where(['user_id'=>$u['id']])->find();
                if($r){
                    unset($user[$k]);
                }

            }
            $id = input('id');
            $this->assign('userid',$id);
            $this->assign('hospital',$hospital);
            $this->assign('user',$user);
            return $this->fetch();
        }
    }

    /**
     * 修改
     */
    public function update(){
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        $model = new doctorModel();
        if($this->request->isPost()) {
            $post = $this->request->post();
            //验证  唯一规则： 表名，字段名，排除主键值，主键名
            $validate = new \think\Validate([
                ['code', 'require', '医生编号不能为空'],
                ['name', 'require', '姓名不能为空'],
                ['tag', 'require', '标签不能为空'],
                ['info', 'require', '个人简介不能为空'],
                ['phone', 'require|max:11|/^1[3-8]{1}[0-9]{9}$/', '手机号不能为空手机号码最多不能超过11个字符|手机号码格式不正确'],
                ['original_price', 'require', '原价格不能为空'],
                ['hospital_code', 'require', '请选择所属医院'],
                ['title', 'require', '请选择所属职位'],
                ['head_img', 'require', '请上传头像'],
            ]);

            //验证部分数据合法性
            if (!$validate->check($post)) {
                $this->error('提交失败：' . $validate->getError());
            }
            //验证医生编号是否存在
            $name = $model->where(['code'=>$post['code'],'id'=>['neq',$post['id']]])->select();
            if(!empty($name)) {
                return $this->error('提交失败：该医生编号已经存在');
            }


            if(false == $model->save($post,['id'=>$id])) {
                return $this->error('修改失败');
            } else {

                return $this->success('修改成功','admin/doctor/index');
            }


        }
        else {

            $doctor = $model->find($id)->toArray();
            $hospital =  Db::name('hospital')->select();
            $user = Db::name('user')->where(['code'=>'','status'=>'A'])->select();
            foreach ($user as $k=>$u) {
                $r = Db::name('doctor')->where(['user_id'=>$u['id']])->find();
                if($r){
                    unset($user[$k]);
                }

            }

            $this->assign('hospital',$hospital);
            $this->assign('user',$user);
            $this->assign('doctor',$doctor);
            $this->assign('id',$id);
            return $this->fetch();
        }
    }


    /**
     * 删除
     */
    public function delete(){
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            $model = new doctorModel();
            $data['status'] = 'D';
            $r = $model ->save($data,['id'=>$id]);
            if(false == $r) {
                return $this->error('删除失败');
            } else {
                return $this->success('删除成功','admin/doctor/index');
            }
        }
    }

    /**
     * 待审医生列表
     */

    public function  user(){
        //实例化用户模型
        $model = new User();
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

        $user = $model->where($where)->order('create_time desc')->paginate(20);
        foreach ($user as $k=>$v){
            $doctor = new doctorModel();
            $re = $doctor->where(['user_id'=>$v['id']])->find();
            if($re){
                unset($user[$k]);
            }
        }

        $this->assign('user',$user);
        return $this->fetch();

    }

    /**
     * 删除
     */
    public function del(){
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
            $model = new User();
            $data['status'] = 'D';
            $r = $model ->save($data,['id'=>$id]);
            if(false == $r) {
                return $this->error('删除失败');
            } else {
                return $this->success('删除成功','admin/doctor/index');
            }
        }
    }
}