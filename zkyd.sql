-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.7.21 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 yy 的数据库结构
CREATE DATABASE IF NOT EXISTS `yy` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yy`;

-- 导出  表 yy.t_auth_group 结构
CREATE TABLE IF NOT EXISTS `t_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '' COMMENT '用户组中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `rules` varchar(250) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id， 多个规则","隔开',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='用户组表';

-- 正在导出表  yy.t_auth_group 的数据：6 rows
/*!40000 ALTER TABLE `t_auth_group` DISABLE KEYS */;
INSERT INTO `t_auth_group` (`id`, `title`, `status`, `rules`) VALUES
	(1, '超级管理员', 1, '2,3,18,41,42,5,19,39,40,6,20,36,37,38,7,17,34,35,24,31,32,33,25,9,10,43,11,12,44,1,4,22,23,28,29,30,8,21,26,27'),
	(2, '单位管理员', 1, '3,5,19,39,40,6,20,36,37,38,7,17,34,35,24,31,32,33,25,9,10,43,11,12,44'),
	(3, '大厅管理员', 1, ''),
	(15, '预约部长', 1, '2,3,18,41,42,5,19,39,40,6,20,36,37,38,49,7,17,34,35,9,46,10,43,11,12,44,47,48'),
	(16, '预约组长', 1, '9,10,43,11,12,44'),
	(17, '预约操作员', 1, '9,10,43,12,44');
/*!40000 ALTER TABLE `t_auth_group` ENABLE KEYS */;

-- 导出  表 yy.t_auth_group_access 结构
CREATE TABLE IF NOT EXISTS `t_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- 正在导出表  yy.t_auth_group_access 的数据：8 rows
/*!40000 ALTER TABLE `t_auth_group_access` DISABLE KEYS */;
INSERT INTO `t_auth_group_access` (`uid`, `group_id`) VALUES
	(1, 1),
	(23, 2),
	(1002, 15),
	(1003, 15),
	(1028, 1),
	(1030, 2),
	(1035, 2),
	(1040, 3);
/*!40000 ALTER TABLE `t_auth_group_access` ENABLE KEYS */;

-- 导出  表 yy.t_auth_rule 结构
CREATE TABLE IF NOT EXISTS `t_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `ismenu` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否是菜单',
  `sort` int(4) NOT NULL DEFAULT '0' COMMENT '排序 越大越前面',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- 正在导出表  yy.t_auth_rule 的数据：44 rows
/*!40000 ALTER TABLE `t_auth_rule` DISABLE KEYS */;
INSERT INTO `t_auth_rule` (`id`, `pid`, `title`, `name`, `type`, `status`, `ismenu`, `sort`, `condition`) VALUES
	(1, 0, '系统设置', '', 1, 1, 1, 0, ''),
	(2, 0, '预约管理', '', 1, 1, 1, 9, ''),
	(3, 2, '医院配置', 'admin/appointment/listunit', 1, 1, 1, 0, ''),
	(4, 1, '用户组', 'admin/permissions/listdata', 1, 1, 1, 0, ''),
	(5, 2, '科室配置', 'admin/hall/listdata', 1, 1, 1, 0, ''),
	(6, 2, '医生配置', 'admin/doctor/listdata', 1, 1, 1, 0, ''),
	(7, 2, '管理员', 'admin/appointment/listmanage', 1, 1, 1, 0, ''),
	(8, 1, '权限管理', 'admin/permissions/listrule', 1, 1, 1, 0, ''),
	(9, 0, '查询统计', '', 1, 1, 1, 8, ''),
	(10, 9, '预约查询', 'admin/appointment/listdata', 1, 1, 1, 0, ''),
	(11, 9, '预约统计', '', 1, 1, 1, 0, ''),
	(12, 9, '预约排队', 'admin/appointment/registration', 1, 1, 1, 0, ''),
	(18, 3, '编辑医院', 'admin/appointment/editUnit', 1, 1, 0, 0, ''),
	(17, 7, '编辑管理员', 'admin/appointment/manageAdd', 1, 1, 0, 0, ''),
	(19, 5, '编辑科室', 'admin/hall/hallDetail', 1, 1, 0, 0, ''),
	(20, 6, '编辑医生', 'admin/doctor/editDoctor', 1, 1, 0, 0, ''),
	(21, 8, '编辑权限规则', 'admin/permissions/ruleEdit', 1, 1, 0, 0, ''),
	(22, 4, '编辑用户组', 'admin/permissions/editPer', 1, 1, 0, 0, ''),
	(23, 4, '分配权限', 'admin/permissions/groupEdit', 1, 1, 0, 0, ''),
	(24, 2, '部门分组', 'admin/group/listdata', 1, 1, 1, 0, ''),
	(25, 2, '人员管理', 'admin/group/memberlist', 1, 1, 1, 0, ''),
	(26, 8, '权限规则删除', 'admin/permissions/ruleDel', 1, 1, 0, 0, ''),
	(27, 8, '权限规则保存', 'admin/permissions/ruleSave', 1, 1, 1, 0, ''),
	(28, 4, '保存权限', 'admin/permissions/groupRules', 1, 1, 0, 0, ''),
	(29, 4, '删除用户组', 'admin/permissions/perDel', 1, 1, 0, 0, ''),
	(30, 4, '保存用户组', 'admin/permissions/groupSave', 1, 1, 0, 0, ''),
	(31, 24, '编辑部门分组', 'admin/group/groupEdit', 1, 1, 0, 0, ''),
	(32, 24, '保存部门分组', 'admin/group/saveGroup', 1, 1, 1, 0, ''),
	(33, 24, '删除部门分组', 'admin/group/groupDel', 1, 1, 1, 0, ''),
	(34, 7, '删除管理员', 'admin/appointment/manageDel', 1, 1, 0, 0, ''),
	(35, 7, '保存管理员', 'admin/appointment/manageSave', 1, 1, 0, 0, ''),
	(36, 6, '保存医生', 'admin/doctor/saveDoctor', 1, 1, 0, 0, ''),
	(37, 6, '删除医生', 'admin/doctor/doctorDel', 1, 1, 0, 0, ''),
	(38, 6, '上传头像', 'admin/doctor/upload', 1, 1, 0, 0, ''),
	(39, 5, '保存科室', 'admin/hall/saveHall', 1, 1, 1, 0, ''),
	(40, 5, '删除科室', 'admin/hall/hallDel', 1, 1, 1, 0, ''),
	(41, 3, '保存单位', 'admin/appointment/saveUnit', 1, 1, 0, 0, ''),
	(42, 3, '删除单位', 'admin/appointment/unitDel', 1, 1, 0, 0, ''),
	(43, 10, '获取数据', 'admin/appointment/getdata', 1, 1, 0, 0, ''),
	(44, 12, '添加预约信息', 'admin/appointment/addDespeak', 1, 1, 1, 0, ''),
	(46, 9, '选择日期', 'admin/appointment/getTime', 1, 1, 0, 1, ''),
	(47, 9, '选择时间', 'admin/appointment/getCheckTime', 1, 1, 0, 0, ''),
	(48, 9, '选择医生', 'admin/appointment/getName', 1, 1, 0, 0, ''),
	(49, 6, '获取部门', 'admin/appointment/gethall', 1, 1, 0, 0, '');
