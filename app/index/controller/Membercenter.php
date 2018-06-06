<?php
/**
 * 用户个人中心
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 10:18
 */

namespace app\index\controller;
use app\index\model\Feedback;
use \think\Controller;
use app\index\model\UserPatient as userPatientModel;//问诊人信息模型
use app\index\model\Favorite as favoriteModel;//收藏模型
use app\index\model\Visit as visitModel;//问诊模型
use app\index\model\VisitLine;
use app\index\model\User;
use app\index\model\Doctor;
use think\Session;

class Membercenter extends Controller
{
    /**
     * 用户中心
     */
    public function index()
    {
        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        //获取头像和昵称
        $where['code'] = Session::get('user_code');
        $model = new User();
        $res = $model->field('wx_nick_name,wx_head_img_url')->where($where)->find()->toArray();

        if($res){
            return success($res);
        }else{
            return failMsg('获取失败');
        }

    }

    /**
     * 我的问诊记录
     */
    public function inquisition()
    {
        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $model = new visitModel();
        $where['status']= input('status');
        $where['user_code'] = Session::get('user_code');
        //验证字段
        $result = $this->validate(
            [
                'status'  => input('status'),
            ],
            [
                'status'  => 'require',

            ],
            [
                'status.require'  =>  '状态必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }
        $res = $model->where($where)->order('create_time desc')->select();

        if($res){
            return success($res);
        }else{
            return emptyResult();
        }

    }

    /**
     * 问诊详情
     */
    public function inquisitionDetail()
    {
        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $where['visit_id'] = input('id');
        //验证字段
        $result = $this->validate(
            [
                'id'  => input('id'),
            ],
            [
                'id'  => 'require',

            ],
            [
                'id.require'  =>  '问诊编号必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        $where['user_code'] = Session::get('user_code');

        $model = new VisitLine();
        $res = $model->where($where)->select();
        if($res){
            return success($res);
        }else{
            return emptyResult();
        }
    }


    /**
     * 关注医生
     */
    public function collect(){
        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $data['user_code'] = Session::get('user_code');
        $data['follow_code'] = input('doctor_code');
        //验证字段
        $result = $this->validate(
            [
                'follow_code'  => $data['follow_code'],
            ],
            [
                'follow_code'  => 'require',

            ],
            [
                'follow_code.require'  =>  '医生编号必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        //查询该编号是否存在
        $doctor = new Doctor();
        $r = $doctor ->where(['code'=>$data['follow_code']])->find();
        if(!$r) return failMsg('被关注的信息不存在');

        $model = new favoriteModel();
        $res = $model->save($data);
        if($res){
            return success($data);
        }else{
            return failMsg('关注失败');
        }

    }



    /**
     * 我关注的医生
     */
    public function collection()
    {
        /*$user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }*/

        $where['user_code'] = Session::get('user_code');
        $model = new favoriteModel();

        $res = $model->field('me_doctor.id,name,head_img,title,hospital_code,department_code,original_price')->join('me_doctor','me_doctor.code=me_favorite.follow_code')->where($where)->select();
        if($res){
            return success($res);
        }else{
            return emptyResult();
        }

    }

    /**
     * 意见反馈
     */
    public function feedback()
    {
        /*$user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }*/

        $data['user_id'] = $_SERVER['HTTP_USER_ID'];

        //$data['user_code'] = Session::get('user_code');
        $data['user_code'] = $_SERVER['HTTP_CODE'];

        $data['content'] = input('content');

        $result = $this->validate(
            [
                'content'  => $data['content'],
            ],
            [
                'content'  => 'require',

            ],
            [
                'content.require'  =>  '内容必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }
        $model = new Feedback();
        $res = $model ->save($data);
        if($res){
            return success($data);
        }else{
            return failMsg('提交失败');
        }

    }

    /**
     * 个人详细信息
     */
    public function detail()
    {

        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $model = new userPatientModel();

        $where['user_id'] = $user_id;
        $res = $model->where($where)->select();

        if($res){
            return success($res);
        }else{
            return failMsg('获取失败');
        }

    }
    /**
     * 修改个人信息
     */
    public function editDetail(){

        $user_id = Session::get('user_id');
        //检查是否已登录

        if(!$user_id){
            return failLogin("您还未登录");
        }
        //检查是否存在
        $model = new userPatientModel();
        $where['user_id'] = $user_id;
        $r = $model->where($where)->find();
        $data_post = $this->request->post();
        $result = $this->validate(
            [
                'name'  => input('name'),
                'phone'  => input('phone'),

            ],
            [
                'name'  => 'require|max:25',
                'phone'  => 'require',
            ],
            [
                'name.require'  =>  '姓名必须'
            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        if($r){
            $res = $model->save($data_post,['user_id'=>$user_id]);
        }else{
            $data_post['user_id'] = $user_id;
            $res = $model->save($data_post);
        }



        if($res){
            return success($data_post);
        }else{
            return failMsg('修改失败');
        }
    }


}