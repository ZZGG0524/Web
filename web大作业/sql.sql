-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.26 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- 导出 blog_system 的数据库结构
CREATE DATABASE IF NOT EXISTS `blog_system` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `blog_system`;

-- 导出  表 blog_system.blog 结构
CREATE TABLE IF NOT EXISTS `blog` (
  `blog_id` double NOT NULL AUTO_INCREMENT,
  `blog_people_id` double NOT NULL,
  `blog_title` varchar(50) COLLATE utf8_bin NOT NULL,
  `blog_content` varchar(50) COLLATE utf8_bin NOT NULL,
  `blog_time` datetime NOT NULL,
  PRIMARY KEY (`blog_id`),
  KEY `FK_blog_user` (`blog_people_id`),
  CONSTRAINT `FK_blog_user` FOREIGN KEY (`blog_people_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog_system.blog 的数据：~22 rows (大约)
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` (`blog_id`, `blog_people_id`, `blog_title`, `blog_content`, `blog_time`) VALUES
	(1, 1, 'C语言', '894653214865123', '2017-10-00 10:00:00'),
	(2, 2, 'Java', '489651320', '2019-12-10 13:18:56'),
	(3, 1, 'C++', '84651320', '2019-12-10 13:19:13'),
	(4, 2, 'Python', '4651321032141653.', '2019-12-10 13:19:48'),
	(5, 1, 'swift', '9846320.165165', '2019-12-10 13:20:11'),
	(6, 1, 'go', '5103.053153065', '2019-12-10 15:32:32'),
	(7, 1, '123', '456', '2019-12-14 14:59:57'),
	(8, 1, '苏若愚', '狗东西', '2019-12-14 15:00:21'),
	(9, 1, '壮壮锅锅', '真好', '2019-12-14 15:01:23'),
	(10, 1, '苏若愚', '憨批', '2019-12-14 15:05:22'),
	(11, 1, '2345', '76543', '2019-12-14 15:05:35'),
	(12, 1, '1234', '6543', '2019-12-14 15:07:26'),
	(13, 1, '13455', '7654', '2019-12-14 15:09:15'),
	(14, 1, '333', '333', '2019-12-14 15:11:58'),
	(15, 1, '111', '111', '2019-12-14 15:13:31'),
	(16, 1, '111223', '423', '2019-12-14 15:15:16'),
	(17, 1, '已经退回瑞特', '好歹是个黑人和', '2019-12-14 15:15:56'),
	(18, 1, '哇哇哇哇', '涛涛涛涛他', '2019-12-14 15:21:17'),
	(19, 1, '222234444', 'iu有同感', '2019-12-14 15:22:05'),
	(20, 1, '4345534', '5435343544434535', '2019-12-14 15:22:50'),
	(21, 1, 'AAAAAA', '感到十分大方', '2019-12-14 15:23:47'),
	(22, 1, '7777', '8888', '2019-12-14 15:24:23');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;

-- 导出  表 blog_system.comment 结构
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` double NOT NULL AUTO_INCREMENT,
  `comment_people_id` double NOT NULL,
  `comment_blog_id` double NOT NULL,
  `comment_content` varchar(50) COLLATE utf8_bin NOT NULL,
  `comment_time` datetime NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `FK_comment_user` (`comment_people_id`),
  KEY `FK_comment_blog` (`comment_blog_id`),
  CONSTRAINT `FK_comment_blog` FOREIGN KEY (`comment_blog_id`) REFERENCES `blog` (`blog_id`),
  CONSTRAINT `FK_comment_user` FOREIGN KEY (`comment_people_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog_system.comment 的数据：~17 rows (大约)
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` (`comment_id`, `comment_people_id`, `comment_blog_id`, `comment_content`, `comment_time`) VALUES
	(1, 1, 1, '很好', '2019-12-10 13:17:29'),
	(2, 1, 3, 'very good', '2019-12-10 13:22:15'),
	(3, 1, 1, 'great!', '2019-12-10 13:22:45'),
	(4, 2, 1, 'nice', '2019-12-10 13:23:13'),
	(5, 1, 2, '漂亮', '2019-12-12 17:08:54'),
	(18, 1, 1, '11111', '2019-12-12 18:53:35'),
	(19, 1, 1, '辜负你的公司发', '2019-12-12 18:53:42'),
	(20, 1, 5, '和人工方式', '2019-12-12 18:54:09'),
	(21, 1, 1, '斤斤计较', '2019-12-12 18:55:19'),
	(23, 1, 1, '你是憨批咩', '2019-12-12 19:00:18'),
	(24, 1, 1, '苏若愚傻逼', '2019-12-12 19:02:32'),
	(25, 1, 2, '苏若愚傻逼', '2019-12-12 19:02:36'),
	(26, 1, 3, '苏若愚傻逼', '2019-12-12 19:02:40'),
	(27, 1, 4, '苏若愚傻逼', '2019-12-12 19:02:45'),
	(28, 1, 5, '苏若愚傻逼', '2019-12-12 19:02:49'),
	(29, 1, 6, '苏若愚傻逼', '2019-12-12 19:02:53'),
	(30, 1, 1, '反对', '2019-12-12 19:09:22'),
	(31, 1, 1, '444', '2019-12-14 13:01:12'),
	(32, 1, 1, '111', '2019-12-14 15:11:53');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 导出  表 blog_system.manager 结构
CREATE TABLE IF NOT EXISTS `manager` (
  `manager_id` double NOT NULL AUTO_INCREMENT,
  `manager_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `manager_password` varchar(50) COLLATE utf8_bin NOT NULL,
  `manager_info` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog_system.manager 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- 导出  表 blog_system.user 结构
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` double NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_password` varchar(50) COLLATE utf8_bin NOT NULL,
  `user_email` varchar(50) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- 正在导出表  blog_system.user 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`user_id`, `user_name`, `user_password`, `user_email`) VALUES
	(1, 'user', '123', '1574619603@qq.com'),
	(2, 'user1', '456', '18384835774@163.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
