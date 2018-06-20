<?php
/**
 * 医生
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 9:55
 */

namespace app\index\controller;

use app\index\model\Account;
use app\index\model\Favorite;
use app\index\model\UserPatient;
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
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if (!$user_id) {
            return failLogin("您还未登录");
        }

        //实例化医生模型
        $model = new doctorModel();

        $page = input('page', '1');
        $pagesize = input('pagesize', '5');


        $doctor = $model->field('me_doctor.*,me_hospital.name as hospital,me_department.name as department')
            ->join('me_hospital','me_hospital.id=me_doctor.hospital_code','left')
            ->join('me_department','me_department.id=me_doctor.department_code','left')
            ->limit(($page - 1) * $pagesize, $pagesize)
            ->order('create_time desc')
            ->select();


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
                $sql = "SELECT TIMESTAMPDIFF(MINUTE,INQUIRY_DT,REPLY_DT) as minute from me_visit where doctor_code = '" . $v['code']."'";
                $res = Db::query($sql);
                if ($res) {
                    $sum = 0;
                    foreach ($res as $vv) {
                        $sum += $vv['minute'];
                    }

                    $doctor[$k]['minute'] = intval($sum / $doctor[$k]['count']);
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
     * 医生详情
     */
    public function detail()
    {
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if (!$user_id) {
            return failLogin("您还未登录");
        }

        //实例化医生模型
        $model = new doctorModel();
        $where['me_doctor.id'] = input('id');
        //验证字段
        $result = $this->validate(
            [
                'id' => input('id'),
            ],
            [
                'id' => 'require',
            ],
            [
                'id.require' => '医生id必须',
            ]
        );

        if (true !== $result) {
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        $doctor = $model->field('me_doctor.*,me_hospital.name as hospital,me_department.name as department')
            ->join('me_hospital','me_hospital.id=me_doctor.hospital_code','left')
            ->join('me_department','me_department.id=me_doctor.department_code','left')
            ->where($where)->select();
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
                $sql = "SELECT TIMESTAMPDIFF(MINUTE,INQUIRY_DT,REPLY_DT) as minute from me_visit where doctor_code = '" . $v['code']."'";
                $res = Db::query($sql);
                if ($res) {
                    $sum = 0;
                    foreach ($res as $vv) {
                        $sum += $vv['minute'];
                    }

                    $doctor[$k]['minute'] = intval($sum / $doctor[$k]['count']);
                } else {
                    $doctor[$k]['minute'] = 0;
                }


                //查询该医生是否被关注
                $user_code = $_SERVER['HTTP_CODE'];
                $favorite = new Favorite();
                $f = $favorite->where(['user_code' => $user_code, 'follow_code' => $v['code']])->find();
                if ($f) {
                    $doctor[$k]['is_collect'] = 1;
                } else {
                    $doctor[$k]['is_collect'] = 0;
                }
                //查询用户是否填写详细信息
                $cond['user_id']= $user_id;
                $user_patient = new UserPatient();
                $r = $user_patient->where($cond)->find();
                if($r){
                    $doctor[$k]['is_detail'] =1;
                }else{
                    $doctor[$k]['is_detail'] =0;
                }


            }

            return success($doctor);
        } else {
            return emptyResult();
        }

    }

    /**
     * 获取医生对应的医院信息
     */
    public function hospital(){
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if (!$user_id) {
            return failLogin("您还未登录");
        }

        //实例化医生模型
        $where['me_doctor.id'] = input('id');
        //验证字段
        $result = $this->validate(
            [
                'id' => input('id'),
            ],
            [
                'id' => 'require',
            ],
            [
                'id.require' => '医生id必须',
            ]
        );

        if (true !== $result) {
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        //根据医生id获取医院详情
        $res = Db::name('doctor')->field('me_hospital.*')
            ->join('me_hospital','me_hospital.id=me_doctor.hospital_code','left')
            ->where($where)
            ->select();


        if($res){
            return success($res);
        }else{
            return emptyResult();
        }



    }

    /**
     * 提问
     */
    public function putQuestions()
    {
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if (!$user_id) {
            return failLogin("您还未登录");
        }

        $data['user_code'] = $_SERVER['HTTP_CODE'];
        $data['doctor_code'] = input('doctor_code');
        $data['origianl_price'] = input('origianl_price');
        $data['actual_pay'] = input('actual_pay','0.00');
        $data['inquiry_dt_last'] = date('Y-m-d H:i:s');
        $post_data['content'] = input('content');


        //验证字段
        $result = $this->validate(
            [
                'doctor_code' => $data['doctor_code'],
                'origianl_price' => $data['origianl_price'],
                'content' => $post_data['content']

            ],
            [
                'doctor_code' => 'require',
                'origianl_price' => 'require',
                'content' => 'require'

            ],
            [
                'doctor_code.require' => '医生编号必须',
                'origianl_price.require' => '价格必须',
                'content.require' => '内容必须'

            ]
        );

        if (true !== $result) {
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        Db::startTrans();
        try {
            //向问诊表插入数据
            $visit = new Visit();

            //检查是否存在
            $where['user_code'] = $data['user_code'];
            $where['doctor_code'] = $data['doctor_code'];

            $re = $visit->save($data);
            $visit_id = $visit->getLastInsID();
            if (!$re) return failMsg('操作失败');


            //向问诊明细表插入数据
            $post_data['visit_id'] = $visit_id;
            $post_data['user_code'] = $data['user_code'];
            $post_data['img'] = input('img');

            $visit_line = new VisitLine();
            $re_line = $visit_line->save($post_data);
            if (!$re_line) return failMsg('操作失败');

            //首次提问  向账户表插入一条收入记录
            $account = new Account();
            $post_account['code']= $data['doctor_code'];
            $post_account['order_code'] = "o".date('YmdHis').rand(100,999);
            $post_account['amount'] = "+".$data['origianl_price'];
            $a = $account->save($post_account);
            if(!$a) return failMsg('操作失败');

            Db::commit();

            return success();
        } catch (\Exception $e) {
            Db::rollback();
            return failMsg($e->getMessage());
        }


    }

    /**
     * 追加问题
     */
    public function append()
    {
        //检查是否已登录
        $user_code = $_SERVER['HTTP_CODE'];
        if (!$user_code) {
            return failLogin("您还未登录");
        }
        //判断是否有权限操作


        //问诊id  visit_id
        $id = input('visit_id');
        $model = new VisitLine();
        $data['content'] = input('content');
        $data['user_code'] = $user_code;
        $data['visit_id'] = $id;
        $data['img'] = input('img');

        //验证字段
        $result = $this->validate(
            [
                'user_code' => $data['user_code'],
                'visit_id' => $data['visit_id']


            ],
            [
                'user_code' => 'require',
                'visit_id' => 'require',

            ],
            [
                'user_code.require' => '用户编号必须',
                'visit_id.require' => '问诊id必须',

            ]
        );

        if (true !== $result) {
            // 验证失败 输出错误信息
            return failMsg($result);
        }
        Db::startTrans();
        try {
            $re = $model->save($data);

            if (!$re) return failMsg('操作失败');

            //修改问诊表里面的状态及最后一次提问时间
            $visit = new Visit();
            $v = $visit->save(['status' => 'P', 'inquiry_dt_last' => date("Y-m-d H:i:s")], ['id' => $id]);
            if (!$v) return failMsg('操作失败');

            Db::commit();

            return success();
        } catch (\Exception $e) {
            Db::rollback();
            return failMsg($e->getMessage());
        }




    }


    /**
     * 图片上传方法
     * @return [type] [description]
     */
    public function upload($module = 'index', $use = 'index_questions')
    {

        //检查是否已登录
        $user_id = $_SERVER['HTTP_USER_ID'];
        if (!$user_id) {
            return failLogin("您还未登录");
        }

        if ($this->request->file('file')) {
            $file = $this->request->file('file');
        } else {
            $res['code'] = 1;
            $res['msg'] = '没有上传文件';
            return json($res);
        }
        $module = $this->request->has('module') ? $this->request->param('module') : $module;//模块
        $web_config = Db::name('webconfig')->where('web', 'web')->find();
        $info = $file->validate(['size' => $web_config['file_size'] * 1024, 'ext' => $web_config['file_type']])->rule('date')->move(ROOT_PATH . 'public' . DS . 'uploads' . DS . $module . DS . $use);
        if ($info) {
            //写入到附件表
            $data = [];
            $data['module'] = $module;
            $data['filename'] = $info->getFilename();//文件名
            $data['filepath'] = DS . 'uploads' . DS . $module . DS . $use . DS . $info->getSaveName();//文件路径
            $data['fileext'] = $info->getExtension();//文件后缀
            $data['filesize'] = $info->getSize();//文件大小
            $data['create_time'] = time();//时间
            $data['uploadip'] = $this->request->ip();//IP
            $data['user_id'] = $user_id;
            if ($data['module'] = 'index') {
                //通过后台上传的文件直接审核通过
                $data['status'] = 1;
                $data['admin_id'] = $data['user_id'];
                $data['audit_time'] = time();
            }
            $data['use'] = $this->request->has('use') ? $this->request->param('use') : $use;//用处
            $res['id'] = Db::name('attachment')->insertGetId($data);
            $res['src'] = str_replace('\\', '/', DS . 'uploads' . DS . $module . DS . $use . DS . $info->getSaveName());

            return success($res);
        } else {
            // 上传失败获取错误信息
            return failMsg('上传失败'.$file->getError());
            //return $this->error('上传失败：'.$file->getError());
        }
    }


    /**
     * 查看提问列表
     */
    public function questions()
    {

        $where['doctor_code'] = input('doctor_code');
        //验证字段
        $result = $this->validate(
            [
                'doctor_code' => input('doctor_code'),
            ],
            [
                'doctor_code' => 'require',

            ],
            [
                'doctor_code.require' => '医生编号必须'

            ]
        );

        if (true !== $result) {
            // 验证失败 输出错误信息
            return failMsg($result);
        }
        //查询visit_id
        $model = new Visit();
        $arr = $model->field('id')->where($where)->select();
        if (!$arr) return emptyResult();
        $res = json_decode(json_encode($arr), true);
        $ids = '';
        foreach ($res as $v) {
            $ids .= $v['id'] . ',';
        }
        $ids = substr($ids, 0, strlen($ids) - 1);

        //表示用户提问  医生编号为空，用户编号不为空

        $where1 = "visit_id in($ids) and doctor_code = ''";

        $line = Db::name('visit_line')
            ->field('id,content,create_time,visit_id,me_user.name')
            ->join('me_user','me_user.code=me_visit_line.user_code','left')
            ->where($where1)
            ->order('create_time')
            ->group('visit_id')
            ->select();


        foreach ($line as $k2=>$v2){
            $line[$k2]['create_time'] = date("Y-m-d H:i:s",$v2['create_time']);
        }
        if ($line) {
            return success($line);
        } else {
            return emptyResult();
        }

    }

    /**
     * 查看某个问题的详情
     */
    public function questionDetail()
    {
        //问题id
        $id = input('id');
        //验证字段
        $result = $this->validate(
            [
                'id' => input('id'),
            ],
            [
                'id' => 'require',

            ],
            [
                'id.require' => '问题id必须'

            ]
        );

        if (true !== $result) {
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        $where['visit_id'] = $id;
        $visit = new VisitLine();
        $res = $visit->where($where)->order('create_time')->select();

        if ($res) {
            return success($res);
        } else {
            return emptyResult();
        }
    }

}