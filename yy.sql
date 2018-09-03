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

-- 导出  表 yy.t_article 结构
CREATE TABLE IF NOT EXISTS `t_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitid` int(11) NOT NULL DEFAULT '0' COMMENT '单位id',
  `manager_id` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '文章分类',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `subtitle` varchar(200) NOT NULL COMMENT '副标题',
  `content` text NOT NULL COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0=关闭 1=开启',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `unitid` (`unitid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='文章消息';

-- 正在导出表  yy.t_article 的数据：3 rows
/*!40000 ALTER TABLE `t_article` DISABLE KEYS */;
INSERT INTO `t_article` (`id`, `unitid`, `manager_id`, `cate_id`, `title`, `subtitle`, `content`, `status`, `addtime`) VALUES
	(1, 0, 1, 1, '共享单车之后，共享孙子孙女也要来了？', '别人的父母总是比自己的父母好。奇怪的是，自己的（外）祖父母，永远都比别人的好。——《戏梦巴黎》', '<p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">对于不少人来说，小时候在家里闯祸了捣蛋了，（外）祖父母总是挡在要惩罚自己的爸妈面前的守护者。现在已经长大出来工作的你，一年下来又有多少时间陪伴（外）祖父母？</span></p><div class="img-container" style="margin-top: 30px; font-family: arial; font-size: 12px; white-space: normal;"><img class="large" src="https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1983400892,1431839083&fm=173&app=25&f=JPEG?w=640&h=437&s=A8006891CA32468C8A9668E40300F03A" style="border-width: 0px; border-style: initial; width: 537px; display: block;"/></div><p style="margin-top: 26px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p"><span class="bjh-br"></span></span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">▲ 图片来自 Psychology Benefits Society</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">最近，美国弗罗里达州冒出了一款名为「Papa」的 app，如果按中国互联网套话来说，它所做的就是「共享孙子 / 女」。</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">通过这款 app，佛罗里达州的老人家可以在 app 上预约一名大学生，提供上门服务：让他们帮忙做家务、开车载他们去买杂货、陪他们聊天下棋，甚至教老人家玩社交软件。</span></p><div class="img-container" style="margin-top: 30px; font-family: arial; font-size: 12px; white-space: normal;"><img class="large" src="https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1064671196,2831597983&fm=173&app=25&f=JPEG?w=640&h=427&s=9F0045870E022EC4488180BE03006003" style="border-width: 0px; border-style: initial; width: 537px; display: block;"/></div><p style="margin-top: 26px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">虽然看着像是轻度劳务服务，但 Papa 的重点还是要解决老人家的孤独感。Papa 的创始人 Andrew Parker 对《Fastcompany》说：</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-blockquote" style="display: block; position: relative; font-size: 18px; color: rgb(153, 153, 153); padding-left: 30px;"><span class="bjh-p">我们相信，我们主要在解决的还是老人家的孤独问题。我想，随着时间推移，这个问题还会不断加深，甚至比我们想象中更严重。</span></span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">Parker 也许并不无道理。美国人口局（Population Reference Bureau）的一份报告指出，美国超过 65 岁的人口到 2060 年可超过 9800 万人，预测占总人口的 24%。</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">但他做这款产品的启发，其实还是出于自身需求。他的爷爷换上了老年痴呆症，看着奶奶一个人照顾非常辛苦，Parker 和家人就找来了传统的家庭护理，但效果并不理想。后来，他聘请了一位大学生帮忙照顾爷爷奶奶，老人家倒是挺开心的。</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">于是，他就搭建了这个平台，招募有耐心、有爱心的大学生（其中不少都是社会服务类专业）来当「Papa Pals」，而软件名「Papa」则是他爷爷的昵称。</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-h3" style="font-size: 18px; font-weight: 700; color: rgb(0, 0, 0); position: relative; padding-left: 9px;">每个人都需要陪伴，「嘴硬」的老人家更是如此</span></p><div class="img-container" style="margin-top: 30px; font-family: arial; font-size: 12px; white-space: normal;"><img class="large" src="https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=2474581061,753457552&fm=173&app=25&f=JPEG?w=640&h=427&s=D03AA777493174849EC900E10300A032" style="border-width: 0px; border-style: initial; width: 537px; display: block;"/></div><p style="margin-top: 26px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">也许是出于对感情因素的考虑吧，Papa 提供了「指定人」的功能。老人家可以先面试，挑出一组自己喜欢的「Papa Pals」来服务自己。</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">老人家要用这个 app，每个月要交 15 美元的会费，如果要指定人，就得交 30 美元 / 月。此外，无论是哪个套餐，每次使用服务，还得按 15 美元 / 小时来收费。</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">Parker 声称，上门拜访服务的平均时长为 3 小时，也有人试过订了 10 小时服务的。</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-blockquote" style="display: block; position: relative; font-size: 18px; color: rgb(153, 153, 153); padding-left: 30px;"><span class="bjh-p">有趣的是，大家都不会说自己需要陪伴，即便他们的家人说他们需要。不过，当一次拜访被延长到 6 小时，你就知道是什么情况了。</span></span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">Parker 对 TechCrunch 说道。此外，Parker 还曾在接受《每日邮报》采访时表示「正在考虑将业务扩张到日本。」</span></p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;"><span class="bjh-p">然而，老龄化出名严重的日本，其实早已经有类似的业务，而且服务范围更广，直接「共享家人」</span></p><p><br/></p>', 1, 1535612431),
	(2, 0, 1, 2, '亚马逊市值逼近1万亿美元 待股价涨至2050美元', '昨夜亚马逊股价首次涨破 2000 美元，最高触及 2024 美元。', '<div class="img-container" style="margin-top: 30px; font-family: arial; font-size: 12px; white-space: normal;"><img class="normal" width="507px" src="https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=724920300,71213560&fm=173&app=25&f=JPEG?w=507&h=254&s=183ECE148EE378131AAA054C030080FA" style="border-width: 0px; border-style: initial; display: block; margin-right: auto; margin-left: auto;"/></div><p style="margin-top: 26px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">此前有测算称，待股价涨至 2050 美元，亚马逊的市值将达到 1 万亿美元，有望成为继苹果后第二家市值万亿美元的科技公司。目前亚马逊市值约为9766亿美元。</p><div class="img-container" style="margin-top: 30px; font-family: arial; font-size: 12px; white-space: normal;"><img class="normal" width="310px" src="https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=2649086778,317617244&fm=173&app=25&f=JPEG?w=310&h=134&s=2851AB4E40D411641B7478190100C091" style="border-width: 0px; border-style: initial; display: block; margin-right: auto; margin-left: auto;"/></div><p style="margin-top: 26px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">TCL发布黑莓KEY2 LE 售价399美元起</p><div class="img-container" style="margin-top: 30px; font-family: arial; font-size: 12px; white-space: normal;"><img class="normal" width="310px" src="https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3707267936,2415500796&fm=173&app=25&f=JPEG?w=310&h=134&s=F31870234573962B5F0A0B870300B0A9" style="border-width: 0px; border-style: initial; display: block; margin-right: auto; margin-left: auto;"/></div><p style="margin-top: 26px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">OPPO R17今日首销 售价3199元起</p><div class="img-container" style="margin-top: 30px; font-family: arial; font-size: 12px; white-space: normal;"><img class="normal" width="310px" src="https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=4247199598,369715290&fm=173&app=25&f=JPEG?w=310&h=134&s=3A01366680EC173A4195B6670300306A" style="border-width: 0px; border-style: initial; display: block; margin-right: auto; margin-left: auto;"/></div><p style="margin-top: 26px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">索尼Xperia XZ3四配色渲染图曝光</p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">官方微博/微信</p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">每日头条、业界资讯、热点资讯、八卦爆料，全天跟踪微博播报。各种爆料、内幕、花边、资讯一网打尽。百万互联网粉丝互动参与，TechWeb官方微博期待您的关注。</p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">↑扫描二维码</p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">想在手机上看科技资讯和科技八卦吗？</p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">想第一时间看独家爆料和深度报道吗？</p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">请关注TechWeb官方微信公众帐号：</p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">1.用手机扫左侧二维码；</p><p style="margin-top: 22px; margin-bottom: 0px; line-height: 24px; color: rgb(51, 51, 51); text-align: justify; font-family: arial; white-space: normal;">2.在添加朋友里，搜索关注TechWeb。</p><p><br/></p>', 1, 1535684636),
	(3, 0, 1, 1, '福州眼科医院“摘镜热潮”持续升温中……', '', '<p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">8月的福州</p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">每天都在热出新高度</p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">但持续高温却没能挡住近视患者们的摘镜热情</p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">这两天</p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">在福州眼科医院屈光科里</p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">摘镜热潮也是一波接着一波</p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">暑假以来，福州眼科医院近视矫治手术量就出现了激增的情况，单日手术量连续刷新纪录！连日的高温依然挡不住近视患者们来福州眼科医院摘镜的热情。</p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">有许多近视患者陆续来到福州眼科医院屈光科，进行手术方式选择、术前检查、术前心理辅导，在经过一系列全面的术前检查及准备后，在中午就进入了手术室等待摘镜。</p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;"><img src="http://d.ifengimg.com/w600/p0.ifengimg.com/pmop/2018/0813/06451C9F9656B0FAEB644931345653638D0809B9_size88_w1080_h775.jpeg" style="vertical-align: baseline; font-weight: inherit; font-family: SimSun, Arial; font-style: inherit; margin-top: 28px; margin-right: auto; margin-left: auto; border-width: 0px; border-style: initial; display: block; max-width: 640px; height: 162px; width: 254px;"/></p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">福州眼科医院副院长、屈光科陈主任为患者进行全飞秒手术</p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;"><strong style="vertical-align: baseline; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px;">福州眼科医院</strong></p><p style="vertical-align: baseline; font-family: &quot;Microsoft YaHei&quot;; margin-top: 28px; margin-bottom: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; line-height: 28px; color: rgb(34, 34, 34); text-align: justify; text-indent: 2em; white-space: normal;">福州眼科医院是一所集医疗、教学、科研、防盲为一体的三级眼科专科医院。福州眼科医院整合了厦门眼科中心和福州市二医院这两所医院的医疗资源优势，实现强强联合。医院开设有白内障、眼底病、眼外伤、屈光科、小儿斜弱视、青光眼、眼表及角膜、眼眶眼整形等专科，以及临床医技检查、检验、医学验光 配镜部等临床辅助科室。咨询电话：0591-88510666</p><p><br/></p>', 1, 1535700426);
