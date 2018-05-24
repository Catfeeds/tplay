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
 * @param string $id
 * @param mixed  $msg
 *
 * @return array
 */
function getResponseMessage ( $id, $msg ) {
    return json( ['status' => $id, 'msg' => $msg] );
}
