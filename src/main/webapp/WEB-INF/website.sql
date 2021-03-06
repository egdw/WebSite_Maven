/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : localhost
 Source Database       : website

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : utf-8

 Date: 07/20/2017 22:07:21 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `website_album`
-- ----------------------------
DROP TABLE IF EXISTS `website_album`;
CREATE TABLE `website_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `url_thumb` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_album`
-- ----------------------------
BEGIN;
INSERT INTO `website_album` VALUES ('87', 'upload/image/7884a2cf-06b3-4a75-b921-5972fdff5d9c.jpg', '测试内容', '2017-05-07 13:44:59', 'upload/image/thumb_7884a2cf-06b3-4a75-b921-5972fdff5d9c.jpg'), ('88', 'upload/image/371c946e-cf62-4c0e-ba65-87448082147c.jpg', 'shibie', '2017-05-07 13:48:54', 'upload/image/thumb_371c946e-cf62-4c0e-ba65-87448082147c.jpg');
COMMIT;

-- ----------------------------
--  Table structure for `website_blog`
-- ----------------------------
DROP TABLE IF EXISTS `website_blog`;
CREATE TABLE `website_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `type` tinyint(4) DEFAULT NULL,
  `click_times` int(11) DEFAULT '0' COMMENT '阅读量',
  `create_time` datetime DEFAULT NULL,
  `comment_times` int(11) DEFAULT '0' COMMENT '评论数',
  `agree_with_times` int(11) DEFAULT '0' COMMENT '赞同数',
  `pic_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_blog`
-- ----------------------------
BEGIN;
INSERT INTO `website_blog` VALUES ('64', 'SpringMVC日期类型转换问题', '<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	前言</h2>\r\n<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	&nbsp;</h2>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 18px;\">我们在SpringMVC开发中，可能遇到比较多的问题就是前台与后台实体类之间日期转换处理的问题了，说问题也不大，但很多人开发中经常会遇到这个问题，有时很令人头疼，有时间问题暴露的不是很明显，然后逐渐对问题进行跟踪，会发现是日期类型转换失败&ldquo;映射&rdquo;不到对应的持久类的日期属性上造成的，由此我还特意写过一篇博文：<a href=\"http://blog.csdn.net/chenleixing/article/details/43740759\" style=\"color: rgb(255, 153, 0); text-decoration: none;\" target=\"_blank\">SpringMVC中出现&quot; 400 Bad Request &quot;错误（用@ResponseBody处理ajax传过来的json数据转成bean）的解决方法</a>。感兴趣的码农可以看一看，总结了常见造成springMVC出现&ldquo;400 Bad Request&rdquo;错误的七大原因，其中就有前台的字符串日期类型与后台的<a class=\"replace_word\" href=\"http://lib.csdn.net/base/javase\" style=\"color: rgb(223, 52, 52); text-decoration: none;\" target=\"_blank\" title=\"Java SE知识库\">Java</a>日期类型匹配不上造成的。</span></p>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	<span style=\"font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 今天晚上呢，特意抽出宝贵的时间来总结归纳出一下解决这个问题的三大方法，分享给大家，以帮助更多像我一样的人。鄙人不才，如果过程中有讲解的不清或者不对的地方，还望认真阅读的您，留下你的宝贵意见或建议，以便您，我，还有大家更快更好的共同进步！</span></p>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	<span style=\"font-size: 18px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 好了，我们切入正题吧！</span></p>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	&nbsp;</p>\r\n<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	<a name=\"t1\" style=\"color: rgb(255, 153, 0);\"></a>方法一：实体类中加日期格式化注解</h2>\r\n<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	&nbsp;</h2>\r\n<div class=\"dp-highlighter bg_java\" style=\"margin-right: 0px; margin-left: 0px; font-family: Consolas, &quot;Courier New&quot;, Courier, mono, serif; width: 698.938px; overflow-x: auto; overflow-y: hidden; padding-top: 1px; position: relative; background-color: rgb(231, 229, 220); margin-top: 18px !important; margin-bottom: 18px !important;\">\r\n	<div class=\"bar\" style=\"margin: 0px; padding-left: 45px;\">\r\n		<div class=\"tools\" style=\"margin: 0px; padding: 3px 8px 10px 10px; font-stretch: normal; font-size: 9px; line-height: normal; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: silver; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(108, 226, 108); background-color: rgb(248, 248, 248);\">\r\n			<b>[java]</b>&nbsp;<a class=\"ViewSource\" href=\"http://blog.csdn.net/chenleixing/article/details/45190371#\" style=\"color: rgb(160, 160, 160); text-decoration: none; border: none; padding: 1px; margin: 0px 10px 0px 0px; display: inline-block; width: 16px; height: 16px; text-indent: -2000px; background-image: url(&quot;images/default/ico_plain.gif&quot;); background-attachment: initial; background-color: inherit; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0% 0%; background-repeat: no-repeat;\" title=\"view plain\">view plain</a><span data-mod=\"popu_168\">&nbsp;<a class=\"CopyToClipboard\" href=\"http://blog.csdn.net/chenleixing/article/details/45190371#\" style=\"color: rgb(160, 160, 160); text-decoration: none; border: none; padding: 1px; margin: 0px 10px 0px 0px; display: inline-block; width: 16px; height: 16px; text-indent: -2000px; background-image: url(&quot;images/default/ico_copy.gif&quot;); background-attachment: initial; background-color: inherit; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0% 0%; background-repeat: no-repeat;\" title=\"copy\">copy</a></span>\r\n			<div style=\"margin: 0px; position: absolute; left: 388px; top: 952px; width: 18px; height: 18px; z-index: 99;\">\r\n				&nbsp;</div>\r\n		</div>\r\n	</div>\r\n	<ol class=\"dp-j\" start=\"1\" style=\"margin-top: 0px; margin-right: 0px; padding-right: 0px; padding-left: 0px; border: none; color: rgb(92, 92, 92); background-color: rgb(255, 255, 255); margin-bottom: 1px !important; margin-left: 45px !important;\">\r\n		<li class=\"alt\" style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; color: inherit; line-height: 18px; padding: 0px 3px 0px 10px !important;\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span class=\"annotation\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(100, 100, 100); background-color: inherit;\">@DateTimeFormat</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">(pattern&nbsp;=&nbsp;</span><span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;yyyy-MM-dd&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">)&nbsp;&nbsp;</span></span></li>\r\n		<li style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; line-height: 18px; padding: 0px 3px 0px 10px !important; background-color: rgb(248, 248, 248);\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span class=\"keyword\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(0, 102, 153); background-color: inherit;\">private</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;Date&nbsp;receiveAppTime;&nbsp;&nbsp;</span></span></li>\r\n	</ol>\r\n</div>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	<span style=\"font-size: 18px;\">如上，在对应的属性上，加上指定日期格式的注解，本人亲自<a class=\"replace_word\" href=\"http://lib.csdn.net/base/softwaretest\" style=\"color: rgb(223, 52, 52); text-decoration: none;\" target=\"_blank\" title=\"软件测试知识库\">测试</a>过，轻松解决问题！</span></p>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	&nbsp;</p>\r\n<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	<a name=\"t2\" style=\"color: rgb(255, 153, 0);\"></a>方法二：控制器Action中加入一段数据绑定代码</h2>\r\n<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	&nbsp;</h2>\r\n<div class=\"dp-highlighter bg_java\" style=\"margin-right: 0px; margin-left: 0px; font-family: Consolas, &quot;Courier New&quot;, Courier, mono, serif; width: 698.938px; overflow-x: auto; overflow-y: hidden; padding-top: 1px; position: relative; background-color: rgb(231, 229, 220); margin-top: 18px !important; margin-bottom: 18px !important;\">\r\n	<div class=\"bar\" style=\"margin: 0px; padding-left: 45px;\">\r\n		<div class=\"tools\" style=\"margin: 0px; padding: 3px 8px 10px 10px; font-stretch: normal; font-size: 9px; line-height: normal; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: silver; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(108, 226, 108); background-color: rgb(248, 248, 248);\">\r\n			<b>[java]</b>&nbsp;<a class=\"ViewSource\" href=\"http://blog.csdn.net/chenleixing/article/details/45190371#\" style=\"color: rgb(160, 160, 160); text-decoration: none; border: none; padding: 1px; margin: 0px 10px 0px 0px; display: inline-block; width: 16px; height: 16px; text-indent: -2000px; background-image: url(&quot;images/default/ico_plain.gif&quot;); background-attachment: initial; background-color: inherit; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0% 0%; background-repeat: no-repeat;\" title=\"view plain\">view plain</a><span data-mod=\"popu_168\">&nbsp;<a class=\"CopyToClipboard\" href=\"http://blog.csdn.net/chenleixing/article/details/45190371#\" style=\"color: rgb(160, 160, 160); text-decoration: none; border: none; padding: 1px; margin: 0px 10px 0px 0px; display: inline-block; width: 16px; height: 16px; text-indent: -2000px; background-image: url(&quot;images/default/ico_copy.gif&quot;); background-attachment: initial; background-color: inherit; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0% 0%; background-repeat: no-repeat;\" title=\"copy\">copy</a></span>\r\n			<div style=\"margin: 0px; position: absolute; left: 388px; top: 1135px; width: 18px; height: 18px; z-index: 99;\">\r\n				&nbsp;</div>\r\n		</div>\r\n	</div>\r\n	<ol class=\"dp-j\" start=\"1\" style=\"margin-top: 0px; margin-right: 0px; padding-right: 0px; padding-left: 0px; border: none; color: rgb(92, 92, 92); background-color: rgb(255, 255, 255); margin-bottom: 1px !important; margin-left: 45px !important;\">\r\n		<li class=\"alt\" style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; color: inherit; line-height: 18px; padding: 0px 3px 0px 10px !important;\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span class=\"annotation\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(100, 100, 100); background-color: inherit;\">@InitBinder</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;&nbsp;</span></span></li>\r\n		<li style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; line-height: 18px; padding: 0px 3px 0px 10px !important; background-color: rgb(248, 248, 248);\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span class=\"keyword\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(0, 102, 153); background-color: inherit;\">public</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;</span><span class=\"keyword\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(0, 102, 153); background-color: inherit;\">void</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;initBinder(WebDataBinder&nbsp;binder)&nbsp;{&nbsp;&nbsp;</span></span></li>\r\n		<li class=\"alt\" style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; color: inherit; line-height: 18px; padding: 0px 3px 0px 10px !important;\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">SimpleDateFormat&nbsp;dateFormat&nbsp;=&nbsp;<span class=\"keyword\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(0, 102, 153); background-color: inherit;\">new</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;SimpleDateFormat(</span><span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;yyyy-MM-dd&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">);&nbsp;&nbsp;</span></span></li>\r\n		<li style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; line-height: 18px; padding: 0px 3px 0px 10px !important; background-color: rgb(248, 248, 248);\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">dateFormat.setLenient(<span class=\"keyword\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(0, 102, 153); background-color: inherit;\">false</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">);&nbsp;&nbsp;</span></span></li>\r\n		<li class=\"alt\" style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; color: inherit; line-height: 18px; padding: 0px 3px 0px 10px !important;\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">binder.registerCustomEditor(Date.<span class=\"keyword\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(0, 102, 153); background-color: inherit;\">class</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">,&nbsp;</span><span class=\"keyword\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(0, 102, 153); background-color: inherit;\">new</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;CustomDateEditor(dateFormat,&nbsp;</span><span class=\"keyword\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(0, 102, 153); background-color: inherit;\">true</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">));&nbsp;&nbsp;&nbsp;</span><span class=\"comment\" style=\"margin: 0px; padding: 0px; border: none; color: rgb(0, 130, 0); background-color: inherit;\">//true:允许输入空值，false:不能为空值</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;&nbsp;</span></span></li>\r\n	</ol>\r\n</div>\r\n<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	<a name=\"t3\" style=\"color: rgb(255, 153, 0);\"></a><br />\r\n	方法三：实现一个全局日期类型转换器并进行配置</h2>\r\n<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	&nbsp;</h2>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size: 18px;\">&nbsp;&nbsp;&nbsp; 此方法较为复杂，请详细查看本人的这篇博文：<a href=\"http://blog.csdn.net/chenleixing/article/details/45156617\" style=\"color: rgb(255, 153, 0); text-decoration: none;\" target=\"_blank\">SpringMVC配置全局日期转换器，处理日期转换异常</a></span></p>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	&nbsp;</p>\r\n<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	<a name=\"t4\" style=\"color: rgb(255, 153, 0);\"></a>附加方法四：适合页面把日期类型转换成字符串且JSP，Freemark页面</h2>\r\n<h2 style=\"margin: 0px; padding: 0px; font-size: 1.33rem; color: rgb(0, 0, 0); font-family: Arial;\">\r\n	&nbsp;</h2>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	<span style=\"font-size: 18px;\">JSP模版引擎方法：</span></p>\r\n<div class=\"dp-highlighter bg_java\" style=\"margin-right: 0px; margin-left: 0px; font-family: Consolas, &quot;Courier New&quot;, Courier, mono, serif; width: 698.938px; overflow-x: auto; overflow-y: hidden; padding-top: 1px; position: relative; background-color: rgb(231, 229, 220); margin-top: 18px !important; margin-bottom: 18px !important;\">\r\n	<div class=\"bar\" style=\"margin: 0px; padding-left: 45px;\">\r\n		<div class=\"tools\" style=\"margin: 0px; padding: 3px 8px 10px 10px; font-stretch: normal; font-size: 9px; line-height: normal; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: silver; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(108, 226, 108); background-color: rgb(248, 248, 248);\">\r\n			<b>[java]</b>&nbsp;<a class=\"ViewSource\" href=\"http://blog.csdn.net/chenleixing/article/details/45190371#\" style=\"color: rgb(160, 160, 160); text-decoration: none; border: none; padding: 1px; margin: 0px 10px 0px 0px; display: inline-block; width: 16px; height: 16px; text-indent: -2000px; background-image: url(&quot;images/default/ico_plain.gif&quot;); background-attachment: initial; background-color: inherit; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0% 0%; background-repeat: no-repeat;\" title=\"view plain\">view plain</a><span data-mod=\"popu_168\">&nbsp;<a class=\"CopyToClipboard\" href=\"http://blog.csdn.net/chenleixing/article/details/45190371#\" style=\"color: rgb(160, 160, 160); text-decoration: none; border: none; padding: 1px; margin: 0px 10px 0px 0px; display: inline-block; width: 16px; height: 16px; text-indent: -2000px; background-image: url(&quot;images/default/ico_copy.gif&quot;); background-attachment: initial; background-color: inherit; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0% 0%; background-repeat: no-repeat;\" title=\"copy\">copy</a></span>\r\n			<div style=\"margin: 0px; position: absolute; left: 388px; top: 1495px; width: 18px; height: 18px; z-index: 99;\">\r\n				&nbsp;</div>\r\n		</div>\r\n	</div>\r\n	<ol class=\"dp-j\" start=\"1\" style=\"margin-top: 0px; margin-right: 0px; padding-right: 0px; padding-left: 0px; border: none; color: rgb(92, 92, 92); background-color: rgb(255, 255, 255); margin-bottom: 1px !important; margin-left: 45px !important;\">\r\n		<li class=\"alt\" style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; color: inherit; line-height: 18px; padding: 0px 3px 0px 10px !important;\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&lt;%@&nbsp;taglib&nbsp;uri=</span><span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;http://java.sun.com/jsp/jstl/fmt&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;prefix=</span><span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;fmt&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">%&gt;&nbsp;&nbsp;&nbsp;</span></span></li>\r\n		<li style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; line-height: 18px; padding: 0px 3px 0px 10px !important; background-color: rgb(248, 248, 248);\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\">&lt;fmt:formatDate&nbsp;value=<span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;${job.jobtime&nbsp;}&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;pattern=</span><span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;yyyy-MM-dd&nbsp;HH:mm:ss&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">/&gt;&nbsp;&nbsp;</span></span></li>\r\n	</ol>\r\n</div>\r\n<p style=\"margin: 0px; padding: 0px; font-size: 14px;\">\r\n	<span style=\"font-size: 18px;\">Freemarker模版引擎方法：</span></p>\r\n<div class=\"dp-highlighter bg_java\" style=\"margin-right: 0px; margin-left: 0px; font-family: Consolas, &quot;Courier New&quot;, Courier, mono, serif; width: 698.938px; overflow-x: auto; overflow-y: hidden; padding-top: 1px; position: relative; background-color: rgb(231, 229, 220); margin-top: 18px !important; margin-bottom: 18px !important;\">\r\n	<div class=\"bar\" style=\"margin: 0px; padding-left: 45px;\">\r\n		<div class=\"tools\" style=\"margin: 0px; padding: 3px 8px 10px 10px; font-stretch: normal; font-size: 9px; line-height: normal; font-family: Verdana, Geneva, Arial, Helvetica, sans-serif; color: silver; border-left-width: 3px; border-left-style: solid; border-left-color: rgb(108, 226, 108); background-color: rgb(248, 248, 248);\">\r\n			<b>[java]</b>&nbsp;<a class=\"ViewSource\" href=\"http://blog.csdn.net/chenleixing/article/details/45190371#\" style=\"color: rgb(160, 160, 160); text-decoration: none; border: none; padding: 1px; margin: 0px 10px 0px 0px; display: inline-block; width: 16px; height: 16px; text-indent: -2000px; background-image: url(&quot;images/default/ico_plain.gif&quot;); background-attachment: initial; background-color: inherit; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0% 0%; background-repeat: no-repeat;\" title=\"view plain\">view plain</a><span data-mod=\"popu_168\">&nbsp;<a class=\"CopyToClipboard\" href=\"http://blog.csdn.net/chenleixing/article/details/45190371#\" style=\"color: rgb(160, 160, 160); text-decoration: none; border: none; padding: 1px; margin: 0px 10px 0px 0px; display: inline-block; width: 16px; height: 16px; text-indent: -2000px; background-image: url(&quot;images/default/ico_copy.gif&quot;); background-attachment: initial; background-color: inherit; background-size: initial; background-origin: initial; background-clip: initial; background-position: 0% 0%; background-repeat: no-repeat;\" title=\"copy\">copy</a></span>\r\n			<div style=\"margin: 0px; position: absolute; left: 388px; top: 1626px; width: 18px; height: 18px; z-index: 99;\">\r\n				&nbsp;</div>\r\n		</div>\r\n	</div>\r\n	<ol class=\"dp-j\" start=\"1\" style=\"margin-top: 0px; margin-right: 0px; padding-right: 0px; padding-left: 0px; border: none; color: rgb(92, 92, 92); background-color: rgb(255, 255, 255); margin-bottom: 1px !important; margin-left: 45px !important;\">\r\n		<li class=\"alt\" style=\"margin: 0px; border-style: none none none solid; border-left-width: 3px; border-left-color: rgb(108, 226, 108); border-image-source: initial; border-image-slice: initial; border-image-width: initial; border-image-outset: initial; border-image-repeat: initial; list-style: decimal-leading-zero outside; color: inherit; line-height: 18px; padding: 0px 3px 0px 10px !important;\">\r\n			<span style=\"margin: 0px; padding: 0px; border: none; color: black; background-color: inherit;\"><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&lt;input&nbsp;id=</span><span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;receiveAppTime&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;name=</span><span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;receiveAppTime&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;type=</span><span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;text&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;value=</span><span class=\"string\" style=\"margin: 0px; padding: 0px; border: none; color: blue; background-color: inherit;\">&quot;${(bean.receiveAppTime?string(&#39;yyyy-MM-dd&#39;))!}&quot;</span><span style=\"margin: 0px; padding: 0px; border: none; background-color: inherit;\">&nbsp;/&gt;&nbsp;&nbsp;</span></span></li>\r\n	</ol>\r\n	<div style=\"margin: 0px;\">\r\n		&nbsp;</div>\r\n</div>\r\n<p>\r\n	&nbsp;</p>\r\n', '2', '62', '2017-03-03 16:46:06', '1', '0', 'upload/image/48392d22-f231-4060-8ba4-edfbe9509a30.jpg'), ('93', '我修改个标题', '<p>\r\n	5555555554</p>\r\n', '0', '0', '2017-03-04 21:26:45', '0', '0', 'upload/image/48392d22-f231-4060-8ba4-edfbe9509a30.jpg'), ('94', '1', '<p>\r\n	小政策性支持</p>\r\n', '0', null, '2017-03-04 21:27:48', null, null, 'upload/image/48392d22-f231-4060-8ba4-edfbe9509a30.jpg'), ('95', '2', '<p>\r\n	小政策性支持</p>\r\n', '0', null, '2017-03-04 21:27:54', null, null, 'upload/image/48392d22-f231-4060-8ba4-edfbe9509a30.jpg'), ('96', '3', '<p>\r\n	小政策性支持</p>\r\n', '0', '2', '2017-03-04 21:27:58', null, null, 'upload/image/48392d22-f231-4060-8ba4-edfbe9509a30.jpg'), ('97', '4', '<p>\r\n	小政策性支持</p>\r\n', '0', null, '2017-03-04 21:28:02', null, null, 'upload/image/48392d22-f231-4060-8ba4-edfbe9509a30.jpg'), ('100', '7', '<p>\r\n	小政策性支持</p>\r\n', '0', null, '2017-03-04 21:28:14', null, null, 'upload/image/48392d22-f231-4060-8ba4-edfbe9509a30.jpg'), ('105', '这是测试啊啊啊!', '<p>\r\n	<img alt=\"\" height=\"100px\" id=\"displayImg\" src=\"http://localhost:8080/WebSite/upload/image/0cdac8cc-e7b9-4de7-b2fb-c76130a1769f.jpg\" width=\"100px\" /></p>\r\n', '0', '1', '2017-04-10 20:12:55', '0', '0', 'upload/image/0cdac8cc-e7b9-4de7-b2fb-c76130a1769f.jpg'), ('106', '213123', '<p>\r\n	<img alt=\"\" src=\"/WebSite/upload/images/544.jpg\" style=\"width: 800px; height: 600px;\" /></p>\r\n', '0', '2', '2017-04-10 20:32:42', '0', '0', ''), ('107', '3112asd', '<p>\r\n	213123123</p>\r\n', '0', '5', '2017-04-10 22:30:50', '0', '0', 'upload/image/508e0a64-6c9f-46a2-a2c4-81da7c8f0969.png'), ('108', '给青春小蓝安装ubuntu15.10', '', '0', '2', '2017-05-07 15:50:11', '0', '0', ''), ('109', '测试', '<p>\r\n	这是测试</p>\r\n', '0', '0', '2017-07-20 21:34:23', '0', '0', '');
COMMIT;

-- ----------------------------
--  Table structure for `website_comment`
-- ----------------------------
DROP TABLE IF EXISTS `website_comment`;
CREATE TABLE `website_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) DEFAULT NULL,
  `content` text,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `agree_with_times` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_comment`
-- ----------------------------
BEGIN;
INSERT INTO `website_comment` VALUES ('57', '64', '这个文章写的真是好啊', '王元杰', '378759617@qq.com', '2017-03-06 17:18:29', '0'), ('58', '64', '文章不错', '王远杰', '110@qq.com', '2017-03-06 17:18:45', '0'), ('66', '64', '撒旦啊', 'hdy', '华盛顿', '2017-03-07 15:32:40', '0');
COMMIT;

-- ----------------------------
--  Table structure for `website_funny`
-- ----------------------------
DROP TABLE IF EXISTS `website_funny`;
CREATE TABLE `website_funny` (
  `funny_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `funny_url` varchar(255) NOT NULL,
  `funny_topic` varchar(255) NOT NULL,
  `funny_text` varchar(255) NOT NULL,
  `funny_create_date` date NOT NULL,
  `funny_img` blob,
  PRIMARY KEY (`funny_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_funny`
-- ----------------------------
BEGIN;
INSERT INTO `website_funny` VALUES ('18', 'upload/funny/20170307122152229admin/7/banner.jsp', '好看吧撒旦就卡 ', '是的框架了哈的', '2017-03-07', null), ('20', 'upload/funny/20170307150011257admin/7/banner.jsp', '这是测试2', '这是测试2', '2017-03-07', null);
COMMIT;

-- ----------------------------
--  Table structure for `website_project`
-- ----------------------------
DROP TABLE IF EXISTS `website_project`;
CREATE TABLE `website_project` (
  `project_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_url` varchar(255) NOT NULL,
  `project_topic` varchar(255) NOT NULL,
  `project_text` varchar(255) NOT NULL,
  `project_create_date` date NOT NULL,
  `project_img` blob,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_project`
-- ----------------------------
BEGIN;
INSERT INTO `website_project` VALUES ('1', 'http://www.baidu.com', '百度', '百度', '2017-02-20', null), ('2', 'http://www.sohu.com', '搜狐', '狐', '2016-02-20', null), ('3', 'http://www.qq.com', '腾讯', '腾讯', '2017-02-06', null), ('4', 'http://www.163.com', '163', '163', '2017-02-02', null), ('5', 'http://www.so.com', 'so', 'so', '2017-02-06', null);
COMMIT;

-- ----------------------------
--  Table structure for `website_role`
-- ----------------------------
DROP TABLE IF EXISTS `website_role`;
CREATE TABLE `website_role` (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `create_time` date NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_role`
-- ----------------------------
BEGIN;
INSERT INTO `website_role` VALUES ('1', 'super_admin', '2017-02-21', '拥有所有的权限'), ('2', 'admin', '2017-02-21', '拥有部分权限'), ('3', 'normal', '2017-02-21', '拥有普通用户的所有权限'), ('4', 'ban_login', '2017-02-21', '禁止登陆的用户'), ('5', 'ban_say', '2017-02-21', '禁止发表文章和评论');
COMMIT;

-- ----------------------------
--  Table structure for `website_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `website_role_permission`;
CREATE TABLE `website_role_permission` (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permissions` varchar(255) NOT NULL,
  PRIMARY KEY (`permission_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `website_permission_role` FOREIGN KEY (`role_id`) REFERENCES `website_role` (`role_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_role_permission`
-- ----------------------------
BEGIN;
INSERT INTO `website_role_permission` VALUES ('1', '1', 'role:delete'), ('2', '1', 'role:update'), ('3', '1', 'role:add'), ('4', '1', 'role:query'), ('5', '1', 'project:delete'), ('6', '1', 'project:add'), ('7', '1', 'project:del'), ('8', '1', 'project:update'), ('9', '2', 'project:del');
COMMIT;

-- ----------------------------
--  Table structure for `website_temp`
-- ----------------------------
DROP TABLE IF EXISTS `website_temp`;
CREATE TABLE `website_temp` (
  `temp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `temp_url` varchar(255) NOT NULL,
  `temp_topic` varchar(255) NOT NULL,
  `temp_text` varchar(255) NOT NULL,
  `temp_create_date` date NOT NULL,
  `temp_img` blob,
  PRIMARY KEY (`temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_temp`
-- ----------------------------
BEGIN;
INSERT INTO `website_temp` VALUES ('21', 'upload/temp/20170307150105779admin/7/banner.jsp', '这是测试', '这是测试', '2017-03-07', null);
COMMIT;

-- ----------------------------
--  Table structure for `website_user`
-- ----------------------------
DROP TABLE IF EXISTS `website_user`;
CREATE TABLE `website_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `login_account` varchar(255) NOT NULL,
  `login_passwd` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_head` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_email` varchar(255) DEFAULT NULL,
  `user_sex` varchar(255) DEFAULT NULL,
  `user_birthday` date DEFAULT NULL,
  `register_date` date NOT NULL,
  `user_phone_verify` tinyint(1) DEFAULT NULL,
  `user_email_verify` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_user`
-- ----------------------------
BEGIN;
INSERT INTO `website_user` VALUES ('1', 'admin', 'hzkjzyjsxy', 'hdy23', null, '13587551653', '378759617@qq.com', '男', '2017-02-21', '2017-02-21', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `website_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `website_user_role`;
CREATE TABLE `website_user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_user_roleid` FOREIGN KEY (`role_id`) REFERENCES `website_role` (`role_id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_userid` FOREIGN KEY (`user_id`) REFERENCES `website_user` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `website_user_role`
-- ----------------------------
BEGIN;
INSERT INTO `website_user_role` VALUES ('1', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