/*!40000 ALTER TABLE `t_article` ENABLE KEYS */;

-- 导出  表 yy.t_article_cate 结构
CREATE TABLE IF NOT EXISTS `t_article_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitid` int(11) NOT NULL DEFAULT '0' COMMENT '单位id',
  `name` varchar(10) NOT NULL COMMENT '分类名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0=关闭 1=开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文章分类';

-- 正在导出表  yy.t_article_cate 的数据：2 rows
/*!40000 ALTER TABLE `t_article_cate` DISABLE KEYS */;
INSERT INTO `t_article_cate` (`id`, `unitid`, `name`, `status`) VALUES
	(1, 0, '国内消息', 1),
	(2, 0, '国际消息', 1);
/*!40000 ALTER TABLE `t_article_cate` ENABLE KEYS */;

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
	(1, '超级管理员', 1, '2,3,18,41,42,5,19,39,40,6,20,36,37,38,49,7,17,34,35,24,31,32,33,25,9,46,10,43,11,12,44,47,48,1,4,22,23,28,29,30,8,21,26,27,51,52,53,54,55,56,57,58,59,60,61'),
	(2, '单位管理员', 1, '2,3,18,41,42,5,19,39,40,6,20,36,37,38,49,7,17,34,35,24,31,32,33,25,9,46,10,43,11,12,44,47,48'),
	(3, '大厅管理员', 1, '5,19,39,40,6,20,36,37,38,49,24,31,32,33,9,46,10,43,11,12,44,47,48'),
	(15, '预约部长', 1, '2,3,18,41,42,5,19,39,40,6,20,36,37,38,49,7,17,34,35,9,46,10,43,11,12,44,47,48'),
	(16, '预约组长', 1, '9,46,10,43,11,12,44,47,48'),
	(17, '预约操作员', 1, '9,46,10,43,12,44');
