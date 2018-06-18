<?php
/**
 * 问诊管理
 * Created by PhpStorm.
 * User: gh
 * Date: 2018/5/23
 * Time: 21:02
 */

namespace app\admin\controller;

use app\admin\model\User;
use app\admin\model\Doctor;
use app\admin\model\VisitLine;
use \think\Db;
use app\admin\controller\Permissions;
use \think\Cookie;
use \think\Session;
use \think\Cache;
use app\admin\model\Visit;

class Inquisition extends Permissions
{
    public function index()
    {
        //实例化问诊模型
        $model = new Visit();
        $where = [];
        $post = $this->request->param();
        if (isset($post['keywords']) and !empty($post['keywords'])) {
            $where['me_doctor.name'] = ['like', '%' . $post['keywords'] . '%'];
        }

        if(isset($post['create_time']) and !empty($post['create_time'])) {
            $min_time = strtotime($post['create_time']);
            $max_time = $min_time + 24 * 60 * 60;
            $where['create_time'] = [['>=',$min_time],['<=',$max_time]];
        }
        if(isset($post['usercode']) and !empty($post['usercode'])){
            $where['user_code'] = $post['usercode'];
        }
        if(isset($post['doctorcode']) and !empty($post['doctorcode'])){
            $where['doctor_code'] = $post['doctorcode'];
        }

        $inquisition = $model->field('me_visit.id,me_visit.doctor_code,me_visit.user_code,me_visit.status,me_visit.origianl_price,me_visit.actual_pay,me_visit.create_time,me_visit.inquiry_dt_last,me_visit.reply_dt,me_visit.reply_dt_last,me_user.name,me_doctor.name as doctor_name')
            ->join('me_user','me_user.code = me_visit.user_code')
            ->join('me_doctor','me_doctor.code = me_visit.doctor_code')
            ->where($where)
            ->order('create_time desc')
            ->paginate(20);

        //计算问题是否超时
        foreach ($inquisition as $k=>$v){
            //SELECT TIMESTAMPDIFF(MINUTE, INQUIRY_DT_LAST ,  IFNULL(REPLY_DT_LAST, NOW( )) ) from me_visit
            $sql = "SELECT TIMESTAMPDIFF(MINUTE, INQUIRY_DT_LAST ,  IFNULL(REPLY_DT_LAST, NOW( )) ) as minute from me_visit where id = ".$v['id'];
            $res = Db::query($sql);
            if($res[0]['minute']>0 && $res[0]['minute']<=10){  //超时时间 10分钟
                $inquisition[$k]['is_overtime'] = 0;
            }else{
                $inquisition[$k]['is_overtime'] = 1;
            }

        }



        $this->assign('inquisition',$inquisition);
        return $this->fetch();


    }

    /**
     * 问诊详情
     */

    public function detail(){
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        $where['visit_id'] = $id;
        //问题列表  查询附件
        $visit = new VisitLine();
        $res = $visit->where($where)->order('create_time')->select();
        if($res){
            $key=0;
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
                }else{
                    $res[$k]['pics'] = [];
                    $res[$k]['vids'] = [];
                }

                if($value['user_code']!=''){
                    $res[$k]['key'] = $key +1;
                    $key++;
                }

            }
        }

        $v = new Visit();
        $x = $v->find($id);
        //计算问题是否超时
            //SELECT TIMESTAMPDIFF(MINUTE, INQUIRY_DT_LAST ,  IFNULL(REPLY_DT_LAST, NOW( )) ) from me_visit
            $sql = "SELECT TIMESTAMPDIFF(MINUTE, INQUIRY_DT_LAST ,  IFNULL(REPLY_DT_LAST, NOW( )) ) as minute from me_visit where id = ".$id;
            $rs = Db::query($sql);
            if($rs[0]['minute']>0 && $rs[0]['minute']<=10){  //超时时间 10分钟
                $x['is_overtime'] = 0;
            }else{
                $x['is_overtime']= 1;
            }


        $d = new Doctor();
        $doctor = $d->where(['code'=>$x['doctor_code']])->find();
        $u = new User();
        $user = $u->join('me_user_patient','me_user_patient.user_id = me_user.id')->where(['code'=>$x['user_code']])->find();

        $this->assign('doctor',$doctor);//医生信息
        $this->assign('user',$user);//问诊人信息
        $this->assign('list',$res);//问题列表
        $this->assign('x',$x);
        return $this->fetch();
    }


    /**
     * 超时问题 医生模拟回答
     */

    public function reply(){
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;

        if($this->request->isPost()){
            $data['src'] ='S';
            $data['content'] = input('content');
            $data['visit_id'] = input('id');
            $v = new Visit();
            $x = $v->find(input('id'));
            $data['doctor_code'] = $x['doctor_code'];
            $visit = new VisitLine();
            if(false == $visit->save($data)) {
                return $this->error('操作失败');
            } else {
                //修改最后回复时间
                $vi = new Visit();
                $data_v['status'] = 'A';
                $data_v['reply_dt_last'] = date('Y-m-d H:i:s');
                $vi->save($data_v,['id'=>$id]);

                return $this->success('操作成功','admin/inquisition/index');
            }


        }else{
            $this->assign('id',$id);
            return $this->fetch();
        }


    }

}