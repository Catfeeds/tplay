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


        $doctor =  $model->order('REGISTER_DT desc') ->select();

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

    }

    /**
     * 提问
     */
    public function putQuestions()
    {

    }

    /**
     * 查看提问
     */
    public function questions()
    {

    }

}