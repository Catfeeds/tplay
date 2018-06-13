-- phpMyAdmin SQL Dump
-- version phpStudy 2014
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2018 �?06 �?13 �?06:23
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` char(2) DEFAULT 'DT',
  `code` char(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT '',
  `order_code` char(20) DEFAULT '',
  `src` char(10) DEFAULT 'O',
  `sub_src` char(5) DEFAULT '',
  `sub_src_descr` varchar(50) DEFAULT '',
  `amount` decimal(13,2) DEFAULT '0.00',
  `note` varchar(150) DEFAULT '',
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`type`,`code`),
  KEY `index1` (`src`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- 转存表中的数据 `me_account`
--

INSERT INTO `me_account` (`id`, `type`, `code`, `order_code`, `src`, `sub_src`, `sub_src_descr`, `amount`, `note`, `update_time`, `create_time`) VALUES
(1, 'DT', '0008', 'o20180608180339457', 'O', '', '', '39.00', '', 1528452219, 1528452219),
(2, 'DT', '0009', 'fdgdfgfd', 'O', '', '', '100.00', '', 1528452219, 1528452219),
(3, 'DT', '0009', 'fdgdfgfdsfd', 'O', '', '', '120.00', '', 1528452219, 1528452219),
(4, 'DT', '0009', 'fdgdf232gfdsfd', 'O', '', '', '150.00', '', 1528452219, 1528452219),
(5, 'DT', '0009', 'fdsdsf232gfdsfd', 'O', '', '', '250.00', '', 1528454519, 1528454519),
(6, 'DT', '0009', 'fdsdsf232gfdsfd', 'O', '', '', '250.00', '', 1528454519, 1528454519),
(7, 'DT', '0009', 'fdsdsf232gfdsfd', 'O', '', '', '250.00', '', 1528454519, 1528454519),
(8, 'DT', '0009', 'fdsdsf232gfdsfd', 'O', '', '', '250.00', '', 1528454519, 1528454519),
(9, 'DT', '0009', 'fdsdsf232gfdsfd', 'O', '', '', '250.00', '', 1528454519, 1528454519),
(10, 'DT', '0009', 'o20180609123602100', 'O', '', '', '39.00', '', 1528518962, 1528518962),
(11, 'DT', '0009', 'o20180609123732901', 'O', '', '', '39.00', '', 1528519052, 1528519052),
(12, 'DT', '0009', 'o20180609123744129', 'O', '', '', '39.00', '', 1528519064, 1528519064),
(13, 'DT', '0009', 'o20180609123918621', 'O', '', '', '39.00', '', 1528519158, 1528519158),
(14, 'DT', '0009', 'o20180609123953266', 'O', '', '', '39.00', '', 1528519193, 1528519193),
(15, 'DT', '0009', 'o20180609124000235', 'O', '', '', '39.00', '', 1528519200, 1528519200),
(16, 'DT', '0009', 'o20180609124030701', 'O', '', '', '39.00', '', 1528519230, 1528519230),
(17, 'DT', '0009', 'o20180609124033235', 'O', '', '', '39.00', '', 1528519233, 1528519233),
(18, 'DT', '0011', 'o20180610233816837', 'O', '', '', '900.00', '', 1528645096, 1528645096),
(19, 'DT', '0010', 'o20180610233854265', 'O', '', '', '2000.00', '', 1528645134, 1528645134),
(20, 'DT', '0010', 'o20180611001858941', 'O', '', '', '2000.00', '', 1528647538, 1528647538),
(21, 'DT', '0010', 'o20180611211602367', 'O', '', '', '2000.00', '', 1528722962, 1528722962),
(22, 'DT', '0010', 'o20180611213422917', 'O', '', '', '2000.00', '', 1528724062, 1528724062),
(23, 'DT', '0010', 'o20180611222137995', 'O', '', '', '2000.00', '', 1528726897, 1528726897),
(24, 'DT', '0010', 'o20180611225447351', 'O', '', '', '2000.00', '', 1528728887, 1528728887),
(25, 'DT', '0011', 'o20180612145359801', 'O', '', '', '900.00', '', 1528786439, 1528786439),
(26, 'DT', '0011', 'o20180612145409965', 'O', '', '', '900.00', '', 1528786449, 1528786449),
(27, 'DT', '0010', 'o20180612211300404', 'O', '', '', '2000.00', '', 1528809180, 1528809180),
(28, 'DT', '0010', 'o20180613001814674', 'O', '', '', '2000.00', '', 1528820294, 1528820294),
(29, 'DT', '0009', '', 'W', '', '', '-1000.00', '', 1528821253, 1528821253),
(30, 'DT', '0000112', 'o20180613131555749', 'O', '', '', '10.00', '', 1528866955, 1528866955),
(31, 'DT', '0000112', 'o20180613131605560', 'O', '', '', '10.00', '', 1528866965, 1528866965),
(32, 'DT', '0000112', 'o20180613132806351', 'O', '', '', '10.00', '', 1528867686, 1528867686);

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
(1, 'admin', 'admin', 'e391919b3bf0b4fb29da3c1c35e25d94', 1, 1510885948, 1528706502, 1528869999, '113.204.96.37', 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

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
(30, 50, 1, '127.0.0.1', '', 1527474290),
(31, 50, 1, '127.0.0.1', '', 1528076604),
(32, 8, 1, '127.0.0.1', '', 1528077117),
(33, 49, 1, '127.0.0.1', '2', 1528091261),
(34, 49, 1, '127.0.0.1', '3', 1528095105),
(35, 49, 1, '127.0.0.1', '4', 1528095893),
(36, 49, 1, '127.0.0.1', '5', 1528097647),
(37, 49, 1, '127.0.0.1', '6', 1528097660),
(38, 50, 1, '113.251.18.85', '', 1528107562),
(39, 50, 1, '113.204.96.37', '', 1528186499),
(40, 50, 1, '113.251.18.9', '', 1528207349),
(41, 49, 1, '113.251.18.9', '7', 1528214811),
(42, 49, 1, '113.251.18.9', '8', 1528215954),
(43, 49, 1, '113.251.18.9', '9', 1528216073),
(44, 50, 1, '113.204.96.37', '', 1528277231),
(45, 50, 1, '113.251.16.61', '', 1528292278),
(46, 49, 1, '113.251.16.61', '10', 1528292409),
(47, 49, 1, '113.251.21.171', '11', 1528346632),
(48, 49, 1, '113.251.21.171', '12', 1528346668),
(49, 50, 1, '113.251.17.125', '', 1528420688),
(50, 50, 1, '113.251.17.125', '', 1528438679),
(51, 50, 1, '113.251.20.201', '', 1528470172),
(52, 50, 1, '113.251.20.201', '', 1528471380),
(53, 4, 1, '113.251.20.201', '41', 1528471408),
(54, 49, 1, '113.251.20.201', '13', 1528471660),
(55, 49, 1, '113.251.20.201', '14', 1528472253),
(56, 49, 1, '113.251.20.201', '15', 1528472953),
(57, 50, 1, '113.250.249.54', '', 1528515992),
(58, 50, 1, '113.251.20.201', '', 1528518602),
(59, 50, 1, '113.251.19.100', '', 1528608333),
(60, 11, 1, '113.251.19.100', '', 1528632260),
(61, 50, 1, '113.251.18.232', '', 1528684684),
(62, 7, 1, '113.251.18.232', '1', 1528706502),
(63, 50, 1, '113.251.19.126', '', 1528729908),
(64, 50, 1, '113.204.96.37', '', 1528772041),
(65, 50, 1, '113.204.96.37', '', 1528794449),
(66, 50, 1, '113.251.19.126', '', 1528815790),
(67, 50, 1, '113.250.252.60', '', 1528816813),
(68, 50, 1, '113.250.252.60', '', 1528817210),
(69, 49, 1, '113.250.252.60', '149', 1528820762),
(70, 49, 1, '113.250.252.60', '150', 1528821138),
(71, 4, 1, '113.251.17.9', '61', 1528854601),
(72, 50, 1, '113.251.17.9', '', 1528868322),
(73, 50, 1, '113.204.96.37', '', 1528869999);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='系统菜单表' AUTO_INCREMENT=62 ;

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
(41, '附件', 'admin', 'attachment', 'index', '', '附件管理。', 1, 2, 1, 1516953306, 1528471408, 'fa-cube', 0, 0),
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
(60, '提现列表', 'admin', 'withdraw', 'index', '', '', 1, 2, 59, 1527077601, 1527077601, 'fa-list-ul', 0, 0),
(61, '待审用户', 'admin', 'doctor', 'user', '', '', 1, 2, 53, 1528854601, 1528854601, 'fa-user-circle-o', 0, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表' AUTO_INCREMENT=161 ;

--
-- 转存表中的数据 `me_attachment`
--

INSERT INTO `me_attachment` (`id`, `module`, `filename`, `filepath`, `filesize`, `fileext`, `user_id`, `uploadip`, `status`, `create_time`, `admin_id`, `audit_time`, `use`, `download`) VALUES
(1, 'admin', '79811855a6c06de53047471c4ff82a36.jpg', '\\uploads\\admin\\admin_thumb\\20180104\\79811855a6c06de53047471c4ff82a36.jpg', 13781, 'jpg', 1, '127.0.0.1', 1, 1515046060, 1, 1515046060, 'admin_thumb', 0),
(2, 'admin', '0db9c637a11c5afb38f19eb09d465c06.jpg', '\\uploads\\admin\\doctor_thumb\\20180604\\0db9c637a11c5afb38f19eb09d465c06.jpg', 1912, 'jpg', 1, '127.0.0.1', 1, 1528091261, 1, 1528091261, 'doctor_thumb', 0),
(3, 'admin', 'ebff115ef1ff22a3f117291b5060531d.jpg', '\\uploads\\admin\\doctor_thumb\\20180604\\ebff115ef1ff22a3f117291b5060531d.jpg', 1912, 'jpg', 1, '127.0.0.1', 1, 1528095105, 1, 1528095105, 'doctor_thumb', 0),
(4, 'admin', 'b5f7ad5e7e9963eb777f7dc96d2ce558.png', '\\uploads\\admin\\doctor_head_img\\20180604\\b5f7ad5e7e9963eb777f7dc96d2ce558.png', 2479, 'png', 1, '127.0.0.1', 1, 1528095893, 1, 1528095893, 'doctor_head_img', 0),
(5, 'admin', '515bdd83378354faebe17a23915a62e3.png', '\\uploads\\admin\\doctor_head_img\\20180604\\515bdd83378354faebe17a23915a62e3.png', 268342, 'png', 1, '127.0.0.1', 1, 1528097647, 1, 1528097647, 'doctor_head_img', 0),
(6, 'admin', 'a3e6cad0241c4ad81ea65c40b3301f37.jpg', '\\uploads\\admin\\doctor_head_img\\20180604\\a3e6cad0241c4ad81ea65c40b3301f37.jpg', 3831, 'jpg', 1, '127.0.0.1', 1, 1528097660, 1, 1528097660, 'doctor_head_img', 0),
(7, 'admin', 'aadd8331f82cdec9dcb0e9410249bc43.jpg', '\\uploads\\admin\\doctor_head_img\\20180606\\aadd8331f82cdec9dcb0e9410249bc43.jpg', 121925, 'jpg', 1, '113.251.18.9', 1, 1528214811, 1, 1528214811, 'doctor_head_img', 0),
(8, 'admin', 'c3e881c8469cf011241c9f9f3be064a0.jpg', '\\uploads\\admin\\doctor_head_img\\20180606\\c3e881c8469cf011241c9f9f3be064a0.jpg', 5951, 'jpg', 1, '113.251.18.9', 1, 1528215954, 1, 1528215954, 'doctor_head_img', 0),
(9, 'admin', '7ba94d91185fa50431af492369013a42.jpg', '\\uploads\\admin\\doctor_head_img\\20180606\\7ba94d91185fa50431af492369013a42.jpg', 54346, 'jpg', 1, '113.251.18.9', 1, 1528216073, 1, 1528216073, 'doctor_head_img', 0),
(10, 'admin', '9888eee7ca9805158304b2464224d559.jpg', '\\uploads\\admin\\doctor_head_img\\20180606\\9888eee7ca9805158304b2464224d559.jpg', 121925, 'jpg', 1, '113.251.16.61', 1, 1528292409, 1, 1528292409, 'doctor_head_img', 0),
(11, 'admin', '3d090b62b9ed78ef0895de00c213adf0.jpg', '\\uploads\\admin\\doctor_head_img\\20180607\\3d090b62b9ed78ef0895de00c213adf0.jpg', 10137, 'jpg', 1, '113.251.21.171', 1, 1528346632, 1, 1528346632, 'doctor_head_img', 0),
(12, 'admin', '844badc810dfac06286d2c41d2f457de.jpg', '\\uploads\\admin\\doctor_head_img\\20180607\\844badc810dfac06286d2c41d2f457de.jpg', 9044, 'jpg', 1, '113.251.21.171', 1, 1528346668, 1, 1528346668, 'doctor_head_img', 0),
(13, 'admin', 'e4d657bafa480514ab14649859346f8b.jpg', '\\uploads\\admin\\doctor_head_img\\20180608\\e4d657bafa480514ab14649859346f8b.jpg', 5951, 'jpg', 1, '113.251.20.201', 1, 1528471660, 1, 1528471660, 'doctor_head_img', 0),
(14, 'admin', '173c74d9a2a88d3a82359caf8de28839.jpg', '\\uploads\\admin\\doctor_head_img\\20180608\\173c74d9a2a88d3a82359caf8de28839.jpg', 54346, 'jpg', 1, '113.251.20.201', 1, 1528472253, 1, 1528472253, 'doctor_head_img', 0),
(15, 'admin', '5820f5fb230a688015c66decd6d1277d.jpg', '\\uploads\\admin\\doctor_head_img\\20180608\\5820f5fb230a688015c66decd6d1277d.jpg', 5951, 'jpg', 1, '113.251.20.201', 1, 1528472953, 1, 1528472953, 'doctor_head_img', 0),
(16, 'index', 'cd48f3f67e202918732f64938351e5ea.jpg', '\\uploads\\index\\index_questions\\20180610\\cd48f3f67e202918732f64938351e5ea.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528630935, 0, 1528630935, 'index_questions', 0),
(17, 'index', 'a13b8988e74a22a9fa57b55e26e8551f.gif', '\\uploads\\index\\index_questions\\20180610\\a13b8988e74a22a9fa57b55e26e8551f.gif', 3372, 'gif', 0, '125.86.95.196', 1, 1528632159, 0, 1528632159, 'index_questions', 0),
(18, 'index', '1c7e80f13631ec04e2b9ac7c21de90ea.png', '\\uploads\\index\\index_questions\\20180610\\1c7e80f13631ec04e2b9ac7c21de90ea.png', 1156445, 'png', 0, '125.86.95.196', 1, 1528632314, 0, 1528632314, 'index_questions', 0),
(19, 'index', '2f8198168895d7645fd455104c91bcda.mp4', '\\uploads\\index\\index_questions\\20180610\\2f8198168895d7645fd455104c91bcda.mp4', 2005078, 'mp4', 0, '125.86.95.196', 1, 1528632569, 0, 1528632569, 'index_questions', 0),
(20, 'index', 'c910595a69776c8030ffa1859f539446.png', '\\uploads\\index\\index_questions\\20180610\\c910595a69776c8030ffa1859f539446.png', 1156445, 'png', 0, '125.86.95.196', 1, 1528633288, 0, 1528633288, 'index_questions', 0),
(21, 'index', 'df00877df1f41b19bda03b7983b097bb.png', '\\uploads\\index\\index_questions\\20180610\\df00877df1f41b19bda03b7983b097bb.png', 613259, 'png', 0, '125.86.95.196', 1, 1528633475, 0, 1528633475, 'index_questions', 0),
(22, 'index', '4482d4f00c314fa2a46670d1300c5e32.png', '\\uploads\\index\\index_questions\\20180610\\4482d4f00c314fa2a46670d1300c5e32.png', 613259, 'png', 0, '125.86.95.196', 1, 1528633532, 0, 1528633532, 'index_questions', 0),
(23, 'index', 'ca205f5864104e3f9a0d67f7719f387d.jpg', '\\uploads\\index\\index_questions\\20180610\\ca205f5864104e3f9a0d67f7719f387d.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528633614, 0, 1528633614, 'index_questions', 0),
(24, 'index', '46bd78e8b274fa8f9677a1cbada35324.jpg', '\\uploads\\index\\index_questions\\20180610\\46bd78e8b274fa8f9677a1cbada35324.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528633697, 0, 1528633697, 'index_questions', 0),
(25, 'index', '292531375ad120a4463ec8b8164d3ceb.jpg', '\\uploads\\index\\index_questions\\20180610\\292531375ad120a4463ec8b8164d3ceb.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528633738, 0, 1528633738, 'index_questions', 0),
(26, 'index', 'cef3e75dba8eb821bdbaa07507d17796.jpg', '\\uploads\\index\\index_questions\\20180610\\cef3e75dba8eb821bdbaa07507d17796.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528633812, 0, 1528633812, 'index_questions', 0),
(27, 'index', '5abc4a7da54579c1f779e69cd88e5674.jpg', '\\uploads\\index\\index_questions\\20180610\\5abc4a7da54579c1f779e69cd88e5674.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528638052, 0, 1528638052, 'index_questions', 0),
(28, 'index', 'f65b0cc69a7d06fe3841294dc4ee08b0.jpg', '\\uploads\\index\\index_questions\\20180610\\f65b0cc69a7d06fe3841294dc4ee08b0.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528638078, 0, 1528638078, 'index_questions', 0),
(29, 'index', '6baf4649c532043e3cf62f6f1eeb2506.jpg', '\\uploads\\index\\index_questions\\20180610\\6baf4649c532043e3cf62f6f1eeb2506.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528638532, 0, 1528638532, 'index_questions', 0),
(30, 'index', 'c24914f2e510a934eb1478d10b899c76.jpg', '\\uploads\\index\\index_questions\\20180610\\c24914f2e510a934eb1478d10b899c76.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528638561, 0, 1528638561, 'index_questions', 0),
(31, 'index', '672e94f04471c92d6e449a3c530f6ff9.jpg', '\\uploads\\index\\index_questions\\20180610\\672e94f04471c92d6e449a3c530f6ff9.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528638593, 0, 1528638593, 'index_questions', 0),
(32, 'index', '2a6186247fc48285dd516b3946ceed25.jpg', '\\uploads\\index\\index_questions\\20180610\\2a6186247fc48285dd516b3946ceed25.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528638640, 0, 1528638640, 'index_questions', 0),
(33, 'index', '2d8babed223c35710ec4c7d2a8e88763.jpg', '\\uploads\\index\\index_questions\\20180610\\2d8babed223c35710ec4c7d2a8e88763.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528638781, 0, 1528638781, 'index_questions', 0),
(34, 'index', '0cdec7420df6ad5f5ee363558811c28b.gif', '\\uploads\\index\\index_questions\\20180610\\0cdec7420df6ad5f5ee363558811c28b.gif', 3372, 'gif', 0, '125.86.95.196', 1, 1528638813, 0, 1528638813, 'index_questions', 0),
(35, 'index', '62a968fef75a62c16b0d8fcf92af9645.jpg', '\\uploads\\index\\index_questions\\20180610\\62a968fef75a62c16b0d8fcf92af9645.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528638827, 0, 1528638827, 'index_questions', 0),
(36, 'index', '80bc84219e73b10ded967a1444648e07.jpg', '\\uploads\\index\\index_questions\\20180610\\80bc84219e73b10ded967a1444648e07.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528638963, 0, 1528638963, 'index_questions', 0),
(37, 'index', 'c2fc04bc7af23a8ff58f24acc7543d68.jpg', '\\uploads\\index\\index_questions\\20180610\\c2fc04bc7af23a8ff58f24acc7543d68.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639002, 0, 1528639002, 'index_questions', 0),
(38, 'index', '6e1fcedc21cfb12f5438f0fb16e65865.jpg', '\\uploads\\index\\index_questions\\20180610\\6e1fcedc21cfb12f5438f0fb16e65865.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639055, 0, 1528639055, 'index_questions', 0),
(39, 'index', 'f96ea289be57e1a70d040cff01379cf4.jpg', '\\uploads\\index\\index_questions\\20180610\\f96ea289be57e1a70d040cff01379cf4.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639119, 0, 1528639119, 'index_questions', 0),
(40, 'index', '1a80c98d3d18d75afd587aeeb66dd711.jpg', '\\uploads\\index\\index_questions\\20180610\\1a80c98d3d18d75afd587aeeb66dd711.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639166, 0, 1528639166, 'index_questions', 0),
(41, 'index', '3e06dabc6199ef42549cec8c55ed30e2.jpg', '\\uploads\\index\\index_questions\\20180610\\3e06dabc6199ef42549cec8c55ed30e2.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639224, 0, 1528639224, 'index_questions', 0),
(42, 'index', '6ccb6606f589694fa9b3c6cef6972112.jpg', '\\uploads\\index\\index_questions\\20180610\\6ccb6606f589694fa9b3c6cef6972112.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639248, 0, 1528639248, 'index_questions', 0),
(43, 'index', '3668a010d90b4016a92a12af32d4ce36.jpg', '\\uploads\\index\\index_questions\\20180610\\3668a010d90b4016a92a12af32d4ce36.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639315, 0, 1528639315, 'index_questions', 0),
(44, 'index', '7793d8320a0dabf974eb24bef901184a.png', '\\uploads\\index\\index_questions\\20180610\\7793d8320a0dabf974eb24bef901184a.png', 613259, 'png', 0, '125.86.95.196', 1, 1528639399, 0, 1528639399, 'index_questions', 0),
(45, 'index', '12a2e09715e43f9f499b3ec32d5ff56a.jpg', '\\uploads\\index\\index_questions\\20180610\\12a2e09715e43f9f499b3ec32d5ff56a.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639482, 0, 1528639482, 'index_questions', 0),
(46, 'index', '88402297af65ede3bcbec131a5aaa459.jpg', '\\uploads\\index\\index_questions\\20180610\\88402297af65ede3bcbec131a5aaa459.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639547, 0, 1528639547, 'index_questions', 0),
(47, 'index', 'e744d7c5a1b8b18a726a69f7e576f3f0.jpg', '\\uploads\\index\\index_questions\\20180610\\e744d7c5a1b8b18a726a69f7e576f3f0.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639661, 0, 1528639661, 'index_questions', 0),
(48, 'index', 'bb0bdd31fae9e9ae4359ec39f07c3155.jpg', '\\uploads\\index\\index_questions\\20180610\\bb0bdd31fae9e9ae4359ec39f07c3155.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639706, 0, 1528639706, 'index_questions', 0),
(49, 'index', '73c68fe9d64095be2ce0226db0dc40e4.jpg', '\\uploads\\index\\index_questions\\20180610\\73c68fe9d64095be2ce0226db0dc40e4.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639784, 0, 1528639784, 'index_questions', 0),
(50, 'index', '2c57a9eade39149a65efb63405ca0b15.jpg', '\\uploads\\index\\index_questions\\20180610\\2c57a9eade39149a65efb63405ca0b15.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639856, 0, 1528639856, 'index_questions', 0),
(51, 'index', '27d644b1d3d5e277690fcc2c657ecb36.jpg', '\\uploads\\index\\index_questions\\20180610\\27d644b1d3d5e277690fcc2c657ecb36.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528639969, 0, 1528639969, 'index_questions', 0),
(52, 'index', 'fa568936cbab4db9d7f3089245950a9f.jpg', '\\uploads\\index\\index_questions\\20180610\\fa568936cbab4db9d7f3089245950a9f.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528640090, 0, 1528640090, 'index_questions', 0),
(53, 'index', 'c33a706d7284274cd1ebc40d9d5082ff.jpg', '\\uploads\\index\\index_questions\\20180610\\c33a706d7284274cd1ebc40d9d5082ff.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528640218, 0, 1528640218, 'index_questions', 0),
(54, 'index', '49269fa39f0b65adba4e02b5c1f4b88c.png', '\\uploads\\index\\index_questions\\20180610\\49269fa39f0b65adba4e02b5c1f4b88c.png', 1156445, 'png', 0, '125.86.95.196', 1, 1528640266, 0, 1528640266, 'index_questions', 0),
(55, 'index', '4ae6cb29a3a62f14ac16e8972830f4f4.png', '\\uploads\\index\\index_questions\\20180610\\4ae6cb29a3a62f14ac16e8972830f4f4.png', 613259, 'png', 0, '125.86.95.196', 1, 1528640279, 0, 1528640279, 'index_questions', 0),
(56, 'index', '33f44897aca8c897024c45a9aa3327a8.jpg', '\\uploads\\index\\index_questions\\20180610\\33f44897aca8c897024c45a9aa3327a8.jpg', 43107, 'jpg', 0, '125.86.95.196', 1, 1528640289, 0, 1528640289, 'index_questions', 0),
(57, 'index', 'ec357123652c065c6eb5d6bf6ecf02aa.jpg', '\\uploads\\index\\index_questions\\20180610\\ec357123652c065c6eb5d6bf6ecf02aa.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528640425, 0, 1528640425, 'index_questions', 0),
(58, 'index', '8326e010f6757176559f25cc22e99038.png', '\\uploads\\index\\index_questions\\20180610\\8326e010f6757176559f25cc22e99038.png', 613259, 'png', 0, '125.86.95.196', 1, 1528640429, 0, 1528640429, 'index_questions', 0),
(59, 'index', '44322404f249da2195bdfc5ddc5314ae.jpg', '\\uploads\\index\\index_questions\\20180610\\44322404f249da2195bdfc5ddc5314ae.jpg', 43107, 'jpg', 0, '125.86.95.196', 1, 1528640434, 0, 1528640434, 'index_questions', 0),
(60, 'index', '93e92d96083370c85678da7172d9387c.jpg', '\\uploads\\index\\index_questions\\20180610\\93e92d96083370c85678da7172d9387c.jpg', 63288, 'jpg', 0, '125.86.95.196', 1, 1528640440, 0, 1528640440, 'index_questions', 0),
(61, 'index', '33541c554b05a00a85c7e083b10daa8e.png', '\\uploads\\index\\index_questions\\20180610\\33541c554b05a00a85c7e083b10daa8e.png', 158321, 'png', 0, '125.86.95.196', 1, 1528640449, 0, 1528640449, 'index_questions', 0),
(62, 'index', '20e058fa3f5806bec9e1728329a86cd0.png', '\\uploads\\index\\index_questions\\20180610\\20e058fa3f5806bec9e1728329a86cd0.png', 2321, 'png', 0, '125.86.95.196', 1, 1528640456, 0, 1528640456, 'index_questions', 0),
(63, 'index', 'fed3fc919cdd4b0328ea864702f4bfbe.png', '\\uploads\\index\\index_questions\\20180610\\fed3fc919cdd4b0328ea864702f4bfbe.png', 170072, 'png', 0, '125.86.95.196', 1, 1528640462, 0, 1528640462, 'index_questions', 0),
(64, 'index', '27f261d49816c0ca5f9969262aee9495.png', '\\uploads\\index\\index_questions\\20180610\\27f261d49816c0ca5f9969262aee9495.png', 43096, 'png', 0, '125.86.95.196', 1, 1528640468, 0, 1528640468, 'index_questions', 0),
(65, 'index', 'e76bc118f14b88a0e8065933a24de1dc.png', '\\uploads\\index\\index_questions\\20180610\\e76bc118f14b88a0e8065933a24de1dc.png', 613259, 'png', 0, '125.86.95.196', 1, 1528643548, 0, 1528643548, 'index_questions', 0),
(66, 'index', '113c4e0f8a3e34b00f457730c1347ac2.jpg', '\\uploads\\index\\index_questions\\20180610\\113c4e0f8a3e34b00f457730c1347ac2.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528643556, 0, 1528643556, 'index_questions', 0),
(67, 'index', '8ec713180cfbd6e2c2f53ecbf6cac765.jpg', '\\uploads\\index\\index_questions\\20180610\\8ec713180cfbd6e2c2f53ecbf6cac765.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528643651, 0, 1528643651, 'index_questions', 0),
(68, 'index', 'de7cf47a0e5fe3b1decabbb91e7e2278.jpg', '\\uploads\\index\\index_questions\\20180610\\de7cf47a0e5fe3b1decabbb91e7e2278.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528643656, 0, 1528643656, 'index_questions', 0),
(69, 'index', '7c987ca89c2a18bf7f858ed05aaa4a8b.jpg', '\\uploads\\index\\index_questions\\20180610\\7c987ca89c2a18bf7f858ed05aaa4a8b.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528643763, 0, 1528643763, 'index_questions', 0),
(70, 'index', 'b6ec2b7efc00016a7fa6206fb883d148.jpg', '\\uploads\\index\\index_questions\\20180610\\b6ec2b7efc00016a7fa6206fb883d148.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528644096, 0, 1528644096, 'index_questions', 0),
(71, 'index', '864ba1824e413ca2281eea5294d8aa27.jpg', '\\uploads\\index\\index_questions\\20180610\\864ba1824e413ca2281eea5294d8aa27.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528644100, 0, 1528644100, 'index_questions', 0),
(72, 'index', '5ad02fd83dae1de6642629f188000434.jpg', '\\uploads\\index\\index_questions\\20180610\\5ad02fd83dae1de6642629f188000434.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528644446, 0, 1528644446, 'index_questions', 0),
(73, 'index', 'ddb7e0fddbf49f8e9284d25876d39967.jpg', '\\uploads\\index\\index_questions\\20180610\\ddb7e0fddbf49f8e9284d25876d39967.jpg', 26902, 'jpg', 0, '125.86.95.196', 1, 1528644523, 0, 1528644523, 'index_questions', 0),
(74, 'index', '1272cb759aa9520d00eb7d9439c381cb.jpg', '\\uploads\\index\\index_questions\\20180610\\1272cb759aa9520d00eb7d9439c381cb.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528644702, 0, 1528644702, 'index_questions', 0),
(75, 'index', 'a73a420aa3c11ebb51acc069053b7d95.jpg', '\\uploads\\index\\index_questions\\20180610\\a73a420aa3c11ebb51acc069053b7d95.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528644784, 0, 1528644784, 'index_questions', 0),
(76, 'index', '5c850cdcb9bfb7a635fae2e0c28e4765.png', '\\uploads\\index\\index_questions\\20180610\\5c850cdcb9bfb7a635fae2e0c28e4765.png', 613259, 'png', 0, '125.86.95.196', 1, 1528644809, 0, 1528644809, 'index_questions', 0),
(77, 'index', 'db5a938fe8fd36eec962ced60f0eaba2.jpg', '\\uploads\\index\\index_questions\\20180610\\db5a938fe8fd36eec962ced60f0eaba2.jpg', 13625, 'jpg', 0, '125.86.95.196', 1, 1528645083, 0, 1528645083, 'index_questions', 0),
(78, 'index', '089effc5b92af1490fe30b5914f8b70c.png', '\\uploads\\index\\index_questions\\20180610\\089effc5b92af1490fe30b5914f8b70c.png', 312586, 'png', 0, '125.86.95.196', 1, 1528645091, 0, 1528645091, 'index_questions', 0),
(79, 'index', '637ca5af6c4bf0c2f80132d43092bbe8.png', '\\uploads\\index\\index_questions\\20180610\\637ca5af6c4bf0c2f80132d43092bbe8.png', 293691, 'png', 0, '125.86.95.196', 1, 1528645128, 0, 1528645128, 'index_questions', 0),
(80, 'index', '9c9a84581014a14830302f3ff25f5850.png', '\\uploads\\index\\index_questions\\20180610\\9c9a84581014a14830302f3ff25f5850.png', 312586, 'png', 0, '125.86.95.196', 1, 1528645132, 0, 1528645132, 'index_questions', 0),
(81, 'index', '9bf09c2200b5eef0457cf993f097d1a1.jpg', '\\uploads\\index\\index_questions\\20180611\\9bf09c2200b5eef0457cf993f097d1a1.jpg', 43480, 'jpg', 0, '125.86.95.196', 1, 1528647411, 0, 1528647411, 'index_questions', 0),
(82, 'index', '5b50ddb3a3fc93ef69c5d83e22069ceb.jpg', '\\uploads\\index\\index_questions\\20180611\\5b50ddb3a3fc93ef69c5d83e22069ceb.jpg', 44537, 'jpg', 0, '125.86.95.196', 1, 1528647442, 0, 1528647442, 'index_questions', 0),
(83, 'index', '08ff4df0ade8fb9ce62bafbda0a93ce4.jpg', '\\uploads\\index\\index_questions\\20180611\\08ff4df0ade8fb9ce62bafbda0a93ce4.jpg', 42845, 'jpg', 0, '125.86.95.196', 1, 1528647517, 0, 1528647517, 'index_questions', 0),
(84, 'index', '77cefb28bb8d41fc6b5b6db9418cc3d4.jpg', '\\uploads\\index\\index_questions\\20180611\\77cefb28bb8d41fc6b5b6db9418cc3d4.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528722908, 5, 1528722908, 'index_questions', 0),
(85, 'index', '43ef76531675a07f291b4393b8cca0b6.jpg', '\\uploads\\index\\index_questions\\20180611\\43ef76531675a07f291b4393b8cca0b6.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528722913, 5, 1528722913, 'index_questions', 0),
(86, 'index', 'ade1c47165e9b9da4679ab3b1dec8356.jpg', '\\uploads\\index\\index_questions\\20180611\\ade1c47165e9b9da4679ab3b1dec8356.jpg', 59152, 'jpg', 5, '125.86.89.208', 1, 1528722921, 5, 1528722921, 'index_questions', 0),
(87, 'index', '937a52a05c4e00eb35bf0a46c79b80dd.jpg', '\\uploads\\index\\index_questions\\20180611\\937a52a05c4e00eb35bf0a46c79b80dd.jpg', 62700, 'jpg', 5, '125.86.89.208', 1, 1528722926, 5, 1528722926, 'index_questions', 0),
(88, 'index', 'e59120de5d69cca25a6ca811cc8d12dd.jpg', '\\uploads\\index\\index_questions\\20180611\\e59120de5d69cca25a6ca811cc8d12dd.jpg', 62700, 'jpg', 5, '125.86.89.208', 1, 1528724048, 5, 1528724048, 'index_questions', 0),
(89, 'index', '4fdbb9471670b97ed6c108744b48c8a7.jpg', '\\uploads\\index\\index_questions\\20180611\\4fdbb9471670b97ed6c108744b48c8a7.jpg', 433126, 'jpg', 5, '125.86.89.208', 1, 1528724054, 5, 1528724054, 'index_questions', 0),
(90, 'index', '810fa55731e6060e8d55acebf04de976.jpg', '\\uploads\\index\\index_questions\\20180611\\810fa55731e6060e8d55acebf04de976.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528724060, 5, 1528724060, 'index_questions', 0),
(91, 'index', '75b92cb33e805cbe3aa76a25557a9345.jpg', '\\uploads\\index\\index_questions\\20180611\\75b92cb33e805cbe3aa76a25557a9345.jpg', 59152, 'jpg', 5, '125.86.89.208', 1, 1528726643, 5, 1528726643, 'index_questions', 0),
(92, 'index', 'ad3df52f9eefc660a51be504b5c75c81.jpg', '\\uploads\\index\\index_questions\\20180611\\ad3df52f9eefc660a51be504b5c75c81.jpg', 62700, 'jpg', 5, '125.86.89.208', 1, 1528726648, 5, 1528726648, 'index_questions', 0),
(93, 'index', 'a4f2f4ee3ed2882e5d67a21f96475505.mp4', '\\uploads\\index\\index_questions\\20180611\\a4f2f4ee3ed2882e5d67a21f96475505.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528726866, 5, 1528726866, 'index_questions', 0),
(94, 'index', '99a06990baddbf0e05190610d4b8c005.jpg', '\\uploads\\index\\index_questions\\20180611\\99a06990baddbf0e05190610d4b8c005.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528726886, 5, 1528726886, 'index_questions', 0),
(95, 'index', 'a337442530564e0514ba06f85a307b8c.jpg', '\\uploads\\index\\index_questions\\20180611\\a337442530564e0514ba06f85a307b8c.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528726891, 5, 1528726891, 'index_questions', 0),
(96, 'index', '3b2eee1c59cd1ffd0d56dbe5ec5a864b.jpg', '\\uploads\\index\\index_questions\\20180611\\3b2eee1c59cd1ffd0d56dbe5ec5a864b.jpg', 59152, 'jpg', 5, '125.86.89.208', 1, 1528726894, 5, 1528726894, 'index_questions', 0),
(97, 'index', '2c9fc2b672325b1fb5f8f8392268bc30.jpg', '\\uploads\\index\\index_questions\\20180611\\2c9fc2b672325b1fb5f8f8392268bc30.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528727328, 5, 1528727328, 'index_questions', 0),
(98, 'index', '9a2ac413e3fbd07a0430361c8ec3e173.mp4', '\\uploads\\index\\index_questions\\20180611\\9a2ac413e3fbd07a0430361c8ec3e173.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528727333, 5, 1528727333, 'index_questions', 0),
(99, 'index', '3b1e230dace6caf218e781b42173e9a1.jpg', '\\uploads\\index\\index_questions\\20180611\\3b1e230dace6caf218e781b42173e9a1.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528727363, 5, 1528727363, 'index_questions', 0),
(100, 'index', '8613f1131e7e50634ceb53cd3bdf2673.mp4', '\\uploads\\index\\index_questions\\20180611\\8613f1131e7e50634ceb53cd3bdf2673.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528727367, 5, 1528727367, 'index_questions', 0),
(101, 'index', '2c87b7af2aa7fad11649c6d27814d173.mp4', '\\uploads\\index\\index_questions\\20180611\\2c87b7af2aa7fad11649c6d27814d173.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528727400, 5, 1528727400, 'index_questions', 0),
(102, 'index', '09bb9f22397758789b8c035baa997dce.jpg', '\\uploads\\index\\index_questions\\20180611\\09bb9f22397758789b8c035baa997dce.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528727438, 5, 1528727438, 'index_questions', 0),
(103, 'index', '88d6b0f5ea9c7c14850eb70d24a8c22c.jpg', '\\uploads\\index\\index_questions\\20180611\\88d6b0f5ea9c7c14850eb70d24a8c22c.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528727442, 5, 1528727442, 'index_questions', 0),
(104, 'index', '6224832eb26b120d23b578f5d3928b35.mp4', '\\uploads\\index\\index_questions\\20180611\\6224832eb26b120d23b578f5d3928b35.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528727490, 5, 1528727490, 'index_questions', 0),
(105, 'index', '9c35417556357b5e3522d9be064623eb.jpg', '\\uploads\\index\\index_questions\\20180611\\9c35417556357b5e3522d9be064623eb.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528727494, 5, 1528727494, 'index_questions', 0),
(106, 'index', 'f83679786b5159ab0aaf7235604ca410.jpg', '\\uploads\\index\\index_questions\\20180611\\f83679786b5159ab0aaf7235604ca410.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528727550, 5, 1528727550, 'index_questions', 0),
(107, 'index', '0a89b56d9b1773623a8da342ec655b8b.jpg', '\\uploads\\index\\index_questions\\20180611\\0a89b56d9b1773623a8da342ec655b8b.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528727554, 5, 1528727554, 'index_questions', 0),
(108, 'index', 'ab6f7366937e7a779626cddc70b089a4.jpg', '\\uploads\\index\\index_questions\\20180611\\ab6f7366937e7a779626cddc70b089a4.jpg', 59152, 'jpg', 5, '125.86.89.208', 1, 1528727559, 5, 1528727559, 'index_questions', 0),
(109, 'index', '668de17f6e66c3bd98ba2b128e93f44b.jpg', '\\uploads\\index\\index_questions\\20180611\\668de17f6e66c3bd98ba2b128e93f44b.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528727600, 5, 1528727600, 'index_questions', 0),
(110, 'index', '18d8ad4026bd507c46242344649bcacc.jpg', '\\uploads\\index\\index_questions\\20180611\\18d8ad4026bd507c46242344649bcacc.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528727604, 5, 1528727604, 'index_questions', 0),
(111, 'index', '0d90637ddcd9952638a438229d0b9e0a.jpg', '\\uploads\\index\\index_questions\\20180611\\0d90637ddcd9952638a438229d0b9e0a.jpg', 59152, 'jpg', 5, '125.86.89.208', 1, 1528727608, 5, 1528727608, 'index_questions', 0),
(112, 'index', '5cd1cbacb478ba3ac48e7d81555f7e58.mp4', '\\uploads\\index\\index_questions\\20180611\\5cd1cbacb478ba3ac48e7d81555f7e58.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528727620, 5, 1528727620, 'index_questions', 0),
(113, 'index', '4f3ab8bcb903518a9ecabd1e1e84c3ee.jpg', '\\uploads\\index\\index_questions\\20180611\\4f3ab8bcb903518a9ecabd1e1e84c3ee.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528727698, 5, 1528727698, 'index_questions', 0),
(114, 'index', 'a288ea5d34ea10d9e049f0e61c854745.mp4', '\\uploads\\index\\index_questions\\20180611\\a288ea5d34ea10d9e049f0e61c854745.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528727703, 5, 1528727703, 'index_questions', 0),
(115, 'index', 'b2ad7b8d522199d6aaaef3261a6b6097.jpg', '\\uploads\\index\\index_questions\\20180611\\b2ad7b8d522199d6aaaef3261a6b6097.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528728346, 5, 1528728346, 'index_questions', 0),
(116, 'index', '0e7b82e8418d7eea1fcaadb204703e3f.jpg', '\\uploads\\index\\index_questions\\20180611\\0e7b82e8418d7eea1fcaadb204703e3f.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528728372, 5, 1528728372, 'index_questions', 0),
(117, 'index', 'a4fb0d00954b3f1b9b5e27c9c7fae491.jpg', '\\uploads\\index\\index_questions\\20180611\\a4fb0d00954b3f1b9b5e27c9c7fae491.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528728380, 5, 1528728380, 'index_questions', 0),
(118, 'index', '38fe30ce610214eaf7bde88fd8b1f138.jpg', '\\uploads\\index\\index_questions\\20180611\\38fe30ce610214eaf7bde88fd8b1f138.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528728569, 5, 1528728569, 'index_questions', 0),
(119, 'index', '714c5fdb82c1280d31e357bc99b9165b.jpg', '\\uploads\\index\\index_questions\\20180611\\714c5fdb82c1280d31e357bc99b9165b.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528728586, 5, 1528728586, 'index_questions', 0),
(120, 'index', '4c9ba59b60e86da9900c16469185153e.jpg', '\\uploads\\index\\index_questions\\20180611\\4c9ba59b60e86da9900c16469185153e.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528728589, 5, 1528728589, 'index_questions', 0),
(121, 'index', 'fd91b6404d39a75947b4a5cb997b2a9f.jpg', '\\uploads\\index\\index_questions\\20180611\\fd91b6404d39a75947b4a5cb997b2a9f.jpg', 433126, 'jpg', 5, '125.86.89.208', 1, 1528728600, 5, 1528728600, 'index_questions', 0),
(122, 'index', 'daa713a2800e09fd44ea844ae8eb4f3e.jpg', '\\uploads\\index\\index_questions\\20180611\\daa713a2800e09fd44ea844ae8eb4f3e.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528728822, 5, 1528728822, 'index_questions', 0),
(123, 'index', 'cf0452dfc0b77f34d3355b05e9ed251e.jpg', '\\uploads\\index\\index_questions\\20180611\\cf0452dfc0b77f34d3355b05e9ed251e.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528728829, 5, 1528728829, 'index_questions', 0),
(124, 'index', '627f462709fea5f81f00ed6a1b37aa60.mp4', '\\uploads\\index\\index_questions\\20180611\\627f462709fea5f81f00ed6a1b37aa60.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528728835, 5, 1528728835, 'index_questions', 0),
(125, 'index', '94f94fe816a3fd9bedd516302edf580a.jpg', '\\uploads\\index\\index_questions\\20180611\\94f94fe816a3fd9bedd516302edf580a.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528728876, 5, 1528728876, 'index_questions', 0),
(126, 'index', 'c8259fc27d2bbe85bf10b540e1a710ee.mp4', '\\uploads\\index\\index_questions\\20180611\\c8259fc27d2bbe85bf10b540e1a710ee.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528728880, 5, 1528728880, 'index_questions', 0),
(127, 'index', '0bf7e5620451e92ac5429f2d2bfeea0e.jpg', '\\uploads\\index\\index_questions\\20180612\\0bf7e5620451e92ac5429f2d2bfeea0e.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528732997, 5, 1528732997, 'index_questions', 0),
(128, 'index', '2ab62283d81ca0462556637d4e55ba54.mp4', '\\uploads\\index\\index_questions\\20180612\\2ab62283d81ca0462556637d4e55ba54.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528733003, 5, 1528733003, 'index_questions', 0),
(129, 'index', '64c8f0988a6a21ec20b6b5346078e853.jpg', '\\uploads\\index\\index_questions\\20180612\\64c8f0988a6a21ec20b6b5346078e853.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528733161, 5, 1528733161, 'index_questions', 0),
(130, 'index', 'e36b5886b53b66e7d1a54f0f7f7bf783.jpg', '\\uploads\\index\\index_questions\\20180612\\e36b5886b53b66e7d1a54f0f7f7bf783.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528733180, 5, 1528733180, 'index_questions', 0),
(131, 'index', '689d816b30cdb28b82a9a90fbe16d908.mp4', '\\uploads\\index\\index_questions\\20180612\\689d816b30cdb28b82a9a90fbe16d908.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528733184, 5, 1528733184, 'index_questions', 0),
(132, 'index', 'c24079ba6b05df6b7e3ed1235a5991a8.jpg', '\\uploads\\index\\index_questions\\20180612\\c24079ba6b05df6b7e3ed1235a5991a8.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528733228, 5, 1528733228, 'index_questions', 0),
(133, 'index', '90f05249e74d227099e3392304257bd8.mp4', '\\uploads\\index\\index_questions\\20180612\\90f05249e74d227099e3392304257bd8.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528733231, 5, 1528733231, 'index_questions', 0),
(134, 'index', '10af8bcf9224cc4dea56dd1c84236fc6.mp4', '\\uploads\\index\\index_questions\\20180612\\10af8bcf9224cc4dea56dd1c84236fc6.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528735007, 5, 1528735007, 'index_questions', 0),
(135, 'index', '4a0eec9624ef557e773fa671637abfb1.mp4', '\\uploads\\index\\index_questions\\20180612\\4a0eec9624ef557e773fa671637abfb1.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528735109, 5, 1528735109, 'index_questions', 0),
(136, 'index', '6f27c669ead56da79f62f880b2e33fea.mp4', '\\uploads\\index\\index_questions\\20180612\\6f27c669ead56da79f62f880b2e33fea.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528735146, 5, 1528735146, 'index_questions', 0),
(137, 'index', '79c72ec5260e8b3f863870fe47362547.mp4', '\\uploads\\index\\index_questions\\20180612\\79c72ec5260e8b3f863870fe47362547.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528735506, 5, 1528735506, 'index_questions', 0),
(138, 'index', '2a0aa06c5b03a6cb228e24e902284ee2.mp4', '\\uploads\\index\\index_questions\\20180612\\2a0aa06c5b03a6cb228e24e902284ee2.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528735644, 5, 1528735644, 'index_questions', 0),
(139, 'index', 'f905f7ef314c188ae2efe716f456a65f.mp4', '\\uploads\\index\\index_questions\\20180612\\f905f7ef314c188ae2efe716f456a65f.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528735681, 5, 1528735681, 'index_questions', 0),
(140, 'index', '6389af6fd84c2b11b51f2842ec666abc.mp4', '\\uploads\\index\\index_questions\\20180612\\6389af6fd84c2b11b51f2842ec666abc.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528735722, 5, 1528735722, 'index_questions', 0),
(141, 'index', 'b0ba9c32ba012cc88b8b7c5c29ad7bd8.mp4', '\\uploads\\index\\index_questions\\20180612\\b0ba9c32ba012cc88b8b7c5c29ad7bd8.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528735930, 5, 1528735930, 'index_questions', 0),
(142, 'index', '725faae8b9c16f8d62e9e093805379e7.mp4', '\\uploads\\index\\index_questions\\20180612\\725faae8b9c16f8d62e9e093805379e7.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528735975, 5, 1528735975, 'index_questions', 0),
(143, 'index', '61bb1e34b5766042a989240882cfa185.mp4', '\\uploads\\index\\index_questions\\20180612\\61bb1e34b5766042a989240882cfa185.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528736008, 5, 1528736008, 'index_questions', 0),
(144, 'index', 'c062e572be1d635518e6809e86ee3010.mp4', '\\uploads\\index\\index_questions\\20180612\\c062e572be1d635518e6809e86ee3010.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528736050, 5, 1528736050, 'index_questions', 0),
(145, 'index', 'c9ed8f3555c30cda73833c7ae0a371ea.jpg', '\\uploads\\index\\index_questions\\20180612\\c9ed8f3555c30cda73833c7ae0a371ea.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528809172, 5, 1528809172, 'index_questions', 0),
(146, 'index', '7e1ef68ab32fe437d466bfd98ca32406.mp4', '\\uploads\\index\\index_questions\\20180612\\7e1ef68ab32fe437d466bfd98ca32406.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528809176, 5, 1528809176, 'index_questions', 0),
(147, 'index', '0104eaa3b5b81c85e7af70d234224b20.jpg', '\\uploads\\index\\index_questions\\20180613\\0104eaa3b5b81c85e7af70d234224b20.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528820288, 5, 1528820288, 'index_questions', 0),
(148, 'index', 'd2fd95c8b1c38f4b970cef696ac0621e.mp4', '\\uploads\\index\\index_questions\\20180613\\d2fd95c8b1c38f4b970cef696ac0621e.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528820292, 5, 1528820292, 'index_questions', 0),
(149, 'admin', '6b654d827eb6d416b5fc4e71582853fa.jpg', '\\uploads\\admin\\doctor_head_img\\20180613\\6b654d827eb6d416b5fc4e71582853fa.jpg', 127843, 'jpg', 1, '113.250.252.60', 1, 1528820762, 1, 1528820762, 'doctor_head_img', 0),
(150, 'admin', '78fa17414f0664258a74d896f35832b0.jpg', '\\uploads\\admin\\doctor_gzh\\20180613\\78fa17414f0664258a74d896f35832b0.jpg', 140667, 'jpg', 1, '113.250.252.60', 1, 1528821138, 1, 1528821138, 'doctor_gzh', 0),
(151, 'index', '9c55d455c6f5760a5779b2e95c2a7975.jpg', '\\uploads\\index\\index_questions\\20180613\\9c55d455c6f5760a5779b2e95c2a7975.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528821247, 5, 1528821247, 'index_questions', 0),
(152, 'index', '29e96716c3f6ca9220503c9e09f5d55c.mp4', '\\uploads\\index\\index_questions\\20180613\\29e96716c3f6ca9220503c9e09f5d55c.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528821251, 5, 1528821251, 'index_questions', 0),
(153, 'index', '65f4d451c0fb945e82f2c7429451b4f7.jpg', '\\uploads\\index\\index_questions\\20180613\\65f4d451c0fb945e82f2c7429451b4f7.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528822425, 5, 1528822425, 'index_questions', 0),
(154, 'index', '4fe22693e89cce40b5c9081e74db111c.jpg', '\\uploads\\index\\index_questions\\20180613\\4fe22693e89cce40b5c9081e74db111c.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528822434, 5, 1528822434, 'index_questions', 0),
(155, 'index', '20151295780ef1b184e9cd571385445a.mp4', '\\uploads\\index\\index_questions\\20180613\\20151295780ef1b184e9cd571385445a.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528822438, 5, 1528822438, 'index_questions', 0),
(156, 'index', '21f7ab7d1fb90e726023c6c0e11cdd0a.jpg', '\\uploads\\index\\index_questions\\20180613\\21f7ab7d1fb90e726023c6c0e11cdd0a.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528822559, 5, 1528822559, 'index_questions', 0),
(157, 'index', 'e6f377275ab042d1fd7dc4dc8bb37eab.mp4', '\\uploads\\index\\index_questions\\20180613\\e6f377275ab042d1fd7dc4dc8bb37eab.mp4', 619920, 'mp4', 5, '125.86.89.208', 1, 1528822563, 5, 1528822563, 'index_questions', 0),
(158, 'index', 'b5964e0c2c545c95ab11887d51032509.jpg', '\\uploads\\index\\index_questions\\20180613\\b5964e0c2c545c95ab11887d51032509.jpg', 83937, 'jpg', 5, '125.86.89.208', 1, 1528823064, 5, 1528823064, 'index_questions', 0),
(159, 'index', 'cce4ae4e4dd283396d8739d9a896cf3e.jpg', '\\uploads\\index\\index_questions\\20180613\\cce4ae4e4dd283396d8739d9a896cf3e.jpg', 225716, 'jpg', 5, '125.86.89.208', 1, 1528823068, 5, 1528823068, 'index_questions', 0),
(160, 'index', '5e15c9975174dec26439a7844260c133.jpg', '\\uploads\\index\\index_questions\\20180613\\5e15c9975174dec26439a7844260c133.jpg', 82009, 'jpg', 26, '113.204.96.37', 1, 1528866946, 26, 1528866946, 'index_questions', 0);

-- --------------------------------------------------------

--
-- 表的结构 `me_attachment_new`
--

CREATE TABLE IF NOT EXISTS `me_attachment_new` (
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
  `status` char(1) DEFAULT 'A',
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
  `tag` varchar(255) NOT NULL COMMENT '标签，标签之间用,隔开',
  `profession` text NOT NULL,
  `learn` text NOT NULL,
  `major` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`code`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- 转存表中的数据 `me_doctor`
--

INSERT INTO `me_doctor` (`id`, `user_id`, `code`, `name`, `head_img`, `title`, `hospital_code`, `department_code`, `status`, `auth_type`, `average_star`, `job_period`, `phone`, `phone_cfm`, `phone_visible`, `info`, `original_price`, `actual_price`, `aq_path`, `aq_path_dt`, `aq_path_url`, `gzh_qr_path`, `src`, `from_user_code`, `register_ip`, `register_dt`, `last_login_dt`, `remark`, `admin_user_id`, `update_time`, `create_time`, `tag`, `profession`, `learn`, `major`) VALUES
(1, 1, '0001', 'cc', '12', '主任医师', '1', '', 'A', '', '0.0', 0, '13594855876', 'N', 'N', '皮肤专家皮肤专家皮肤专家皮肤专家', '0.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-05-28 14:10:54', NULL, '', 0, 1528346725, 1528095254, '皮肤', '', '', ''),
(3, 3, '0002', '张医生', '11', '主任医师', '1', '', 'A', '', '0.0', 6, '13594855873', 'N', 'N', '个人简介个人简介个人简介', '39.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-04 14:54:14', NULL, '', 0, 1528608509, 1528095254, '脱发,过敏,湿疹', '职业经历职业经历职业经历职业经历', '学术经历学术经历学术经历学术经历', '专业资历专业资历专业资历'),
(10, 16, '0009', '翠竹', '13', '主任医师', '1', '', 'A', '', '0.0', 3, '13594855879', 'N', 'N', '个人简介个人简介个人简介个人简介', '10000.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-08 23:27:42', NULL, '', 0, 1528476296, 1528471662, '保健,护肤', '', '', ''),
(11, 17, '0010', '黄鹏', '14', '主任医师', '1', '', 'A', '', '0.0', 5, '13594855970', 'N', 'N', '就职于江西省南昌市第94医院', '2000.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-08 23:37:35', NULL, '', 0, 1528472255, 1528472255, '青春痘,皮炎,湿疹', '就职于江西省南昌市第94医院', '就职于江西省南昌市第94医院', '就职于江西省南昌市第94医院'),
(4, 3, '0003', '李医生', '4', '主任医师', '1', '', 'A', '', '0.0', 9, '13594855874', 'N', 'N', '个人简介个人简介个人简介', '39.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-04 15:04:55', NULL, '', 0, 1528095895, 1528095895, '湿疹', '职业经历职业经历', '学术经历学术经历', '专业资历专业资历'),
(12, 18, '0011', '花花', '15', '主任医师', '1', '', 'A', '', '0.0', 3, '13594855872', 'N', 'N', '个人简介', '900.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-08 23:49:17', NULL, '', 0, 1528615869, 1528472957, '皮肤', '', '', ''),
(13, 25, '0000112', '刘医生', '149', '副主任医师', '1', '', 'A', '', '0.0', 1, '15023132600', 'N', 'N', '刘医生', '10.00', '10.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-13 00:26:04', NULL, '', 0, 1528820764, 1528820764, '美容', '刘医生', '刘医生', '刘医生'),
(5, 4, '0004', '赵医生', '6', '主任医师', '1', '', 'A', 'V', '0.0', 1, '13594855876', 'N', 'N', '个人简介个人简介个人简介', '50.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-04 15:34:23', NULL, '', 0, 1528099450, 1528097663, '白斑', '', '', ''),
(6, 6, '0005', '钱医生', '7', '副主任医师', '1', '', 'A', '', '0.0', 5, '13594855871', 'N', 'N', '个人简介个人简介个人简介', '300.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-06 00:11:52', NULL, '', 0, 1528215112, 1528215112, '止咳,化痰', '职业经历职业经历', '学术经历学术经历', '专业资历专业资历专业资历'),
(7, 13, '0006', '周医生', '8', '主治医师', '1', '', 'A', '', '0.0', 2, '13594855872', 'N', 'N', '个人简介个人简介个人简介', '500.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-06 00:25:56', NULL, '', 0, 1528215956, 1528215956, '白斑', '', '', ''),
(8, 9, '0007', '吴医生', '9', '主任医师', '1', '', 'A', '', '0.0', 4, '13594855873', 'N', 'N', '个人简介个人简介个人简介', '800.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-06 00:27:55', NULL, '', 0, 1528216075, 1528216075, '过敏', '', '', ''),
(9, 15, '0008', '黄医生', '10', '主任医师', '1', '', 'A', '', '0.0', 5, '13594855555', 'N', 'N', '个人简介个人简介个人简介', '1000.00', '0.00', '', NULL, '', '', '', '', '0.0.0.0', '2018-06-06 21:40:21', NULL, '', 0, 1528292421, 1528292421, '止咳', '职业经历职业经历职业经历', '学术经历学术经历学术经历', '专业资历专业资历专业资历');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `me_favorite`
--

INSERT INTO `me_favorite` (`id`, `user_code`, `type`, `follow_code`, `update_time`, `create_time`) VALUES
(1, 'u2018053125894470', 'DT', '0001', 1527748870, 1527748870),
(2, 'u2018053138866577', 'DT', '0001', 1527835874, 1527835874),
(14, 'u2018060673421325', 'DT', '0009', 1528471830, 1528471830),
(15, 'u2018060561133117', 'DT', '0008', 1528472913, 1528472913),
(13, 'u2018060673421325', 'DT', '0008', 1528470307, 1528470307);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- 转存表中的数据 `me_feedback`
--

INSERT INTO `me_feedback` (`id`, `user_code`, `doctor_code`, `status`, `content`, `operate_dt`, `admin_user_id`, `update_time`, `create_time`) VALUES
(1, 'u2018053195635681', '', 'P', '有点小建议', NULL, 0, 1527746811, 1527746811),
(2, 'u2018053195635681', '', 'P', '有点小建议', NULL, 0, 1527746813, 1527746813),
(3, NULL, '', 'P', 'hhhhhhhhh', NULL, 0, 1528295175, 1528295175),
(4, NULL, '', 'P', '你好呀，花花', NULL, 0, 1528295887, 1528295887),
(5, 'u2018060561133117', '', 'D', '水电费水电费地方', '2018-06-07 12:47:29', 0, 1528346849, 1528296940),
(6, 'u2018060561133117', '', 'P', 'erwerwerwerwer', NULL, 0, 1528297156, 1528297156),
(7, 'u2018060561133117', '', 'P', 'esdfsdfdfdfdfsdfsdfsdffdsddfsdfsdf', NULL, 0, 1528297841, 1528297841),
(8, 'u2018060561133117', '', 'P', 'sdfsdfsdf', NULL, 0, 1528298111, 1528298111),
(9, 'u2018060561133117', '', 'P', 'asdasdasdasdasdasd', NULL, 0, 1528299013, 1528299013),
(10, 'u2018060561133117', '', 'P', 'dfsdfsdfsdfdfsdfsdfsdf', NULL, 0, 1528299352, 1528299352),
(11, 'u2018060561133117', '', 'P', 'sdfsdfsdfsdfsdfsdf', NULL, 0, 1528299404, 1528299404),
(12, 'u2018060561133117', '', 'P', 'sdfsdfsdfsdfsdfsdfsdf', NULL, 0, 1528299443, 1528299443),
(13, 'u2018060561133117', '', 'P', 'sdsdfsdfsdfsdfsdf', NULL, 0, 1528299477, 1528299477),
(14, 'u2018060561133117', '', 'P', 'gdfgdfgdfgdfgdfgdfg', NULL, 0, 1528299546, 1528299546),
(15, 'u2018060561133117', '', 'P', 'sdfsdfsdfsdfsdfsdfsdfdf', NULL, 0, 1528299654, 1528299654),
(16, 'u2018060561133117', '', 'P', 'dfgdfgdfgdfgdfgdfg', NULL, 0, 1528299716, 1528299716),
(17, 'u2018060561133117', '', 'P', 'asdsdfdfgdfsdf', NULL, 0, 1528299770, 1528299770),
(18, 'u2018060673421325', '', 'P', '测试反馈意见', NULL, 0, 1528346823, 1528346823),
(19, 'u2018060561133117', '', 'P', '哈哈', NULL, 0, 1528472939, 1528472939),
(20, 'u2018060561133117', '', 'P', '你好呀', NULL, 0, 1528472947, 1528472947),
(21, 'u2018060673421325', '', 'P', '啦咯啦咯啦咯', NULL, 0, 1528609685, 1528609685);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `me_hospital`
--

INSERT INTO `me_hospital` (`id`, `name`, `contact`, `address`, `update_time`, `create_time`) VALUES
(1, 'DT', '', '', '2018-06-04 15:00:52', '2018-06-04 15:00:52');

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
  `status` char(1) DEFAULT 'A',
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- 转存表中的数据 `me_user`
--

INSERT INTO `me_user` (`id`, `code`, `name`, `status`, `phone`, `phone_cfm`, `password`, `level`, `src`, `from_user_code`, `register_ip`, `register_dt`, `last_login_dt`, `union_id`, `open_id`, `open_id_ur`, `open_id_dt`, `wx_nick_name`, `wx_sex`, `wx_head_img_url`, `wx_province`, `wx_city`, `wx_country`, `wx_subscribe`, `wx_scene`, `wx_latitude`, `wx_longitude`, `wx_precision`, `wx_location_dt`, `wx_qr_img`, `wx_qr_url`, `wx_qr_update_time`, `remark`, `admin_user_id`, `update_time`, `create_time`) VALUES
(1, 'u2018053125894470', 'hh1', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 14:39:41', NULL, '', '', '12345', '', 'hh', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1527748781, 1527748781),
(2, 'u2018053138866577', 'hh6', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 17:29:13', NULL, '', '', '123456', '', 'hh6', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528081425, 1527758953),
(3, '', 'cc', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-04 11:09:20', NULL, '', '', '', '123', 'cc', '0', '1.jpg', 'cq', '重庆', '中国', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528081760, 1528081760),
(4, '', '测试', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-04 15:23:43', NULL, '', '', '', '123456', '测试', '0', '1.jpg', 'cq', '重庆', '中国', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528097023, 1528097023),
(5, 'u2018060561133117', '黄鹏', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-05 21:38:45', NULL, 'P3RwRaW3EFR4KICzEKKrqw==', '', 'oRw0T0Tcdw0JfpnnrjX5GADzTFNY', '', '黄鹏', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKA4ibZVDbVnrdmre6ppHQlibbOVzibgnjpdwo736mteZddpyx8viaiaFHrz3oU6N3PtTh0oEySsK5dyaw/132', 'Chongqing', 'Zhongxian', 'China', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528825223, 1528205925),
(6, '', '111', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-05 23:33:25', NULL, '', '', '', '111', '111', '1', '', '', '', '', 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, NULL),
(7, 'u2018060673421325', '花花', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-06 00:10:42', NULL, 'yryt5scMv1FLmB8AYU38YA==', '', 'oRw0T0dXfBrM9pHPAD9NqnxS-olM', '', '花花', '2', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKGh3EB6CjzoTHuXaQstX2WiaS1b52Hbfm3oXPiaWsfyQU3f23f2MEUZ9wcxuRx5PIKMbAkjbuLyatg/132', '', '', 'Andorra', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528815298, 1528215042),
(8, 'u2018060646565246', '木木', 'D', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-06 00:15:10', NULL, 'x8CIOCqOgKrKujljZuWbKw==', '', 'oRw0T0e2ORb9JNe2O6-i0y_dtNko', '', '木木', '2', 'https://wx.qlogo.cn/mmopen/vi_32/uoMfkiacCH2ibEKjWdStoXZpKxBauvMJ2oXFKuiacMqF5KawXFwTG54qZU8VdibeIwYXzXJs9dt5L31cwLRwIpf5Ng/132', '', '', 'Andorra', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528608420, 1528215310),
(9, '', '222', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-06 00:20:33', NULL, '', '', '', '222', '222', '', '', '', '', '', 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, NULL),
(10, '', '333', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-06 00:21:25', NULL, '', '', '', '333', '333', '', '', '', '', '', 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, NULL),
(11, '', '444', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-06 00:23:00', NULL, '', '', '', '444', '444', '', '', '', '', '', 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, NULL),
(12, '', '555', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-06 00:23:15', NULL, '', '', '', '555', '555', '', '', '', '', '', 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, NULL),
(13, '', '666', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-06 00:23:30', NULL, '', '', '', '666', '666', '', '', '', '', '', 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, NULL),
(14, '', '777', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-06 00:23:48', NULL, '', '', '', '777', '777', '', '', '', '', '', 0, '', '', '', '', NULL, '', '', NULL, '', 0, NULL, NULL),
(15, '', '黄鹏', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-06 21:30:18', NULL, 'CpK/68M9bfJzqEwxSA1KPg==', '', '', 'oRw0T0Tcdw0JfpnnrjX5GADzTFNY', '黄鹏', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKA4ibZVDbVnrdmre6ppHQlibbOVzibgnjpdwo736mteZddpyx8viaiaFHrz3oU6N3PtTh0oEySsK5dyaw/132', 'Chongqing', 'Zhongxian', 'China', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528294461, 1528291818),
(16, '', '翠竹', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-08 23:23:08', NULL, 'dvyjIOD0NqW5wxbBr8gwjQ==', '', '', 'o0r9r5arVap6v8THmlSBNfcbVfZ8', '翠竹', '2', 'https://wx.qlogo.cn/mmopen/vi_32/D3sIdrqXyeT3JfQu0tnJP1gOfHFs5dqQvAlkViazNcEwGwto0Ig2KUlzWhv8mSRrw4tQmAFsX7B56yZM2UcOibgA/132', 'Chongqing', 'Zhongxian', 'China', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528630920, 1528471388),
(17, '', '黄鹏', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-08 23:33:18', NULL, 'kTiwaeisiaBWDzt8xj9hnA==', '', '', 'o0r9r5WBGjhc-YJNt6L8VZBdilIw', '黄鹏', '1', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJXZz2yX937P7eVcGH9tib9kQqPKFldb9jexv44ZyBazTouxC43NnSyKmaJdRBnIU5D1XrOU4qkaBA/132', 'Chongqing', 'Zhongxian', 'China', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528825170, 1528471998),
(18, '', '花花', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-08 23:42:51', NULL, 'LsE8F6FfTjldN/VFmvkY7Q==', '', '', 'o0r9r5VMPsRLNpedDEF6afyU5Ti0', '花花', '2', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIX7ibExl4dApKdHga9wiazYjFmUAGWcJh7fz6juVM2q5Sl1mDcLdwgQpQA9QObpLykoPJlvqX6YfDA/132', '', '', 'Andorra', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528815026, 1528472571),
(19, 'u2018053125894471', 'hh111', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 14:39:41', NULL, '', '', '12345', '', 'hh', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1527748781, 1527748781),
(20, 'u2018053125894472', 'hh222', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 14:39:41', NULL, '', '', '12345', '', 'hh', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1527748781, 1527748781),
(21, 'u2018053125894473', 'hh333', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 14:39:41', NULL, '', '', '12345', '', 'hh', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1527748781, 1527748781),
(22, 'u2018053125894474', 'hh444', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 14:39:41', NULL, '', '', '12345', '', 'hh', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1527748781, 1527748781),
(23, 'u2018053125894475', 'hh555', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 14:39:41', NULL, '', '', '12345', '', 'hh', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1527748781, 1527748781),
(24, 'u2018053125894476', 'hh666', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-05-31 14:39:41', NULL, '', '', '12345', '', 'hh', '1', '123', '3', '2', '1', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1527748781, 1527748781),
(25, '', 'Cla', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-12 16:55:57', NULL, '6E4kZT6R7Oa3dajdd5+0VQ==', '', '', 'o0r9r5cC_wfABdIdaMDGJfFcZarw', 'Cla', '1', 'https://wx.qlogo.cn/mmopen/vi_32/S7RWvVX2571kBZ1ibSKj0uqj1DfLKib8GlkB13ia7QbBa3kB3H5BVVtNlXCbb4BJ14yMeddfD0Goz3lDUeQp8tBCg/132', 'Chongqing', 'Jiangbei', 'China', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528868680, 1528793757),
(26, 'u2018061278499755', 'Cla', 'A', '', 'N', NULL, 0, '', '', '0.0.0.0', '2018-06-12 23:57:50', NULL, 'tF8hImkX3WcY7HSnS1AuTQ==', '', 'oRw0T0UKN_pNGM1A5F1JSCxO9wwE', '', 'Cla', '1', 'https://wx.qlogo.cn/mmopen/vi_32/P0YtHv13waWBjsqRXhHslpjGP33BH42QiaDyjjwicVPmLX2hpCuG4QDXgXk8lbouj2cykwwedYWhiaN3V6g2gNLNQ/132', 'Chongqing', 'Jiangbei', 'China', 0, '', '', '', '', NULL, '', '', NULL, '', 0, 1528867620, 1528819070);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `me_user_patient`
--

INSERT INTO `me_user_patient` (`id`, `user_id`, `status`, `name`, `phone`, `phone_cfm`, `level`, `birthday`, `height`, `weight`, `age`, `sex`, `is_allergy`, `medical_history`, `update_time`, `create_time`) VALUES
(1, 3, 'A', 'hh', '13594855872', 'N', 0, NULL, 0, 0, 0, 0, 'N', '', 1527737623, 1527734590),
(2, 2, 'A', 'hh', '13594855872', 'N', 0, NULL, 0, 0, 0, 0, 'N', '', 1527836481, 1527836481),
(3, 7, 'A', 'hh', '13594855872', 'N', 0, NULL, 165, 46, 26, 1, 'N', '无', 1528609583, 1528423932),
(4, 5, 'A', '你好11', '14725811111', 'N', 0, NULL, 11111, 10111, 60, 0, '', '111111111111111', 1528821426, 1528467256),
(5, 19, 'A', 'hh111', '13594855872', 'N', 0, NULL, 165, 45, 26, 0, '', '无', 1528471881, 1528423932),
(6, 20, 'A', 'hh222', '13594855872', 'N', 0, NULL, 165, 45, 26, 0, '', '无', 1528471881, 1528423932),
(7, 21, 'A', 'hh333', '13594855872', 'N', 0, NULL, 165, 45, 26, 0, '', '无', 1528471881, 1528423932),
(8, 22, 'A', 'hh444', '13594855872', 'N', 0, NULL, 165, 45, 26, 0, '', '无', 1528471881, 1528423932),
(9, 23, 'A', 'hh555', '13594855872', 'N', 0, NULL, 165, 45, 26, 0, '', '无', 1528471881, 1528423932),
(10, 24, 'A', 'hh666', '13594855872', 'N', 0, NULL, 165, 45, 26, 0, '', '无', 1528471881, 1528423932);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `me_visit`
--

INSERT INTO `me_visit` (`id`, `user_code`, `doctor_code`, `status`, `origianl_price`, `actual_pay`, `use_coupon`, `inquiry_dt`, `inquiry_dt_last`, `reply_dt`, `reply_dt_last`, `close_dt`, `update_time`, `create_time`) VALUES
(1, 'u2018053125894470', '0001', 'P', '39.00', '0.00', 'N', '2018-05-31 16:10:55', NULL, NULL, NULL, NULL, 1527754255, 1527754255),
(16, 'u2018060561133117', '0011', 'P', '900.00', NULL, 'N', '2018-06-10 23:38:16', '2018-06-10 23:38:16', NULL, NULL, NULL, 1528645096, 1528645096),
(3, 'u2018053138866577', '0001', 'P', '39.00', NULL, 'N', '2018-05-31 17:29:24', NULL, NULL, NULL, NULL, 1527760375, 1527758964),
(4, 'u2018060673421325', '0008', 'P', '39.00', NULL, 'N', '2018-06-08 18:03:15', '2018-06-08 18:03:39', NULL, NULL, NULL, 1528452219, 1528452195),
(5, 'u2018060673421325', '0009', 'P', '39.00', NULL, 'N', '2018-06-09 12:36:02', '2018-06-09 12:37:32', NULL, NULL, NULL, 1528519052, 1528518962),
(6, 'u2018060646565246', '0009', 'P', '39.00', NULL, 'N', '2018-06-09 12:37:44', '2018-06-09 12:37:44', NULL, NULL, NULL, 1528519064, 1528519064),
(7, 'u2018060561133117', '0009', 'P', '39.00', NULL, 'N', '2018-06-09 12:39:18', '2018-06-09 12:39:17', NULL, NULL, NULL, 1528519158, 1528519158),
(8, 'u2018053138866577', '0009', 'P', '39.00', NULL, 'N', '2018-06-09 12:39:53', '2018-06-09 12:40:00', NULL, NULL, NULL, 1528519200, 1528519193),
(9, 'u2018053125894470', '0009', 'P', '39.00', NULL, 'N', '2018-06-09 12:40:30', '2018-06-09 12:40:33', NULL, NULL, NULL, 1528519233, 1528519230),
(10, 'u2018053125894471', '0009', 'A', '39.00', NULL, 'N', '2018-06-09 12:40:30', '2018-06-09 12:40:33', '2018-06-09 12:42:33', '2018-06-09 12:42:33', NULL, 1528519233, 1528519230),
(11, 'u2018053125894472', '0009', 'A', '39.00', NULL, 'N', '2018-06-09 12:40:30', '2018-06-09 12:40:33', '2018-06-09 12:42:33', '2018-06-09 12:42:33', NULL, 1528519233, 1528519230),
(12, 'u2018053125894473', '0009', 'A', '39.00', NULL, 'N', '2018-06-09 12:40:30', '2018-06-09 12:40:33', '2018-06-09 12:42:33', '2018-06-09 12:42:33', NULL, 1528519233, 1528519230),
(13, 'u2018053125894474', '0009', 'C', '39.00', NULL, 'N', '2018-06-09 12:40:30', '2018-06-09 12:40:33', '2018-06-09 12:42:33', '2018-06-09 12:42:33', NULL, 1528519233, 1528519230),
(14, 'u2018053125894475', '0009', 'C', '39.00', NULL, 'N', '2018-06-09 12:40:30', '2018-06-09 12:40:33', '2018-06-09 12:42:33', '2018-06-09 12:42:33', NULL, 1528519233, 1528519230),
(15, 'u2018053125894476', '0009', 'C', '39.00', NULL, 'N', '2018-06-09 12:40:30', '2018-06-09 12:40:33', '2018-06-09 12:42:33', '2018-06-09 12:42:33', NULL, 1528519233, 1528519230),
(17, 'u2018060561133117', '0010', 'P', '2000.00', NULL, 'N', '2018-06-10 23:38:54', '2018-06-11 00:18:58', NULL, NULL, NULL, 1528647538, 1528645134),
(18, 'u2018060561133117', '0010', 'P', '2000.00', NULL, 'N', '2018-06-11 21:16:02', '2018-06-13 01:04:30', NULL, NULL, NULL, 1528823070, 1528722962),
(19, 'u2018060561133117', '0010', 'A', '2000.00', NULL, 'N', '2018-06-11 21:34:22', '2018-06-11 21:34:22', NULL, '2018-06-12 21:02:35', NULL, 1528808555, 1528724062),
(20, 'u2018060561133117', '0010', 'A', '2000.00', NULL, 'N', '2018-06-11 22:21:37', '2018-06-11 22:21:37', NULL, '2018-06-11 23:44:51', NULL, 1528731891, 1528726897),
(21, 'u2018060561133117', '0010', 'A', '2000.00', NULL, 'N', '2018-06-11 22:54:47', '2018-06-11 22:54:46', NULL, '2018-06-11 23:23:29', NULL, 1528730609, 1528728887),
(22, 'u2018060673421325', '0011', 'P', '900.00', '0.00', 'N', '2018-06-12 14:53:59', '2018-06-12 14:53:59', NULL, NULL, NULL, 1528786439, 1528786439),
(23, 'u2018060673421325', '0011', 'P', '900.00', '0.00', 'N', '2018-06-12 14:54:09', '2018-06-12 14:54:09', NULL, NULL, NULL, 1528786449, 1528786449),
(24, 'u2018060561133117', '0010', 'A', '2000.00', '0.00', 'N', '2018-06-12 21:13:00', '2018-06-12 21:13:00', NULL, '2018-06-12 21:21:32', NULL, 1528809692, 1528809180),
(25, 'u2018060561133117', '0010', 'A', '2000.00', '0.00', 'N', '2018-06-13 00:18:14', '2018-06-13 00:56:05', NULL, '2018-06-13 00:56:32', NULL, 1528822592, 1528820294),
(26, 'u2018061278499755', '0000112', 'P', '10.00', '0.00', 'N', '2018-06-13 13:15:55', '2018-06-13 13:15:55', NULL, NULL, NULL, 1528866955, 1528866955),
(27, 'u2018061278499755', '0000112', 'P', '10.00', '0.00', 'N', '2018-06-13 13:16:05', '2018-06-13 13:16:05', NULL, NULL, NULL, 1528866965, 1528866965),
(28, 'u2018061278499755', '0000112', 'P', '10.00', '0.00', 'N', '2018-06-13 13:28:06', '2018-06-13 13:28:06', NULL, NULL, NULL, 1528867686, 1528867686);

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
  `img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`visit_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- 转存表中的数据 `me_visit_line`
--

INSERT INTO `me_visit_line` (`id`, `visit_id`, `user_code`, `doctor_code`, `status`, `type`, `content`, `src`, `visible`, `update_time`, `create_time`, `img`) VALUES
(1, 1, 'u2018053125894470', '', 'A', 'T', '内容内容123', '', '', 1527754255, 1527754255, ''),
(2, 1, 'u2018053125894470', '', 'A', 'T', '内容内容', '', '', 1527758926, 1527758926, ''),
(3, 3, 'u2018053138866577', '', 'A', 'T', '内容内容', '', '', 1527758964, 1527758964, ''),
(4, 3, 'u2018053138866577', '', 'A', 'T', '内容内容456', '', '', 1527760375, 1527760375, ''),
(5, 4, 'u2018060673421325', '', 'A', 'T', '内容内容zzz', '', '', 1528452219, 1528452219, NULL),
(6, 5, 'u2018060673421325', '', 'A', 'T', '内容内容456', '', '', 1528518962, 1528518962, NULL),
(7, 5, 'u2018060673421325', '', 'A', 'T', '内容内容456dfdfdsfsdsf', '', '', 1528519052, 1528519052, NULL),
(8, 6, 'u2018060646565246', '', 'A', 'T', '内容内容456dfdfdsfsdsf', '', '', 1528519064, 1528519064, NULL),
(9, 7, 'u2018060561133117', '', 'A', 'T', '测试提问', '', '', 1528519158, 1528519158, NULL),
(10, 8, 'u2018053138866577', '', 'A', 'T', '测试提问1', '', '', 1528519193, 1528519193, NULL),
(11, 8, 'u2018053138866577', '', 'A', 'T', '测试提问2', '', '', 1528519200, 1528519200, NULL),
(12, 9, 'u2018053125894470', '', 'A', 'T', '测试提问3', '', '', 1528519230, 1528519230, NULL),
(13, 9, 'u2018053125894470', '', 'A', 'T', '测试提问4', '', '', 1528519233, 1528519233, NULL),
(14, 10, 'u2018053125894471', '', 'A', 'T', '测试提问666', '', '', 1528519233, 1528519233, NULL),
(15, 11, 'u2018053125894472', '', 'A', 'T', '测试提问666sdfsdf', '', '', 1528519233, 1528519233, NULL),
(16, 12, 'u2018053125894473', '', 'A', 'T', '测试提问777', '', '', 1528519233, 1528519233, NULL),
(17, 13, 'u2018053125894474', '', 'A', 'T', '测试提问777', '', '', 1528519233, 1528519233, NULL),
(18, 14, 'u2018053125894475', '', 'A', 'T', '测试提问777', '', '', 1528519233, 1528519233, NULL),
(19, 15, 'u2018053125894476', '', 'A', 'T', '测试提问777', '', '', 1528519233, 1528519233, NULL),
(20, 16, 'u2018060561133117', '', 'A', 'T', 'wo bignal', '', '', 1528645096, 1528645096, '77,78'),
(21, 17, 'u2018060561133117', '', 'A', 'T', 'dfsdfsdfsdfsdfsdf', '', '', 1528645134, 1528645134, '79,80'),
(22, 17, 'u2018060561133117', '', 'A', 'T', '我得病啦，哈哈', '', '', 1528647538, 1528647538, '83'),
(23, 18, 'u2018060561133117', '', 'A', 'T', '你好，我是一名患者，哈哈', '', '', 1528722962, 1528722962, '84,85,86,87'),
(24, 19, 'u2018060561133117', '', 'A', 'T', '你好呀，我生病啦，哈哈哈哈', '', '', 1528724062, 1528724062, '88,89,90'),
(25, 20, 'u2018060561133117', '', 'A', 'T', '你好呀，我问个问题', '', '', 1528726897, 1528726897, '94,95,96'),
(26, 21, 'u2018060561133117', '', 'A', 'T', 'sdfsdfsdfsdf', '', '', 1528728887, 1528728887, '125,126'),
(27, 21, '', '0010', 'A', 'T', '我是黄医生专业回复', '', '', 1528730509, 1528730509, NULL),
(28, 21, '', '0010', 'A', 'T', '我是黄医生专业回复', '', '', 1528730609, 1528730609, NULL),
(29, 20, '', '0010', 'A', 'T', '我为您解答', '', '', 1528731891, 1528731891, NULL),
(30, 22, 'u2018060673421325', '', 'A', 'T', '提一个问题，提一个小问题', '', '', 1528786439, 1528786439, ''),
(31, 23, 'u2018060673421325', '', 'A', 'T', '提一个问题，提一个小问题', '', '', 1528786449, 1528786449, ''),
(32, 19, '', '0010', 'A', 'T', '你好1111', '', '', 1528808555, 1528808555, NULL),
(33, 24, 'u2018060561133117', '', 'A', 'T', '我的病啦，求治疗', '', '', 1528809180, 1528809180, '145,146'),
(34, 24, '', '0010', 'A', 'T', 'haha,nizheshi yizhognbigndezhi', '', '', 1528809692, 1528809692, NULL),
(35, 25, 'u2018060561133117', '', 'A', 'T', '哈哈，你好呀', '', '', 1528820294, 1528820294, '147,148'),
(36, 25, '', '0010', 'A', 'T', '哈哈你好', '', '', 1528820316, 1528820316, NULL),
(37, 25, '', '0010', 'A', 'T', '哈哈你好2', '', '', 1528820349, 1528820349, NULL),
(38, 25, '', '0010', 'A', 'T', '哈哈你好3', '', '', 1528820352, 1528820352, NULL),
(39, 25, 'u2018060561133117', '', 'A', 'T', '我是追问', '', '', 1528822565, 1528822565, '156,157'),
(40, 25, '', '0010', 'A', 'T', '我已经收到追问，你好同志', '', '', 1528822592, 1528822592, NULL),
(41, 18, 'u2018060561133117', '', 'A', 'T', 'hahahahha', '', '', 1528823070, 1528823070, '158,159'),
(42, 26, 'u2018061278499755', '', 'A', 'T', '哈', '', '', 1528866955, 1528866955, '160'),
(43, 27, 'u2018061278499755', '', 'A', 'T', '哈', '', '', 1528866965, 1528866965, '160'),
(44, 28, 'u2018061278499755', '', 'A', 'T', '哈哈', '', '', 1528867686, 1528867686, '');

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
('web', '玛恩医生后台管理', '玛恩医生,后台管理', '玛恩医生 www.minebuty.top', 1, 'jpg,png,gif,mp4,zip,jpeg', 50000, '', '', NULL);

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
  `status` char(10) DEFAULT 'P',
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
  `update_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `remark` varchar(200) DEFAULT '',
  `opening_bank` varchar(30) NOT NULL,
  `card_no` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `operate_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index0` (`open_id`,`trade_dt`),
  KEY `index1` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `me_wx_payment_line`
