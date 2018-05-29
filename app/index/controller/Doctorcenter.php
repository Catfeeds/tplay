<?php
/**
 * 医生端
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 10:00
 */

namespace app\index\controller;

use \think\Db;
use \think\Controller;
use \think\Response\json;
use app\index\model\Visit as visitModel;//问诊模型
use think\Session;
use app\index\model\PaymentLine as paymentLineModel;//付款队列
use app\index\model\Account as accountModel;//账户模型

class Doctorcenter extends Controller
{
    /**
     * @api               {get} /index/doctorcenter/index 接诊入口问题列表
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
    public function index()
    {
        //var_dump(Db::name('visit')->select());
        //检查参数

        //检查是否已登录
        /*$doctor_code = Session::get('doctor_code');
        if(!$doctor_code){
            return failLogin("您还未登录");
        }*/
        $post = $this->request->param();
        $model = new visitModel();
        $where['status']= input('status');
        //$where['doctor_code'] = $doctor_code;
        $res = $model->where($where)->order('create_time desc')->select();

        if($res){
            return success($res);
        }else{
            return emptyResult();
        }




    }

    /**
     * 收入统计
     */
    public function income()
    {
        //获取余额
        $doctor_code = Session::get('doctor_code');
        //检查是否已登录
        /*
        if(!$doctor_code){
            return failLogin("您还未登录");
        }*/
        $where['type'] = 'DT';
        $where['code'] = $doctor_code;
        $model = new accountModel();
        $re = $model ->where($where)->sum('amount');
        if($re){
            return success($re);
        }else{
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
        /*
        if(!$doctor_code){
            return failLogin("您还未登录");
        }*/
        $where['type'] = 'DT';
        $where['code'] = $doctor_code;
        $model = new accountModel();
        $re = $model->field('id,order_code,amount,create_time')->where($where)->select();
        if($re){
            return success($re);
        }else{
            return failMsg('查询失败');
        }


    }

    /**
     * 提现申请
     */
    public function withdraw()
    {
        $open_id = Session::get('open_id');
        $doctor_code = Session::get('doctor_code');
        //检查是否已登录
        /*
        if(!$doctor_code){
            return failLogin("您还未登录");
        }*/

        //先查询数据是否存在
        $where['open_id'] = $open_id;
        $where['doctor_code'] = $doctor_code;
        $model = new paymentLineModel();
        $line = $model->where($where)->find();
        if(!$line) return failMsg('你没有权限操作');

        $data['name'] = input('name');//姓名
        $data['card_no'] = input('card_no');
        $data['opening_bank'] = input('opening_bank');
        $data['amount'] = input('amount');

        $res = $model->save($data);
        if($res){
            return success($res);
        }else{
            return failMsg('申请失败');
        }

    }

    /**
     * 二维码管理
     */
    public function code()
    {

    }

}