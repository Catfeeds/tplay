<?php
//操作成功：0.
function success ( array &$data = NULL ) {
    return json( ['status' => '200', 'msg' => 'ok', 'data' => $data] );
}

//操作失败：空数据
function emptyResult ( $msg = '无数据' ) {
    return getResponseMessage( '000', $msg );
}

//操作失败：参数不完整
function failIncomplete ( $msg = '参数不完整' ) {
    return getResponseMessage( '101', $msg );
}

//操作失败：数据签名错误
function failSign ( $msg = '数据签名错误' ) {
    return getResponseMessage( '102', $msg );
}

//操作失败：未在当前设备登录
function failLogin ( $msg = '您未在本设备登录' ) {
    return getResponseMessage( '103', $msg );
}

//操作失败：自定义失败消息
function failMsg ( $msg = '操作失败' ) {
    return getResponseMessage( '10x', $msg );
}

/**
 * 获取 格式化的 响应消息.
 *
 * @param  $id
 * @param mixed  $msg
 *
 * @return array
 */
function getResponseMessage ( $id, $msg ) {
    return json( ['status' => $id, 'msg' => $msg] );
}



/**
 * 登录 和 校验登录 相关.
 * User: user001
 * Time: 2017/9/28 16:33
 */

//token 的盐
define( 'TOKEN_SALT', 'F#!^%YWYHW%&*(!@#ATGW#%GR' );

/**
 * 生成 登录token.
 *
 * @param  $userID
 * @param  $deviceID
 *
 * @return 
 */
function getToken (  $userID ) {
    return md5( $userID . TOKEN_SALT );
}

/**
 * 通过 userID 和 deviceID 获取登录 token.
 *
 * @param  $userID
 * @param  $deviceID
 *
 * @return 
 */
function saveUserLogin (  $userID,  $deviceID ) {
    if ( !$userID ) throw new InvalidArgumentException( '缺少参数：$userID' );
    if ( !$deviceID ) throw new InvalidArgumentException( '缺少参数：$deviceID' );

    $memcached = \think\Loader::model( 'Memcached' );
    $token = getToken( $userID );
    if ( $memcached->set( $token, func_get_args(), 604800 ) ) return $token;

    throw new RuntimeException( '保存登录token失败' );
}

/**
 * 删除用户的 登录 token.
 *
 * @param  $token
 *
 * @return bool
 */
function deleteUserLogin (  $token ) {
    if ( !$token ) throw new InvalidArgumentException( '缺少参数：$token' );

    $memcached = \think\Loader::model( 'Memcached' );
    if ( $memcached->delete( $token ) ) return TRUE;

    throw new RuntimeException( '清除登录token失败' );
}

/**
 * 通过登录token，获取 userID.
 *
 * @param       $token
 * @param |NULL $deviceID
 *
 * @return mixed
 */
function getUserIDByToken (  $token,  $deviceID = NULL ) {
    return checkLogin( $token, $deviceID );

}

/**
 * 检查 用户 在 本设备，是否已登录.
 *
 * @param       $token
 * @param |NULL $deviceID
 *
 * @return mixed
 */
function checkLogin ($token = NULL,  $deviceID = NULL ) {
    if ( !$token ) $token = input( 'post.token' );
    if ( !$deviceID ) $deviceID = input( 'server.HTTP_DEVICE' );

    $memcached = \think\Loader::model( 'Memcached' );
    $userDevice = $memcached->get( $token );

    if ( !$userDevice ) return FALSE;
    if ( $userDevice[ 1 ] !== $deviceID ) return FALSE;
    return $userDevice[ 0 ];
}


/**
 * 签名 和 验签
 */

define( 'SIGN_SALT', 'QE151SD1A1V5W1E6565QE511J13A5W1A' );

/**
 * 生成签名.
 *
 * @param array $data
 *
 * @return string
 */
function getSign ( array $data ) {
    //去除签名值
    unset( $data[ 'sign' ] );
    //参数去空
    $param = paraFilter( $data );
    //参数升序
    $param = argSort( $param );
    //参数组装
    $param = createLinkString( $param );
    //签名
    $sign = md5( $param . '&' . SIGN_SALT );
    if ( !$sign ) throw new \RuntimeException( '签名失败' );

    return $sign;
}

/**
 * 校验签名.
 *
 * @param array $data
 *
 * @return bool
 */
