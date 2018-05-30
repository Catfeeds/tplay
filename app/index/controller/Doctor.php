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
use think\File;
use think\Session;

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


        $doctor =  $model->field('id,name,head_img,title,hospital_code,department_code,original_price')->order('create_time desc') ->select();

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
        $file = request()->file('file');// 获取表单提交过来的文件
        $error = $_FILES['file']['error']; // 如果$_FILES['file']['error']>0,表示文件上传失败
        if($error){
            return failMsg('文件上传失败');
        }
        //上传的时候的原文件名
        $filename = $file -> getInfo()['name'];
        $dir = config('upload_path');// 自定义文件上传路径
        if (!is_dir($dir)) {
            mkdir($dir,0777,true);
        }
        $info = $file->move($dir);// 将文件上传指定目录
        //获取文件的全路径
        $post_data['url'] = str_replace('\\', '/', $info->getPathname());//GetPathName返回文件路径(盘符+路径+文件名)


        //向问诊表插入数据
        $data['user_code'] = Session::get('user_code');
        $data['doctor_code'] = input('doctor_code');
        $data['origianl_price'] = input('origianl_price');
        $data['actual_pay'] = input('actual_pay');

        //向问诊明细表插入数据
        $post_data['visit_id'] = '';
        $post_data['content']  = input('content');
        $data['user_code'] = Session::get('user_code');
        $data['doctor_code'] = input('doctor_code');

        //向附件表插入图片或视频







    }

    /**
     * 查看提问
     */
    public function questions()
    {
        $where['doctor_code'] = input('doctor_code');
        $line = Db::name('visit_line')->field('content')->where($where)->select();
        if($line){
            return success($line);
        }else{
            return emptyResult();
        }

    }


}