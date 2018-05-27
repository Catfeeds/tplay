-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?05 �?27 �?09:35
-- 服务器版本: 5.7.17
-- PHP 版本: 5.5.38

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `tplay`
--

-- --------------------------------------------------------

--
-- 表的结构 `me_account`
--

CREATE TABLE IF NOT EXISTS `me_account` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE` char(2) DEFAULT 'DT',
  `CODE` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `ORDER_CODE` char(20) DEFAULT '',
  `SRC` char(10) DEFAULT 'O',
  `SUB_SRC` char(5) DEFAULT '',
  `SUB_SRC_DESCR` varchar(50) DEFAULT '',
  `AMOUNT` decimal(13,2) DEFAULT '0.00',
  `NOTE` varchar(150) DEFAULT '',
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `index0` (`TYPE`,`CODE`),
  KEY `index1` (`SRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_admin`
--

CREATE TABLE IF NOT EXISTS `me_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) DEFAULT NULL COMMENT '昵称',
  `name` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `thumb` int(11) NOT NULL DEFAULT '1' COMMENT '管理员头像',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '修改时间',
  `login_time` int(11) DEFAULT NULL COMMENT '最后登录时间',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登录ip',
  `admin_cate_id` int(2) NOT NULL DEFAULT '1' COMMENT '管理员分组',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `admin_cate_id` (`admin_cate_id`) USING BTREE,
  KEY `nickname` (`nickname`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `me_admin`
--

INSERT INTO `me_admin` (`id`, `nickname`, `name`, `password`, `thumb`, `create_time`, `update_time`, `login_time`, `login_ip`, `admin_cate_id`) VALUES
(1, 'Tplay', 'admin', '31c64b511d1e90fcda8519941c1bd660', 1, 1510885948, 1517622948, 1527317487, '127.0.0.1', 1);

-- --------------------------------------------------------

--
-- 表的结构 `me_admin_cate`
--

CREATE TABLE IF NOT EXISTS `me_admin_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `permissions` text COMMENT '权限菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `desc` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `me_admin_cate`
--

INSERT INTO `me_admin_cate` (`id`, `name`, `permissions`, `create_time`, `update_time`, `desc`) VALUES
(1, '超级管理员', '4,5,6,7,8,11,13,14,16,17,19,20,21,25,26,28,29,34,35,37,38,39,40,42,43,44,45,47,48', 0, 1517022009, '超级管理员，拥有最高权限！');

-- --------------------------------------------------------

--
-- 表的结构 `me_admin_log`
--

CREATE TABLE IF NOT EXISTS `me_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_menu_id` int(11) NOT NULL COMMENT '操作菜单id',
  `admin_id` int(11) NOT NULL COMMENT '操作者id',
  `ip` varchar(100) DEFAULT NULL COMMENT '操作ip',
  `operation_id` varchar(200) DEFAULT NULL COMMENT '操作关联id',
  `create_time` int(11) NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `me_admin_log`
--

INSERT INTO `me_admin_log` (`id`, `admin_menu_id`, `admin_id`, `ip`, `operation_id`, `create_time`) VALUES
(1, 50, 1, '127.0.0.1', '', 1526957833),
(2, 50, 1, '127.0.0.1', '', 1526958595),
(3, 4, 1, '127.0.0.1', '23', 1527066706),
(4, 4, 1, '127.0.0.1', '22', 1527066761),
(5, 4, 1, '127.0.0.1', '52', 1527067013),
(6, 4, 1, '127.0.0.1', '52', 1527067168),
(7, 4, 1, '127.0.0.1', '53', 1527067343),
(8, 4, 1, '127.0.0.1', '54', 1527067424),
(9, 4, 1, '127.0.0.1', '53', 1527067451),
(10, 4, 1, '127.0.0.1', '31', 1527067520),
(11, 4, 1, '127.0.0.1', '54', 1527067535),
(12, 4, 1, '127.0.0.1', '53', 1527067555),
(13, 4, 1, '127.0.0.1', '23', 1527067593),
(14, 4, 1, '127.0.0.1', '55', 1527068350),
(15, 4, 1, '127.0.0.1', '56', 1527068462),
(16, 4, 1, '127.0.0.1', '46', 1527076991),
(17, 4, 1, '127.0.0.1', '57', 1527077063),
(18, 4, 1, '127.0.0.1', '46', 1527077089),
(19, 4, 1, '127.0.0.1', '46', 1527077162),
(20, 4, 1, '127.0.0.1', '57', 1527077189),
(21, 4, 1, '127.0.0.1', '58', 1527077244),
(22, 4, 1, '127.0.0.1', '58', 1527077368),
(23, 4, 1, '127.0.0.1', '59', 1527077442),
(24, 4, 1, '127.0.0.1', '60', 1527077601),
(25, 50, 1, '127.0.0.1', '', 1527080245),
(26, 11, 1, '127.0.0.1', '', 1527081477),
(27, 50, 1, '127.0.0.1', '', 1527317487);

-- --------------------------------------------------------

--
-- 表的结构 `me_admin_menu`
--

CREATE TABLE IF NOT EXISTS `me_admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `module` varchar(50) NOT NULL COMMENT '模块',
  `controller` varchar(100) NOT NULL COMMENT '控制器',
  `function` varchar(100) NOT NULL COMMENT '方法',
  `parameter` varchar(50) DEFAULT NULL COMMENT '参数',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `is_display` int(1) NOT NULL DEFAULT '1' COMMENT '1显示在左侧菜单2只作为节点',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '1权限节点2普通节点',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级菜单0为顶级菜单',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_open` int(1) NOT NULL DEFAULT '0' COMMENT '0默认闭合1默认展开',
  `orders` int(11) NOT NULL DEFAULT '0' COMMENT '排序值，越小越靠前',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `module` (`module`) USING BTREE,
  KEY `controller` (`controller`) USING BTREE,
  KEY `function` (`function`) USING BTREE,
  KEY `is_display` (`is_display`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='系统菜单表' AUTO_INCREMENT=61 ;

--
-- 转存表中的数据 `me_admin_menu`
--

INSERT INTO `me_admin_menu` (`id`, `name`, `module`, `controller`, `function`, `parameter`, `description`, `is_display`, `type`, `pid`, `create_time`, `update_time`, `icon`, `is_open`, `orders`) VALUES
(1, '系统', '', '', '', '', '系统设置。', 1, 2, 0, 0, 1517015748, 'fa-cog', 1, 0),
(2, '菜单', '', '', '', '', '菜单管理。', 1, 2, 1, 0, 1517015764, 'fa-paw', 0, 0),
(51, '系统菜单排序', 'admin', 'menu', 'orders', '', '系统菜单排序。', 2, 1, 3, 1517562047, 1517562047, '', 0, 0),
(3, '系统菜单', 'admin', 'menu', 'index', NULL, '系统菜单管理', 1, 2, 2, 0, 0, 'fa-share-alt', 0, 0),
(4, '新增/修改系统菜单', 'admin', 'menu', 'publish', '', '新增/修改系统菜单.', 2, 1, 3, 1516948769, 1516948769, '', 0, 0),
(5, '删除系统菜单', 'admin', 'menu', 'delete', '', '删除系统菜单。', 2, 1, 3, 1516948857, 1516948857, '', 0, 0),
(6, '个人', '', '', '', '', '个人信息管理。', 1, 1, 1, 1516949308, 1517021986, 'fa-user', 0, 0),
(7, '个人信息', 'admin', 'admin', 'personal', '', '个人信息修改。', 1, 1, 6, 1516949435, 1516949435, 'fa-user', 0, 0),
(8, '修改密码', 'admin', 'admin', 'editpassword', '', '管理员修改个人密码。', 1, 1, 6, 1516949702, 1517619887, 'fa-unlock-alt', 0, 0),
(9, '设置', '', '', '', '', '系统相关设置。', 1, 2, 1, 1516949853, 1517015878, 'fa-cog', 0, 0),
(10, '网站设置', 'admin', 'webconfig', 'index', '', '网站相关设置首页。', 1, 2, 9, 1516949994, 1516949994, 'fa-bullseye', 0, 0),
(11, '修改网站设置', 'admin', 'webconfig', 'publish', '', '修改网站设置。', 2, 1, 10, 1516950047, 1516950047, '', 0, 0),
(12, '邮件设置', 'admin', 'emailconfig', 'index', '', '邮件配置首页。', 1, 2, 9, 1516950129, 1516950129, 'fa-envelope', 0, 0),
(13, '修改邮件设置', 'admin', 'emailconfig', 'publish', '', '修改邮件设置。', 2, 1, 12, 1516950215, 1516950215, '', 0, 0),
(14, '发送测试邮件', 'admin', 'emailconfig', 'mailto', '', '发送测试邮件。', 2, 1, 12, 1516950295, 1516950295, '', 0, 0),
(15, '短信设置', 'admin', 'smsconfig', 'index', '', '短信设置首页。', 1, 2, 9, 1516950394, 1516950394, 'fa-comments', 0, 0),
(16, '修改短信设置', 'admin', 'smsconfig', 'publish', '', '修改短信设置。', 2, 1, 15, 1516950447, 1516950447, '', 0, 0),
(17, '发送测试短信', 'admin', 'smsconfig', 'smsto', '', '发送测试短信。', 2, 1, 15, 1516950483, 1516950483, '', 0, 0),
(18, 'URL 设置', 'admin', 'urlsconfig', 'index', '', 'url 设置。', 1, 2, 9, 1516950738, 1516950804, 'fa-code-fork', 0, 0),
(19, '新增/修改url设置', 'admin', 'urlsconfig', 'publish', '', '新增/修改url设置。', 2, 1, 18, 1516950850, 1516950850, '', 0, 0),
(20, '启用/禁用url美化', 'admin', 'urlsconfig', 'status', '', '启用/禁用url美化。', 2, 1, 18, 1516950909, 1516950909, '', 0, 0),
(21, ' 删除url美化规则', 'admin', 'urlsconfig', 'delete', '', ' 删除url美化规则。', 2, 1, 18, 1516950941, 1516950941, '', 0, 0),
(22, '顾客管理', '', '', '', '', '顾客管理。', 1, 2, 0, 1516950991, 1527066761, 'fa-users', 0, 0),
(23, '管理员', '', '', '', '', '系统管理员管理。', 1, 2, 1, 1516951071, 1527067593, 'fa-user', 0, 0),
(24, '管理员', 'admin', 'admin', 'index', '', '系统管理员列表。', 1, 2, 23, 1516951163, 1516951163, 'fa-user', 0, 0),
(25, '新增/修改管理员', 'admin', 'admin', 'publish', '', '新增/修改系统管理员。', 2, 1, 24, 1516951224, 1516951224, '', 0, 0),
(26, '删除管理员', 'admin', 'admin', 'delete', '', '删除管理员。', 2, 1, 24, 1516951253, 1516951253, '', 0, 0),
(27, '权限组', 'admin', 'admin', 'admincate', '', '权限分组。', 1, 2, 23, 1516951353, 1517018168, 'fa-dot-circle-o', 0, 0),
(28, '新增/修改权限组', 'admin', 'admin', 'admincatepublish', '', '新增/修改权限组。', 2, 1, 27, 1516951483, 1516951483, '', 0, 0),
(29, '删除权限组', 'admin', 'admin', 'admincatedelete', '', '删除权限组。', 2, 1, 27, 1516951515, 1516951515, '', 0, 0),
(30, '操作日志', 'admin', 'admin', 'log', '', '系统管理员操作日志。', 1, 2, 23, 1516951754, 1517018196, 'fa-pencil', 0, 0),
(31, '内容', '', '', '', '', '内容管理。', 2, 2, 0, 1516952262, 1527067520, 'fa-th-large', 0, 0),
(32, '文章', '', '', '', '', '文章相关管理。', 1, 2, 31, 1516952698, 1517015846, 'fa-bookmark', 0, 0),
(33, '分类', 'admin', 'articlecate', 'index', '', '文章分类管理。', 1, 2, 32, 1516952856, 1516952856, 'fa-tag', 0, 0),
(34, '新增/修改文章分类', 'admin', 'articlecate', 'publish', '', '新增/修改文章分类。', 2, 1, 33, 1516952896, 1516952896, '', 0, 0),
(35, '删除文章分类', 'admin', 'articlecate', 'delete', '', '删除文章分类。', 2, 1, 33, 1516952942, 1516952942, '', 0, 0),
(36, '文章', 'admin', 'article', 'index', '', '文章管理。', 1, 2, 32, 1516953011, 1516953028, 'fa-bookmark', 0, 0),
(37, '新增/修改文章', 'admin', 'article', 'publish', '', '新增/修改文章。', 2, 1, 36, 1516953056, 1516953056, '', 0, 0),
(38, '审核/拒绝文章', 'admin', 'article', 'status', '', '审核/拒绝文章。', 2, 1, 36, 1516953113, 1516953113, '', 0, 0),
(39, '置顶/取消置顶文章', 'admin', 'article', 'is_top', '', '置顶/取消置顶文章。', 2, 1, 36, 1516953162, 1516953162, '', 0, 0),
(40, '删除文章', 'admin', 'article', 'delete', '', '删除文章。', 2, 1, 36, 1516953183, 1516953183, '', 0, 0),
(41, '附件', 'admin', 'attachment', 'index', '', '附件管理。', 1, 2, 31, 1516953306, 1516953306, 'fa-cube', 0, 0),
(42, '附件审核', 'admin', 'attachment', 'audit', '', '附件审核。', 2, 1, 41, 1516953359, 1516953440, '', 0, 0),
(43, '附件上传', 'admin', 'attachment', 'upload', '', '附件上传。', 2, 1, 41, 1516953392, 1516953392, '', 0, 0),
(44, '附件下载', 'admin', 'attachment', 'download', '', '附件下载。', 2, 1, 41, 1516953430, 1516953430, '', 0, 0),
(45, '附件删除', 'admin', 'attachment', 'delete', '', '附件删除。', 2, 1, 41, 1516953477, 1516953477, '', 0, 0),
(46, '留言', 'admin', 'tomessages', 'index', '', '留言管理。', 1, 2, 31, 1516953526, 1527077162, 'fa-comments', 0, 0),
(47, '留言处理', 'admin', 'tomessages', 'mark', '', '留言处理。', 2, 1, 46, 1516953605, 1516953605, '', 0, 0),
(48, '留言删除', 'admin', 'tomessages', 'delete', '', '留言删除。', 2, 1, 46, 1516953648, 1516953648, '', 0, 0),
(49, '图片上传', 'admin', 'common', 'upload', '', '图片上传。', 2, 2, 0, 1516954491, 1516954491, '', 0, 0),
(50, '管理员登录', 'admin', 'common', 'login', '', '管理员登录。', 2, 2, 0, 1516954517, 1516954517, '', 0, 0),
(52, '顾客列表', 'admin', 'customer', 'index', '', '', 1, 2, 22, 1527067013, 1527067168, 'fa-user-o', 1, 0),
(53, '医生管理', '', '', '', '', '', 1, 2, 0, 1527067343, 1527067555, 'fa-th-large', 0, 0),
(54, '医生列表', 'admin', 'doctor', 'index', '', '', 1, 2, 53, 1527067424, 1527067535, 'fa-heart', 0, 0),
(55, '问诊管理', '', '', '', '', '', 1, 2, 0, 1527068350, 1527068350, 'fa-plus-circle', 0, 0),
(56, '问诊列表', 'admin', 'inquisition', 'index', '', '', 1, 2, 55, 1527068462, 1527068462, 'fa-list', 0, 0),
(58, '意见反馈列表', 'admin', 'feedback', 'index', '', '', 1, 2, 57, 1527077244, 1527077368, 'fa-list', 0, 0),
(57, '意见反馈', '', '', '', '', '', 1, 2, 0, 1527077063, 1527077189, 'fa-comments', 0, 0),
(59, '提现管理', '', '', '', '', '', 1, 2, 0, 1527077442, 1527077442, 'fa-money', 0, 0),
(60, '提现列表', 'admin', 'withdraw', 'index', '', '', 1, 2, 59, 1527077601, 1527077601, 'fa-list-ul', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `me_article`
--

CREATE TABLE IF NOT EXISTS `me_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `tag` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `article_cate_id` int(11) NOT NULL,
  `thumb` int(11) DEFAULT NULL,
  `content` text,
  `admin_id` int(11) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `edit_admin_id` int(11) NOT NULL COMMENT '最后修改人',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '0待审核1已审核',
  `is_top` int(1) NOT NULL DEFAULT '0' COMMENT '1置顶0普通',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_top` (`is_top`) USING BTREE,
  KEY `article_cate_id` (`article_cate_id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_article_cate`
--

CREATE TABLE IF NOT EXISTS `me_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `tag` varchar(250) DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_attachment`
--

CREATE TABLE IF NOT EXISTS `me_attachment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL DEFAULT '' COMMENT '所属模块',
  `filename` char(50) NOT NULL DEFAULT '' COMMENT '文件名',
  `filepath` char(200) NOT NULL DEFAULT '' COMMENT '文件路径+文件名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `fileext` char(10) NOT NULL DEFAULT '' COMMENT '文件后缀',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `uploadip` char(15) NOT NULL DEFAULT '' COMMENT '上传IP',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未审核1已审核-1不通过',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0',
  `admin_id` int(11) NOT NULL COMMENT '审核者id',
  `audit_time` int(11) NOT NULL COMMENT '审核时间',
  `use` varchar(200) DEFAULT NULL COMMENT '用处',
  `download` int(11) NOT NULL DEFAULT '0' COMMENT '下载量',
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `filename` (`filename`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表' AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `me_attachment`
--

INSERT INTO `me_attachment` (`id`, `module`, `filename`, `filepath`, `filesize`, `fileext`, `user_id`, `uploadip`, `status`, `create_time`, `admin_id`, `audit_time`, `use`, `download`) VALUES
(1, 'admin', '79811855a6c06de53047471c4ff82a36.jpg', '\\uploads\\admin\\admin_thumb\\20180104\\79811855a6c06de53047471c4ff82a36.jpg', 13781, 'jpg', 1, '127.0.0.1', 1, 1515046060, 1, 1515046060, 'admin_thumb', 0);

-- --------------------------------------------------------

--
-- 表的结构 `me_attachment1`
--

CREATE TABLE IF NOT EXISTS `me_attachment1` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SRC` char(5) DEFAULT 'V',
  `SUB_ID` bigint(20) DEFAULT '0',
  `TITLE` varchar(50) DEFAULT '',
  `MEDIA_TYPE` char(1) DEFAULT 'P',
  `SUFFIX` char(4) DEFAULT '',
  `PATH` varchar(255) DEFAULT '',
  `URL` varchar(255) DEFAULT '',
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `index0` (`SRC`,`SUB_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_doctor`
--

CREATE TABLE IF NOT EXISTS `me_doctor` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT '0',
  `CODE` char(20) DEFAULT '',
  `NAME` varchar(20) DEFAULT '',
  `HEAD_IMG` varchar(255) DEFAULT '',
  `TITLE` varchar(20) DEFAULT '',
  `HOSPITAL_CODE` varchar(20) DEFAULT '',
  `DEPARTMENT_CODE` varchar(20) DEFAULT '',
  `STATUS` char(1) DEFAULT 'I',
  `AUTH_TYPE` char(1) DEFAULT '',
  `AVERAGE_STAR` decimal(3,1) DEFAULT '0.0',
  `JOB_PERIOD` smallint(6) DEFAULT '0',
  `PHONE` char(11) DEFAULT '',
  `PHONE_CFM` char(1) DEFAULT 'N',
  `PHONE_VISIBLE` char(1) DEFAULT 'N',
  `INFO` text CHARACTER SET utf8mb4,
  `ORIGINAL_PRICE` decimal(13,2) DEFAULT '0.00',
  `ACTUAL_PRICE` decimal(13,2) DEFAULT '0.00',
  `AQ_PATH` varchar(255) DEFAULT '',
  `AQ_PATH_DT` datetime DEFAULT NULL,
  `AQ_PATH_URL` varchar(255) DEFAULT '',
  `GZH_QR_PATH` varchar(255) DEFAULT '',
  `SRC` char(1) DEFAULT '',
  `FROM_USER_CODE` char(30) DEFAULT '',
  `REGISTER_IP` char(46) DEFAULT '0.0.0.0',
  `REGISTER_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_LOGIN_DT` datetime DEFAULT NULL,
  `UNION_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `OPEN_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `OPEN_ID_DT` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `WX_NICK_NAME` varchar(50) DEFAULT '',
  `WX_SEX` char(1) DEFAULT '',
  `WX_HEAD_IMG_URL` varchar(250) DEFAULT '',
  `WX_PROVINCE` varchar(15) DEFAULT '',
  `WX_CITY` varchar(15) DEFAULT '',
  `WX_COUNTRY` varchar(15) DEFAULT '',
  `WX_SUBSCRIBE` smallint(6) DEFAULT '0',
  `WX_SCENE` varchar(64) DEFAULT '',
  `WX_LATITUDE` varchar(20) DEFAULT '',
  `WX_LONGITUDE` varchar(20) DEFAULT '',
  `WX_PRECISION` varchar(20) DEFAULT '',
  `WX_LOCATION_DT` datetime DEFAULT NULL,
  `WX_QR_IMG` varchar(250) DEFAULT '',
  `WX_QR_URL` varchar(250) DEFAULT '',
  `WX_QR_UPDATE_DT` datetime DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT '',
  `ADMIN_USER_ID` int(11) DEFAULT '0',
  `UPDATE_DT` datetime DEFAULT NULL,
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `index0` (`CODE`),
  KEY `index1` (`OPEN_ID_DT`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_emailconfig`
--

CREATE TABLE IF NOT EXISTS `me_emailconfig` (
  `email` varchar(5) NOT NULL COMMENT '邮箱配置标识',
  `from_email` varchar(50) NOT NULL COMMENT '邮件来源也就是邮件地址',
  `from_name` varchar(50) NOT NULL,
  `smtp` varchar(50) NOT NULL COMMENT '邮箱smtp服务器',
  `username` varchar(100) NOT NULL COMMENT '邮箱账号',
  `password` varchar(100) NOT NULL COMMENT '邮箱密码',
  `title` varchar(200) NOT NULL COMMENT '邮件标题',
  `content` text NOT NULL COMMENT '邮件模板',
  KEY `email` (`email`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `me_emailconfig`
--

INSERT INTO `me_emailconfig` (`email`, `from_email`, `from_name`, `smtp`, `username`, `password`, `title`, `content`) VALUES
('email', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `me_favorite`
--

CREATE TABLE IF NOT EXISTS `me_favorite` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_CODE` char(20) DEFAULT '',
  `TYPE` char(2) DEFAULT 'DT',
  `FOLLOW_CODE` varchar(32) DEFAULT '',
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `index0` (`USER_CODE`,`TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_feedback`
--

CREATE TABLE IF NOT EXISTS `me_feedback` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_CODE` char(20) DEFAULT '',
  `DOCTOR_CODE` char(20) DEFAULT '',
  `STATUS` char(1) DEFAULT 'P',
  `CONTENT` varchar(500) DEFAULT '',
  `OPERATE_DT` datetime DEFAULT NULL,
  `ADMIN_USER_ID` int(11) DEFAULT '0',
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_label`
--

CREATE TABLE IF NOT EXISTS `me_label` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE` char(2) DEFAULT 'DT',
  `LABEL_VALUE` varchar(32) DEFAULT '',
  `URL` varchar(255) DEFAULT '',
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `index0` (`TYPE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_label_rel`
--

CREATE TABLE IF NOT EXISTS `me_label_rel` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE` char(2) DEFAULT 'DT',
  `CODE` char(20) DEFAULT '',
  `LABEL_ID` bigint(20) DEFAULT '0',
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `index0` (`TYPE`,`CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_messages`
--

CREATE TABLE IF NOT EXISTS `me_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(11) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `is_look` int(1) NOT NULL DEFAULT '0' COMMENT '0未读1已读',
  `message` text NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `is_look` (`is_look`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_setting`
--

CREATE TABLE IF NOT EXISTS `me_setting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEY_CODE` varchar(150) DEFAULT '',
  `KEY_VALUE` varchar(50) DEFAULT '',
  `KEY_TYPE` varchar(50) DEFAULT '',
  `UPDATE_DT` datetime DEFAULT NULL,
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `index0` (`KEY_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_smsconfig`
--

CREATE TABLE IF NOT EXISTS `me_smsconfig` (
  `sms` varchar(10) NOT NULL DEFAULT 'sms' COMMENT '标识',
  `appkey` varchar(200) NOT NULL,
  `secretkey` varchar(200) NOT NULL,
  `type` varchar(100) DEFAULT 'normal' COMMENT '短信类型',
  `name` varchar(100) NOT NULL COMMENT '短信签名',
  `code` varchar(100) NOT NULL COMMENT '短信模板ID',
  `content` text NOT NULL COMMENT '短信默认模板',
  KEY `sms` (`sms`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `me_smsconfig`
--

INSERT INTO `me_smsconfig` (`sms`, `appkey`, `secretkey`, `type`, `name`, `code`, `content`) VALUES
('sms', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `me_urlconfig`
--

CREATE TABLE IF NOT EXISTS `me_urlconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `aliases` varchar(200) NOT NULL COMMENT '想要设置的别名',
  `url` varchar(200) NOT NULL COMMENT '原url结构',
  `desc` text COMMENT '备注',
  `status` int(1) NOT NULL DEFAULT '1' COMMENT '0禁用1使用',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `me_urlconfig`
--

INSERT INTO `me_urlconfig` (`id`, `aliases`, `url`, `desc`, `status`, `create_time`, `update_time`) VALUES
(1, 'admin_login', 'admin/common/login', '后台登录地址。', 0, 1517621629, 1517621629);

-- --------------------------------------------------------

--
-- 表的结构 `me_user`
--

CREATE TABLE IF NOT EXISTS `me_user` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CODE` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `NAME` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `STATUS` char(1) DEFAULT 'I',
  `PHONE` char(11) DEFAULT '',
  `PHONE_CFM` char(1) DEFAULT 'N',
  `PASSWORD` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `LEVEL` smallint(6) DEFAULT '0',
  `BIRTHDAY` date DEFAULT NULL,
  `HEIGHT` smallint(6) DEFAULT '0',
  `WEIGHT` smallint(6) DEFAULT '0',
  `SRC` char(1) DEFAULT '',
  `FROM_USER_CODE` char(30) DEFAULT '',
  `REGISTER_IP` char(46) DEFAULT '0.0.0.0',
  `REGISTER_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  `LAST_LOGIN_DT` datetime DEFAULT NULL,
  `UNION_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `OPEN_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `OPEN_ID_UR` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `WX_NICK_NAME` varchar(50) DEFAULT '',
  `WX_SEX` char(1) DEFAULT '',
  `WX_HEAD_IMG_URL` varchar(250) DEFAULT '',
  `WX_PROVINCE` varchar(15) DEFAULT '',
  `WX_CITY` varchar(15) DEFAULT '',
  `WX_COUNTRY` varchar(15) DEFAULT '',
  `WX_SUBSCRIBE` smallint(6) DEFAULT '0',
  `WX_SCENE` varchar(64) DEFAULT '',
  `WX_LATITUDE` varchar(20) DEFAULT '',
  `WX_LONGITUDE` varchar(20) DEFAULT '',
  `WX_PRECISION` varchar(20) DEFAULT '',
  `WX_LOCATION_DT` datetime DEFAULT NULL,
  `WX_QR_IMG` varchar(250) DEFAULT '',
  `WX_QR_URL` varchar(250) DEFAULT '',
  `WX_QR_UPDATE_DT` datetime DEFAULT NULL,
  `REMARK` varchar(100) DEFAULT '',
  `ADMIN_USER_ID` int(11) DEFAULT '0',
  `UPDATE_DT` datetime DEFAULT NULL,
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `index0` (`CODE`),
  KEY `index1` (`OPEN_ID_UR`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `me_user`
--

INSERT INTO `me_user` (`ID`, `CODE`, `NAME`, `STATUS`, `PHONE`, `PHONE_CFM`, `PASSWORD`, `LEVEL`, `BIRTHDAY`, `HEIGHT`, `WEIGHT`, `SRC`, `FROM_USER_CODE`, `REGISTER_IP`, `REGISTER_DT`, `LAST_LOGIN_DT`, `UNION_ID`, `OPEN_ID`, `OPEN_ID_UR`, `WX_NICK_NAME`, `WX_SEX`, `WX_HEAD_IMG_URL`, `WX_PROVINCE`, `WX_CITY`, `WX_COUNTRY`, `WX_SUBSCRIBE`, `WX_SCENE`, `WX_LATITUDE`, `WX_LONGITUDE`, `WX_PRECISION`, `WX_LOCATION_DT`, `WX_QR_IMG`, `WX_QR_URL`, `WX_QR_UPDATE_DT`, `REMARK`, `ADMIN_USER_ID`, `UPDATE_DT`, `CREATE_DT`, `create_time`, `update_time`) VALUES
(1, '', 'hh1', 'I', '', 'N', NULL, 0, NULL, 0, 0, '', '', '0.0.0.0', '2018-05-26 19:31:15', NULL, '', '', '123', NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, '2018-05-26 19:31:15', 1527334275, 1527335946),
(2, '', 'hh1', 'I', '', 'N', NULL, 0, NULL, 0, 0, '', '', '0.0.0.0', '2018-05-26 20:00:40', NULL, '', '', '111', NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, '2018-05-26 20:00:40', 1527336040, 1527336344),
(3, '', 'hh22', 'I', '', 'N', NULL, 0, NULL, 0, 0, '', '', '0.0.0.0', '2018-05-26 20:08:32', NULL, '', '', '222', NULL, NULL, NULL, NULL, NULL, NULL, 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, '2018-05-26 20:08:32', 1527336512, 1527336534);

-- --------------------------------------------------------

--
-- 表的结构 `me_visit`
--

CREATE TABLE IF NOT EXISTS `me_visit` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_CODE` char(20) DEFAULT '',
  `DOCTOR_CODE` char(20) DEFAULT '',
  `STATUS` char(1) DEFAULT 'P',
  `ORIGIANL_PRICE` decimal(13,2) DEFAULT '0.00',
  `ACTUAL_PAY` decimal(13,2) DEFAULT '0.00',
  `USE_COUPON` char(1) DEFAULT 'N',
  `INQUIRY_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  `INQUIRY_DT_LAST` datetime DEFAULT NULL,
  `REPLY_DT` datetime DEFAULT NULL,
  `REPLY_DT_LAST` datetime DEFAULT NULL,
  `CLOSE_DT` datetime DEFAULT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `index0` (`USER_CODE`,`STATUS`),
  KEY `index1` (`DOCTOR_CODE`,`STATUS`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `me_visit`
--

INSERT INTO `me_visit` (`ID`, `USER_CODE`, `DOCTOR_CODE`, `STATUS`, `ORIGIANL_PRICE`, `ACTUAL_PAY`, `USE_COUPON`, `INQUIRY_DT`, `INQUIRY_DT_LAST`, `REPLY_DT`, `REPLY_DT_LAST`, `CLOSE_DT`, `create_time`, `update_time`) VALUES
(1, '001', '01', 'P', '0.00', '0.00', 'N', '2018-05-26 20:25:08', NULL, NULL, NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `me_visit_line`
--

CREATE TABLE IF NOT EXISTS `me_visit_line` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VISIT_ID` bigint(20) DEFAULT '0',
  `USER_CODE` char(20) DEFAULT '',
  `DOCTOR_CODE` char(20) DEFAULT '',
  `STATUS` char(1) DEFAULT 'A',
  `TYPE` char(1) DEFAULT 'T',
  `CONTENT` text CHARACTER SET utf8mb4,
  `SRC` char(1) DEFAULT '',
  `VISIBLE` char(1) DEFAULT '',
  `CREATE_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `index0` (`VISIT_ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_webconfig`
--

CREATE TABLE IF NOT EXISTS `me_webconfig` (
  `web` varchar(20) NOT NULL COMMENT '网站配置标识',
  `name` varchar(200) NOT NULL COMMENT '网站名称',
  `keywords` text COMMENT '关键词',
  `desc` text COMMENT '描述',
  `is_log` int(1) NOT NULL DEFAULT '1' COMMENT '1开启日志0关闭',
  `file_type` varchar(200) DEFAULT NULL COMMENT '允许上传的类型',
  `file_size` bigint(20) DEFAULT NULL COMMENT '允许上传的最大值',
  `statistics` text COMMENT '统计代码',
  `black_ip` text COMMENT 'ip黑名单',
  `url_suffix` varchar(20) DEFAULT NULL COMMENT 'url伪静态后缀',
  KEY `web` (`web`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `me_webconfig`
--

INSERT INTO `me_webconfig` (`web`, `name`, `keywords`, `desc`, `is_log`, `file_type`, `file_size`, `statistics`, `black_ip`, `url_suffix`) VALUES
('web', '玛恩医生后台管理', '玛恩医生,后台管理', '玛恩医生 www.minebuty.top', 1, 'jpg,png,gif,mp4,zip,jpeg', 500, '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `me_wx_payment_line`
--

CREATE TABLE IF NOT EXISTS `me_wx_payment_line` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OPEN_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `DOCTOR_CODE` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `CD_SHOP` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `SRC` char(10) DEFAULT '',
  `AMOUNT` int(11) DEFAULT '0',
  `STATUS` char(10) DEFAULT 'PEDDING',
  `SUBMIT_DT` datetime DEFAULT CURRENT_TIMESTAMP,
  `RE_USER_NAME` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `CHECK_NAME` char(20) DEFAULT '',
  `DESCR` varchar(100) DEFAULT '',
  `SPBILL_CREATE_IP` char(32) DEFAULT '',
  `APP_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `MCH_ID` varchar(50) DEFAULT '',
  `NONCE_STR` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `SIGN` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `PARTNER_TRADE_NO` varchar(50) DEFAULT '',
  `TRADE_DT` date DEFAULT NULL,
  `RETURN_CODE` varchar(16) DEFAULT '',
  `RETURN_MSG` varchar(128) DEFAULT '',
  `RESULT_CODE` varchar(16) DEFAULT '',
  `ERR_CODE` varchar(32) DEFAULT '',
  `ERR_CODE_DES` varchar(128) DEFAULT '',
  `PAYMENT_NO` varchar(50) DEFAULT '',
  `PAYMENT_TIME` varchar(30) DEFAULT '',
  `UPDATE_DT` datetime DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `index0` (`OPEN_ID`,`TRADE_DT`),
  KEY `index1` (`STATUS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
