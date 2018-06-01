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

        $doctor_code  = input('doctor_code');
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

        $model = new doctorModel;
        $model->select();



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
        //var_dump(Db::name('visit')->select());
        //检查参数

        //检查是否已登录
        /*$doctor_code = Session::get('doctor_code');
        if(!$doctor_code){
            return failLogin("您还未登录");
        }*/
        $post = $this->request->param();
        $model = new visitModel();
        $where['status'] = input('status');
        //$where['doctor_code'] = $doctor_code;
        $res = $model->where($where)->order('create_time desc')->select();

        if ($res) {
            return success($res);
        } else {
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
        /*
        if(!$doctor_code){
            return failLogin("您还未登录");
        }*/
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
        if (!$line) return failMsg('你没有权限操作');

        $data['name'] = input('name');//姓名
        $data['card_no'] = input('card_no');
        $data['opening_bank'] = input('opening_bank');
        $data['amount'] = input('amount');

        $res = $model->save($data);
        if ($res) {
            return success($res);
        } else {
            return failMsg('申请失败');
        }

    }

    /**
     * 二维码管理
     */
    public function code()
    {
        $model = new doctorModel();
        $where['code'] = Session::get('code');
        $res = $model->field('aq_path,aq_path_dt,aq_path_url,gzh_qr_path')->where($where)->find();
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

        $key = "c_c83aFnkpnMkrIS2zlyDIdprzpCn1cC0NbRaw7wWlJE";
        //$weburl=$_POST['url'];//网址 例如：http://www.guanguihua.cc
        $id = Session::get('user_id');
        $weburl = Config::get('baseUrl') . "index/doctor/detail/?id=$id";
        $size = input('size');//尺寸大小 单位：px
        $text = input('text');//内容 例如：数字、汉字、字母
        $color = input('color');//前景颜色 例如：ccc或red
        $bgcolor = input('bgcolor');//背景颜色 例如：ccc或red
        /*
        $logo=$_FILES['logo']['tmp_name'];//logo图
        if(move_uploaded_file($logo, "upload/".$_FILES['logo']['name'])){
            $logo=$_SERVER['HTTP_HOST']."upload/".$_FILES['logo']['name'];
        }*/

        $file = request()->file('logo');
        if (empty($file)) {
            return failMsg('请选择上传文件');
        }
        //移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->move(ROOT_PATH . 'public' . DS . 'uploads');
        if (!$info) {
            //上传失败获取错误信息
            return failMsg($file->getError());
        }


        $url = "http://www.2d-code.cn/2dcode/api.php?key=$key";
        if ($weburl) {
            $url .= "&url=$weburl";
        }
        if ($size) {
            $url .= "&size=$size";
        }
        if ($text) {
            $url .= "&text=$text";
        }
        if ($color) {
            $url .= "&color=$color";
        }
        if ($bgcolor) {
            $url .= "&bgcolor=$bgcolor";
        }
        if ($info) {
            $url .= "&logo=$info->getFilename()";
        }
        //echo "<a href='$url'><img src='$url'/></a>";
        if ($url) {
            return success($url);
        } else {
            return failMsg('生成失败');
        }

    }

}