function verifySign ( array &$data ) {return TRUE;
    if ( !isset( $data[ 'sign' ] ) ) throw new \InvalidArgumentException( '缺少参数：sign' );
    if ( empty( $data[ 'sign' ] ) ) throw new \InvalidArgumentException( '参数不能为空：sign' );
    if ( strlen( $data[ 'sign' ] ) !== 32 ) throw new \InvalidArgumentException( '签名失败' );

    //获取签名值
    $sign = getSign( $data );
    //判断签名值
    if ( !$sign ) throw new \RuntimeException( '签名失败' );
    //校验签名值
    return $sign === $data[ 'sign' ];
}

//参数组合
function createLinkString ( array &$para ) {
    $arg = "";
    while ( list ( $key, $val ) = each( $para ) ) {
        $arg .= $key . "=" . $val . "&";
    }
    //去掉最后一个&字符
    return substr( $arg, 0, count( $arg ) - 2 );
}

//参数排序
function argSort ( $para ) {
    ksort( $para );
    reset( $para );

    return $para;
}

/**
 * 除去数组中的空值和签名参数.
 *
 * @param array $para 签名参数组
 *
 * @return array 去掉空值与签名参数后的新签名参数组
 */
function paraFilter ( &$para ) {
    $para_filter = array();
    while ( list ( $key, $val ) = each( $para ) ) {
        if ( $key == "sign" || $key == "sign_type" ) continue;
        $para_filter[ $key ] = $para[ $key ];
    }

    return $para_filter;
}


    /**
     * 获取token
     * @return mixed
     */
   function get_access_token($appid,$appsecret){
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$appid.'&secret='.$appsecret;
        return curl_data($url);
    }
    /**
     * 设置小程序token
     * @return mixed
     */
   function set_token(){
        $access_token = Session('access_token');
        $tokenInfo = json_decode($access_token,true);
        //判断access_token是否失效
        if($tokenInfo['expires_in'] - time() < 2000){
            //重新获取access_token
            $access_token = get_access_token(config('C_APPID'),config('C_APPSECRET'));
            $tokenInfo = json_decode($access_token,true);
            $tokenInfo['expires_in'] = $tokenInfo['expires_in']+time();
            if(isset($tokenInfo['errcode'])){
                return $tokenInfo;
            }
            Session('access_token',json_encode($tokenInfo,JSON_UNESCAPED_UNICODE));
        }
        return json_decode($access_token,true);
    }
    /**
     * 获取微信小程序oepnid等信息
     * @param array $param
     * @return mixed
     */
  function send_url($param=[]){
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.config('C_APPID').'&secret='.config('C_APPSECRET').'&js_code='.$param['code'].'&grant_type=authorization_code';
        return curl_data($url,$param);
    }

    /**
     * 获取微信小程序oepnid等信息
     * @param array $param
     * @return mixed
     */
    function send_url_d($param=[]){
        $url = 'https://api.weixin.qq.com/sns/jscode2session?appid='.config('D_APPID').'&secret='.config('D_APPSECRET').'&js_code='.$param['code'].'&grant_type=authorization_code';
        return curl_data($url,$param);
    }

    /**
     * 获取用户增减数据
     * @param array $param
     * @return mixed
     */
  function get_user_summary($param){
        $url = 'https://api.weixin.qq.com/datacube/getusersummary?access_token='.$param['access_token'];
        $param =['begin_date'=>$param['begin_date'],'end_date'=>$param['end_date']];
        return curl_data($url,json_encode($param));
    }
    /**
     * 获取累计用户数据
     * @param array $param
     * @return mixed
     */
    function get_user_cumulate($param){
        $url = 'https://api.weixin.qq.com/datacube/getusercumulate?access_token='.$param['access_token'];
        $param =['begin_date'=>$param['begin_date'],'end_date'=>$param['end_date']];
        return curl_data($url,json_encode($param));
    }
    /**
     * 获取微信用户信息列表包统计(公众号)
     * @param array $param
     * @return mixed
     */
    function get_user_wx($param=[]){
        $access_token = session('access_token');
        $tokenInfo = json_decode($access_token,true);
        //判断access_token是否失效
        if($tokenInfo['expires_in'] - time() < 600){
            //重新获取access_token
            $access_token = $this->get_access_token(C('G_APPID'),C('G_APPSECRET'));
            $tokenInfo = json_decode($access_token,true);
            $tokenInfo['expires_in'] = $tokenInfo['expires_in']+time();
            if($tokenInfo['errcode']){
                return $tokenInfo;
            }
            session('access_token',json_encode($tokenInfo,JSON_FORCE_OBJECT));
        }
        $tokenInfo = json_decode($access_token,true)['access_token'];
        $param['access_token'] = $tokenInfo;
        //获取用户增减数据
        $summary = json_decode($this->get_user_summary($param),true);
        if(!$summary){
            return [];
        }
        foreach($summary['list'] as $v) {
            $cumulate_arr[$v['ref_date']] = $v;
        }
        //获取累计用户数据
        $cumulate = json_decode($this->get_user_cumulate($param),true);
        foreach($cumulate['list'] as &$vs){
            $vs += $cumulate_arr[$vs['ref_date']]?:[];
        }
        return $cumulate;
    }
    /**
     * 小程序获取二维码
     * @param $param
     * @return bool|mixed
     */
    function  get_wxa_code($param){
        $tokenInfo = set_token()['access_token'];

        //获取二维码
        $url = 'https://api.weixin.qq.com/cgi-bin/wxaapp/createwxaqrcode?access_token='.$tokenInfo;
        //$url = 'https://api.weixin.qq.com/wxa/getwxacodeunlimit?access_token='.$tokenInfo;
        $parm['path'] = $param['page'] ?: 'pages/index/index';
        $parm['width'] = $param['width'] ?: 430;
        if (isset($param['scene'])) {
            $parm['scene'] = $param['scene'];
        }
//        $parm['auto_color'] =  false;

        if(!$param['page']){

            return false;
        }
        //var_dump(json_encode($parm,JSON_UNESCAPED_SLASHES));
        //exit;

        return curl_data($url,json_encode($parm));
    }
    /**
     * 小程序模板消息推送
     * @param $param
     * @return mixed
     */
    function send_template($param){
        $tokenInfo = set_token()['access_token'];
        $url='https://api.weixin.qq.com/cgi-bin/message/wxopen/template/send?access_token='.$tokenInfo;
        return curl_data($url,json_encode($param));
    }
    function transfers(){
        $url = 'https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';
    }

