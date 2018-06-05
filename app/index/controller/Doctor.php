<?php
/**
 * 医生
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 9:55
 */

namespace app\index\controller;
use app\index\model\Visit;
use app\index\model\VisitLine;
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

        $page = input('page','1');
        $pagesize = input('pagesize','5');


        $doctor =  $model->field('id,name,head_img,title,hospital_code,department_code,original_price')->limit(($page-1)*$pagesize,$pagesize)->order('create_time desc') ->select();

        if($doctor){
            foreach ($doctor as $k=>$v){
                $doctor[$k]['head_img'] = geturl($v['head_img']);
            }

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
        //验证字段
        $result = $this->validate(
            [
                'id'  => input('id'),
            ],
            [
                'id'  => 'require',
            ],
            [
                'id.require'  =>  '医生编号必须',
            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        $doctor =  $model->where($where)->select();
        if($doctor){
            foreach ($doctor as $k=>$v){
                $doctor[$k]['head_img'] = geturl($v['head_img']);
            }
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
        /*$file = request()->file('file');// 获取表单提交过来的文件
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
        $post_data['url'] = str_replace('\\', '/', $info->getPathname());//GetPathName返回文件路径(盘符+路径+文件名)*/

        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $data['user_code'] = Session::get('user_code');
        $data['doctor_code'] = input('doctor_code');
        $data['origianl_price'] = input('origianl_price');
        $data['actual_pay'] = input('actual_pay');
        $post_data['content']  = input('content');


        //验证字段
        $result = $this->validate(
            [
                'doctor_code'  => $data['doctor_code'],
                'origianl_price' => $data['origianl_price'],
                'content' => $post_data['content']

            ],
            [
                'doctor_code'  => 'require',
                'origianl_price'=>'require',
                'content' => 'require'

            ],
            [
                'doctor_code.require'  =>  '医生编号必须',
                'origianl_price.require' =>'价格必须',
                'content.require' =>'内容必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        //向问诊表插入数据
        $visit = new Visit();

        //检查是否存在
        $where['user_code'] = $data['user_code'];
        $where['doctor_code'] = $data['doctor_code'];
        $info = $visit->field('id')->where($where)->find();

        if($info['id']){
            $visit_id = $info['id'];
            $re = $visit->save($data,['id'=>$info['id']]);

        }else{

            $re = $visit->save($data);
            $visit_id = $visit->getLastInsID();
        }


        if(!$re) return failMsg('操作失败');


        //向问诊明细表插入数据
        $post_data['visit_id'] = $visit_id;
        $post_data['user_code'] = $data['user_code'];

        $visit_line = new VisitLine();
        $re_line = $visit_line->save($post_data);
        if(!$re_line) return failMsg('操作失败');

        //向附件表插入图片或视频


        //首次提问  向账户表插入一条收入记录


        return success();




    }

    /**
     * 查看提问列表
     */
    public function questions()
    {

        $where['doctor_code']= input('doctor_code');
        //验证字段
        $result = $this->validate(
            [
                'doctor_code'  => input('doctor_code'),
            ],
            [
                'doctor_code'  => 'require',

            ],
            [
                'doctor_code.require'  =>  '医生编号必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }
        //查询visit_id
        $model = new Visit();
        $arr = $model->field('id')->where($where)->select();
        if(!$arr) return emptyResult();
        $res = json_decode(json_encode($arr),true);
        $ids='';
        foreach ($res as $v){
            $ids .= $v['id'].',';
        }
        $ids = substr($ids,0,strlen($ids)-1);

       //表示用户提问  医生编号为空，用户编号不为空

        $where1="visit_id in($ids) and doctor_code = ''";

        $line = Db::name('visit_line')->field('id,content')->where($where1)->order('create_time')->group('user_code')->select();
        if($line){
            return success($line);
        }else{
            return emptyResult();
        }

    }

    /**
     * 查看某个问题的详情
     */
    public function questionDetail(){


    }

}