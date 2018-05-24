<?php
namespace app\index\controller;

use app\index\model\User as userModel;//用户模型

class Index
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

        $code = input('post.code/s');

        if(!$code){
            return failMsg('code不能为空');
        }
        $res_wx = $this->send_url(['code'=>$code]);
        $res_wx = json_decode($res_wx,true);
        if($res_wx['errcode']){
            return failMsg('code失效');
        }
        $post_data['openid'] = $res_wx['openid']??'';
        $post_data['unionid'] = $res_wx['unionid'] ?? '';

        //检查用户是否存在
        $user_info = $wx_user->field('id')->where("openid='%s' ",array($post_data['openid']))->find();
        $type = $user_info['id'] ? 2 : 1 ;
        $post_data = $wx_user->save($post_data,$type);
        if(!$post_data){
            return failMsg($wx_user->getError());
        }

        if($user_info['id']){
            $last_id = $user_info['id'];
            $wx_user->where(array('id'=>$last_id))->save($post_data);
        }else{
            $last_id = $wx_user->save($post_data);
        }
        $session_user_info = md5($post_data['openid'].$last_id);
        $token = md5($post_data['openid'].$last_id.time().microtime());
        //设置登录信息
        $post_data['user_id'] = $last_id;
        S($token,$session_user_info,['expire'=>86400*30]);
        S($session_user_info,$post_data,['expire'=>86400*30]);
        return success($token);

    }


}
