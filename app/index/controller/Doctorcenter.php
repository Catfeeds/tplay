<?php
/**
 * 医生端
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 10:00
 */

namespace app\index\controller;

use think\Config;
use \think\Db;
use think\Request;
use \think\Controller;
use \think\Response\json;
use app\index\model\Visit as visitModel;//问诊模型
use think\Session;
use app\index\model\WxPaymentLine as paymentLineModel;//付款队列
use app\index\model\Account as accountModel;//账户模型
use app\index\model\Doctor as doctorModel;

class Doctorcenter extends Controller
{
    /**
     * 个人主页 医生的个人主页 详细信息
     */
    public function index()
    {
        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $where['code']  = Session::get('doctor_code');


        $model = new doctorModel;
        $res =$model->field('name,head_img,title,job_period,info,auth_type,hospital_code,department_code')->where($where)->select();
        if($res){
            return success($res);
        }else{
            return emptyResult();
        }


    }


    /**
     * @api               {get} /index/doctorcenter/quisition 接诊入口问题列表
     * @apiName           questionList
     * @apiGroup          DoctorCenter
     *
     * @apiParam {String} token       登录token
     * @apiParam {String} sign        签名sign
     *
     * @apiParam {Number} page
     * @apiParam {Number} limit
     *
     * @apiParam {String} status  状态  P：待回答，A：已回答，C：已结束
     *
     * @apiSuccess {String} status    操作成功，值恒为 0
     * @apiSuccess {Object} msg           响应消息
     * @apiSuccess {Object[]} data    数据列表
     * @apiSuccess {int} data.        问题ID
     * @apiSuccess {String} data.USER_CODE   用户编号
     *
     * @apiError (emptResult) {String} status    固定为：000
     * @apiError (emptResult) {String} msg       "空数据"
     *
     * @apiError          status    值为："FAIL0" 等
     * @apiError          msg       失败消息
     *
     */
    public function quisition()
    {

        //检查是否已登录
        $doctor_code = Session::get('doctor_code');
        if(!$doctor_code){
            return failLogin("您还未登录");
        }


        $model = new visitModel();
        $where['status'] = input('status');
        $where['doctor_code'] = $doctor_code;
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

        if ($res) {
            return success($res);
        } else {
            return emptyResult();
        }


    }

    /**
     * 查看某个问题的详情
     */
    public function questionDetail(){


    }

    /**
     * 回复问题
     */
    public function answer(){

    }

    /**
     * 收入统计
     */
    public function income()
    {
        //获取余额
        $doctor_code = Session::get('doctor_code');
        //检查是否已登录

        if(!$doctor_code){
            return failLogin("您还未登录");
        }
        $where['type'] = 'DT';
        $where['code'] = $doctor_code;
        $model = new accountModel();
        $re = $model->where($where)->sum('amount');
        if ($re) {
            return success($re);
        } else {
            return failMsg('查询失败');
        }


    }

    /**
     * 收入明细
     */
    public function incomeList()
    {
        $doctor_code = Session::get('doctor_code');
        //检查是否已登录

        if(!$doctor_code){
            return failLogin("您还未登录");
        }
        $where['type'] = 'DT';
        $where['code'] = $doctor_code;
        $model = new accountModel();
        $re = $model->field('id,order_code,amount,create_time')->where($where)->select();
        if ($re) {
            return success($re);
        } else {
            return failMsg('查询失败');
        }


    }

    /**
     * 提现申请
     */
    public function withdraw()
    {
        $doctor_code = Session::get('doctor_code');
        //检查是否已登录

        if(!$doctor_code){
            return failLogin("您还未登录");
        }

        $model = new paymentLineModel();
        $data['open_id'] = Session::get('openid');
        $data['doctor_code'] = $doctor_code;
        $data['name'] = input('name');//姓名
        $data['card_no'] = input('card_no');
        $data['opening_bank'] = input('opening_bank');
        $data['amount'] = input('amount');

        //验证字段
        $result = $this->validate(
            [
                'name'  => input('name'),
                'card_no'  => input('card_no'),
                'opening_bank'  => input('opening_bank'),
                'amount'  => input('amount'),
            ],
            [
                'name'  => 'require',
                'card_no'  => 'require',
                'opening_bank'  => 'require',
                'amount'  => 'require',

            ],
            [
                'name.require'  =>  '姓名必须',
                'card_no.require'  =>  '卡号必须',
                'opening_bank.require'  =>  '开户行必须',
                'amount.require'  =>  '金额必须',


            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        $res = $model->save($data);
        if ($res) {
            return success($data);
        } else {
            return failMsg('申请失败');
        }

    }

    /**
     * 提现记录
     */

    public function  withdrawList(){
        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }
        $where['doctor_code'] = Session::get('doctor_code');
        $model = new paymentLineModel();
        $res = $model->where($where)->select();
        if ($res) {
            return success($res);
        } else {
            return emptyResult();
        }


    }

    /**
     * 二维码管理
     */
    public function code()
    {
        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $model = new doctorModel();
        $where['code'] = Session::get('doctor_code');
        $res = $model->field('aq_path,aq_path_dt,aq_path_url,gzh_qr_path')->where($where)->find()->toArray();

        if ($res) {
            return success($res);
        } else {
            return failMsg('查询失败');
        }

    }

    /**
     *生成二维码
     */

    public function createCode()
    {
        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $post_data['page'] = input('page');
        $post_data['width'] = input('width');
        //验证字段
        $result = $this->validate(
            [
                'page'  => input('page'),

            ],
            [
                'page'  => 'require',

            ],
            [
                'page.require'  =>  '医生个人主页地址必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }
        $re = get_wxa_code($post_data);
        //保存地址
        $imgDir = Config::get('upload_url');


        //要生成的图片名字

        $filename = date("Ym")."/".md5(time().mt_rand(10, 99)).".jpg"; //新图片名称

        $newFilePath = $imgDir.$filename;
        if (!file_exists(date("Ym"))){
            mkdir(date("Ym"));
        }

        $newFile = fopen(ROOT_PATH.'public/'.$newFilePath,"w"); //打开文件准备写入

        fwrite($newFile,$re); //写入二进制流到文件

        fclose($newFile); //关闭文件

        if ($re) {
            //把图片路径写入数据库
            $model = new doctorModel();
            $data['aq_path'] = $newFilePath;
            $data['aq_path_dt'] = date("Y-m-d H:i:s");
            $data['aq_path_url'] = $post_data['page'];
            $model->save($data,['user_id'=>$user_id]);
            return  json( ['status' => '200', 'msg' => 'ok', 'data' => $data] );
        } else {
            return failMsg('生成失败');
        }

    }

    /**
     * 服务定价
     */
    public function  setPrice(){
        $user_id = Session::get('user_id');
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }
        $doctor_code = Session::get('doctor_code');

        $post_data['original_price'] =input('price');
        $result = $this->validate(
            [
                'price'  => $post_data['original_price'],
            ],
            [
                'price'  => 'require',

            ],
            [
                'price.require'  =>  '价格必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        $model = new doctorModel();
        $res = $model ->save($post_data,['code'=>$doctor_code]);
        if($res){
            return success($post_data);
        }else{
            return failMsg('设置失败');
        }



    }




}