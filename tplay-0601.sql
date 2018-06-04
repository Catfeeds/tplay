-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 年 06 月 01 日 13:50
-- 服务器版本: 5.7.17
-- PHP 版本: 5.4.45

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` char(2) DEFAULT 'DT',
  `code` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `order_code` char(20) DEFAULT '',
  `src` char(10) DEFAULT 'O',
  `sub_src` char(5) DEFAULT '',
  `sub_src_descr` varchar(50) DEFAULT '',
  `amount` decimal(13,2) DEFAULT '0.00',
  `note` varchar(150) DEFAULT '',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index0` (`type`,`code`),
  KEY `index1` (`src`)
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
(1, 'Tplay', 'admin', '31c64b511d1e90fcda8519941c1bd660', 1, 1510885948, 1517622948, 1527474290, '127.0.0.1', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

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
(27, 50, 1, '127.0.0.1', '', 1527230279),
(28, 50, 1, '127.0.0.1', '', 1527231592),
(29, 50, 1, '127.0.0.1', '', 1527231729),
(30, 50, 1, '127.0.0.1', '', 1527474290);

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `src` char(5) DEFAULT 'V',
  `sub_id` bigint(20) DEFAULT '0',
  `title` varchar(50) DEFAULT '',
  `media_type` char(1) DEFAULT 'P',
  `suffix` char(4) DEFAULT '',
  `path` varchar(255) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index0` (`src`,`sub_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT '0',
  `code` char(20) DEFAULT '',
  `name` varchar(20) DEFAULT '',
  `head_img` varchar(255) DEFAULT '',
  `title` varchar(20) DEFAULT '',
  `hospital_code` varchar(20) DEFAULT '',
  `department_code` varchar(20) DEFAULT '',
  `status` char(1) DEFAULT 'I',
  `auth_type` char(1) DEFAULT '',
  `average_star` decimal(3,1) DEFAULT '0.0',
  `job_period` smallint(6) DEFAULT '0',
  `phone` char(11) DEFAULT '',
  `phone_cfm` char(1) DEFAULT 'N',
  `phone_visible` char(1) DEFAULT 'N',
  `info` text CHARACTER SET utf8mb4,
  `original_price` decimal(13,2) DEFAULT '0.00',
  `actual_price` decimal(13,2) DEFAULT '0.00',
  `aq_path` varchar(255) DEFAULT '',
  `aq_path_dt` datetime DEFAULT NULL,
  `aq_path_url` varchar(255) DEFAULT '',
  `gzh_qr_path` varchar(255) DEFAULT '',
  `src` char(1) DEFAULT '',
  `from_user_code` char(30) DEFAULT '',
  `register_ip` char(46) DEFAULT '0.0.0.0',
  `register_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_login_dt` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT '',
  `admin_user_id` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `me_doctor`
--

INSERT INTO `me_doctor` (`id`, `user_id`, `code`, `name`, `head_img`, `title`, `hospital_code`, `department_code`, `status`, `auth_type`, `average_star`, `job_period`, `phone`, `phone_cfm`, `phone_visible`, `info`, `original_price`, `actual_price`, `aq_path`, `aq_path_dt`, `aq_path_url`, `gzh_qr_path`, `src`, `from_user_code`, `register_ip`, `register_dt`, `last_login_dt`, `remark`, `admin_user_id`, `update_time`, `create_time`) VALUES
(1, 1, '0001', 'cc', '', '', '', '', 'I', '', '0.0', 0, '', 'N', 'N', NULL, '0.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-05-28 14:10:54', NULL, '', 0, NULL, NULL);

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_code` char(20) DEFAULT '',
  `type` char(2) DEFAULT 'DT',
  `follow_code` varchar(32) DEFAULT '',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`user_code`,`type`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `me_favorite`
--

INSERT INTO `me_favorite` (`id`, `user_code`, `type`, `follow_code`, `update_time`, `create_time`) VALUES
(1, 'u2018053125894470', 'DT', '0001', 1527748870, 1527748870),
(2, 'u2018053138866577', 'DT', '0001', 1527835874, 1527835874);

-- --------------------------------------------------------

--
-- 表的结构 `me_feedback`
--

CREATE TABLE IF NOT EXISTS `me_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_code` char(20) DEFAULT '',
  `doctor_code` char(20) DEFAULT '',
  `status` char(1) DEFAULT 'P',
  `content` varchar(500) DEFAULT '',
  `operate_dt` datetime DEFAULT NULL,
  `admin_user_id` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `me_feedback`
--

INSERT INTO `me_feedback` (`id`, `user_code`, `doctor_code`, `status`, `content`, `operate_dt`, `admin_user_id`, `update_time`, `create_time`) VALUES
(1, 'u2018053195635681', '', 'P', '有点小建议', NULL, 0, 1527746811, 1527746811),
(2, 'u2018053195635681', '', 'P', '有点小建议', NULL, 0, 1527746813, 1527746813);

-- --------------------------------------------------------

--
-- 表的结构 `me_hospital`
--

CREATE TABLE IF NOT EXISTS `me_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(50) DEFAULT 'DT',
  `contact` varchar(50) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_label`
--

CREATE TABLE IF NOT EXISTS `me_label` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` char(2) DEFAULT 'DT',
  `label_value` varchar(32) DEFAULT '',
  `url` varchar(255) DEFAULT '',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index0` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `me_label_rel`
--

CREATE TABLE IF NOT EXISTS `me_label_rel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` char(2) DEFAULT 'DT',
  `code` char(20) DEFAULT '',
  `label_id` bigint(20) DEFAULT '0',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index0` (`type`,`code`)
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key_code` varchar(150) DEFAULT '',
  `key_value` varchar(50) DEFAULT '',
  `key_type` varchar(50) DEFAULT '',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `index0` (`key_code`)
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `status` char(1) DEFAULT 'I',
  `phone` char(11) DEFAULT '',
  `phone_cfm` char(1) DEFAULT 'N',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `level` smallint(6) DEFAULT '0',
  `src` char(1) DEFAULT '',
  `from_user_code` char(30) DEFAULT '',
  `register_ip` char(46) DEFAULT '0.0.0.0',
  `register_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_login_dt` datetime DEFAULT NULL,
  `union_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `open_id_ur` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `open_id_dt` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `wx_nick_name` varchar(50) DEFAULT '',
  `wx_sex` char(1) DEFAULT '',
  `wx_head_img_url` varchar(250) DEFAULT '',
  `wx_province` varchar(15) DEFAULT '',
  `wx_city` varchar(15) DEFAULT '',
  `wx_country` varchar(15) DEFAULT '',
  `wx_subscribe` smallint(6) DEFAULT '0',
  `wx_scene` varchar(64) DEFAULT '',
  `wx_latitude` varchar(20) DEFAULT '',
  `wx_longitude` varchar(20) DEFAULT '',
  `wx_precision` varchar(20) DEFAULT '',
  `wx_location_dt` datetime DEFAULT NULL,
  `wx_qr_img` varchar(250) DEFAULT '',
  `wx_qr_url` varchar(250) DEFAULT '',
  `wx_qr_update_time` datetime DEFAULT NULL,
  `remark` varchar(100) DEFAULT '',
  `admin_user_id` int(11) DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`code`),
  KEY `index1` (`open_id_ur`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `me_user`
--

INSERT INTO `me_user` (`id`, `code`, `name`, `status`, `phone`, `phone_cfm`, `password`, `level`, `src`, `from_user_code`, `register_ip`, `register_dt`, `last_login_dt`, `union_id`, `open_id`, `open_id_ur`, `open_id_dt`, `wx_nick_name`, `wx_sex`, `wx_head_img_url`, `wx_province`, `wx_city`, `wx_country`, `wx_subscribe`, `wx_scene`, `wx_latitude`, `wx_longitude`, `wx_precision`, `wx_location_dt`, `wx_qr_img`, `wx_qr_url`, `wx_qr_update_time`, `remark`, `admin_user_id`, `update_time`, `create_time`) VALUES
(1, 'u2018053125894470', 'hh1', 'I', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 14:39:41', NULL, '', '', '12345', '', 'hh', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1527748781, 1527748781),
(2, 'u2018053138866577', 'hh6', 'I', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 17:29:13', NULL, '', '', '123456', '', 'hh6', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1527758953, 1527758953);

-- --------------------------------------------------------

--
-- 表的结构 `me_user_patient`
--

CREATE TABLE IF NOT EXISTS `me_user_patient` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT '0',
  `status` char(1) DEFAULT 'A',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `phone` char(11) DEFAULT '',
  `phone_cfm` char(1) DEFAULT 'N',
  `level` smallint(6) DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `height` smallint(6) DEFAULT '0',
  `weight` smallint(6) DEFAULT '0',
  `age` smallint(6) DEFAULT '0',
  `sex` smallint(6) DEFAULT '0',
  `is_allergy` char(1) DEFAULT 'N',
  `medical_history` varchar(2000) DEFAULT '',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `me_user_patient`
--

INSERT INTO `me_user_patient` (`id`, `user_id`, `status`, `name`, `phone`, `phone_cfm`, `level`, `birthday`, `height`, `weight`, `age`, `sex`, `is_allergy`, `medical_history`, `update_time`, `create_time`) VALUES
(1, 3, 'A', 'hh', '13594855872', 'N', 0, NULL, 0, 0, 0, 0, 'N', '', 1527737623, 1527734590),
(2, 2, 'A', 'hh', '13594855872', 'N', 0, NULL, 0, 0, 0, 0, 'N', '', 1527836481, 1527836481);

-- --------------------------------------------------------

--
-- 表的结构 `me_visit`
--

CREATE TABLE IF NOT EXISTS `me_visit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_code` char(20) DEFAULT '',
  `doctor_code` char(20) DEFAULT '',
  `status` char(1) DEFAULT 'P',
  `origianl_price` decimal(13,2) DEFAULT '0.00',
  `actual_pay` decimal(13,2) DEFAULT '0.00',
  `use_coupon` char(1) DEFAULT 'N',
  `inquiry_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `inquiry_dt_last` datetime DEFAULT NULL,
  `reply_dt` datetime DEFAULT NULL,
  `reply_dt_last` datetime DEFAULT NULL,
  `close_dt` datetime DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`user_code`,`status`),
  KEY `index1` (`doctor_code`,`status`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `me_visit`
--

INSERT INTO `me_visit` (`id`, `user_code`, `doctor_code`, `status`, `origianl_price`, `actual_pay`, `use_coupon`, `inquiry_dt`, `inquiry_dt_last`, `reply_dt`, `reply_dt_last`, `close_dt`, `update_time`, `create_time`) VALUES
(1, 'u2018053125894470', '0001', 'P', '39.00', NULL, 'N', '2018-05-31 16:10:55', NULL, NULL, NULL, NULL, 1527754255, 1527754255),
(2, 'u2018053125894470', '0001', 'P', '39.00', NULL, 'N', '2018-05-31 17:28:46', NULL, NULL, NULL, NULL, 1527758926, 1527758926),
(3, 'u2018053138866577', '0001', 'P', '39.00', NULL, 'N', '2018-05-31 17:29:24', NULL, NULL, NULL, NULL, 1527760375, 1527758964);

-- --------------------------------------------------------

--
-- 表的结构 `me_visit_line`
--

CREATE TABLE IF NOT EXISTS `me_visit_line` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `visit_id` bigint(20) DEFAULT '0',
  `user_code` char(20) DEFAULT '',
  `doctor_code` char(20) DEFAULT '',
  `status` char(1) DEFAULT 'A',
  `type` char(1) DEFAULT 'T',
  `content` text CHARACTER SET utf8mb4,
  `src` char(1) DEFAULT '',
  `visible` char(1) DEFAULT '',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`visit_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `me_visit_line`
--

INSERT INTO `me_visit_line` (`id`, `visit_id`, `user_code`, `doctor_code`, `status`, `type`, `content`, `src`, `visible`, `update_time`, `create_time`) VALUES
(1, 1, 'u2018053125894470', '', 'A', 'T', '内容内容123', '', '', 1527754255, 1527754255),
(2, 2, 'u2018053125894470', '', 'A', 'T', '内容内容', '', '', 1527758926, 1527758926),
(3, 3, 'u2018053138866577', '', 'A', 'T', '内容内容', '', '', 1527758964, 1527758964),
(4, 3, 'u2018053138866577', '', 'A', 'T', '内容内容456', '', '', 1527760375, 1527760375);

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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `open_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `doctor_code` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `cd_shop` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `src` char(10) DEFAULT '',
  `amount` int(11) DEFAULT '0',
  `status` char(10) DEFAULT 'PEDDING',
  `submit_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `re_user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `check_name` char(20) DEFAULT '',
  `descr` varchar(100) DEFAULT '',
  `spbill_create_ip` char(32) DEFAULT '',
  `app_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `mch_id` varchar(50) DEFAULT '',
  `nonce_str` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `sign` char(32) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `partner_trade_no` varchar(50) DEFAULT '',
  `trade_dt` date DEFAULT NULL,
  `return_code` varchar(16) DEFAULT '',
  `return_msg` varchar(128) DEFAULT '',
  `result_code` varchar(16) DEFAULT '',
  `err_code` varchar(32) DEFAULT '',
  `err_code_des` varchar(128) DEFAULT '',
  `payment_no` varchar(50) DEFAULT '',
  `payment_time` varchar(30) DEFAULT '',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `remark` varchar(200) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `index0` (`open_id`,`trade_dt`),
  KEY `index1` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