/*!40000 ALTER TABLE `t_auth_rule` ENABLE KEYS */;

-- 导出  表 yy.t_despeak 结构
CREATE TABLE IF NOT EXISTS `t_despeak` (
  `despeak_id` int(9) NOT NULL AUTO_INCREMENT COMMENT 'ID唯一标识',
  `mobile` char(11) NOT NULL COMMENT '手机号',
  `name` char(20) DEFAULT NULL COMMENT '全名',
  `idcard` char(18) DEFAULT NULL COMMENT '身份证号',
  `plateNum` char(10) DEFAULT NULL COMMENT '预约随机码',
  `noChar` char(2) DEFAULT NULL COMMENT '预约号前缀文字',
  `queNo` int(6) DEFAULT NULL COMMENT '预约排队号',
  `despeakDate` date DEFAULT NULL COMMENT '预约时间',
  `time_Part_S` time DEFAULT NULL COMMENT '时间段起始时间',
  `time_Part_O` time DEFAULT NULL COMMENT '时间段结束时间',
  `fetchTime` int(3) DEFAULT NULL COMMENT '可提前多少分钟取号',
  `unitId` int(4) NOT NULL DEFAULT '0' COMMENT '继承预约单位UnitID',
  `unitName` char(50) DEFAULT NULL,
  `hallNo` int(4) NOT NULL COMMENT '继承预约单位大厅ServiceNo',
  `hallName` char(50) DEFAULT NULL,
  `queId` int(4) NOT NULL COMMENT '队列标识',
  `queName` char(30) DEFAULT NULL COMMENT '预约队列名称',
  `AlternateField1` char(30) DEFAULT NULL,
  `AlternateField2` char(30) DEFAULT NULL,
  `hall_Con` char(10) DEFAULT NULL COMMENT '大厅接口值',
  `que_Con` char(10) DEFAULT NULL,
  `inClerk` char(30) DEFAULT NULL COMMENT '录入人',
  `inUnit` char(30) DEFAULT NULL COMMENT '录入人单位',
  `inDept` char(30) DEFAULT NULL COMMENT '录入人部门',
  `remark` varchar(30) DEFAULT NULL COMMENT '备注',
  `inTime` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0=取消 1=正常 2=完成',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`despeak_id`)
) ENGINE=MyISAM AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='预约数据';