--

INSERT INTO `me_wx_payment_line` (`id`, `open_id`, `doctor_code`, `cd_shop`, `src`, `amount`, `status`, `submit_dt`, `re_user_name`, `check_name`, `descr`, `spbill_create_ip`, `app_id`, `mch_id`, `nonce_str`, `sign`, `partner_trade_no`, `trade_dt`, `return_code`, `return_msg`, `result_code`, `err_code`, `err_code_des`, `payment_no`, `payment_time`, `update_time`, `create_time`, `remark`, `opening_bank`, `card_no`, `name`, `operate_dt`) VALUES
(1, '', 'u2018060673421325', '', '', 200, 'D', '2018-06-07 10:09:04', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', 1528337750, 1528337344, '已处理', '开户行', '123456789012113', 'huahua', '2018-06-07 00:00:00'),
(2, '', 'u2018060673421325', '', '', 200, 'D', '2018-06-07 10:17:29', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', 1528337874, 1528337849, '通过', '开户行', '123456789012113', 'huahua', '2018-06-07 10:17:54'),
(3, 'o0r9r5arVap6v8THmlSBNfcbVfZ8', '0009', '', '', 200, 'P', '2018-06-09 00:45:03', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', 1528476303, 1528476303, '', '开户行', '123456789012113', 'huahua', NULL),
(4, 'o0r9r5arVap6v8THmlSBNfcbVfZ8', '0009', '', '', 1000, 'D', '2018-06-09 00:54:32', '', '', '', '', '', '', '', '', '', NULL, '', '', '', '', '', '', '', 1528821253, 1528476872, '', '中国邮政', '622222222222222', '黄鹏', '2018-06-13 00:34:13');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