/*!40000 ALTER TABLE `t_auth_group` ENABLE KEYS */;

-- 导出  表 yy.t_auth_group_access 结构
CREATE TABLE IF NOT EXISTS `t_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';

-- 正在导出表  yy.t_auth_group_access 的数据：16 rows
/*!40000 ALTER TABLE `t_auth_group_access` DISABLE KEYS */;
INSERT INTO `t_auth_group_access` (`uid`, `group_id`) VALUES
	(0, 15),
	(1, 1),
	(23, 2),
	(1002, 15),
	(1003, 15),
	(1028, 1),
	(1030, 2),
	(1035, 15),
	(1040, 3),
	(1048, 2),
	(1049, 3),
	(1050, 16),
	(1051, 17),
	(1052, 15),
	(1053, 15),
	(1054, 16);
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
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COMMENT='权限表';

-- 正在导出表  yy.t_auth_rule 的数据：55 rows
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
	(11, 9, '预约统计', '', 1, 1, 0, 0, ''),
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
	(49, 6, '获取部门', 'admin/appointment/gethall', 1, 1, 0, 0, ''),
	(51, 0, '信息管理', '', 1, 1, 1, 0, ''),
	(52, 51, '添加文章', 'admin/article/article', 1, 1, 1, 0, ''),
	(53, 51, '分类列表', 'admin/article/cateList', 1, 1, 1, 0, ''),
	(54, 53, '文章分类编辑', 'admin/article/cateEdit', 1, 1, 0, 0, ''),
	(55, 51, '添加分类', 'admin/article/cateedit', 1, 1, 1, 0, ''),
	(56, 51, '文章列表', 'admin/article/articleList', 1, 1, 1, 0, ''),
	(57, 0, '短信管理', '', 1, 1, 1, 0, ''),
	(58, 57, '短信配置', 'admin/sms/smsconfig', 1, 1, 1, 0, ''),
	(59, 57, '短信日志', 'admin/sms/smsLog', 1, 1, 1, 0, ''),
	(60, 57, '新增短信配置', 'admin/sms/smsEdit', 1, 1, 1, 0, ''),
	(61, 57, '批量发送短信', 'admin/sms/sendBatchSms', 1, 1, 1, 0, ''),
	(62, 59, '短信日志重新发送短信', 'admin/sms/reSend', 1, 1, 0, 0, '');
/*!40000 ALTER TABLE `t_auth_rule` ENABLE KEYS */;

-- 导出  表 yy.t_despeak 结构
CREATE TABLE IF NOT EXISTS `t_despeak` (
  `despeak_id` int(9) NOT NULL AUTO_INCREMENT COMMENT 'ID唯一标识',
  `manager_id` int(9) NOT NULL DEFAULT '0' COMMENT '操作人员',
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
  `platform` varchar(10) DEFAULT NULL COMMENT '数据来源',
  `inTime` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0=取消 1=正常 2=完成',
  `addtime` int(10) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`despeak_id`),
  KEY `manager_id` (`manager_id`)
) ENGINE=MyISAM AUTO_INCREMENT=220 DEFAULT CHARSET=utf8 COMMENT='预约数据';

-- 正在导出表  yy.t_despeak 的数据：54 rows
/*!40000 ALTER TABLE `t_despeak` DISABLE KEYS */;
INSERT INTO `t_despeak` (`despeak_id`, `manager_id`, `mobile`, `name`, `idcard`, `plateNum`, `noChar`, `queNo`, `despeakDate`, `time_Part_S`, `time_Part_O`, `fetchTime`, `unitId`, `unitName`, `hallNo`, `hallName`, `queId`, `queName`, `AlternateField1`, `AlternateField2`, `hall_Con`, `que_Con`, `inClerk`, `inUnit`, `inDept`, `remark`, `platform`, `inTime`, `status`, `addtime`) VALUES
	(164, 0, '13567896789', '', '420111197910094099', '', 'Y', 1000, '2018-03-20', '09:00:00', '10:00:00', 9999, 4, '', 13, '屈光科', 48, '曾路宏', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '2018-03-13 09:00:30', 1, NULL),
	(165, 0, '13345674567', 'aaaa', '420111197910094099', '', 'Y', 1000, '2018-03-23', '16:00:00', '17:00:00', 9999, 3, '', 12, '屈光科', 56, '黄伟强', NULL, NULL, '', '', '1022 bb bb', '3 易达眼科医院', '', NULL, NULL, '2018-03-13 12:58:38', 1, NULL),
	(166, 0, '13696969696', '', '420111197910094099', '', 'Y', 1000, '2018-04-17', '09:00:00', '10:00:00', 9999, 3, '', 12, '屈光科', 47, '刘小真', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '2018-04-16 18:23:58', 1, NULL),
	(167, 0, '13042343423', '111', '420111197910094099', '', 'Y', 1001, '2018-04-17', '09:00:00', '10:00:00', 9999, 3, '', 12, '屈光科', 47, '刘小真', NULL, NULL, '', '', '1031 bbb bbb', '3 福州市眼科医院', '25 业务二组', NULL, NULL, '2018-04-16 19:40:34', 1, NULL),
	(168, 0, '13345674567', '123133', '420111197910094099', '', 'Y', 1000, '2018-04-18', '10:00:00', '11:00:00', 9999, 3, '', 12, '屈光科', 56, '黄伟强', NULL, NULL, '', '', '1035 2 2', '3 福州市眼科医院', '24 业务一组', NULL, NULL, '2018-04-16 20:53:58', 1, NULL),
	(169, 0, '13245674567', '12345', '420111197910094099', '', 'Y', 1000, '2018-04-23', '17:00:00', '18:00:00', 9999, 3, '', 15, '眼底病专科', 54, '林双庆', NULL, NULL, '', '', '1040 xxx xxx', '3 福州市眼科医院', '25 业务二组', NULL, NULL, '2018-04-16 21:08:58', 1, NULL),
	(170, 0, '13456785678', '', '420111197910094099', '', 'Y', 1000, '2018-04-20', '09:00:00', '10:00:00', 9999, 3, '', 13, '屈光科', 46, '王小刚', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '2018-04-17 10:17:27', 1, NULL),
	(171, 0, '13345674567', '12121', '420111197910094099', '', 'Y', 1001, '2018-04-20', '09:00:00', '10:00:00', 9999, 3, '', 13, '白内障专科', 46, '王小刚', NULL, NULL, '', '', '1040 xxx xxx', '3 福州市眼科医院', '25 业务二组', NULL, NULL, '2018-04-17 10:40:45', 1, NULL),
	(174, 0, '13363636363', '', '420111197910094099', '', 'Y', 1000, '2018-08-08', '17:00:00', '18:00:00', 9999, 3, '', 12, '屈光科', 47, '刘小真', NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '2018-08-07 09:54:55', 1, NULL),
	(175, 0, '24124', '权限', '12421421412', NULL, NULL, NULL, '2018-08-15', '10:00:00', '11:00:00', NULL, 0, NULL, 16, '眼表病专科1', 55, '陈宏展', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2018-08-13 10:44:59', 1, NULL),
	(176, 0, '15125124125', '特意', '2414444444444', NULL, NULL, NULL, '2018-08-15', '11:00:00', '12:00:00', NULL, 0, NULL, 16, '眼表病专科1', 55, '陈宏展', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 've', NULL, '2018-08-13 11:51:33', 1, NULL),
	(177, 0, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:34:06', 1, 1534923246),
	(178, 0, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:35:59', 1, 1534923359),
	(179, 0, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:36:17', 1, 1534923377),
	(180, 0, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '10:00:00', '11:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:39:17', 1, 1534923557),
	(181, 0, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:46:18', 1, 1534923978),
	(182, 0, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:46:32', 1, 1534923992),
	(183, 0, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-24', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-22 15:46:41', 1, 1534924001),
	(184, 0, '13696800225', NULL, '', NULL, NULL, NULL, '2018-08-24', '15:00:00', '16:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 15:44:39', 1, 1535010279),
	(185, 0, '13696800225', NULL, '', NULL, NULL, NULL, '2018-08-27', '14:00:00', '15:00:00', NULL, 0, NULL, 13, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 15:46:15', 1, 1535010375),
	(186, 0, '15377907108', NULL, '12345979676949646', NULL, NULL, NULL, '2018-08-27', '09:00:00', '10:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 15:47:53', 1, 1535010473),
	(187, 0, '13696800225', '陈崇炎', '35012219880209461X', NULL, NULL, NULL, '2018-08-24', '10:00:00', '11:00:00', NULL, 0, NULL, 16, '眼表病专科2', 55, '陈宏展', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2018-08-23 00:00:00', 1, 1535011476),
	(188, 0, '13696800225', NULL, '', NULL, NULL, NULL, '2018-08-24', '11:00:00', '12:00:00', NULL, 0, NULL, 13, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 16:07:20', 1, 1535011640),
	(189, 0, '13696800225', NULL, '', NULL, NULL, NULL, '2018-08-27', '10:00:00', '11:00:00', NULL, 0, NULL, 25, NULL, 59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-23 16:48:29', 1, 1535014109),
	(190, 0, '15377907108', NULL, '350124198912282876', NULL, NULL, NULL, '2018-08-26', NULL, NULL, NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-24 14:22:23', 1, 1535091743),
	(191, 0, '15377907108', NULL, '350124198912282876', NULL, NULL, NULL, '2018-08-27', NULL, NULL, NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-24 14:24:25', 1, 1535091865),
	(192, 0, '15377907108', NULL, '350124198912282876', NULL, NULL, NULL, '2018-08-27', '12:00:00', '13:00:00', NULL, 0, NULL, 16, NULL, 55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-24 14:30:16', 0, 1535092216),
	(193, 0, '12345645645', '陈娟', '420111197910094099', NULL, NULL, NULL, '2018-08-28', '10:00:00', '11:00:00', NULL, 3, NULL, 13, '白内障专科', 46, '王小刚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2018-08-27 00:00:00', 1, 1535350235),
	(194, 0, '15377907108', NULL, '350124198912282892', NULL, NULL, NULL, '2018-08-30', '16:00:00', '17:00:00', NULL, 0, NULL, 13, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-28 16:08:11', 2, 1535443691),
	(195, 0, '15377907108', NULL, '420111197910094099', NULL, NULL, NULL, '2018-08-31', '15:00:00', '16:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 10:50:44', 1, 1535511044),
	(196, 0, '13696800225', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-08-30', '15:00:00', '16:00:00', NULL, 0, NULL, 13, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:04:16', 1, 1535511856),
	(197, 0, '13696800226', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-08-31', '09:00:00', '10:00:00', NULL, 0, NULL, 15, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:10:02', 1, 1535512202),
	(198, 0, '17095989314', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-01', '11:00:00', '12:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:42:02', 1, 1535514122),
	(199, 0, '17095989314', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-04', '10:00:00', '11:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:43:30', 1, 1535514210),
	(200, 0, '13696800225', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-01', '14:00:00', '15:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:43:52', 0, 1535514232),
	(201, 0, '13696800227', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-01', '12:00:00', '13:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:45:03', 1, 1535514303),
	(202, 0, '15375907108', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-05', '11:00:00', '12:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:45:49', 1, 1535514349),
	(203, 0, '15377907108', NULL, '420111197910094099', NULL, NULL, NULL, '2018-08-31', '09:00:00', '10:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:54:46', 1, 1535514886),
	(204, 0, '15877907208', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-04', '12:00:00', '13:00:00', NULL, 0, NULL, 13, NULL, 56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 11:57:42', 1, 1535515062),
	(205, 0, '13696800225', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-08-30', '09:00:00', '10:00:00', NULL, 0, NULL, 25, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-29 17:14:18', 1, 1535534058),
	(206, 0, '13696800225', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-09-05', '08:00:00', '09:00:00', NULL, 0, NULL, 25, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-30 10:17:02', 0, 1535595422),
	(207, 1, '15377907108', '权限', '12345979676949646', NULL, NULL, NULL, '2018-08-31', '10:00:00', '11:00:00', NULL, 0, NULL, 13, '白内障专科', 50, '蒋仁贵', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'windows', '2018-08-30 00:00:00', 1, 1535598344),
	(208, 0, '13696800225', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-09-04', '08:00:00', '09:00:00', NULL, 0, NULL, 25, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-30 17:21:02', 1, 1535620862),
	(209, 0, '13696800225', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-09-04', '11:00:00', '12:00:00', NULL, 0, NULL, 25, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-30 17:26:29', 1, 1535621189),
	(210, 0, '13696800225', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-09-04', '09:00:00', '10:00:00', NULL, 0, NULL, 25, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-30 17:26:38', 1, 1535621198),
	(211, 0, '13696800225', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-09-04', '10:00:00', '11:00:00', NULL, 0, NULL, 25, NULL, 61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-30 17:29:23', 0, 1535621363),
	(212, 0, '13300000000', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-03', '09:00:00', '10:00:00', NULL, 0, NULL, 15, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-31 11:30:48', 1, 1535686248),
	(213, 0, '13300000000', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-03', '10:00:00', '11:00:00', NULL, 0, NULL, 15, NULL, 54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-31 11:31:23', 0, 1535686283),
	(214, 0, '13300000000', NULL, '420111197910094099', NULL, NULL, NULL, '2018-09-03', '14:00:00', '15:00:00', NULL, 0, NULL, 13, NULL, 48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-31 11:50:27', 1, 1535687427),
	(215, 0, '13696800225', NULL, '35012219880209461X', NULL, NULL, NULL, '2018-09-06', '09:00:00', '10:00:00', NULL, 0, NULL, 25, NULL, 62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-08-31 14:44:28', 0, 1535697868),
	(216, 1, '13567896789', '222', '420111197910094099', NULL, NULL, NULL, '2018-09-04', '10:00:00', '11:00:00', NULL, 0, NULL, 15, '眼底病专科', 54, '林双庆', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'windows', '2018-08-31 00:00:00', 1, 1535698602),
	(217, 1, '13696800225', '陈崇炎', '35012219880209461X', NULL, NULL, NULL, '2018-09-02', '09:00:00', '10:00:00', NULL, 0, NULL, 25, '内科', 61, '美女1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'windows', '2018-08-31 00:00:00', 1, 1535698615),
	(218, 1, '', '', '', NULL, NULL, NULL, '2018-09-06', '10:00:00', '11:00:00', NULL, 0, NULL, 25, '内科', 62, '美女2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'windows', '2018-08-31 00:00:00', 1, 1535698777),
	(219, 1, '', '', '', NULL, NULL, NULL, '2018-09-05', '10:00:00', '11:00:00', NULL, 0, NULL, 25, '内科', 61, '美女1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 'windows', '2018-08-31 00:00:00', 1, 1535698854);
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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='部门';

-- 正在导出表  yy.t_hall 的数据：12 rows
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
	(25, '', 16, NULL, '内科', '内科', 1, '08:00:00', '12:00:00', '14:00:00', '18:00:00', 6, NULL, NULL, '', NULL, '2018-08-23 16:12:31'),
	(28, '', 16, NULL, '外科', '外科', 1, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 5, NULL, NULL, '', NULL, '2018-08-29 15:01:36'),
	(29, '', 16, NULL, '皮肤科', '皮肤科', 1, '08:00:00', '12:00:00', '14:00:00', '18:00:00', 5, NULL, NULL, '', NULL, '2018-08-31 17:28:05');
/*!40000 ALTER TABLE `t_hall` ENABLE KEYS */;

-- 导出  表 yy.t_manager 结构
CREATE TABLE IF NOT EXISTS `t_manager` (
  `UserId` int(6) NOT NULL AUTO_INCREMENT,
  `unitid` int(10) NOT NULL DEFAULT '0' COMMENT '单位id',
  `hallid` int(10) NOT NULL DEFAULT '0' COMMENT '部门id',
  `UserName` char(20) NOT NULL,
  `BodNo` char(11) NOT NULL COMMENT '手机号',
  `FullName` char(16) NOT NULL,
  `Sex` char(2) DEFAULT NULL,
  `password` varchar(32) NOT NULL COMMENT '密码',
  `group_id` varchar(50) DEFAULT '0' COMMENT '身份类型 auth_group',
  `Types` tinyint(1) DEFAULT '0' COMMENT '用户类型编码 1=管理员 2=预约管理',
  `UnitIDS` char(50) DEFAULT NULL COMMENT '可管理单位单码',
  `ServiceNoS` char(50) DEFAULT NULL COMMENT '可管理单位单码',
  `AlternateField1` char(20) DEFAULT NULL COMMENT '备用字段1',
  `AlternateField2` char(20) DEFAULT NULL COMMENT '备用字段2',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态 0=禁用 1=正常',
  `InTime` datetime DEFAULT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=MyISAM AUTO_INCREMENT=1055 DEFAULT CHARSET=utf8 COMMENT='管理员';

-- 正在导出表  yy.t_manager 的数据：22 rows
/*!40000 ALTER TABLE `t_manager` DISABLE KEYS */;
INSERT INTO `t_manager` (`UserId`, `unitid`, `hallid`, `UserName`, `BodNo`, `FullName`, `Sex`, `password`, `group_id`, `Types`, `UnitIDS`, `ServiceNoS`, `AlternateField1`, `AlternateField2`, `status`, `InTime`) VALUES
	(1, 0, 0, 'admin', '13300000000', '黄建', '男', 'e10adc3949ba59abbe56e057f20f883e', '1', 1, NULL, NULL, NULL, NULL, 1, '2017-11-28 17:56:31'),
	(1002, 3, 16, 'hj', '13345674567', '郑成', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 1, '3 易达眼科医院', '', NULL, NULL, 1, '2018-03-13 22:03:55'),
	(1049, 16, 0, 'dt', '', '大厅管理员', '男', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, NULL, NULL, NULL, NULL, 1, '2018-08-29 14:49:28'),
	(1009, 0, 0, 'admin001', '18900000000', 'lhh', '男', '123456', '2', 1, '3 易达眼科医院', '16 眼表病专科1', NULL, NULL, 1, '2017-12-27 18:17:12'),
	(1010, 0, 0, 'czy', '18900000000', '操作员A', '男', '123456', '2', 2, '12 CCC', '', NULL, NULL, 1, '2018-08-02 18:32:31'),
	(1035, 3, 13, '2', '18900000000', '2', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 2, '3 福州市眼科医院', '24 业务一组', NULL, NULL, 1, '2018-04-02 12:38:01'),
	(1013, 0, 0, 'wang', '18900000000', '小王', '女', '123456', '2', 2, '3 福州市眼科医院', '24 业务一组', NULL, NULL, 1, '2018-08-02 18:32:14'),
	(1048, 16, 0, 'ccy', '', '陈三', '男', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, NULL, NULL, NULL, NULL, 1, '2018-08-29 14:38:21'),
	(1034, 0, 0, '1', '18900000000', '1', '男', '123456', '2', 2, '3 福州市眼科医院', '25 业务二组', NULL, NULL, 1, '2018-04-02 12:37:48'),
	(1024, 0, 0, '111', '18900000000', '111', '男', '123456', '2', 1, '12 CCC', '20 aaa', NULL, NULL, 1, '2017-12-27 18:02:22'),
	(1041, 0, 0, 'ccc', '18900000000', 'ccc', '男', '123456', '2', 1, '12 CCC', '', NULL, NULL, 1, '2018-08-02 18:45:59'),
	(1026, 0, 0, 'aab', '18900000222', 'aabc', '男', '123456', '2', 2, '3 福州市眼科医院', '26 业务三组', NULL, NULL, 1, '2018-04-16 18:36:50'),
	(1027, 0, 0, 'hj', '18900000000', 'hj', '男', '123456', '2', 2, '3 福州市眼科医院', '24 业务一组', NULL, NULL, 1, '2018-03-25 16:28:49'),
	(1028, 3, 15, 'hb', '18900000000', '校园', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 2, '3 福州市眼科医院', '24 业务一组', NULL, NULL, 1, '2018-03-25 17:53:56'),
	(1029, 0, 0, '333', '18900000000', '333', '男', '123456', '2', 0, '', '', NULL, NULL, 1, '2018-03-25 17:56:20'),
	(1030, 3, 0, 'ccc', '18900000000', 'ccc443', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 2, '3 福州市眼科医院', '24 业务一组', NULL, NULL, 1, '2018-03-25 21:08:00'),
	(1031, 3, 13, 'gf', '17095989213', 'er', '男', 'e10adc3949ba59abbe56e057f20f883e', '2', 2, '3 福州市眼科医院', '25 业务二组', NULL, NULL, 1, '2018-03-25 21:09:42'),
	(1050, 16, 0, 'aaa', '', 'aa', '男', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, NULL, NULL, NULL, NULL, 1, '2018-08-29 14:53:31'),
	(1051, 16, 0, 'aa', '', 'aaa', '男', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, NULL, NULL, NULL, NULL, 1, '2018-08-29 14:54:08'),
	(1052, 16, 0, 'y123', '', '陈四', '男', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, NULL, NULL, NULL, NULL, 1, '2018-08-29 14:55:34'),
	(1053, 12, 0, 'aau', '', 'aa', '男', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, NULL, NULL, NULL, NULL, 1, '2018-08-29 14:59:43'),
	(1054, 16, 0, 'yy123', '', '陈五', '男', 'e10adc3949ba59abbe56e057f20f883e', '0', 0, NULL, NULL, NULL, NULL, 1, '2018-08-29 15:17:08');
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
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- 正在导出表  yy.t_serque 的数据：15 rows
/*!40000 ALTER TABLE `t_serque` DISABLE KEYS */;
INSERT INTO `t_serque` (`QueId`, `UnitId`, `HallNo`, `pic`, `InterfaceID`, `QueName`, `DispName`, `ClassesTime`, `EnableFlag`, `QueForm`, `NoChar`, `StarNo`, `WorkTime1`, `WorkTime2`, `WorkTime3`, `WorkTime4`, `HourSum`, `FetchTime`, `AlternateField1`, `AlternateField2`, `InTime`) VALUES
	(46, 3, 0, '20180827\\39f7f03974d293fc8c95881367fcca7f.jpg', '', '王小刚', '王小刚1', '11-12-21-32-51-52', 0, 2, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '医院副院长、屈光科主任、全飞秒-准分子激光手术专家，厦门大学医学院硕士生导师。', NULL, '2017-11-26 15:24:45'),
	(47, 3, 12, '1512716467.jpg', '', '刘小真', '刘小真', '-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '主任医师，福建医科大学眼科学硕士。从事眼科工作余年，治疗经验非常丰富。', NULL, '2017-11-26 15:26:03'),
	(48, 3, 13, '20180820\\52225f7b44016e79331ad025bc2a52ce.jpg', '', '曾路宏', '曾路宏', '11-12-21-22-31-32-41-42-51-52', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副主任医师，针对近视、高度近视、散光等屈光不正', NULL, '2017-11-26 15:27:42'),
	(49, 3, 13, NULL, '', '叶宏星', '叶宏星', '-11-12-21-22-31-32-41-42-51-52-', 0, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副院长、白内障专业学科带头人、白内障科主任、医学博士。', NULL, '2017-11-26 15:28:17'),
	(50, 3, 13, '20180827\\a1ac289049589b9fdd3e9b180c0e789a.png', '', '蒋仁贵', '蒋仁贵', '11-21-32-41-42-51', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '主任医师，毕业于福建医科大学，毕业后一直从事眼科专业。', NULL, '2017-11-26 15:29:12'),
	(51, 3, 14, '1514120285.jpg', '', '刘鹏飞', '刘鹏飞', '-11-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副院长、小儿眼科及斜视专科、眼眶病及眼整形专科主任。', NULL, '2017-11-26 15:30:13'),
	(52, 3, 14, NULL, '', '陈庆生', '陈庆生', '-11-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '主任医师，福州市医学会眼科分会委员，获眼科医学进步奖。', NULL, '2017-11-26 15:31:35'),
	(53, 3, 14, NULL, '', '吴少清', '吴少清', '-11-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副主任医师，中华医学会福建分会整形与美容专科一届委员会委员、福州劳动能力鉴定委员会劳动鉴定医学技术医生组医生，曾两次获得福州市卫生局科技成果三等奖。', NULL, '2017-11-26 15:32:32'),
	(54, 3, 15, '1523873901.jpg', '', '林双庆', '林双庆1', '-11-12-21-22-31-32-41-42-51-52-', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副主任医师，毕业于上海第二医科大学，眼科激光专业。', NULL, '2017-11-26 15:34:19'),
	(55, 16, 25, '20180821\\795181147c67708b192182045e4fc756.jpg', '', '陈宏展', '陈宏展', '12-21-22-31-32-41-42-51-52-71', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '主任医师，享受省劳模津贴，福建医学院医疗系本科毕业，从事眼科临床工作 39 年。', NULL, '2017-11-26 15:35:31'),
	(56, 3, 13, '20180816\\7811dbefe67933773e03caec532b7732.jpg', '', '黄伟强1', '黄伟强3', '21-22-31-32-41-42-51-52-61', 1, 3, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 6, 9999, '副主任医师，硕士。福州眼科医院青光眼科负责人。福建省眼科学会角膜病学组委员。', NULL, '2017-11-26 15:36:39'),
	(59, 16, 25, '', '', '陈发', '陈发', '11-12-21-22', 1, 2, 'Y', 1000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 5, 9999, '', NULL, '2018-08-23 16:47:05'),
	(61, 16, 25, '20180829\\fa4be51d4f3259930ca25a75760371c0.jpg', '', '美女1', '美女1', '11-21-31-42-51-61-71', 1, 1, 'A', 1000, '08:00:00', '12:00:00', '14:00:00', '18:00:00', 5, 30, '', NULL, '2018-08-29 16:44:03'),
	(62, 16, 25, '20180829\\2b7afdd800635fb27f978ba94abd737b.jpg', '', '美女2', '美女2', '12-22-32-42-52-62-72', 1, 2, 'A', 2000, '09:00:00', '12:00:00', '14:00:00', '18:00:00', 5, 30, '', NULL, '2018-08-29 16:45:23'),
	(63, 16, 25, '', '', '美女医生3', '美女医生3', '11-12-21-22-31-32-41-42-51-52', 1, 1, 'A', 3000, '08:00:00', '12:00:00', '14:00:00', '18:00:00', 5, 30, '1', NULL, '2018-08-31 17:25:52');
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

-- 导出  表 yy.t_sms_config 结构
CREATE TABLE IF NOT EXISTS `t_sms_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitid` int(11) NOT NULL DEFAULT '0' COMMENT '单位id',
  `number` int(11) NOT NULL DEFAULT '0' COMMENT '短信数量',
  `used` int(11) NOT NULL DEFAULT '0' COMMENT '已用数量',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0=关闭 1=开启',
  PRIMARY KEY (`id`),
  KEY `unitid` (`unitid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='短信配置\r\n';

