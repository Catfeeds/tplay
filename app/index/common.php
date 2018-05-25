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