-- 正在导出表  yy.t_despeak 的数据：29 rows
/*!40000 ALTER TABLE `t_despeak` DISABLE KEYS */;
INSERT INTO `t_despeak` (`despeak_id`, `mobile`, `name`, `idcard`, `plateNum`, `noChar`, `queNo`, `despeakDate`, `time_Part_S`, `time_Part_O`, `fetchTime`, `unitId`, `unitName`, `hallNo`, `hallName`, `queId`, `queName`, `AlternateField1`, `AlternateField2`, `hall_Con`, `que_Con`, `inClerk`, `inUnit`, `inDept`, `remark`, `inTime`, `status`, `addtime`) VALUES
	(164, '13567896789', '', '420111197910094099', '', 'Y', 1000, '2018-03-20', '09:00:00', '10:00:00', 9999, 4, '', 13, '屈光科', 48, '曾路宏', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '2018-03-13 09:00:30', 1, NULL),
	(165, '13345674567', 'aaaa', '420111197910094099', '', 'Y', 1000, '2018-03-23', '16:00:00', '17:00:00', 9999, 3, '', 12, '屈光科', 56, '黄伟强', NULL, NULL, '', '', '1022 bb bb', '3 易达眼科医院', '', NULL, '2018-03-13 12:58:38', 1, NULL),
	(166, '13696969696', '', '420111197910094099', '', 'Y', 1000, '2018-04-17', '09:00:00', '10:00:00', 9999, 3, '', 12, '屈光科', 47, '刘小真', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '2018-04-16 18:23:58', 1, NULL),
	(167, '13042343423', '111', '420111197910094099', '', 'Y', 1001, '2018-04-17', '09:00:00', '10:00:00', 9999, 3, '', 12, '屈光科', 47, '刘小真', NULL, NULL, '', '', '1031 bbb bbb', '3 福州市眼科医院', '25 业务二组', NULL, '2018-04-16 19:40:34', 1, NULL),
	(168, '13345674567', '123133', '420111197910094099', '', 'Y', 1000, '2018-04-18', '10:00:00', '11:00:00', 9999, 3, '', 12, '屈光科', 56, '黄伟强', NULL, NULL, '', '', '1035 2 2', '3 福州市眼科医院', '24 业务一组', NULL, '2018-04-16 20:53:58', 1, NULL),
	(169, '13245674567', '12345', '420111197910094099', '', 'Y', 1000, '2018-04-23', '17:00:00', '18:00:00', 9999, 3, '', 15, '眼底病专科', 54, '林双庆', NULL, NULL, '', '', '1040 xxx xxx', '3 福州市眼科医院', '25 业务二组', NULL, '2018-04-16 21:08:58', 1, NULL),
	(170, '13456785678', '', '420111197910094099', '', 'Y', 1000, '2018-04-20', '09:00:00', '10:00:00', 9999, 3, '', 13, '屈光科', 46, '王小刚', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '2018-04-17 10:17:27', 1, NULL),
	(171, '13345674567', '12121', '420111197910094099', '', 'Y', 1001, '2018-04-20', '09:00:00', '10:00:00', 9999, 3, '', 13, '白内障专科', 46, '王小刚', NULL, NULL, '', '', '1040 xxx xxx', '3 福州市眼科医院', '25 业务二组', NULL, '2018-04-17 10:40:45', 1, NULL),
	(174, '13363636363', '', '420111197910094099', '', 'Y', 1000, '2018-08-08', '17:00:00', '18:00:00', 9999, 3, '', 12, '屈光科', 47, '刘小真', NULL, NULL, '', '', NULL, NULL, NULL, NULL, '2018-08-07 09:54:55', 1, NULL),
	(175, '24124', '权限', '12421421412', NULL, NULL, NULL, '2018-08-15', '10:00:00', '11:00:00', NULL, 0, NULL, 16, '眼表病专科1', 55, '陈宏展', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-08-13 10:44:59', 1, NULL),
	(176, '15125124125', '特意', '2414444444444', NULL, NULL, NULL, '2018-08-15', '11:00:00', '12:00:00', NULL, 0, NULL, 16, '眼表病专科1', 55, '陈宏展', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 've', '2018-08-13 11:51:33', 1, NULL),
	(177, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:34:06', 1, 1534923246),
	(178, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:35:59', 1, 1534923359),
	(179, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:36:17', 1, 1534923377),
	(180, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '10:00:00', '11:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:39:17', 1, 1534923557),
	(181, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:46:18', 1, 1534923978),
	(182, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:46:32', 1, 1534923992),
	(183, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:46:41', 1, 1534924001),
	(184, '13696800225', NULL, '', NULL, NULL, NULL, '2018-08-24', '15:00:00', '16:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 15:44:39', 1, 1535010279),
	(185, '13696800225', NULL, '', NULL, NULL, NULL, '2018-08-27', '14:00:00', '15:00:00', NULL, 0, NULL, 13, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 15:46:15', 1, 1535010375),
	(186, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-27', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 15:47:53', 1, 1535010473),
	(187, '13696800225', '陈崇炎', '35012219880209461X', NULL, NULL, NULL, '2018-08-24', '10:00:00', '11:00:00', NULL, 0, NULL, 16, '眼表病专科2', 55, '陈宏展', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-08-23 00:00:00', 1, 1535011476),
	(188, '13696800225', NULL, '', NULL, NULL, NULL, '2018-08-24', '11:00:00', '12:00:00', NULL, 0, NULL, 13, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 16:07:20', 1, 1535011640),
	(189, '13696800225', NULL, '', NULL, NULL, NULL, '2018-08-27', '10:00:00', '11:00:00', NULL, 0, NULL, 25, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 16:48:29', 1, 1535014109),
	(190, '15377907108', NULL, '350124198912282876', NULL, NULL, NULL, '2018-08-26', NULL, NULL, NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-24 14:22:23', 1, 1535091743),
	(191, '15377907108', NULL, '350124198912282876', NULL, NULL, NULL, '2018-08-27', NULL, NULL, NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-24 14:24:25', 1, 1535091865),
	(192, '15377907108', NULL, '350124198912282876', NULL, NULL, NULL, '2018-08-27', '12:00:00', '13:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-24 14:30:16', 0, 1535092216),
	(193, '12345645645', '陈娟', '420111197910094099', NULL, NULL, NULL, '2018-08-28', '10:00:00', '11:00:00', NULL, 3, NULL, 13, '白内障专科', 46, '王小刚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '2018-08-27 00:00:00', 1, 1535350235),
	(194, '15377907108', NULL, '350124198912282892', NULL, NULL, NULL, '2018-08-30', '16:00:00', '17:00:00', NULL, 0, NULL, 13, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-28 16:08:11', 2, 1535443691),
	(195, '15377907108', NULL, '420111197910094099', NULL, NULL, NULL, '2018-08-31', '15:00:00', '16:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 10:50:44', 1, 1535511044),
	(196, '13696800225', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-08-30', '15:00:00', '16:00:00', NULL, 0, NULL, 13, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:04:16', 1, 1535511856),
	(197, '13696800226', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-08-31', '09:00:00', '10:00:00', NULL, 0, NULL, 15, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:10:02', 1, 1535512202),
	(198, '17095989314', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-01', '11:00:00', '12:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:42:02', 1, 1535514122),
	(199, '17095989314', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-04', '10:00:00', '11:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:43:30', 1, 1535514210),
	(200, '13696800225', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-01', '14:00:00', '15:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:43:52', 1, 1535514232),
	(201, '13696800227', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-01', '12:00:00', '13:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:45:03', 1, 1535514303),
	(202, '15375907108', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-05', '11:00:00', '12:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:45:49', 1, 1535514349),
	(203, '15377907108', NULL, '420111197910094099', NULL, NULL, NULL, '2018-08-31', '09:00:00', '10:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:54:46', 1, 1535514886),
	(204, '15877907208', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-04', '12:00:00', '13:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:57:42', 1, 1535515062);
/*!40000 ALTER TABLE `t_despeak` ENABLE KEYS */;

-- 导出  表 yy.t_hall 结构
CREATE TABLE IF NOT EXISTS `t_hall` (
  `HallNo` int(4) NOT NULL AUTO_INCREMENT COMMENT '大厅唯一标识',
  `SerInterface` char(10) DEFAULT NULL COMMENT '与排队系统的接口',
  `UnitId` int(4) DEFAULT NULL COMMENT '所属大厅标识',
  `UnitName` char(50) DEFAULT NULL COMMENT '所属大厅名',
  `HallName` char(50) NOT NULL COMMENT '大厅名',
  `DispName` char(50) NOT NULL COMMENT '大厅预约名',
  `EnableFlag` int(1) NOT NULL COMMENT '启用与暂停',
  `WorkTime1` time DEFAULT NULL COMMENT '上午开始时间',
  `WorkTime2` time DEFAULT NULL COMMENT '上午结束时间',
  `WorkTime3` time DEFAULT NULL COMMENT '下午开始时间',
  `WorkTime4` time DEFAULT NULL COMMENT '下午结束时间',
  `Despeak_Part` int(3) DEFAULT NULL COMMENT '可预约天数',
  `Managers1` char(30) DEFAULT NULL,
  `Managers2` char(30) DEFAULT NULL COMMENT '管理员2',
  `AlternateField1` char(80) DEFAULT NULL COMMENT '说明',
  `AlternateField2` char(20) DEFAULT NULL COMMENT '管理员1',
  `InTime` datetime DEFAULT NULL,
  PRIMARY KEY (`HallNo`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='部门';

-- 正在导出表  yy.t_hall 的数据：10 rows
/*!40000 ALTER TABLE `t_hall` DISABLE KEYS */;
INSERT INTO `t_hall` (`HallNo`, `SerInterface`, `UnitId`, `UnitName`, `HallName`, `DispName`, `EnableFlag`, `WorkTime1`, `WorkTime2`, `WorkTime3`, `WorkTime4`, `Despeak_Part`, `Managers1`, `Managers2`, `AlternateField1`, `AlternateField2`, `InTime`) VALUES
	(16, '', 3, '福州市眼科医院', '眼表病专科2', '眼表病专科', 0, '09:00:00', '11:00:00', '14:00:00', '18:00:00', 8, '1012 AAA AAA 18900000000', '', '常见的眼表疾病为干眼病、角膜炎、结膜炎、泪道疾病', NULL, '2017-11-25 17:33:30'),
	(13, '', 3, '福州市眼科医院', '白内障专科', '白内障专科', 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 7, '1002 hj 13345674567', '', '各种白障相关的药物与手术治疗', NULL, '2017-11-25 17:22:42'),
	(15, '', 3, '福州市眼科医院', '眼底病专科', '眼底病专科1', 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 7, '1002 hj 13345674567', '', '黄斑病变、视网膜脱落、玻璃体病变切除等', NULL, '2017-11-25 17:32:04'),
	(14, '', 3, '福州市眼科医院', '小儿眼科及斜弱视科', '小儿眼科及斜弱视科', 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 7, '1002 hj 13345674567', '', '针对小儿与成人的斜视与弱视眼病的诊断与治疗。', NULL, '2017-11-25 17:30:16'),
	(12, '', 3, '福州市眼科医院', '屈光科', '屈光科', 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 10, '1002 hj 13345674567', '1009 admin001 lhh 18900000000', '针对近视、高度近视、散光等屈光不正。', NULL, '2017-11-25 17:20:54'),
	(17, '', 12, 'CCC', 'AAA', 'AAA', 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 7, '1025 xxx xxx 18900000000', '', '', NULL, '2017-11-29 20:02:34'),
	(20, '', 12, 'CCC', 'aaa', 'aaa', 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 7, '1009 lhh 王小刚 18900010001', '1003 lhh 王小刚 18900010001', 'aaa', NULL, '2017-12-06 14:38:25'),
	(21, '', 12, 'CCC', 'ddd', 'ddd', 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 7, '请在管理员设置中设置您的管理人员', '请在管理员设置中设置您的管理人员', 'ddddddd', NULL, '2017-12-27 21:35:37'),
	(26, '', 0, NULL, '56756', '5868', 0, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 1, NULL, NULL, '', NULL, '2018-08-27 15:17:37'),
	(25, '', 16, NULL, '内科', '内科', 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, NULL, NULL, '', NULL, '2018-08-23 16:12:31');
/*!40000 ALTER TABLE `t_hall` ENABLE KEYS */;

-- 导出  表 yy.t_manager 结构
CREATE TABLE IF NOT EXISTS `t_manager` (
  `UserId` int(6) NOT NULL AUTO_INCREMENT,
  `UserName` char(20) NOT NULL,
  `BodNo` char(11) NOT NULL COMMENT '手机号',
  `FullName` char(16) NOT NULL,
  `Sex` char(2) DEFAULT NULL,
  `password` varchar(32) NOT NULL COMMENT '密码',
  `group_id` varchar(50) DEFAULT '0' COMMENT '身份类型 auth_group',
  `Types` tinyint(1) DEFAULT '0' COMMENT '用户类型编码 1=管理员 2=预约管理',
  `UnitIDS` char(50) DEFAULT NULL COMMENT '可管理单位单码',
  `unitid` int(10) NOT NULL DEFAULT '0' COMMENT '单位id',
  `hallid` int(10) NOT NULL DEFAULT '0' COMMENT '部门id',
  `ServiceNoS` char(50) DEFAULT NULL COMMENT '可管理单位单码',
  `AlternateField1` char(20) DEFAULT NULL COMMENT '备用字段1',
  `AlternateField2` char(20) DEFAULT NULL COMMENT '备用字段2',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0=禁用 1=正常',
  `InTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=1047 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- 正在导出表  yy.t_manager 的数据：15 rows
/*!40000 ALTER TABLE `t_manager` DISABLE KEYS */;
INSERT INTO `t_manager` (`UserId`, `UserName`, `BodNo`, `FullName`, `Sex`, `password`, `group_id`, `Types`, `UnitIDS`, `unitid`, `hallid`, `ServiceNoS`, `AlternateField1`, `AlternateField2`, `status`, `InTime`) VALUES
	(1, 'admin', '13300000000', '黄建', '男', 'e10adc3949ba59abbe56e057f20f883e', '1', 1, NULL, 0, 0, NULL, NULL, NULL, 1, '2017-11-28 17:56:31'),
	(1002, 'hj', '13345674567', '郑成', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 1, '3 易达眼科医院', 3, 16, '', NULL, NULL, 1, '2018-03-13 22:03:55'),
	(1009, 'admin001', '18900000000', 'lhh', '男', '123456', '2', 1, '3 易达眼科医院', 0, 0, '16 眼表病专科1', NULL, NULL, 1, '2017-12-27 18:17:12'),
	(1010, 'czy', '18900000000', '操作员A', '男', '123456', '2', 2, '12 CCC', 0, 0, '', NULL, NULL, 1, '2018-08-02 18:32:31'),
	(1035, '2', '18900000000', '2', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 2, '3 福州市眼科医院', 3, 13, '24 业务一组', NULL, NULL, 1, '2018-04-02 12:38:01'),
	(1013, 'wang', '18900000000', '小王', '女', '123456', '2', 2, '3 福州市眼科医院', 0, 0, '24 业务一组', NULL, NULL, 1, '2018-08-02 18:32:14'),
	(1034, '1', '18900000000', '1', '男', '123456', '2', 2, '3 福州市眼科医院', 0, 0, '25 业务二组', NULL, NULL, 1, '2018-04-02 12:37:48'),
	(1024, '111', '18900000000', '111', '男', '123456', '2', 1, '12 CCC', 0, 0, '20 aaa', NULL, NULL, 1, '2017-12-27 18:02:22'),
	(1041, 'ccc', '18900000000', 'ccc', '男', '123456', '2', 1, '12 CCC', 0, 0, '', NULL, NULL, 1, '2018-08-02 18:45:59'),
	(1026, 'aab', '18900000222', 'aabc', '男', '123456', '2', 2, '3 福州市眼科医院', 0, 0, '26 业务三组', NULL, NULL, 1, '2018-04-16 18:36:50'),
	(1027, 'hj', '18900000000', 'hj', '男', '123456', '2', 2, '3 福州市眼科医院', 0, 0, '24 业务一组', NULL, NULL, 1, '2018-03-25 16:28:49'),
	(1028, 'hb', '18900000000', '校园', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 2, '3 福州市眼科医院', 3, 15, '24 业务一组', NULL, NULL, 1, '2018-03-25 17:53:56'),
	(1029, '333', '18900000000', '333', '男', '123456', '2', 0, '', 0, 0, '', NULL, NULL, 1, '2018-03-25 17:56:20'),
	(1030, 'ccc', '18900000000', 'ccc443', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 2, '3 福州市眼科医院', 0, 0, '24 业务一组', NULL, NULL, 1, '2018-03-25 21:08:00'),
	(1031, 'gf', '17095989213', 'er', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 2, '3 福州市眼科医院', 3, 13, '25 业务二组', NULL, NULL, 1, '2018-03-25 21:09:42');
/*!40000 ALTER TABLE `t_manager` ENABLE KEYS */;

-- 导出  表 yy.t_menu 结构
CREATE TABLE IF NOT EXISTS `t_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级id',
  `title` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `name` varchar(80) DEFAULT NULL COMMENT '操作控制或方法',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：1 正常；0 禁用;',
  `is_display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示：1 显示；0 隐藏',
  `list_order` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  `inputtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`menu_id`),
  KEY `pid` (`pid`),
  KEY `status` (`status`),
  KEY `is_display` (`is_display`)
) ENGINE=MyISAM AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单';

-- 正在导出表  yy.t_menu 的数据：15 rows
/*!40000 ALTER TABLE `t_menu` DISABLE KEYS */;
INSERT INTO `t_menu` (`menu_id`, `pid`, `title`, `name`, `status`, `is_display`, `list_order`, `inputtime`) VALUES
	(82, 0, '预约管理', NULL, 1, 1, 0, 0),
	(83, 82, '医院配置', '/admin/appointment/listunit', 1, 1, 0, 0),
	(84, 82, '科室配置', '/admin/hall/listdata', 1, 1, 0, 0),
	(85, 82, '医生配置', '/admin/doctor/listdata', 1, 1, 0, 0),
	(86, 82, '管理员', '/admin/appointment/listmanage', 1, 1, 0, 0),
	(87, 0, '查询统计', NULL, 1, 1, 0, 0),
	(88, 87, '预约查询', '/admin/appointment/listdata', 1, 1, 0, 0),
	(89, 87, '预约统计', NULL, 1, 1, 0, 0),
	(90, 0, '预约咨询', NULL, 1, 1, 0, 0),
	(91, 90, '部门分组', NULL, 1, 1, 0, 0),
	(92, 90, '人员管理', NULL, 1, 1, 0, 0),
	(93, 0, '商城管理', NULL, 1, 1, 0, 0),
	(94, 87, '预约排队', '/admin/appointment/registration', 1, 1, 0, 0),
	(95, 93, '用户组', '/admin/permissions/listdata', 1, 1, 0, 0),
	(96, 93, '权限管理', '/admin/permissions/listrule', 1, 1, 0, 0);
/*!40000 ALTER TABLE `t_menu` ENABLE KEYS */;

-- 导出  表 yy.t_serque 结构
CREATE TABLE IF NOT EXISTS `t_serque` (
  `QueId` int(5) NOT NULL AUTO_INCREMENT,
  `UnitId` int(4) NOT NULL COMMENT '所属单位id',
  `HallNo` int(4) NOT NULL COMMENT '所属大厅ID',
  `pic` varchar(50) DEFAULT NULL COMMENT '照片位置',
  `InterfaceID` char(10) DEFAULT NULL COMMENT '接口字符串',
  `QueName` char(30) NOT NULL,
  `DispName` char(30) NOT NULL,
  `ClassesTime` char(50) DEFAULT '11-12-21-22-31-32-41-42-51-52' COMMENT '排班安排 11--周一上午、12-周一下午、13-周一全天...',
  `EnableFlag` int(1) NOT NULL,
  `QueForm` int(1) NOT NULL DEFAULT '3' COMMENT '1--按号码排，2---按时间段方式（默认)，3---混合模式',
  `NoChar` char(2) DEFAULT 'Y' COMMENT '号前字符串 默认：Y',
  `StarNo` int(6) DEFAULT '1000' COMMENT '起始号  默认：1000',
  `WorkTime1` time DEFAULT NULL,
  `WorkTime2` time DEFAULT NULL,
  `WorkTime3` time DEFAULT NULL,
  `WorkTime4` time DEFAULT NULL,
  `HourSum` int(2) DEFAULT '6' COMMENT '每小时内可预约的数量,默认为6',
  `FetchTime` int(3) DEFAULT '30' COMMENT '可提前多少分钟在取号机上取号，默认30',
  `AlternateField1` char(80) DEFAULT NULL COMMENT '介绍与说明',
  `AlternateField2` char(20) DEFAULT NULL,
  `InTime` datetime DEFAULT NULL,
  PRIMARY KEY (`QueId`),
  KEY `queid` (`QueId`,`UnitId`,`HallNo`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- 正在导出表  yy.t_serque 的数据：12 rows
/*!40000 ALTER TABLE `t_serque` DISABLE KEYS */;
INSERT INTO `t_serque` (`QueId`, `UnitId`, `HallNo`, `pic`, `InterfaceID`, `QueName`, `DispName`, `ClassesTime`, `EnableFlag`, `QueForm`, `NoChar`, `StarNo`, `WorkTime1`, `WorkTime2`, `WorkTime3`, `WorkTime4`, `HourSum`, `FetchTime`, `AlternateField1`, `AlternateField2`, `InTime`) VALUES
	(46, 3, 0, '20180827\\39f7f03974d293fc8c95881367fcca7f.jpg', '', '王小刚', '王小刚1', '11-12-21-32-51-52', 0, 2, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '医院副院长、屈光科主任、全飞秒-准分子激光手术专家，厦门大学医学院硕士生导师。', NULL, '2017-11-26 15:24:45'),
	(47, 3, 12, '1512716467.jpg', '', '刘小真', '刘小真', '-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '主任医师，福建医科大学眼科学硕士。从事眼科工作余年，治疗经验非常丰富。', NULL, '2017-11-26 15:26:03'),
	(48, 3, 13, '20180820\\52225f7b44016e79331ad025bc2a52ce.jpg', '', '曾路宏', '曾路宏', '11-12-21-22-31-32-41-42-51-52', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副主任医师，针对近视、高度近视、散光等屈光不正', NULL, '2017-11-26 15:27:42'),
	(49, 3, 13, NULL, '', '叶宏星', '叶宏星', '-11-12-21-22-31-32-41-42-51-52-', 0, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副院长、白内障专业学科带头人、白内障科主任、医学博士。', NULL, '2017-11-26 15:28:17'),
	(50, 3, 13, '20180827\\a1ac289049589b9fdd3e9b180c0e789a.png', '', '蒋仁贵', '蒋仁贵', '11-12-21-22-31-32-41-42-51-52', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '主任医师，毕业于福建医科大学，毕业后一直从事眼科专业。', NULL, '2017-11-26 15:29:12'),
	(51, 3, 14, '1514120285.jpg', '', '刘鹏飞', '刘鹏飞', '-11-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副院长、小儿眼科及斜视专科、眼眶病及眼整形专科主任。', NULL, '2017-11-26 15:30:13'),
	(52, 3, 14, NULL, '', '陈庆生', '陈庆生', '-11-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '主任医师，福州市医学会眼科分会委员，获眼科医学进步奖。', NULL, '2017-11-26 15:31:35'),
	(53, 3, 14, NULL, '', '吴少清', '吴少清', '-11-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副主任医师，中华医学会福建分会整形与美容专科一届委员会委员、福州劳动能力鉴定委员会劳动鉴定医学技术医生组医生，曾两次获得福州市卫生局科技成果三等奖。', NULL, '2017-11-26 15:32:32'),
	(54, 3, 15, '1523873901.jpg', '', '林双庆', '林双庆1', '-11-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副主任医师，毕业于上海第二医科大学，眼科激光专业。', NULL, '2017-11-26 15:34:19'),
	(55, 16, 25, '20180821\\795181147c67708b192182045e4fc756.jpg', '', '陈宏展', '陈宏展', '12-21-22-31-32-41-42-51-52-71', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '主任医师，享受省劳模津贴，福建医学院医疗系本科毕业，从事眼科临床工作 39 年。', NULL, '2017-11-26 15:35:31'),
	(56, 3, 13, '20180816\\7811dbefe67933773e03caec532b7732.jpg', '', '黄伟强1', '黄伟强3', '21-22-31-32-41-42-51-52-61', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副主任医师，硕士。福州眼科医院青光眼科负责人。福建省眼科学会角膜病学组委员。', NULL, '2017-11-26 15:36:39'),
	(59, 16, 25, '', '', '陈发', '陈发', '11-12-21-22', 1, 2, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 5, 9999, '', NULL, '2018-08-23 16:47:05');
/*!40000 ALTER TABLE `t_serque` ENABLE KEYS */;

-- 导出  表 yy.t_situation 结构
CREATE TABLE IF NOT EXISTS `t_situation` (
  `ID` int(9) NOT NULL AUTO_INCREMENT,
  `QueId` int(5) NOT NULL COMMENT '所属队列',
  `UnitID` int(4) NOT NULL COMMENT '所属单位id',
  `HallNo` int(4) NOT NULL COMMENT '所属大厅ID',
  `InterfaceID` char(10) DEFAULT NULL COMMENT '接口字符串',
  `PresentNo` char(10) DEFAULT NULL COMMENT '当前号',
  `WaitNum` int(5) DEFAULT NULL COMMENT '等候数',
  `Amount` int(5) DEFAULT NULL COMMENT '总数',
  `InTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID` (`ID`,`UnitID`,`HallNo`,`QueId`,`InTime`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='大厅排队情况表';

-- 正在导出表  yy.t_situation 的数据：2 rows
/*!40000 ALTER TABLE `t_situation` DISABLE KEYS */;
INSERT INTO `t_situation` (`ID`, `QueId`, `UnitID`, `HallNo`, `InterfaceID`, `PresentNo`, `WaitNum`, `Amount`, `InTime`) VALUES
	(35, 33, 3, 5, '33', 'A1801', 21, 58, '2017-11-10 14:32:34'),
	(36, 7, 3, 7, '31', 'C201', 15, 45, '2017-11-10 14:33:30');
/*!40000 ALTER TABLE `t_situation` ENABLE KEYS */;

-- 导出  表 yy.t_unit 结构
CREATE TABLE IF NOT EXISTS `t_unit` (
  `UnitId` int(4) NOT NULL AUTO_INCREMENT,
  `manageid` int(4) DEFAULT '0' COMMENT '管理员id',
  `unitname` varchar(30) NOT NULL,
  `dispname` varchar(30) NOT NULL,
  `managers` varchar(40) DEFAULT NULL COMMENT '管理员详情',
  `EnableFlag` int(1) NOT NULL COMMENT '1--表示启用，0--表示停用',
  `AlternateField1` char(20) DEFAULT NULL COMMENT '备用字段1',
  `AlternateField2` char(20) DEFAULT NULL COMMENT '备用字段2',
  `InTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UnitId`),
  KEY `manageid` (`manageid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='单位';

-- 正在导出表  yy.t_unit 的数据：5 rows
/*!40000 ALTER TABLE `t_unit` DISABLE KEYS */;
INSERT INTO `t_unit` (`UnitId`, `manageid`, `unitname`, `dispname`, `managers`, `EnableFlag`, `AlternateField1`, `AlternateField2`, `InTime`) VALUES
	(12, 0, 'CCC', 'CCC', '', 1, NULL, NULL, '2017-11-29 20:39:59'),
	(3, 1001, '福州市眼科医院', '福州市眼科医院666', '1001admin黄建13300000000', 1, NULL, NULL, '2018-08-27 14:48:02'),
	(13, 1013, '2523', '234', '1013wang小王18900000000', 1, NULL, NULL, '2018-08-08 15:03:56'),
	(14, 1001, '福州市眼科医院', '福州市眼科医院5', '1001admin黄建13300000000', 0, NULL, NULL, '2018-08-08 15:49:57'),
	(16, 1, '三明市第一医院', '三明第一医院', '1admin黄建13300000000', 1, NULL, NULL, '2018-08-23 16:10:53');
/*!40000 ALTER TABLE `t_unit` ENABLE KEYS */;

-- 导出  表 yy.t_user 结构
CREATE TABLE IF NOT EXISTS `t_user` (
  `UserID` int(8) NOT NULL AUTO_INCREMENT COMMENT '用户唯一标识',
  `BodNo` char(11) NOT NULL COMMENT '手机号',
  `UserName` char(15) DEFAULT NULL COMMENT '用户名',
  `FullName` char(20) DEFAULT NULL COMMENT '姓名',
  `Sex` char(2) DEFAULT NULL COMMENT '性别',
  `PlateNumber` char(10) DEFAULT NULL COMMENT '车牌号',
  `Password` char(10) DEFAULT NULL COMMENT '密码',
  `IdCards` char(20) DEFAULT NULL COMMENT '身份证号',
  `AlternateField1` char(20) DEFAULT NULL,
  `AlternateField2` char(20) DEFAULT NULL,
  `InTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户';

-- 正在导出表  yy.t_user 的数据：0 rows
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;

-- 导出  表 yy.t_yygroup 结构
CREATE TABLE IF NOT EXISTS `t_yygroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SerInterface` char(10) DEFAULT NULL COMMENT '与排队系统的接口',
  `unitId` int(4) DEFAULT NULL COMMENT '所属大厅标识',
  `UnitName` char(50) DEFAULT NULL COMMENT '所属大厅名',
  `HallName` char(50) NOT NULL COMMENT '大厅名',
  `DispName` char(50) NOT NULL COMMENT '大厅预约名',
  `EnableFlag` int(1) NOT NULL COMMENT '启用与暂停',
  `managers1` char(30) DEFAULT NULL,
  `managers2` char(30) DEFAULT NULL COMMENT '管理员2',
  `AlternateField1` char(80) DEFAULT NULL COMMENT '说明',
  `AlternateField2` char(20) DEFAULT NULL COMMENT '管理员1',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='预约分组';

-- 正在导出表  yy.t_yygroup 的数据：3 rows
/*!40000 ALTER TABLE `t_yygroup` DISABLE KEYS */;
INSERT INTO `t_yygroup` (`id`, `SerInterface`, `unitId`, `UnitName`, `HallName`, `DispName`, `EnableFlag`, `managers1`, `managers2`, `AlternateField1`, `AlternateField2`, `addtime`) VALUES
	(24, '', 12, 'CCC', '业务一组6', '业务一组6', 1, '', '', '', NULL, 1534755047),
	(25, 'aaa1221', 3, '易达眼科医院', '业务二组', '业务二组', 0, '', '', '', NULL, 1534755047),
	(26, 'AAAm', 3, '易达眼科医院', '业务三组', '业务三组', 1, '', '', '', NULL, 1534755047);
/*!40000 ALTER TABLE `t_yygroup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