-- 正在导出表  yy.t_sms_config 的数据：2 rows
/*!40000 ALTER TABLE `t_sms_config` DISABLE KEYS */;
INSERT INTO `t_sms_config` (`id`, `unitid`, `number`, `used`, `status`) VALUES
	(1, 3, 100, 2, 1),
	(2, 16, 300, 0, 1);
/*!40000 ALTER TABLE `t_sms_config` ENABLE KEYS */;

-- 导出  表 yy.t_sms_log 结构
CREATE TABLE IF NOT EXISTS `t_sms_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unitid` int(11) NOT NULL DEFAULT '0' COMMENT '单位id',
  `sign` varchar(20) NOT NULL COMMENT '签名',
  `temp` varchar(20) NOT NULL COMMENT '模版CODE',
  `mobile` varchar(11) NOT NULL DEFAULT '0' COMMENT '接收手机号',
  `content` varchar(250) NOT NULL COMMENT '内容',
  `error` varchar(150) NOT NULL COMMENT '错误信息',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0=未发送 1=发送 -1=发送失败',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `unitid` (`unitid`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='短信';

-- 正在导出表  yy.t_sms_log 的数据：4 rows
/*!40000 ALTER TABLE `t_sms_log` DISABLE KEYS */;
INSERT INTO `t_sms_log` (`id`, `unitid`, `sign`, `temp`, `mobile`, `content`, `error`, `status`, `addtime`) VALUES
	(20, 0, '中科易达', 'SMS_137780003', '15377907108', '能不能用', '', 1, 1535964455),
	(19, 0, '中科易达', 'SMS_137780004', '15377907201', '能不能用', '', 1, 1535964227),
	(18, 0, '中科易达', 'SMS_137780004', '17095989213', '能不能用', '', 1, 1535964227),
	(17, 0, '中科易达', 'SMS_137780004', '17095989313', '123', 'params must be [a-zA-Z0-9] for verification sms', 0, 1535964227);
