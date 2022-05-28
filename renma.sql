/*
Navicat MySQL Data Transfer

Source Server         : 123456
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : renma

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2022-05-28 13:52:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `proid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `group` int(11) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `imageid` int(11) NOT NULL,
  `proid` int(11) NOT NULL,
  `imageurl` varchar(255) NOT NULL,
  `uploadtime` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`imageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `proid` int(11) NOT NULL,
  `msg` varchar(255) NOT NULL,
  `uploaduserid` int(11) NOT NULL,
  `acceptstatus` varchar(255) NOT NULL,
  `uploadtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `proid` int(11) NOT NULL,
  `proname` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`proid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project
-- ----------------------------

-- ----------------------------
-- Table structure for sgin
-- ----------------------------
DROP TABLE IF EXISTS `sgin`;
CREATE TABLE `sgin` (
  `proid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `sgintime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sgin
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `imageid` int(11) NOT NULL,
  `sex` int(11) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------

-- ----------------------------
-- View structure for selectproimage
-- ----------------------------
DROP VIEW IF EXISTS `selectproimage`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `selectproimage` AS select `image`.`imageurl` AS `imageurl` from (`image` join `project`) where (`image`.`proid` = `project`.`proid`) ;

-- ----------------------------
-- View structure for selectuserimage
-- ----------------------------
DROP VIEW IF EXISTS `selectuserimage`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `selectuserimage` AS select `image`.`imageurl` AS `imageurl` from (`image` join `user`) where (`user`.`imageid` = `image`.`imageid`) ;
