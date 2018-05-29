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
use think\Session;

class Membercenter extends Controller
{
    /**
     * 用户中心
     */
    public function index()
    {
        //获取头像和昵称
        $where['user_code'] = Session::get('user_code');
        $model = new User();
        $res = $model->field('name,wx_head_img_url')->where($where)->find();
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
        $model = new visitModel();
        $where['status']= input('status');
        $where['user_code'] = Session::get('user_code');
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
        $where['visit_id'] = input('id');
        $where['user_code'] = Session::get('user_code');
        $model = new VisitLine();
        $res = $model->where($where)->find();
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
        $data['user_code'] = Session::get('user_code');
        $data['follow_code'] = input('doctor_code');
        $model = new favoriteModel();
        $res = $model->save($data);
        if($res){
            return success($res);
        }else{
            return failMsg('关注失败');
        }

    }



    /**
     * 我关注的医生
     */
    public function collection()
    {
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
        $data['user_code'] = Session::get('user_code');
        $data['content'] = input('content');
        $model = new Feedback();
        $res = $model ->save($data);
        if($res){
            return success($res);
        }else{
            return failMsg('提交失败');
        }

    }

    /**
     * 个人详细信息
     */
    public function detail()
    {

        $model = new userPatientModel();
        $user_id = Session::get('user_id');
        $res = $model->find($user_id);
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
        $data_post = $this->request->post();
        $model = new userPatientModel();
        $where['user_id'] = Session::get('user_id');
        $res = $model->where($where)->save($data_post);
        if($res){
            return success($res);
        }else{
            return failMsg('修改失败');
        }
    }


}