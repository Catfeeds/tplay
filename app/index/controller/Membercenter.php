<?php
/**
 * 用户个人中心
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/5/24 0024
 * Time: 上午 10:18
 */

namespace app\index\controller;
use app\index\model\Feedback;
use \think\Controller;
use app\index\model\UserPatient as userPatientModel;//问诊人信息模型
use app\index\model\Favorite as favoriteModel;//收藏模型
use app\index\model\Visit as visitModel;//问诊模型
use app\index\model\VisitLine;
use app\index\model\User;
use app\index\model\Doctor;
use \think\db;
use think\Session;

class Membercenter extends Controller
{
    /**
     * 用户中心
     */
    public function index()
    {
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        //获取头像和昵称
        $where['code'] = $_SERVER['HTTP_CODE'];
        $model = new User();
        $res = $model->field('wx_nick_name,wx_head_img_url')->where($where)->find()->toArray();

        if($res){
            return success($res);
        }else{
            return failMsg('获取失败');
        }

    }

    /**
     * 我的问诊记录
     */
    public function inquisition()
    {
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $model = new visitModel();
        $where['me_visit.status']= input('status');
        $where['user_code'] = $_SERVER['HTTP_CODE'];

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
        $res = $model->field('me_visit.*,me_doctor.head_img,me_doctor.name,me_doctor.title,me_doctor.phone')
            ->join('me_doctor','me_doctor.code= me_visit.doctor_code')
            ->where($where)->order('create_time desc')->select();

        if($res){
            foreach ($res as $k => $v) {
                $res[$k]['head_img'] = geturl($v['head_img']);
                $res[$k]['head_img'] = str_replace("\\", "/", $res[$k]['head_img']);
            }
            $re['list'] = $res;
            //统计未回答和已回答的条数
            $re['pedding'] = $model->where(['status'=>'P','user_code'=> $_SERVER['HTTP_CODE']])->count();
            $re['anserwed']= $model->where(['status'=>'A','user_code'=> $_SERVER['HTTP_CODE']])->count();
            $re['closed']= $model->where(['status'=>'C','user_code'=> $_SERVER['HTTP_CODE']])->count();

            return success($re);
        }else{
            return emptyResult();
        }

    }

