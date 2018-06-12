<?php
/**
 * 医生端
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 10:00
 */

namespace app\index\controller;

use app\index\model\Account;
use app\index\model\User;
use app\index\model\UserPatient;
use app\index\model\Visit;
use think\Config;
use \think\Db;
use think\Request;
use \think\Controller;
use \think\Response\json;
use app\index\model\Visit as visitModel;//问诊模型
use app\index\model\VisitLine;//问诊详情
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
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $where['code']  = $_SERVER['HTTP_CODE'];


        $model = new doctorModel;
        $doctor =$model->where($where)->select();
        if ($doctor) {
            foreach ($doctor as $k => $v) {
                $doctor[$k]['head_img'] = geturl($v['head_img']);
                $doctor[$k]['head_img'] = str_replace("\\", "/", $doctor[$k]['head_img']);

                //总计多少个回答
                $visit = new Visit();
                $ww['doctor_code'] = $v['code'];
                $doctor[$k]['count'] = $visit->where($ww)->count();
                //平均响应多少分钟
                //SELECT TIMESTAMPDIFF(MINUTE,REPLY_DT,INQUIRY_DT) from me_visit
                $sql = "SELECT TIMESTAMPDIFF(MINUTE,INQUIRY_DT,REPLY_DT) as minute from me_visit where doctor_code = " . $v['code'];
                $res = Db::query($sql);
                if ($res) {
                    $sum = 0;
                    foreach ($res as $vv) {
                        $sum += $vv['minute'];
                    }

                    $doctor[$k]['minute'] = $sum / $doctor[$k]['count'];
                } else {
                    $doctor[$k]['minute'] = 0;
                }
            }

            return success($doctor);
        } else {
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
        $doctor_code = $_SERVER['HTTP_CODE'];
        if(!$doctor_code){
            return failLogin("您还未登录");
        }

        $model = new visitModel();
        $where['me_visit.status'] = input('status');
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
        $res = $model->field('me_visit.*,me_user.id as user_id,me_user_patient.name,me_user_patient.phone,me_user_patient.age')
            ->join('me_user','me_user.code = me_visit.user_code')
            ->join('me_user_patient','me_user.id = me_user_patient.user_id')
            ->where($where)
            ->order('create_time desc')
            ->select();

        if ($res) {
            return success($res);
        } else {
            return emptyResult();
        }


    }

    /**
     * 查看某个问题的详情
     */
    public function detail(){
        //检查是否已登录
        $doctor_code = $_SERVER['HTTP_CODE'];
        if(!$doctor_code){
            return failLogin("您还未登录");
        }

        //判断是否有权限操作


        $id = input('id');
        $user_code = input('user_code');

        //验证字段
        $result = $this->validate(
            [
                'id'  => input('id'),
            ],
            [
                'id'  => 'require',

            ],
            [
                'id.require'  =>  '问题id必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }
        //及查看问诊人信息
        $user = new User();
        $res1 = $user->field('me_user_patient.*,me_user.id')
            ->join('me_user_patient','me_user.id=me_user_patient.user_id')
            ->where(['code'=>$user_code])->select();

        //查看最新一条问题内容
        $where['visit_id'] = $id;
        $visit = new VisitLine();
        $res = $visit->where($where)->order('create_time desc')->limit(0,1)->select();
        //查看问题附件
        if($res){
            foreach ($res as $k=>$value){
                if($value['img']!=null){
                    $ids = explode(',',$value['img']);
                    $res[$k]['pics'] = '';
                    $res[$k]['vids'] = '';
                    foreach ($ids as $k1=>$v1){

                        if(isImage(geturl($v1))){
                            $res[$k]['pics'] .= geturl($v1).',';
                        }else{
                            $res[$k]['vids'] .= geturl($v1).',';
                        }


                    }

                    if($res[$k]['pics']){
                        $res[$k]['pics'] = substr($res[$k]['pics'],0,-1);
                        $res[$k]['pics'] = str_replace('\\','/',explode(',',$res[$k]['pics']));
                    }

                    if($res[$k]['vids']){
                        $res[$k]['vids'] = substr($res[$k]['vids'],0,-1);
                        $res[$k]['vids'] = str_replace('\\','/',explode(',',$res[$k]['vids']));

                    }

                }

            }
        }
        $data['user'] = $res1;
        $data['list'] = $res;

        //查看状态和支付金额
        $v = new Visit();
        $data['other'] = $v->field('status,origianl_price,actual_pay')->find($id);

        if($res){
            return success($data);
        }else{
            return emptyResult();
        }




    }

    /**
     * 查看某个问题的详情列表
     */
    public function detailList(){
        //检查是否已登录
        $doctor_code = $_SERVER['HTTP_CODE'];
        if(!$doctor_code){
            return failLogin("您还未登录");
        }
        //判断是否有权限操作

        $id = input('id');

        //验证字段
        $result = $this->validate(
            [
                'id'  => input('id'),
            ],
            [
                'id'  => 'require',

            ],
            [
                'id.require'  =>  '问题id必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        $where['visit_id'] = $id;
        $visit = new VisitLine();
        $res = $visit->where($where)->order('create_time')->select();
        if($res){
            foreach ($res as $k=>$value){
                if($value['img']!=null){
                    $ids = explode(',',$value['img']);
                    $res[$k]['pics'] = '';
                    $res[$k]['vids'] = '';
                    foreach ($ids as $k1=>$v1){
                        if(isImage(geturl($v1))){
                            $res[$k]['pics'] .= geturl($v1).',';
                        }else{
                            $res[$k]['vids'] .= geturl($v1).',';
                        }


                    }
                    if($res[$k]['pics']){
                        $res[$k]['pics'] = substr($res[$k]['pics'],0,-1);
                        $res[$k]['pics'] = str_replace('\\','/',explode(',',$res[$k]['pics']));
                    }

                    if($res[$k]['vids']){
                        $res[$k]['vids'] = substr($res[$k]['vids'],0,-1);
                        $res[$k]['vids'] = str_replace('\\','/',explode(',',$res[$k]['vids']));

                    }


                }

            }
        }

        if($res){
            return success($res);
        }else{
            return emptyResult();
        }




    }



    /**
     * 回复问题
     */
    public function answer(){
        //检查是否已登录
        $doctor_code = $_SERVER['HTTP_CODE'];
        if(!$doctor_code){
            return failLogin("您还未登录");
        }
        //判断是否有权限操作


        //问诊id  visit_id
        $id = input('visit_id');
        $model = new VisitLine();
        $data['content'] = input('content');
        $data['doctor_code'] = $doctor_code;
        $data['visit_id'] = $id;
        $data['img'] = input('img');

        //验证字段
        $result = $this->validate(
            [
                'visit_id' => $data['visit_id'],
                'content' => $data['content']

            ],
            [
                'visit_id'=>'require',
                'content' => 'require'

            ],
            [
                'visit_id.require' =>'问诊id必须',
                'content.require' =>'内容必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        Db::startTrans();
        try {
            $re = $model->save($data);
            if (!$re) return failMsg('操作失败');

            //修改问诊表里面的状态及最后一次回复时间
            $visit = new Visit();
            $v = $visit->save(['status' => 'A', 'reply_dt_last' => date("Y-m-d H:i:s")], ['id' => $id]);
            if (!$v) return failMsg('操作失败');

            Db::commit();

            return success();
        } catch (\Exception $e) {
            Db::rollback();
            return failMsg($e->getMessage());
        }



    }

    /**
     * 关闭问题
     */
    public function  close(){
        //检查是否已登录
        $doctor_code = $_SERVER['HTTP_CODE'];
        if(!$doctor_code){
            return failLogin("您还未登录");
        }

        //问诊id  visit_id
        $id = input('visit_id');
        $model = new Visit();
        $re = $model->save(['status'=>'C','close_dt'=>date('Y-m-d H:i:s')],['id'=>$id]);

        if ($re) {
            return success();
        } else {
            return failMsg('操作失败');
        }

    }
    /**
     * 收入统计
     */
    public function income()
    {
        //获取余额
        $doctor_code = $_SERVER['HTTP_CODE'];
        //检查是否已登录

        if(!$doctor_code){
            return failLogin("您还未登录");
        }
        $where['type'] = 'DT';
        $where['code'] = $doctor_code;
        $model = new accountModel();
        $sum = $model->where($where)->sum('amount');
        if ($sum) {
            $re['amount'] = number_format($sum,2);
            return success($re);
        } else {
            $re['amount'] = '0.00';
            return success($re);
        }


    }

    /**
     * 收入明细
     */
    public function incomeList()
    {
        $doctor_code = $_SERVER['HTTP_CODE'];
        //检查是否已登录

        if(!$doctor_code){
            return failLogin("您还未登录");
        }
        $where['type'] = 'DT';
        $where['code'] = $doctor_code;
        $model = new accountModel();
        $re = $model->field('id,order_code,amount,create_time')->where($where)->order('create_time desc')->select();
        if ($re) {
            return success($re);
        } else {
            $re=[];
            return success($re);
        }


    }

    /**
     * 提现申请
     */
    public function withdraw()
    {
        $doctor_code = $_SERVER['HTTP_CODE'];
        //检查是否已登录

        if(!$doctor_code){
            return failLogin("您还未登录");
        }
        //查看该用户是否存在
        $user = new User();
        $user_id = $_SERVER['HTTP_USER_ID'];
        $u = $user->field('open_id_dt')->find($user_id);
        if(!$u) return failMsg('您还不是本平台用户');

        $model = new paymentLineModel();
        $data['open_id'] = $u['open_id_dt'];
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
        //检查该用户是否有可提现余额
        $account = new Account();
        $amount = $account->where(['code'=>$doctor_code,'type'=>'DT'])->sum('amount');
        if($amount<=0) return failMsg('余额不足，无法提现');

        //检查申请金额是否在可申请余额范围之类
        if($data['amount']>$amount) return failMsg('申请金额不在可申请余额范围之类，请重新填写金额');

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
        $user_id = $_SERVER['HTTP_USER_ID'];;
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }
        $where['doctor_code'] = $_SERVER['HTTP_CODE'];
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
        $user_id = $_SERVER['HTTP_USER_ID'];;
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $model = new doctorModel();
        $where['code'] = $_SERVER['HTTP_CODE'];
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
        $user_id = $_SERVER['HTTP_USER_ID'];;
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
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }
        $doctor_code = $_SERVER['HTTP_CODE'];

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

    /**
     * 查看服务定价
     */
    public function  seePrice(){
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }
        $doctor_code = $_SERVER['HTTP_CODE'];

        $model = new doctorModel();
        $res = $model ->field('original_price')->where(['code'=>$doctor_code])->find()->toArray();
        if($res){
            return success($res);
        }else{
            return failMsg('获取失败');
        }


    }




}