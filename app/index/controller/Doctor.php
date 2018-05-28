<?php
/**
 * 医生
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 9:55
 */

namespace app\index\controller;
use \think\Controller;
use app\index\model\Doctor as doctorModel;//医生模型
use \think\db;

class Doctor extends Controller
{
    /**
     * 医生列表
     */
    public function index()
    {
        //实例化医生模型
        $model = new doctorModel();

        $post = input('page');


        $doctor =  $model->field('name,head_img,title,hospital_code,department_code,original_price')->order('create_time desc') ->select();

        if($doctor){
            return success($doctor);
        }else{
            return emptyResult();
        }
    }

    /**
     * 医生详情
     */
    public function detail()
    {
        //实例化医生模型
        $model = new doctorModel();
        $where['id'] = input('id');
        $doctor =  $model->where($where)->select();

        if($doctor){
            return success($doctor);
        }else{
            return emptyResult();
        }

    }

    /**
     * 提问
     */
    public function putQuestions()
    {

        $post_data['content']  = input('content');
        $post_data['url'] = input('url');


    }

    /**
     * 查看提问
     */
    public function questions()
    {
        $where['doctor_code'] = input('doctor_code');
        $line = Db::name('visit_line')->field('content')->where($where)->select();
        if($line){
            return success($doctor);
        }else{
            return emptyResult();
        }

    }

}