    /**
     * 问诊详情
     */
    public function inquisitionDetail()
    {
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $where['visit_id'] = input('id');
        //验证字段
        $result = $this->validate(
            [
                'id'  => input('id'),
            ],
            [
                'id'  => 'require',

            ],
            [
                'id.require'  =>  '问诊编号必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        $model = new VisitLine();
        $res = $model->where($where)->order('create_time')->select();
        if($res){
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
        $user_code = $_SERVER['HTTP_CODE'];
        if(!$user_code){
            return failLogin("您还未登录");
        }
        //判断是否有权限操作


        //问诊id  visit_id
        $id = input('visit_id');
        $model = new VisitLine();
        $data['content'] = input('content');
        $data['user_code'] = $user_code;
        $data['visit_id'] = $id;

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

        $re = $model->save($data);
        if ($re){
            return success();
        }else{
            return failMsg('操作失败');
        }



    }


    /**
     * 关注医生
     */
    public function collect(){
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $data['user_code'] = $_SERVER['HTTP_CODE'];
        $data['follow_code'] = input('doctor_code');
        //验证字段
        $result = $this->validate(
            [
                'follow_code'  => $data['follow_code'],
            ],
            [
                'follow_code'  => 'require',

            ],
            [
                'follow_code.require'  =>  '医生编号必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        //查询该编号是否存在
        $doctor = new Doctor();
        $r = $doctor ->where(['code'=>$data['follow_code']])->find();
        if(!$r) return failMsg('被关注的信息不存在');

        $model = new favoriteModel();
        $res = $model->save($data);
        if($res){
            return success($data);
        }else{
            return failMsg('关注失败');
        }

    }

    /**
     * 取消关注
     */
    public function cancelCollect(){
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $data['user_code'] = $_SERVER['HTTP_CODE'];
        $data['follow_code'] = input('doctor_code');
        //验证字段
        $result = $this->validate(
            [
                'follow_code'  => $data['follow_code'],
            ],
            [
                'follow_code'  => 'require',

            ],
            [
                'follow_code.require'  =>  '医生编号必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        //查询该编号是否存在
        $doctor = new Doctor();
        $r = $doctor ->where(['code'=>$data['follow_code']])->find();
        if(!$r) return failMsg('被取消的信息不存在');

        $model = new favoriteModel();
        $w['user_code'] = $data['user_code'];
        $w['follow_code'] = $data['follow_code'];
        $res = $model->where($w)->delete();
        if($res){
            return success();
        }else{
            return failMsg('取消失败');
        }

    }


    /**
     * 我关注的医生
     */
    public function collection()
    {
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id||!$_SERVER['HTTP_CODE']){
            return failLogin("您还未登录");
        }

        $where['user_code'] = $_SERVER['HTTP_CODE'];
        $model = new favoriteModel();

        $doctor = $model->field('me_doctor.id,code,me_doctor.name,head_img,title,hospital_code,department_code,original_price,tag,me_hospital.name as hospital,me_department.name as department')
            ->join('me_doctor','me_doctor.code=me_favorite.follow_code')
            ->join('me_hospital','me_hospital.id=me_doctor.hospital_code','left')
            ->join('me_department','me_department.id=me_doctor.department_code','left')
            ->where($where)
            ->select();
        if($doctor){
            foreach ($doctor as $k=>$v){
                $doctor[$k]['head_img'] = geturl($v['head_img']);
                $doctor[$k]['head_img'] = str_replace("\\","/",$doctor[$k]['head_img']);

                //总计多少个回答
                $visit = new visitModel();
                $ww['doctor_code']= $v['code'];
                $doctor[$k]['count']=$visit->where($ww)->count();

                //平均响应多少分钟
                //SELECT TIMESTAMPDIFF(MINUTE,REPLY_DT,INQUIRY_DT) from me_visit
                $sql = "SELECT TIMESTAMPDIFF(MINUTE,INQUIRY_DT,REPLY_DT) as minute from me_visit where doctor_code = ".$v['code'];
                $res = Db::query($sql);
                if($res){
                    $sum = 0;
                    foreach ($res as $vv){
                        $sum += $vv['minute'];
                    }

                    $doctor[$k]['minute'] = intval($sum/$doctor[$k]['count']);
                }else{
                    $doctor[$k]['minute'] = 0;
                }
            }

            return success($doctor);
        }else{
            return emptyResult();
        }

    }

    /**
     * 意见反馈
     */
    public function feedback()
    {
        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id||!$_SERVER['HTTP_CODE']){
            return failLogin("您还未登录");
        }

        $data['user_code'] = $_SERVER['HTTP_CODE'];

        $data['content'] = input('content');

        $result = $this->validate(
            [
                'content'  => $data['content'],
            ],
            [
                'content'  => 'require',

            ],
            [
                'content.require'  =>  '内容必须'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }
        $model = new Feedback();
        $res = $model ->save($data);
        if($res){
            return success($data);
        }else{
            return failMsg('提交失败');
        }

    }

    /**
     * 个人详细信息
     */
    public function detail()
    {

        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录
        if(!$user_id){
            return failLogin("您还未登录");
        }

        $model = new userPatientModel();

        $where['user_id'] = $user_id;
        $res = $model->where($where)->select();

        if($res){
            return success($res);
        }else{
            $res = [];
            return success($res);
        }

    }
    /**
     * 修改个人信息
     */
    public function editDetail(){

        $user_id = $_SERVER['HTTP_USER_ID'];
        //检查是否已登录

        if(!$user_id){
            return failLogin("您还未登录");
        }
        //检查是否存在
        $model = new userPatientModel();
        $where['user_id'] = $user_id;
        $r = $model->where($where)->find();
        $data_post = $this->request->post();
        $result = $this->validate(
            [
                'name'  => input('name'),
                'phone'  => input('phone'),

            ],
            [
                'name'  => 'require|max:25',
                'phone'  => 'require',
            ],
            [
                'name.require'  =>  '姓名必须'
            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        if($r){
            $res = $model->save($data_post,['user_id'=>$user_id]);
        }else{
            $data_post['user_id'] = $user_id;
            $res = $model->save($data_post);
        }



        if($res){
            return success($data_post);
        }else{
            return failMsg('修改失败');
        }
    }


}