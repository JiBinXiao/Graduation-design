/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50508
Source Host           : 127.0.0.1:3306
Source Database       : rwsc

Target Server Type    : MYSQL
Target Server Version : 50508
File Encoding         : 65001

Date: 2018-04-17 09:26:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `model_baseinfo`
-- ----------------------------
DROP TABLE IF EXISTS `model_baseinfo`;
CREATE TABLE `model_baseinfo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `baseid` int(11) NOT NULL COMMENT '关联数据库',
  `sourcetype` char(1) NOT NULL COMMENT '数据源类型（1-表 2-视图）',
  `modeltype` char(1) NOT NULL COMMENT '模型类型',
  `modelname` varchar(100) NOT NULL COMMENT '模型名称',
  `modeldesc` varchar(1000) DEFAULT NULL COMMENT '模型描述',
  `sourcename` varchar(100) DEFAULT NULL COMMENT '数据源名称',
  `sourcedesc` varchar(1000) DEFAULT NULL COMMENT '数据源描述',
  `sourcefields` varchar(1000) DEFAULT NULL COMMENT '数据源字段列表',
  `modelparam1` decimal(20,2) DEFAULT NULL COMMENT '模型参数1',
  `modelparam2` decimal(20,2) DEFAULT NULL COMMENT '模型参数2',
  `modelparam3` decimal(20,2) DEFAULT NULL COMMENT '模型参数3',
  `modelparam4` decimal(20,2) DEFAULT NULL COMMENT '模型参数4',
  `modelparam5` decimal(20,2) DEFAULT NULL COMMENT '模型参数5',
  `modelparam6` decimal(20,2) DEFAULT NULL COMMENT '模型参数6',
  `modelparam7` varchar(500) DEFAULT NULL,
  `status` char(1) NOT NULL COMMENT '状态',
  `username` varchar(100) NOT NULL COMMENT '创建用户',
  `lastuser` varchar(100) DEFAULT NULL COMMENT '上次使用用户',
  `lasttime` datetime DEFAULT NULL COMMENT '上次使用时间',
  `result` varchar(5000) DEFAULT NULL,
  `delflag` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_type` (`modeltype`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_baseinfo
-- ----------------------------
INSERT INTO `model_baseinfo` VALUES ('1', '2', '1', '1', 'qq', '1', 'cmsp_coalmine_drivingworklayer', '', 'tunnellength,sectionarea', '1.00', '1.00', null, null, null, null, null, '1', '宓仕银', null, null, null, '1');
INSERT INTO `model_baseinfo` VALUES ('2', '2', '1', '1', '333', '223', 'cmsp_coalmine_worklayer', '', 'slopelength,minelayerid,trendlength', '1.00', '1.00', null, null, null, null, null, '1', '宓仕银', null, null, null, '1');
INSERT INTO `model_baseinfo` VALUES ('3', '2', '1', '1', '77', '7', 'cmsp_coalmine_drivingworklayer', '', 'sectionarea,tunnellength', '1.00', '1.00', null, null, null, null, null, '1', '宓仕银', null, null, null, '1');
INSERT INTO `model_baseinfo` VALUES ('4', '2', '1', '1', '77', '7', 'cmsp_coalmine_drivingworklayer', '', 'createby,sectionarea,tunnellength', '1.00', '1.00', null, null, null, null, null, '1', '宓仕银', null, null, null, '0');
INSERT INTO `model_baseinfo` VALUES ('5', '2', '1', '1', '77', '7', 'cmsp_coalmine_drivingworklayer', '', 'createby,sectionarea,tunnellength,updateby,id', '1.00', '1.00', null, null, null, null, null, '4', '宓仕银', null, '2018-03-30 14:47:23', '{\"最终结果_factorModelStr\":[[4.2177969601155396E10],[4.217795559426204E10],[2.9804207440942886E10],[3.908452908897153E10],[-3.6413450966138446E11],[4.2177969467092476E10],[4.2177969558193E10],[4.217796963692236E10],[4.217796963692236E10],[4.217796963692236E10]],\"协方差矩阵_cov\":[[1648.9333333333327,-5.519679950485776E11,-8.145679013793778E11,-318.1333333333334,0.1111111111111111],[-5.519679950485776E11,5.348467494251819E21,7.682565062824032E21,-2.822567441415999E11,-1.5746922991777777E10],[-8.145679013793778E11,7.682565062824032E21,1.1036762685514346E22,-4.0345678984897784E11,-2.1358024786666664E10],[-318.1333333333334,-2.822567441415999E11,-4.0345678984897784E11,313.06666666666666,2.444444444444444],[0.1111111111111111,-1.5746922991777777E10,-2.1358024786666664E10,2.444444444444444,9.166666666666666]],\"特征值对应矩阵_eigenVectors\":\"\",\"样本平均值处理后矩阵_dataAdjust\":[[-23.4,-2.43444468638E10,-3.44444444616E10,-10.8,-4.5],[-35.4,-2.43444226618E10,-3.44444442426E10,17.2,-3.5],[58.6,-1.54555580078E10,-2.55555555966E10,-10.8,-2.5],[-23.4,-2.21222246738E10,-3.22222222626E10,29.2,-1.5],[-23.4,2.079888864372E11,2.988888888484E11,-10.8,-0.5],[58.6,-2.43444467728E10,-3.44444443616E10,-10.8,0.5],[58.6,-2.43444467728E10,-3.44444444726E10,-10.8,1.5],[-23.4,-2.43444468948E10,-3.44444444836E10,-10.8,2.5],[-23.4,-2.43444468948E10,-3.44444444836E10,-10.8,3.5],[-23.4,-2.43444468948E10,-3.44444444836E10,29.2,4.5]],\"特征值比率_eigensratio\":[[1.6384744330212458E22,0.999999999120726],[4.8584955370820717E17,8.792740943351737E-10],[1369.642934386685,6.987718232954392E-39],[201.25846060925184,1.5087905479746374E-40],[7.742996170966187,2.2332572402547555E-43]],\"选择特征值矩阵_eigenSdVectors\":[[6.004906057487955E-11],[-0.5713228034422877],[-0.820725443901214],[3.005155023318255E-11],[1.61892367854839E-12]]}', '0');
INSERT INTO `model_baseinfo` VALUES ('6', '2', '1', '1', '77', '7', 'cmsp_coalmine_drivingworklayer', '', 'createby,sectionarea,tunnellength', '1.00', '1.00', null, null, null, null, null, '1', '宓仕银', null, null, null, '1');
INSERT INTO `model_baseinfo` VALUES ('7', '2', '1', '1', '综合实力', '综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力', 'cmsp_coalmine_drivingworklayer', '综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力综合实力', 'createby,sectionarea,tunnellength', '1.00', '1.00', '1.00', null, null, null, null, '4', '宓仕银', '宓仕银', '2018-04-09 13:39:29', '{\"最终结果_factorModelStr\":[[3.834362983328272E10,2.7085697869114304E8],[3.8343615824860214E10,2.7083724169887924E8],[2.596969595683468E10,-1.9450967144020824E9],[3.525014639204073E10,-2.8313143474222755E8],[-3.6796886687676483E11,6.139204898980713E7],[3.8343629699218445E10,2.7085696114779663E8],[3.834362979031406E10,2.708568977239075E8],[3.834362986905069E10,2.7085699156175995E8],[3.834362986905069E10,2.7085699156175995E8],[3.834362986905069E10,2.7085699156175995E8],[3.83436297730619E10,2.708570462074547E8]],\"协方差矩阵_cov\":[[1495.8545454545456,-4.7154149604492737E11,-6.97414141617891E11],[-4.7154149604492737E11,4.867498207929079E21,6.990538642589772E21],[-6.97414141617891E11,6.990538642589772E21,1.0040942757708915E22]],\"特征值对应矩阵_eigenVectors\":\"\",\"样本平均值处理后矩阵_dataAdjust\":[[-22.363636363636367,-2.213131532881818E10,-3.1313131336727272E10],[-34.36363636363637,-2.213129112681818E10,-3.1313131117727272E10],[59.63636363636363,-1.324242647281818E10,-2.2424242471727272E10],[-22.363636363636367,-1.990909313881818E10,-2.9090909137727272E10],[-22.363636363636367,2.1020201797218182E11,3.020202019732727E11],[59.63636363636363,-2.213131523781818E10,-3.1313131236727272E10],[59.63636363636363,-2.213131523781818E10,-3.1313131347727272E10],[-22.363636363636367,-2.213131535981818E10,-3.1313131358727272E10],[-22.363636363636367,-2.213131535981818E10,-3.1313131358727272E10],[-22.363636363636367,-2.213131535981818E10,-3.1313131358727272E10],[-10.363636363636367,-2.213131534981818E10,-3.1313131248727272E10]],\"特征值比率_eigensratio\":[[1.490799554254226E22,0.9999999991072971],[4.4542309573455494E17,8.927029195577207E-10],[1151.0499908403956,5.9614219539668E-39]],\"选择特征值矩阵_eigenSdVectors\":[[5.646547512010479E-11,-2.5835471398179608E-8],[-0.571386386723104,-0.8206811786970112],[-0.8206811786970113,0.5713863867231038]]}', '0');
INSERT INTO `model_baseinfo` VALUES ('8', '2', '1', '1', '主成分析1', '', 'cmsp_coalmine_drivingworklayer', '', 'sectionarea,tunnellength', '1.00', '1.00', '1.00', null, null, null, null, '4', '宓仕银', '宓仕银', '2018-04-09 13:39:22', '{\"最终结果_factorModelStr\":[[-3.8343629833282715E10],[-3.83436158248602E10],[-2.596969595683467E10],[-3.5250146392040726E10],[3.679688668767647E11],[-3.834362969921843E10],[-3.834362979031404E10],[-3.8343629869050674E10],[-3.8343629869050674E10],[-3.8343629869050674E10],[-3.834362977306188E10]],\"协方差矩阵_cov\":[[4.867498207929079E21,6.990538642589772E21],[6.990538642589772E21,1.0040942757708915E22]],\"特征值对应矩阵_eigenVectors\":\"\",\"样本平均值处理后矩阵_dataAdjust\":[[-2.213131532881818E10,-3.1313131336727272E10],[-2.213129112681818E10,-3.1313131117727272E10],[-1.324242647281818E10,-2.2424242471727272E10],[-1.990909313881818E10,-2.9090909137727272E10],[2.1020201797218182E11,3.020202019732727E11],[-2.213131523781818E10,-3.1313131236727272E10],[-2.213131523781818E10,-3.1313131347727272E10],[-2.213131535981818E10,-3.1313131358727272E10],[-2.213131535981818E10,-3.1313131358727272E10],[-2.213131535981818E10,-3.1313131358727272E10],[-2.213131534981818E10,-3.1313131248727272E10]],\"特征值比率_eigensratio\":[[1.4907995542542258E22,0.9999999991072971],[4.4542309573402426E17,8.927029195555937E-10]],\"选择特征值矩阵_eigenSdVectors\":[[0.5713863867231037],[0.8206811786970112]]}', '0');
INSERT INTO `model_baseinfo` VALUES ('9', '2', '1', '2', 'ad', '', 'cmsp_hidedanger_checkplan', '', 'checkdepart,chargeperson', '1.00', '1.00', null, null, null, null, null, '1', '宓仕银', null, null, null, '0');
INSERT INTO `model_baseinfo` VALUES ('10', '2', '1', '1', 'dad', '', 'cmsp_hidedanger_checkplan', '', 'checkdepart,chargeperson', '1.00', '1.00', '2.00', null, null, null, null, '2', '宓仕银', null, null, null, '1');
INSERT INTO `model_baseinfo` VALUES ('11', '2', '1', '1', '2', '', 'cmsp_hidedanger_delayapp', '', 'appperson', '1.00', '1.00', '1.00', null, null, null, null, '1', '宓仕银', null, null, null, '0');
INSERT INTO `model_baseinfo` VALUES ('12', '2', '1', '2', 'dggv', '', 'cmsp_coalmine_wellholeinfo', '', 'sectionalarea,angle', '1.00', '1.00', null, null, null, null, null, '4', '宓仕银', '宓仕银', '2018-04-09 13:42:12', '{\"因子载荷矩阵_eigenSdVectors\":[[0.7071067811865474],[0.7071067811865477]],\"因子模型_factorModelStr\":[[\"X1 = 0.7071067811865474F1\"],[\"X2 = 0.7071067811865477F1\"]],\"特征值对应矩阵_eigenVectors\":[[1.9998636487951504,0.0],[0.0,1.363512048496337E-4]],\"特征值比率_eigensratio\":[[1.9998636487951504,0.9999999953514535,0.9999999953514535],[1.363512048496337E-4,4.648546557698557E-9,1.0]],\"协方差矩阵_relv\":[[1.0,0.9998636487951503],[0.9998636487951503,1.0]]}', '0');
INSERT INTO `model_baseinfo` VALUES ('13', '2', '1', '2', '2', '', 'cmsp_hidedanger_chk', '', null, null, null, null, null, null, null, null, '1', '宓仕银', null, null, null, '0');
INSERT INTO `model_baseinfo` VALUES ('14', '2', '1', '3', '撒旦法', '', 'cmsp_hidedanger_checklist', '', 'id', null, null, null, null, null, null, null, '1', '宓仕银', null, null, null, '1');
INSERT INTO `model_baseinfo` VALUES ('15', '2', '1', '3', '测试熵值法', '爱的色放', 'cmsp_coalmine_drivingworklayer', '', 'id,sectionarea', null, null, null, null, null, null, null, '1', '宓仕银', null, null, null, '1');
INSERT INTO `model_baseinfo` VALUES ('16', '2', '1', '3', '阿斯达', '', 'cmsp_coalmine_drivingworklayer', '', 'sectionarea,tunnellength', null, null, null, null, null, null, null, '1', '宓仕银', null, null, null, '1');
INSERT INTO `model_baseinfo` VALUES ('17', '2', '1', '3', '为啥', '', 'cmsp_coalmine_drivingworklayer', '', 'id,sectionarea,tunnellength', null, null, null, null, null, null, '1,0,1', '4', '宓仕银', '宓仕银', '2018-04-09 13:42:54', '{\"熵值_entropyArray\":[0.9917572001105917,0.9943893556122515,0.98823116752978],\"权值矩阵_rightArray\":[0.32170442816921935,0.21897524732351928,0.45932032450726135],\"综合评价值_scoreArray\":[1.2189752473236743,1.248221081921243,1.281337684398349,1.3076804993569249,1.5763037529310542,1.3652045329071658,1.3944503898605047,1.4236962470666255,1.452942104172918,1.482187961279211,1.5114338185276541],\"样本标准化处理后的矩阵_startardDatas\":[[1.0,1.9999999998622668,1.000000000066],[1.0909090909090908,1.9999998956929699,1.000000000723],[1.1818181818181819,1.961740793882298,1.0266666666610267],[1.2727272727272727,1.9904351984705744,1.0066666666630066],[1.3636363636363638,1.0,1.999999999997],[1.4545454545454546,1.9999999994705884,1.000000000366],[1.5454545454545454,1.9999999994705884,1.000000000033],[1.6363636363636362,1.9999999999956959,1.0],[1.7272727272727273,1.9999999999956959,1.0],[1.8181818181818183,1.9999999999956959,1.0],[1.9090909090909092,1.9999999999526543,1.00000000033]],\"信息效用值_effectiveArray\":[0.008242799889408348,0.005610644387748498,0.011768832470219981]}', '0');

-- ----------------------------
-- Table structure for `model_database`
-- ----------------------------
DROP TABLE IF EXISTS `model_database`;
CREATE TABLE `model_database` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `schema` varchar(50) NOT NULL COMMENT '数据库名',
  `name` varchar(100) NOT NULL COMMENT '数据库名',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '数据库链接',
  `username` varchar(50) NOT NULL COMMENT '数据库连接用户名',
  `password` varchar(100) NOT NULL COMMENT '数据库连接密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_database
-- ----------------------------
INSERT INTO `model_database` VALUES ('2', 'cmsp', '煤矿安全', 'jdbc:mysql://127.0.0.1:3306/cmsp?useUnicode=true&characterEncoding=utf-8', 'root', 'trsadmin');

-- ----------------------------
-- Table structure for `model_user`
-- ----------------------------
DROP TABLE IF EXISTS `model_user`;
CREATE TABLE `model_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model_user
-- ----------------------------
INSERT INTO `model_user` VALUES ('1', '宓仕银', '123456');
INSERT INTO `model_user` VALUES ('2', 'mishiyin', '123456');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(6) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `remoteaddr` varchar(50) DEFAULT NULL,
  `requesturi` varchar(255) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `params` varchar(2000) DEFAULT NULL,
  `useragent` varchar(255) DEFAULT NULL,
  `exception` varchar(5000) DEFAULT NULL,
  `createby` int(10) unsigned DEFAULT NULL,
  `createdate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111484 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('111483', '1', '系统登录', '0:0:0:0:0:0:0:1', '/modelplat/a', 'GET', null, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36', '', '2', '2018-03-27 09:45:35');

-- ----------------------------
-- Table structure for `testuser`
-- ----------------------------
DROP TABLE IF EXISTS `testuser`;
CREATE TABLE `testuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of testuser
-- ----------------------------
INSERT INTO `testuser` VALUES ('1', '2', '3', '0');
INSERT INTO `testuser` VALUES ('2', 'e3bf1a13-023e-47f5-82b0-fee1a35fc2c1', 'asdasd', '2');
INSERT INTO `testuser` VALUES ('3', 'a26f6c6e-8c4f-4e96-b255-1fc1cf77d251', 'asdasd', '2');
INSERT INTO `testuser` VALUES ('4', 'c530413a-0e8c-487d-b768-7f360d734eee', 'asdasd', '2');
INSERT INTO `testuser` VALUES ('5', 'bc1df03e-6147-40bd-b183-bf9dbaca502a', 'asdasd', '2');
INSERT INTO `testuser` VALUES ('6', 'fc7e695b-cd09-4606-94e7-5e7665a0265e', 'asdasd', '2');
INSERT INTO `testuser` VALUES ('7', 'a5d50963-b864-4de9-8204-8b42450eea34', 'asdasd', '2');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `nickname` varchar(60) NOT NULL,
  `st` int(1) NOT NULL DEFAULT '0' COMMENT '0：正常  1：用户过期  2：停用 3：删除',
  `failnum` int(5) NOT NULL DEFAULT '0' COMMENT '登录失败次数',
  `limtdate` date NOT NULL COMMENT '截止日期',
  `lgtime` datetime NOT NULL COMMENT '最近一次登录时间',
  `ctime` datetime NOT NULL COMMENT '创建时间',
  `utime` datetime NOT NULL COMMENT '修改时间',
  `cuser` varchar(60) DEFAULT '' COMMENT '创建用户',
  `uuser` varchar(60) DEFAULT '' COMMENT '修改用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '宓仕银', '123456', '宓仕银', '0', '0', '2018-04-16', '2018-04-16 16:31:12', '2018-04-16 16:31:20', '2018-04-16 16:31:29', '', '');
INSERT INTO `user` VALUES ('2', 'mishiyin', '123456', '宓仕银', '0', '0', '2018-04-16', '2018-04-16 16:31:14', '2018-04-16 16:31:23', '2018-04-16 16:31:32', '', '');
INSERT INTO `user` VALUES ('3', 'admin', 'trsadmin', '宓仕银', '0', '0', '2018-04-16', '2018-04-16 16:31:17', '2018-04-16 16:31:26', '2018-04-16 16:31:35', '', '');