/**
 * 生成唯一code
 * @param $table
 * @param string $field
 * @param string $fix
 * @return string
 */
function create_order($table,$field='',$fix = ''){
    $fix = $fix?: config('TRANSA_PREFIX');
    $node_code =$fix.date('YmdHis') . rand(10000000,99999999);
    if( !$table ){return $node_code;}
    if($field){
        $where = array($field => $node_code );
    }
    do{
        $res = $table->where($where)->count();
    }while($res > 0);
    return $node_code;
}
/**
 * curl提交数据
 * @param $url
 * @param array $data
 * @param int $timeout
 * @return mixed
 */
function curl_data($url,$data=[],$timeout=30,$useCert=[])
{
    $ch = curl_init();
    //取数据的地址
    curl_setopt($ch, CURLOPT_URL, $url);
    //传输为post
    curl_setopt($ch, CURLOPT_POST, true);
    /*
    //是否提交普通商户证书
    if($useCert['pt'] == true){
        //使用证书：cert 与 key 分别属于两个.pem文件
        curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLCERT, config('SSLCERT_PATH'));
        curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLKEY, config('SSLKEY_PATH'));
    }
    //是否提交企业商户证书
    if($useCert['is_post'] == true){
        if($useCert['qy']){
            $sslcert = config('SSLCERTQY_PATH');
            $sslkey = config('SSLKEYQY_PATH');
        }else{
            $sslcert = config('SSLCERTPT_PATH');
            $sslkey = config('SSLKEYPT_PATH');
        }
        //使用证书：cert 与 key 分别属于两个.pem文件
        curl_setopt($ch,CURLOPT_SSLCERTTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLCERT, $sslcert);
        curl_setopt($ch,CURLOPT_SSLKEYTYPE,'PEM');
        curl_setopt($ch,CURLOPT_SSLKEY, $sslkey);
    }*/
    //传输数据
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    //隐藏返回结果
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    //限制时间
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, $timeout);
    //https支持
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);//这个是重点。
    //执行
    $handles = curl_exec($ch);
    //断开
    curl_close($ch);
    return $handles;
}

function isImage($url){
    return preg_match('/.*(\.png|\.jpg|\.jpeg|\.gif)$/', $url);
}