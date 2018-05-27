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
use app\index\model\Visit as visitModel;
use think\Session;//问诊模型

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
        $where['STATUS']= input('status');
        //$where['DOCTOR_CODE'] = $doctor_code;
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


    }

    /**
     * 收入明细
     */
    public function incomeList()
    {

    }

    /**
     * 提现申请
     */
    public function withdraw()
    {

    }

    /**
     * 二维码管理
     */
    public function code()
    {

    }

}