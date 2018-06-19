<?php
/**
 * 医院管理
 * Created by PhpStorm.
 * User: gh
 * Date: 2018/6/19
 * Time: 22:48
 */

namespace app\admin\controller;

use \think\Db;
use app\admin\controller\Permissions;
use \think\Cookie;
use \think\Session;
use \think\Cache;


class Hospital extends Permissions
{
    public function index()
    {
        $cates = Db::name('hospital')->select();
        $this->assign('cates',$cates);
        return $this->fetch();
    }


    public function publish()
    {
        //获取菜单id
        $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
        //是正常添加操作
        if($id > 0) {
            //是修改操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['name', 'require', '医院名称不能为空'],
                    ['contact', 'require|max:11|/^1[3-8]{1}[0-9]{9}$/', '联系方式不能为空|最多不能超过11个字符|手机号码格式不正确'],
                    ['address', 'require', '医院地址不能为空']
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                //验证菜单是否存在
                $cate = Db::name('hospital')->where('id',$id)->find();
                if(empty($cate)) {
                    return $this->error('id不正确');
                }
                if(false == Db::name('hospital')->where(['id'=>$id])->update($post)) {
                    return $this->error('修改失败');
                } else {
                    return $this->success('修改成功','admin/hospital/index');
                }
            } else {
                //非提交操作
                $cate = Db::name('hospital')->where('id',$id)->find();
                $cates = Db::name('hospital')->select();
                $this->assign('cates',$cates);
                if(!empty($cate)) {
                    $this->assign('cate',$cate);
                    return $this->fetch();
                } else {
                    return $this->error('id不正确');
                }
            }
        } else {
            //是新增操作
            if($this->request->isPost()) {
                //是提交操作
                $post = $this->request->post();
                //验证  唯一规则： 表名，字段名，排除主键值，主键名
                $validate = new \think\Validate([
                    ['name', 'require', '医院名称不能为空'],
                    ['contact', 'require|max:11|/^1[3-8]{1}[0-9]{9}$/', '联系方式不能为空|最多不能超过11个字符|手机号码格式不正确'],
                    ['address', 'require', '医院地址不能为空']
                ]);
                //验证部分数据合法性
                if (!$validate->check($post)) {
                    $this->error('提交失败：' . $validate->getError());
                }
                if(false == Db::name('hospital')->insert($post)) {
                    return $this->error('添加失败');
                } else {
                    return $this->success('添加成功','admin/hospital/index');
                }
            } else {
                //非提交操作
                $cate = Db::name('hospital')->select();
                $this->assign('cates',$cate);
                return $this->fetch();
            }
        }

    }


    public function delete()
    {
        if($this->request->isAjax()) {
            $id = $this->request->has('id') ? $this->request->param('id', 0, 'intval') : 0;
                if(false == Db::name('hospital')->where('id',$id)->delete()) {
                    return $this->error('删除失败');
                } else {
                    addlog($id);//写入日志
                    return $this->success('删除成功', 'admin/hospital/index');
                }

        }
    }
}