/*!40000 ALTER TABLE `t_sms_log` ENABLE KEYS */;

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
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='单位';

-- 正在导出表  yy.t_unit 的数据：5 rows
/*!40000 ALTER TABLE `t_unit` DISABLE KEYS */;
INSERT INTO `t_unit` (`UnitId`, `manageid`, `unitname`, `dispname`, `managers`, `EnableFlag`, `AlternateField1`, `AlternateField2`, `InTime`) VALUES
	(12, 0, 'CCC', 'CCC', '', 0, NULL, NULL, '2018-08-31 16:12:08'),
	(3, 1001, '福州市眼科医院', '福州市眼科医院666', '1001admin黄建13300000000', 1, NULL, NULL, '2018-08-27 14:48:02'),
	(13, 1013, '2523', '234', '1013wang小王18900000000', 0, NULL, NULL, '2018-08-31 16:12:28'),
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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='预约分组';

-- 正在导出表  yy.t_yygroup 的数据：4 rows
/*!40000 ALTER TABLE `t_yygroup` DISABLE KEYS */;
INSERT INTO `t_yygroup` (`id`, `SerInterface`, `unitId`, `UnitName`, `HallName`, `DispName`, `EnableFlag`, `managers1`, `managers2`, `AlternateField1`, `AlternateField2`, `addtime`) VALUES
	(24, '', 12, 'CCC', '业务一组6', '业务一组6', 1, '', '', '', NULL, 1534755047),
	(25, 'aaa1221', 3, '易达眼科医院', '业务二组', '业务二组', 0, '', '', '', NULL, 1534755047),
	(26, 'AAAm', 3, '易达眼科医院', '业务三组', '业务三组', 1, '', '', '', NULL, 1534755047),
	(30, '', 16, '三明市第一医院', '三明第一医院', '三明第一医院', 1, NULL, NULL, NULL, NULL, 1535526177);
/*!40000 ALTER TABLE `t_yygroup` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
