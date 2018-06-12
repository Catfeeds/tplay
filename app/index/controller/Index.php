<?php
namespace app\index\controller;

use app\index\model\User as userModel;//用户模型
use app\index\model\Doctor;
use \think\Session;
use \think\Controller;

class Index extends Controller
{
    public function index()
    {
        return '<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} a{color:#2E5CD5;cursor: pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family: "Century Gothic","Microsoft yahei"; color: #333;font-size:18px;} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p> Tplay<br/><span style="font-size:30px">为开发者量身定制的高速度开发后台管理框架</span></p><span style="font-size:22px;"><br>【重要】【重要】【重要】Tplay后台管理框架目前没有开发index前台模块，请严格按照安装包中的安装说明进行安装！！';
    }

    /**
     * 用户登录
     */

    public function dologin(){
        $wx_user = new userModel();

        $code = input('code');

        if(!$code){
            return failMsg('code不能为空');
        }
        $res_wx = send_url(['code'=>$code]);
        $res_wx = json_decode($res_wx,true);
       if(isset($res_wx['errcode'])){
            return failMsg('code失效');
        }
        $post_data['open_id_ur'] = $res_wx['openid'];
        $post_data['union_id'] = $res_wx['session_key'];
        //$post_data['open_id_ur'] = input('openid');

        $post_data['name']  = input('name');
        $post_data['wx_nick_name'] = input('nick_name');
        $post_data['wx_head_img_url'] = input('head_img');
        $post_data['wx_sex'] = input('sex');
        $post_data['wx_country'] = input('country');
        $post_data['wx_city'] = input('city');
        $post_data['wx_province']= input('province');

        $result = $this->validate(
            [
                'name'  => $post_data['name'],
                'nick_name' => $post_data['wx_nick_name'],
                'head_img'   => $post_data['wx_head_img_url'],
                'sex'   => $post_data['wx_sex'],
                //'country'   => $post_data['wx_country'],
                //'city'   => $post_data['wx_city'],
                //'province'   => $post_data['wx_province'],
                'open_id_ur' => $post_data['open_id_ur']
            ],
            [
                'name'  => 'require|max:25',
                'nick_name'   => 'require',
                'head_img'   => 'require',
                'sex'   => 'require',
                //'country'   => 'require',
                //'city'   => 'require',
                //'province'   => 'require',
                'open_id_ur' =>'require'


            ],
            [
                'name.require'  =>  '用户名必须',
                'open_id_ur.require'=>'openid不能为空'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        //检查用户是否存在
        $where['open_id_ur'] = $post_data['open_id_ur'];
        $user_info = $wx_user->field('id')->where($where)->find();

        if($user_info['id']){
            $last_id = $user_info['id'];
            $wx_user->save($post_data,['id'=>$user_info['id']]);
            $res_code = $wx_user->field('code')->find($user_info['id']);
            $post_data['code'] = $res_code['code'];

        }else{
            $post_data['code'] = 'u'.date('Ymd') . rand(10000000,99999999);

            $wx_user->save($post_data);
            $last_id = $wx_user->getLastInsID();
        }

        $token = md5($post_data['open_id_ur'].$last_id.time().microtime());

        //设置登录信息
        $post_data['user_id'] = $last_id;
        $post_data['token'] = $token;
        return success($post_data);

    }

    /**
     * 医生登录
     */

    public function login(){
        $wx_user = new userModel();

        $code = input('code');

        if(!$code){
            return failMsg('code不能为空');
        }
        $res_wx = send_url_d(['code'=>$code]);
        $res_wx = json_decode($res_wx,true);

        if(isset($res_wx['errcode'])){

            if($res_wx['errcode']=='40029')
            return failMsg('code失效'.$res_wx['errcode']);
        }
        $post_data['open_id_dt'] = $res_wx['openid'];
        $post_data['union_id'] = $res_wx['session_key'];

        $post_data['name']  = input('name');
        $post_data['wx_nick_name'] = input('nick_name');
        $post_data['wx_head_img_url'] = input('head_img');
        $post_data['wx_sex'] = input('sex');
        $post_data['wx_country'] = input('country');
        $post_data['wx_city'] = input('city');
        $post_data['wx_province']= input('province');


        $result = $this->validate(
            [
                'name'  => $post_data['name'],
                'nick_name' => $post_data['wx_nick_name'],
                'head_img'   => $post_data['wx_head_img_url'],
                'sex'   => $post_data['wx_sex'],
                //'country'   => $post_data['wx_country'],
                //'city'   => $post_data['wx_city'],
                //'province'   => $post_data['wx_province'],
                'open_id_dt' => $post_data['open_id_dt']
            ],
            [
                'name'  => 'require|max:25',
                'nick_name'   => 'require',
                'head_img'   => 'require',
                'sex'   => 'require',
               // 'country'   => 'require',
               // 'city'   => 'require',
               // 'province'   => 'require',
                'open_id_dt' =>'require'


            ],
            [
                'name.require'  =>  '用户名必须',
                'open_id_dt.require'=>'openid不能为空'

            ]
        );

        if(true !== $result){
            // 验证失败 输出错误信息
            return failMsg($result);
        }

        //检查用户是否存在
        $where['open_id_dt'] = $post_data['open_id_dt'];
        $user_info = $wx_user->field('id')->where($where)->find();

        if($user_info['id']){
            $last_id = $user_info['id'];
            $wx_user->save($post_data,['id'=>$user_info['id']]);
        }else{
            $wx_user->save($post_data);
            $last_id = $wx_user->getLastInsID();
        }

        $token = md5($post_data['open_id_dt'].$last_id.time().microtime());

        //设置登录信息
        $post_data['user_id'] = $last_id;
        $post_data['token'] = $token;

        //查询该用户有没有doctor_code
        $doctor = new Doctor();
        $w['user_id'] = $post_data['user_id'];
        $res = $doctor->where($w)->find();

        if(!$res){
            return failMsg('您还不是本平台医生，请先联系平台管理员,微信号minebuty');
        }

        $post_data['code'] = $res ['code'];
        return success($post_data);

    }


}
