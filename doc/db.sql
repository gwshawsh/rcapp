
--  菜单
drop table if exists `sys_menu` ;
CREATE TABLE `sys_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `menu_id` varchar(50) COMMENT '父菜单ID，一级菜单为0',
  `parent_id` varchar(50) COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) COMMENT '菜单名称',
  `url` varchar(200) COMMENT '菜单URL',
  `perms` varchar(500) COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) COMMENT '菜单图标',
  `order_num` int COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单管理';



--  部门
drop table if exists `sys_dept` ;
CREATE TABLE `sys_dept` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) COMMENT '部门名称',
  `type` int COMMENT '类型   0：目录   1：菜单   ', 
  `order_num` int COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门管理';

/*
--  系统用户
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户编码',
  `fullname` varchar(50)  COMMENT '姓名',
  `password` varchar(100) COMMENT '密码',
  `email` varchar(100) COMMENT '邮箱',
  `mobile` varchar(100) COMMENT '手机号',
  `status` tinyint COMMENT '状态  0：禁用   1：正常',
  `orgid` bigint NULL COMMENT '所属组织',
  `dept_id` bigint NULL COMMENT '所属部门',
  `create_time` datetime COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

*/

--  系统用户 
drop table if exists `sys_user` ;
CREATE TABLE `sys_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户编码',
  `fullname` varchar(50)  COMMENT '姓名',
  `password` varchar(100) COMMENT '密码',
  `entrytime` datetime COMMENT '入职时间',
  `email` varchar(100) COMMENT '邮箱',
  `englishname` varchar(50)  COMMENT '英文名',
  `brithday` datetime COMMENT '出生日期', 
  `englishlevel` varchar(50)  COMMENT '外语水平',
  `graduationtime` datetime COMMENT '毕业时间',
  `residence` text COMMENT '现住址',
  `census` text COMMENT '户籍在地',
  `educationexperience` text COMMENT '教育经历',
  `workexperience` text COMMENT '工作经历',
  `family` text COMMENT '家庭状况',
  `mobile` varchar(100) COMMENT '电话',
  `startedworktime` datetime COMMENT '参加工作时间',  
  `name` varchar(50)  COMMENT '姓名',
  `gender` varchar(4) COMMENT '性别:enum:1015:enumvalueid:enumvaluename',--  0-男，1-女
  `nationality` varchar(50)  COMMENT '民族',
  `computerlevel` varchar(50)  COMMENT '计算机水平',
  `major` varchar(50)  COMMENT '所学专业',
  `thermobile` varchar(100) COMMENT '其他联系方式',
  `vacationyear` varchar(4) COMMENT '本年假天数:enum:1016:enumvalueid:enumvaluename',
  `vacationlastyear` varchar(4) COMMENT '上年假天数:enum:1017:enumvalueid:enumvaluename',
  `identification` varchar(50)  COMMENT '身份证',   
  `qulification` varchar(50)  COMMENT '学历',   
  `marriage` varchar(4) COMMENT '婚姻状况:enum:1018:enumvalueid:enumvaluename',--  0-未婚，1-已婚 
  `academictitle` varchar(50)  COMMENT '专业职称',
  `school` varchar(50)  COMMENT '毕业院校',
  `status` tinyint COMMENT '状态:enum:1020:enumvalueid:enumvaluename',
  `orgid` bigint NULL COMMENT '所属组织:dialogtree:organization:id:name',
  `dept_id` bigint NULL COMMENT '所属部门:dialogtree:sys_dept:id:name',
  `create_time` datetime COMMENT '创建时间',
  PRIMARY KEY (`id`),
  UNIQUE INDEX (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';


--  初始数据  
-- 初始数据 
INSERT INTO `sys_user` (`id`, `username`, `password`, `email`, `mobile`, `status`, `create_time`) VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'root@renren.io', '13612345678', '1', '2016-11-11 11:11:11');




--  角色
CREATE TABLE `sys_role` (
  `role_id` bigint NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) COMMENT '角色名称',
  `remark` varchar(100) COMMENT '备注',
  `create_time` datetime COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

--  用户与角色对应关系
CREATE TABLE `sys_user_role` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint COMMENT '用户ID',
  `role_id` bigint COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色对应关系';

--  角色与菜单对应关系
CREATE TABLE `sys_role_menu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `role_id` bigint COMMENT '角色ID',
  `menu_id` varchar(50) COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色与菜单对应关系';


--  系统配置信息
CREATE TABLE `sys_config` (
	`id` bigint NOT NULL AUTO_INCREMENT,
	`key` varchar(50) COMMENT 'key',
	`value` varchar(2000) COMMENT 'value',
	`status` tinyint DEFAULT 1 COMMENT '状态   0：隐藏   1：显示',
	`remark` varchar(500) COMMENT '备注',
	PRIMARY KEY (`id`),
	UNIQUE INDEX (`key`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8 COMMENT='系统配置信息表';

--  系统日志
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COMMENT '用户名',
  `operation` varchar(50) COMMENT '用户操作',
  `method` varchar(200) COMMENT '请求方法',
  `params` varchar(5000) COMMENT '请求参数',
  `ip` varchar(64) COMMENT 'IP地址',
  `create_date` datetime COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=`InnoDB` DEFAULT CHARACTER SET utf8 COMMENT='系统日志';



-- 合同管理



-- 采购管理


-- 报表分析
 
 

 

--  定时任务
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务';

--  定时任务日志
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `method_name` varchar(100) DEFAULT NULL COMMENT '方法名',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务日志';



INSERT INTO `schedule_job` (`bean_name`, `method_name`, `params`, `cron_expression`, `status`, `remark`, `create_time`) VALUES ('testTask', 'test', 'renren', '0 0/30 * * * ?', '0', '有参数测试', '2016-12-01 23:16:46');
INSERT INTO `schedule_job` (`bean_name`, `method_name`, `params`, `cron_expression`, `status`, `remark`, `create_time`) VALUES ('testTask', 'test2', NULL, '0 0/30 * * * ?', '1', '无参数测试', '2016-12-03 14:55:56');


-- 枚举表
DROP TABLE IF EXISTS `enumtable`;
CREATE TABLE `enumtable`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enumtype` varchar(50) COMMENT '枚举类型',
  `enumvalueid` int COMMENT '枚举值',
  `enumvaluename` varchar(50) COMMENT '枚举名称',
  `remark` text COMMENT '备注', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='枚举表';



-- -- 银行账户表
-- DROP TABLE IF EXISTS `bankaccount`;
-- CREATE TABLE `bankaccount`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `bankname` varchar(50) COMMENT '银行名称',
--   `subbank` varchar(50) COMMENT '开户支行',
--   `accountperson` varchar(50) COMMENT '账号法人',
--   `accountno` varchar(50) COMMENT '银行账号',
--   `uptdate` datetime COMMENT '更新时间',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行账户表';
 

DROP TABLE IF EXISTS `goods` ;
CREATE TABLE `goods` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `classid` bigint COMMENT '类别:combo:gclass:id:name',
  `code` varchar(50) COMMENT '编码',
  `name` varchar(200) COMMENT '名称',
  `spec` varchar(500) COMMENT '规格',
  `unit` varchar(500) COMMENT '单位',
  `remark` varchar(500) COMMENT '备注',
  `price` double COMMENT '单价',
  `pricetax` double COMMENT '含税单价',
  `gcount` int COMMENT '库存', --    0：目录   1：菜单   2：按钮

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

DROP TABLE IF EXISTS `gclass` ;
CREATE TABLE `gclass` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint COMMENT '上级类别ID',
  `name` varchar(50) COMMENT '名称',
  `code` int COMMENT '编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品类表';





--  组织管理
DROP TABLE IF EXISTS `organization` ;
CREATE TABLE `organization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(50) COMMENT '简称',
  `fullname` varchar(30) COMMENT '全称',
  `parent_id` bigint COMMENT '上级组织:dialogtree:organization:id:name', 
  `phone` varchar(20) COMMENT '电话',
  `fax` varchar(20) COMMENT '传真',
  `address` varchar(500) COMMENT '办公地址',
  `signaddress` varchar(500) COMMENT '注册地址',
  `enaddress` varchar(500) COMMENT '英文地址',
  `email` varchar(200) COMMENT '邮箱',
  `webaddress` varchar(200) COMMENT '网址',
  `longitude` varchar(50) COMMENT '经度',
  `latitude` varchar(50) COMMENT '纬度',
  `linkman` varchar(50) COMMENT '联系人',
  `paytype` varchar(50) COMMENT '付款方式:combo:paytype:id:name',
  `financecode` varchar(50) COMMENT '财务编码',
  `province` varchar(50) COMMENT '省',
  `city` varchar(50) COMMENT '城市',
  `remark` varchar(50) COMMENT '备注',
  `bankid` bigint COMMENT '银行名称:combo:bank:id:name',
  `subbank` varchar(50) COMMENT '开户支行',
  `accountperson` varchar(50) COMMENT '账号法人',
  `accountno` varchar(50) COMMENT '银行账号',
  `taxcode` varchar(50) COMMENT '纳税人识别号',
  `accperiod` varchar(50) COMMENT '账期',
  `policyrate` double COMMENT '保险客户费率',
  `relationid` bigint  COMMENT '关联单位',
  `zizhi` varchar(50) COMMENT '注册资质',
  `busstype` varchar(50) COMMENT '业务类型:enum:2001:enumvalueid:enumvaluename',
  `type` int COMMENT '类型:enum:2001:enumvalueid:enumvaluename', --  0：目录  1：港口  2：仓库   3：堆场 4：船公司  5：放箱公司',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织管理';


-- -- 付款方式
-- DROP TABLE IF EXISTS `paytype` ;
-- CREATE TABLE `paytype` (
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `code` varchar(50) COMMENT '编码',
--   `name` varchar(50) COMMENT '名称', 
--   `remark` varchar(50) COMMENT '备注',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='付款方式';


-- 地点管理 
DROP TABLE IF EXISTS `place` ;
CREATE TABLE `place` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(50) COMMENT '名称', 
  `linkman` varchar(50) COMMENT '联系人', 
  `phone` varchar(20) COMMENT '联系电话',
  `address` varchar(200) COMMENT '地址',
  `longitude` varchar(50) COMMENT '经度',
  `latitude` varchar(50) COMMENT '纬度',
  `organization` varchar(50) COMMENT '所属组织:dialogtree:organization:id:name',
  `placetype` int COMMENT '地点类型:enum:2001:enumvalueid:enumvaluename', --  0：仓库 1:工厂 2:堆场',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地点管理';

-- 线路管理
DROP TABLE IF EXISTS `transline` ;
CREATE TABLE `transline` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(50) COMMENT '名称',
  `startlocation` bigint COMMENT '起始地点:combo:place:id:name',
  `endlocation`  bigint COMMENT '结束地点:combo:place:id:name',
  `distance` double COMMENT '距离',
  `helpcode` varchar(200) COMMENT '助记码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线路管理';

-- -- 仓库管理
-- DROP TABLE IF EXISTS `store` ;
-- CREATE TABLE `store` (
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `code` varchar(50) COMMENT '编码',
--   `name` varchar(50) COMMENT '名称', 
--   `linkman` varchar(50) COMMENT '联系人', 
--   `phone` varchar(20) COMMENT '联系电话',
--   `address` varchar(200) COMMENT '地址',
--   `longitude` varchar(50) COMMENT '经度',
--   `latitude` varchar(50) COMMENT '纬度',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库管理';

-- -- 港口管理
-- DROP TABLE IF EXISTS `port` ;
-- CREATE TABLE `port` (
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `code` varchar(50) COMMENT '编码',
--   `name` varchar(50) COMMENT '名称', 
--   `linkman` varchar(50) COMMENT '联系人', 
--   `phone` varchar(20) COMMENT '联系电话',
--   `address` varchar(200) COMMENT '地址',
--   `longitude` varchar(50) COMMENT '经度',
--   `latitude` varchar(50) COMMENT '纬度',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='港口管理';

-- -- 堆场管理
-- DROP TABLE IF EXISTS `containeryard` ;
-- CREATE TABLE `containeryard` (
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `code` varchar(50) COMMENT '编码',
--   `name` varchar(50) COMMENT '名称', 
--   `linkman` varchar(50) COMMENT '联系人', 
--   `phone` varchar(20) COMMENT '联系电话',
--   `address` varchar(200) COMMENT '地址',
--   `longitude` varchar(50) COMMENT '经度',
--   `latitude` varchar(50) COMMENT '纬度',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='堆场管理';


-- 银行管理
DROP TABLE IF EXISTS `bank` ;
CREATE TABLE `bank` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(50) COMMENT '名称', 
  `boctid` int COMMENT '币别',
  `address` varchar(100) COMMENT '地址',
  `tel` varchar(50) COMMENT '电话',
  `fax` varchar(50) COMMENT '传真',
  `man` varchar(50) COMMENT '联系人',
  `del` int COMMENT '假删',
  `makeuser` int COMMENT '创建人员',
  `makedate` datetime COMMENT '创建日期',
  `remark` varchar(200) COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='银行管理';

-- -- 工厂管理
-- DROP TABLE IF EXISTS `factory` ;
-- CREATE TABLE `factory` (
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `code` varchar(50) COMMENT '编码',
--   `name` varchar(50) COMMENT '名称', 
--   `linkman` varchar(50) COMMENT '联系人', 
--   `phone` varchar(20) COMMENT '联系电话',
--   `address` varchar(200) COMMENT '地址',
--   `longitude` varchar(50) COMMENT '经度',
--   `latitude` varchar(50) COMMENT '纬度',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工厂管理';



-- 区域管理
DROP TABLE IF EXISTS `region` ;
CREATE TABLE `region` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(50) COMMENT '名称',
  `regionalcode` varchar(50) COMMENT '上级区域编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域管理';


-- 车队管理
DROP TABLE IF EXISTS `transteam` ;
CREATE TABLE `transteam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(50) COMMENT '名称',
  `address` varchar(200) COMMENT '地址',
  `contact` varchar(20) COMMENT '联系人',
  `contact_number` varchar(20) COMMENT '联系电话',
  `vehicle_type` varchar(20) COMMENT '车辆类型:enum:2003:enumvalueid:enumvaluename', -- （挂靠、自营、外协）,
  `billing_information` varchar(1000) COMMENT '开票信息',
  `account_information` varchar(1000) COMMENT '账户信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车队管理';

-- 车辆管理
 
 

--  船舶管理
DROP TABLE IF EXISTS `ship` ;
CREATE TABLE `ship` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(20) COMMENT '中文名称',
  `enname` varchar(20) COMMENT '英文名称',
  `region` bigint COMMENT '所属区域:combo:region:id:name',
  `uncode` varchar(50) COMMENT 'UN代码',
  `type` varchar(50) COMMENT '类型',
  `company` bigint COMMENT '所属船公司',
  `coscode` varchar(50) COMMENT 'COS代码',
  `cosshipenname` varchar(20) COMMENT 'COS船英文名',
  `country` varchar(20) COMMENT '所属国家',
  `contact` varchar(20) COMMENT '联系人',
  `address` varchar(200) COMMENT '地址',
  `phone` varchar(20) COMMENT '电话',
  `route` varchar(100) COMMENT '航线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='船舶管理';

--  船舶计划
DROP TABLE IF EXISTS `shipplan` ;
CREATE TABLE `shipplan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enshipname` varchar(20) COMMENT '英文船名',
  `chshipname` varchar(20) COMMENT '中文船名',
  `expvoyage` varchar(50) COMMENT '出口航次',
  `Impvoyage` varchar(50) COMMENT '进口航次',
  `arrivalstate` varchar(50) COMMENT '到港状态',
  `arrivaldate` datetime COMMENT '预计到港日期',
  `shipid` varchar(20) COMMENT '船舶呼号',
  `imono` varchar(50) COMMENT 'IMO编码',
  `dockcode` varchar(50) COMMENT '码头代码',
  `dockname` varchar(50) COMMENT '码头名称',
  `dockunit` varchar(50) COMMENT '靠泊单位', 
  `route` varchar(50) COMMENT '航线',
  `arrivaltime` datetime COMMENT '预计到港时间',
  `leavetime` datetime COMMENT '预计离港时间',
  `shipment` varchar(20) COMMENT '船期',
  `remark` varchar(50) COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='船舶计划';

-- 车辆类型
DROP TABLE IF EXISTS `cartype`;
CREATE TABLE `cartype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cartypecode` varchar(50) COMMENT '编码',
  `cartypename` varchar(20) COMMENT '姓名', --  五轴，六轴...
  `uptdate` datetime COMMENT '更新时间', 
  `remark` varchar(50) COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆类型';

-- 币别
DROP TABLE IF EXISTS `boctype`;
CREATE TABLE `boctype` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `boctypecode` varchar(50) COMMENT '编码',
  `boctypename` varchar(20) COMMENT '币名', --  美币，人民币...
  `rate` double COMMENT '汇率',
  `unit` varchar(20) COMMENT '单位',
  `uptdate` datetime COMMENT '更新时间', 
  `remark` varchar(50) COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='币别';


-- 车辆管理
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `carcode` varchar(50) COMMENT '编码',
  `carname` varchar(20) COMMENT '车牌号',
  `CarInfo`  varchar(1024) COMMENT '车辆辨识信息', 
  `DriverId`  varchar(32) COMMENT '主司机编码',
  `DriverName`  varchar(50) COMMENT '主司机姓名',
  `OwnerType`  varchar(4) COMMENT '车辆所属:enum:2003:enumvalueid:enumvaluename',--  1-自有车辆，2-挂靠车辆，3-外协车辆
  `transteam` bigint COMMENT '所属车队:combo:transteam:id:name',
  `cartype` bigint COMMENT '车辆类型:enum:1007:enumvalueid:enumvaluename',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆管理';



-- 司机管理
DROP TABLE IF EXISTS `drivers`;
CREATE TABLE `drivers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(20) COMMENT '姓名',
  `phone` varchar(20) COMMENT '电话',
  `transteam` bigint COMMENT '所属车队:combo:transteam:id:name',
  `documentno` varchar(50) COMMENT '证件号',
  `driveage` int COMMENT '驾龄',
  `type` varchar(20) COMMENT '类型:enum:2005:enumvalueid:enumvaluename', --  （有、无车）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='司机管理';

-- 箱型管理
DROP TABLE IF EXISTS `boxs`;
CREATE TABLE `boxs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `boxsize` varchar(50) COMMENT '箱型尺寸',
  `weight` varchar(10) COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='箱型管理';

-- 待办事项
DROP TABLE IF EXISTS `todolist`;
CREATE TABLE `todolist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COMMENT '待办名称',
  `todotype` int COMMENT '待办类型',
  `billdate` datetime COMMENT '创建日期',
  `billdata` text COMMENT '业务数据',
  `remark` varchar(500) COMMENT '备注',
  `todourl` varchar(500) COMMENT '功能路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='待办事项';



-- 空箱计划用箱单单
DROP TABLE IF EXISTS `emptymain`;
CREATE TABLE `emptymain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `orgid` bigint COMMENT '客户:dialogtree:organization:id:name',
  `ladingcode` varchar(50) COMMENT '提单号',
  `shipname` varchar(20) COMMENT '船名',
  `flight` varchar(50) COMMENT '航次', 
  `shipid` bigint COMMENT '船公司', 
  `portid` bigint COMMENT '进港点:combo:place:id:name',
  `boxqty` int COMMENT '箱量',
  `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
  `takeboxplaceid` bigint COMMENT '提箱场站:combo:place:id:name', 
  `endplaceid` bigint COMMENT '目的地:combo:place:id:name', 
  `shipdate` datetime COMMENT '船期',
  `bgnshipdatetime` datetime COMMENT '集港时间',
  `endshipdatetime` datetime COMMENT '截港时间',
  `planarrdatetime` datetime COMMENT '预计用箱时间',-- 表示到场时间
  `istakebox` int COMMENT '是否放箱:enum:0001:enumvalueid:enumvaluename',
  `istrans` int COMMENT '是否运输:enum:0001:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `billstatus` varchar(50) COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',-- :0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='空箱计划';
 
-- 重箱计划单
DROP TABLE IF EXISTS `heavymain`;
CREATE TABLE `heavymain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `orgid` bigint COMMENT '客户:dialogtree:organization:id:name',
  `ladingcode` varchar(50) COMMENT '提单号',
  `shipname` varchar(20) COMMENT '船名',
  `flight` varchar(50) COMMENT '航次', 
  `portid` bigint COMMENT '港口:combo:place:id:name',
  `boxqty` int COMMENT '箱量',
  `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
  `takeboxplaceid` bigint COMMENT '提箱场站:combo:place:id:name', 
  `endplaceid` bigint COMMENT '目的地:combo:place:id:name', 
  `bgnshipdatetime` datetime COMMENT '集港时间',
  `endshipdatetime` datetime COMMENT '截港时间',
  `bgnplanarrtime` datetime COMMENT '最早到场时间',
  `endplanarrtime` datetime COMMENT '最晚到场时间',
  `fengxiangtime` datetime COMMENT '封箱时间',
  `baoguantime` datetime COMMENT '报关时间',
  `remark` varchar(1000) COMMENT '备注',
  `billstatus` varchar(50) COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename', -- 0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='重箱计划';
 

-- 门点计划单
DROP TABLE IF EXISTS `factorymain`;
CREATE TABLE `factorymain`(
   `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `orgid` bigint COMMENT '客户:dialogtree:organization:id:name',
  `ladingcode` varchar(50) COMMENT '提单号',
  `shipname` varchar(20) COMMENT '船名',
  `flight` varchar(50) COMMENT '航次', 
  `portid` bigint COMMENT '港口:combo:place:id:name',
  `boxqty` int COMMENT '箱量',
  `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
  `takeboxplaceid` bigint COMMENT '提箱场站:combo:place:id:name', 
  `endplaceid` bigint COMMENT '装卸地:combo:place:id:name', 
  `backplaceid` bigint COMMENT '返回地:combo:place:id:name', 
  `bgnshipdatetime` datetime COMMENT '集港时间',
  `endshipdatetime` datetime COMMENT '截港时间',
  `bgnplanarrtime` datetime COMMENT '最早到场时间',
  `endplanarrtime` datetime COMMENT '最晚到场时间',
  `fengxiangtime` datetime COMMENT '封箱时间',
  `baoguantime` datetime COMMENT '报关时间',
  `remark` varchar(1000) COMMENT '备注',
  `billstatus` varchar(50) COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename', -- 0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门点计划';
 


-- 疏港计划单
DROP TABLE IF EXISTS `leaveportmain`;
CREATE TABLE `leaveportmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `orgid` bigint COMMENT '客户:dialogtree:organization:id:name',
  `ladingcode` varchar(50) COMMENT '提单号',
  `shipname` varchar(20) COMMENT '船名',
  `flight` varchar(50) COMMENT '航次', 
  `portid` bigint COMMENT '港口:combo:place:id:name',
  `shipcompany` bigint COMMENT '船公司:combo:organization:id:name',
  `boxqty` int COMMENT '箱量',
  `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
  `takeboxplaceid` bigint COMMENT '起运地:combo:place:id:name', 
  `endplaceid` bigint COMMENT '目的地:combo:place:id:name', 
  `planarrporttime` datetime COMMENT '预计到港时间',
  `planarrtime` datetime COMMENT '预计到场时间',
  `remark` varchar(1000) COMMENT '备注',
  `billstatus` varchar(50) COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename', -- 0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疏港计划';
 
 


-- 预约用箱单单
DROP TABLE IF EXISTS `preemptymain`;
CREATE TABLE `preemptymain`(
   `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `orgid` bigint COMMENT '客户:dialogtree:organization:id:name',
  `ladingcode` varchar(50) COMMENT '提单号',
  `shipname` varchar(20) COMMENT '船名',
  `flight` varchar(50) COMMENT '航次', 
  `portid` bigint COMMENT '港口:combo:place:id:name',
  `boxqty` int COMMENT '箱量',
  `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
  `takeboxplaceid` bigint COMMENT '提箱场站:combo:place:id:name', 
  `endplaceid` bigint COMMENT '目的地:combo:place:id:name',
  `shipdate` datetime COMMENT '船期', 
  `bgntakedate` datetime COMMENT '计划开始日期',
  `endtakedate` datetime COMMENT '计划截止日期',
  `remark` varchar(1000) COMMENT '备注',
  `billstatus` varchar(50) COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename', -- 0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约用箱';
 

-- 放箱计划单
DROP TABLE IF EXISTS `takeboxmain`;
CREATE TABLE `takeboxmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `refbillno` varchar(50) COMMENT '参照单据号',
  `refbilltype` int COMMENT '参照单据类型:enum:1006:enumvalueid:enumvaluename', -- :0:无参照  1-空箱计划  2:重箱计划  3:门点计划 4:司机预约',
  `orgid` bigint COMMENT '客户:dialogtree:organization:id:name',
  `ladingcode` varchar(50) COMMENT '提单号',
  `shipname` varchar(20) COMMENT '船名',
  `flight` varchar(50) COMMENT '航次', 
  `shipid` bigint COMMENT '船公司', 
  `portid` bigint COMMENT '进港点:combo:place:id:name',-- 港口
  `boxqty` int COMMENT '箱量',
  `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
  `takeboxplaceid` bigint COMMENT '提箱场站:combo:place:id:name', 
  `endplaceid` bigint COMMENT '目的地:combo:place:id:name', -- 空箱计划就是仓库  重箱计划就是港口  门店计划就是工厂
  `shipdate` datetime COMMENT '船期',
  `bgnshipdatetime` datetime COMMENT '集港时间',
  `endshipdatetime` datetime COMMENT '截港时间',
  `bgnplanarrtime` datetime COMMENT '最早到场时间',-- 预计用箱时间
  `endplanarrtime` datetime COMMENT '最晚到场时间',
  `yingshou` decimal(19,4) COMMENT '应收费用',
  `yingfu` decimal(19,4) COMMENT '应付费用',
  `remark` varchar(1000) COMMENT '备注',
  `billstatus` varchar(50) COMMENT '单据状态:enum:2002:enumvalueid:enumvaluename', -- 0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成', 6放单异常  7放单结束
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='放箱计划';

-- 放箱计划明细表
DROP TABLE IF EXISTS `takeboxdetail`;
CREATE TABLE `takeboxdetail`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `transcompanyid` bigint COMMENT '运输公司:combo:organization:id:name',
  `startplaceid1` bigint COMMENT '原起运地点:combo:place:id:name',
  `startplaceid2` bigint COMMENT '现起运点:combo:place:id:name',
  `realplaceid2` bigint COMMENT '现起运点:combo:place:id:name',
  `endplaceid` bigint COMMENT '目的地:combo:place:id:name',
  `changeplacetype` int COMMENT '改单类型:enum:2009:enumvalueid:enumvaluename',-- 0-未改单   1-客户发起改单   2-运输发起改单
  `boxno` varchar(50) COMMENT '箱号',
  `fengno` varchar(50) COMMENT '铅封号',
  `plantaketime` datetime COMMENT '计划提箱时间',-- 对于重箱计划，就是从仓库的提箱时间
  `realtaketime` datetime COMMENT '实际提箱时间',
  `planarrvetime` datetime COMMENT '计划到场时间',  
  `realarrvetime` datetime COMMENT '实际到场时间', 
  `changefee` decimal(19,4) COMMENT '应收改单费',-- 
  `yingshou` decimal(19,4) COMMENT '应收运费用',
  `yingfu` decimal(19,4) COMMENT '应付运费用',
  `remark` varchar(500) COMMENT '备注',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='放箱计划明细表';




-- 运输计划单
DROP TABLE IF EXISTS `transboxmain`;
CREATE TABLE `transboxmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `refbillno` varchar(50) COMMENT '参照单据号',
  `refbilltype` int COMMENT '参照单据类型:enum:1006:enumvalueid:enumvaluename', -- :0:无参照  1-放箱计划  2:重箱计划  3:门点计划 4:司机预约',
  `orgid` bigint COMMENT '客户:dialogtree:organization:id:name',
  `ladingcode` varchar(50) COMMENT '提单号',
  `shipname` varchar(20) COMMENT '船名',
  `flight` varchar(50) COMMENT '航次', 
  `portid` bigint COMMENT '港口:combo:place:id:name',
  `boxqty` int COMMENT '箱量',
  `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
  `takeboxplaceid` bigint COMMENT '提箱场站:combo:place:id:name',
  `endplaceid` bigint COMMENT '目的地:combo:place:id:name', -- 空箱计划就是仓库  重箱计划就是港口  门店计划就是工厂
  `bgnshipdatetime` datetime COMMENT '集港时间',
  `endshipdatetime` datetime COMMENT '截港时间',
  `bgnplanarrtime` datetime COMMENT '最早到场时间',
  `endplanarrtime` datetime COMMENT '最晚到场时间',
  `remark` varchar(1000) COMMENT '备注',
  `billstatus` varchar(50) COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename', -- 0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输计划';

-- 运输计划明细表
DROP TABLE IF EXISTS `transboxdetail`;
CREATE TABLE `transboxdetail`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `transcompanyid` bigint COMMENT '运输公司:dialog:organization:id:name',
  `refbillno` varchar(50) COMMENT '参照单据号',
  `refserialno` bigint COMMENT '参照单据序号',
  `startplaceid1` bigint COMMENT '原起运地点:combo:place:id:name',
  `startplaceid2` bigint COMMENT '现起运点:combo:place:id:name',
  `endplaceid` bigint COMMENT '目的地:combo:place:id:name',
  `lineid` bigint COMMENT '线路:combo:transline:id:name',
  `boxno` varchar(50) COMMENT '箱号',
  `fengno` varchar(50) COMMENT '铅封号',
  `wendu` varchar(50) COMMENT '温度',
  `plantaketime` datetime COMMENT '计划提箱时间',-- 对于重箱计划，就是从仓库的提箱时间
  `realtaketime` datetime COMMENT '实际提箱时间',
  `planarrvetime` datetime COMMENT '计划到场时间',  
  `realarrvetime` datetime COMMENT '实际到场时间',  
  `carno` varchar(50) COMMENT '车牌号',
  `cartype` bigint COMMENT '车型:combo:cartype:id:cartypename',
  `carenergytype` bigint COMMENT '燃料:enum:1008:enumvalueid:enumvaluename', -- 燃油，燃气，电动
  `driversid` bigint COMMENT '司机编码:dialog:drivers:id:name',
  `driversname` varchar(20) COMMENT '司机姓名',
  `feein` decimal(19,4) COMMENT '应收费用',
  `feeout` decimal(19,4) COMMENT '应付费用', 
  `profit` decimal(19,4) COMMENT '利润', 
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输计划明细表';


-- 运输过程记录表
DROP TABLE IF EXISTS `transboxstatusrec`;
CREATE TABLE `transboxstatusrec`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '订单号',
  `serialno` bigint COMMENT '序号',
  `refbilltype` int COMMENT '参照单据类型:enum:1006:enumvalueid:enumvaluename', 
  `transcompanyid` bigint COMMENT '运输公司:dialog:organization:id:name',
  `tkbillno` varchar(50) COMMENT '放箱单号',
  `billstatus` varchar(50) COMMENT '状态:enum:2002:enumvalueid:enumvaluename',

  `ladingcode` varchar(50) COMMENT '提单号',
  `shipname` varchar(20) COMMENT '船名',
  `flight` varchar(50) COMMENT '航次', 
  `portid` bigint COMMENT '进港点:combo:place:id:name',
  
  `startplaceid1` bigint COMMENT '原起运地点:combo:place:id:name',
  `startplaceid2` bigint COMMENT '现起运点:combo:place:id:name',
  `realplaceid2` bigint COMMENT '实际起运点:combo:place:id:name',
  `endplaceid` bigint COMMENT '目的地:combo:place:id:name',
  `lineid` bigint COMMENT '线路:combo:transline:id:name',
  
  `boxno` varchar(50) COMMENT '箱号',
  `fengno` varchar(50) COMMENT '铅封号',
  `wendu` varchar(50) COMMENT '温度',

  `plantaketime` datetime COMMENT '计划提箱时间',-- 对于重箱计划，就是从仓库的提箱时间
  `realtaketime` datetime COMMENT '实际提箱时间',
  `planarrvetime` datetime COMMENT '计划到场时间',  
  `realarrvetime` datetime COMMENT '实际到场时间',
  `planporttime` datetime COMMENT '计划进港时间',  
  `realporttime` datetime COMMENT '实际进港时间',

  `takeboxerror` varchar(500) COMMENT '放单异常备注',

  

  `carno` varchar(50) COMMENT '车牌号',
  `cartype` bigint COMMENT '车型:combo:cartype:id:cartypename',
  `carenergytype` bigint COMMENT '燃料:enum:1008:enumvalueid:enumvaluename', -- 燃油，燃气，电动
  `driversid` bigint COMMENT '司机编码:dialog:drivers:id:name',
  `driversname` varchar(20) COMMENT '司机姓名',

  `feechange` decimal(19,4) COMMENT '应收改单费',
  `feein` decimal(19,4) COMMENT '应收费用',
  `feeout` decimal(19,4) COMMENT '应付费用', 
  `profit` decimal(19,4) COMMENT '利润', 
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输过程记录';


-- 费用项目
DROP TABLE IF EXISTS `feeinfo`;
create table `feeinfo`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '上级费用',
  `code` varchar(50) COMMENT '编码',
  `name` varchar(20) COMMENT '名称',
  `feetype` int COMMENT '类型:enum:2006:enumvalueid:enumvaluename',-- 
  `paytype` int COMMENT '收付款:enum:1011:enumvalueid:enumvaluename',-- :0：收款 1：付款,
  `lineid` bigint COMMENT '线路:combo:transline:id:name',
  `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
  `price` decimal(19,4) COMMENT '标准单价',-- 一 
  `cost` decimal(19,4) COMMENT '标准成本',--  
  `remark` varchar(50) COMMENT '备注',
  `status` bigint COMMENT '状态',
  `nodetype` int COMMENT '节点类型:enum:2004:enumvalueid:enumvaluename', 
  `uptdate` datetime COMMENT '更新时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='费用项目';


-- 结算周期
DROP TABLE IF EXISTS `paycircle`;
create table `paycircle`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(20) COMMENT '名称',
  `paytype` int COMMENT '账期类型:enum:2005:enumvalueid:enumvaluename',-- :0：收款 1：付款,
  `payday1` bigint COMMENT '支付日1:combo:transline:id:name',
  `payday2` bigint COMMENT '支付日2:combo:boxs:id:boxsize',
  `uptdate` datetime COMMENT '更新时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='结算周期';



-- 合同管理
DROP TABLE IF EXISTS `contractmain`;
CREATE TABLE `contractmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `partyaid` bigint COMMENT '甲方:dialogtree:organization:id:name',
  `partybid` bigint COMMENT '乙方:dialogtree:organization:id:name',
  `billtype` int COMMENT '收付款类型:enum:1011:enumvalueid:enumvaluename',-- :0：收款 1：付款,
  `paytype` bigint COMMENT '付款方式:enum:2005:enumvalueid:enumvaluename',
  `paycircleid` int COMMENT '结算周期:combo:paycircle:id:name', 
  `bgndate` datetime COMMENT '生效日期',--  
  `enddate` datetime COMMENT '失效日期',
  `remark` varchar(1000) COMMENT '备注',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',-- :0：新增 1：审核 2：作废',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同管理';

-- 合同明细
DROP TABLE IF EXISTS `contractdetail`;
CREATE TABLE `contractdetail`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `feeid` bigint COMMENT '费用项目:dialogtree:feeinfo:id:name',
  `price` decimal(19,4) COMMENT '单价',-- 
  `cost` decimal(19,4) COMMENT '金额',-- 
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同明细';




-- 入职申请
DROP TABLE IF EXISTS `entryapplicationmain`;
CREATE TABLE `entryapplicationmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '申请单号',
  `name` varchar(50) COMMENT '员工姓名',
  `applicationday` datetime COMMENT '申请时间', 
  `deptid` bigint COMMENT '部门:dialogtree:sys_dept:id:name',
  `roleid` bigint COMMENT'岗位:combo:sys_role:role_id:role_name',
  `entryday` datetime COMMENT '入职时间', 
  `probation` datetime COMMENT '试用/实习期间', 
  `reason` text COMMENT '自述理由',
  `handover` text COMMENT '交接内容',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
/*新增*/ 
  `englishname` varchar(50)  COMMENT '英文名',
  `userid` varchar(50) NOT NULL COMMENT '用户编码',
  `password` varchar(100) COMMENT '密码',
  `email` varchar(100) COMMENT '邮箱',
  `brithday` datetime COMMENT '出生日期', 
  `englishlevel` varchar(50)  COMMENT '外语水平',
  `graduationtime` datetime COMMENT '毕业时间',
  `residence` text COMMENT '现住址',
  `census` text COMMENT '户籍在地',
  `educationexperience` text COMMENT '教育经历',
  `workexperience` text COMMENT '工作经历',
  `family` text COMMENT '家庭状况',
  `mobile` varchar(100) COMMENT '电话',
  `startedworktime` datetime COMMENT '参加工作时间',  
  `gender` varchar(4) COMMENT '性别:enum:1015:enumvalueid:enumvaluename',--  0-男，1-女
  `nationality` varchar(50)  COMMENT '民族',
  `computerlevel` varchar(50)  COMMENT '计算机水平',
  `major` varchar(50)  COMMENT '所学专业',
  `thermobile` varchar(100) COMMENT '其他联系方式',
  `vacationyear` varchar(4) COMMENT '本年假天数:enum:1016:enumvalueid:enumvaluename',
  `vacationlastyear` varchar(4) COMMENT '上年假天数:enum:1017:enumvalueid:enumvaluename',
  `identification` varchar(50)  COMMENT '身份证',   
  `qulification` varchar(50)  COMMENT '学历',   
  `marriage` varchar(4) COMMENT '婚姻状况:enum:1018:enumvalueid:enumvaluename',--  0-未婚，1-已婚 
  `academictitle` varchar(50)  COMMENT '专业职称',
  `school` varchar(50)  COMMENT '毕业院校',
  `status` tinyint COMMENT '状态:enum:1020:enumvalueid:enumvaluename',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入职申请';

-- 转正申请
DROP TABLE IF EXISTS `formalapplicationmain`;
CREATE TABLE `formalapplicationmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '申请单号',
  `name` varchar(50) COMMENT '员工姓名',
  `applicationday` datetime COMMENT '申请时间', 
  `deptid` bigint COMMENT '部门:dialogtree:sys_dept:id:name',
  `roleid` bigint COMMENT'岗位:combo:sys_role:role_id:role_name',
  `entryday` datetime COMMENT '入职时间', 
  `probation` datetime COMMENT '试用/实习期间', 
  `reason` text COMMENT '自述理由',
  `handover` text COMMENT '交接内容',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  /*新增*/ 
  `englishname` varchar(50)  COMMENT '英文名',
  `userid` varchar(50) NOT NULL COMMENT '用户编码',
  `password` varchar(100) COMMENT '密码',
  `email` varchar(100) COMMENT '邮箱',
  `brithday` datetime COMMENT '出生日期', 
  `englishlevel` varchar(50)  COMMENT '外语水平',
  `graduationtime` datetime COMMENT '毕业时间',
  `residence` text COMMENT '现住址',
  `census` text COMMENT '户籍在地',
  `educationexperience` text COMMENT '教育经历',
  `workexperience` text COMMENT '工作经历',
  `family` text COMMENT '家庭状况',
  `mobile` varchar(100) COMMENT '电话',
  `startedworktime` datetime COMMENT '参加工作时间',  
  `gender` varchar(4) COMMENT '性别:enum:1015:enumvalueid:enumvaluename',--  0-男，1-女
  `nationality` varchar(50)  COMMENT '民族',
  `computerlevel` varchar(50)  COMMENT '计算机水平',
  `major` varchar(50)  COMMENT '所学专业',
  `thermobile` varchar(100) COMMENT '其他联系方式',
  `vacationyear` varchar(4) COMMENT '本年假天数:enum:1016:enumvalueid:enumvaluename',
  `vacationlastyear` varchar(4) COMMENT '上年假天数:enum:1017:enumvalueid:enumvaluename',
  `identification` varchar(50)  COMMENT '身份证',   
  `qulification` varchar(50)  COMMENT '学历',   
  `marriage` varchar(4) COMMENT '婚姻状况:enum:1018:enumvalueid:enumvaluename',--  0-未婚，1-已婚 
  `academictitle` varchar(50)  COMMENT '专业职称',
  `school` varchar(50)  COMMENT '毕业院校',
  `status` tinyint COMMENT '状态:enum:1020:enumvalueid:enumvaluename',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='转正申请';



-- 续签申请
DROP TABLE IF EXISTS `renewapplicationmain`;
CREATE TABLE `renewapplicationmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '申请单号',
  `name` varchar(50) COMMENT '员工姓名',
  `applicationday` datetime COMMENT '申请时间', 
  `deptid` bigint COMMENT '部门:dialogtree:sys_dept:id:name',
  `roleid` bigint COMMENT'当前岗位:combo:sys_role:role_id:role_name', 
  `renewroleid` bigint COMMENT'续签岗位:combo:sys_role:role_id:role_name', 
  `entryday` datetime COMMENT '入职时间', 
  `personalapplication` varchar(4) COMMENT '个人申请续签年限:enum:1019:enumvalueid:enumvaluename',
  `applicationapproval` varchar(4) COMMENT '公司批准续签年限:enum:1019:enumvalueid:enumvaluename',  
  `reason` text COMMENT '自述理由',
  `handover` text COMMENT '交接内容',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='续签申请';



-- 调岗申请
DROP TABLE IF EXISTS `transferapplicationmain`;
CREATE TABLE `transferapplicationmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '申请单号',
  `name` varchar(50) COMMENT '员工姓名',
  `applicationday` datetime COMMENT '申请时间', 
  `deptid` bigint COMMENT '部门:dialogtree:sys_dept:id:name', 
  `roleid` bigint COMMENT'岗位:combo:sys_role:role_id:role_name', 
  `outdeptid` bigint COMMENT '调出部门:dialogtree:sys_dept:id:name', 
  `outroleid` bigint COMMENT'调出岗位:combo:sys_role:role_id:role_name', 
  `indeptid` bigint COMMENT '调入部门:dialogtree:sys_dept:id:name', 
  `inroleid` bigint COMMENT'调入岗位:combo:sys_role:role_id:role_name', 
  `reason` text COMMENT '自述理由',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调岗申请';



-- 离职申请
DROP TABLE IF EXISTS `depatureapplicationmain`;
CREATE TABLE `depatureapplicationmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '申请单号',
  `name` varchar(50) COMMENT '员工姓名',
  `applicationday` datetime COMMENT '申请时间', 
  `deptid` bigint COMMENT '部门:dialogtree:sys_dept:id:name',
  `roleid` bigint COMMENT'岗位:combo:sys_role:role_id:role_name',
  `depatureday` datetime COMMENT '离职时间', 
  `successer` bigint COMMENT '交接人:combo:sys_user:id:fullname',
  `reason` text COMMENT '自述理由',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='离职申请';



-- -- 租赁合同
-- DROP TABLE IF EXISTS `rentcontractmain`;
-- CREATE TABLE `rentcontractmain`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `billno` varchar(50) COMMENT '单据号',
--   `orgid` bigint COMMENT '客户:dialogtree:organization:id:name',
--   `billtype` int COMMENT '收付款类型:enum:1011:enumvalueid:enumvaluename',-- :0：收款 1：付款,
--   `linkman` varchar(50) null COMMENT '客户联系人',
--   `mobile` varchar(20) null COMMENT '客户联系电话',
--   `paytype` bigint COMMENT '付款方式:combo:paytype:id:name',
--   `paycircle` int COMMENT '结算周期:enum:1010:enumvalueid:enumvaluename',
--   `boctid` bigint COMMENT '币别:combo:boctype:id:boctypename',
--   `rate` decimal(19,4) COMMENT '汇率',
--   `taxrate` decimal(19,4) COMMENT '税率',
--   `rentprice` decimal(19,4) COMMENT '月租金',
--   `rentmonth` int COMMENT '租期(月)',
--   `renttotal` decimal(19,4) COMMENT '总金额',
--   `bgndate` datetime COMMENT '生效日期',--  
--   `enddate` datetime COMMENT '失效日期',
--   `remark` varchar(1000) COMMENT '备注',
--   `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',-- :0：新增 1：审核 2：作废',
--   `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
--   `makedate` datetime COMMENT '制单日期',
--   `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
--   `accdate` datetime COMMENT '审核日期',
--   `uptdate` datetime COMMENT '更新时间', 
--   `pocessinstanceid` varchar(100) COMMENT '流程ID',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='租赁合同';


-- -- 机械维修合同
-- DROP TABLE IF EXISTS `repaircontractmain`;
-- CREATE TABLE `repaircontractmain`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `billno` varchar(50) COMMENT '单据号',
--   `orgid` bigint COMMENT '客户:dialogtree:organization:id:name',
--   `billtype` int COMMENT '收付款类型:enum:1011:enumvalueid:enumvaluename',-- :0：收款 1：付款,
--   `paytype` bigint COMMENT '付款方式:combo:paytype:id:name',
--   `boctid` bigint COMMENT '币别:combo:boctype:id:boctypename',
--   `rate` decimal(19,4) COMMENT '汇率',
--   `taxrate` decimal(19,4) COMMENT '税率',
--   `total` decimal(19,4) COMMENT '总金额',
--   `bgndate` datetime COMMENT '生效日期',--  
--   `enddate` datetime COMMENT '失效日期',
--   `remark` varchar(1000) COMMENT '备注',
--   `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',-- :0：新增 1：审核 2：作废',
--   `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
--   `makedate` datetime COMMENT '制单日期',
--   `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
--   `accdate` datetime COMMENT '审核日期',
--   `uptdate` datetime COMMENT '更新时间', 
--   `pocessinstanceid` varchar(100) COMMENT '流程ID',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机械维修合同';

-- -- 机械维修合同明细
-- DROP TABLE IF EXISTS `repaircontractdetail`;
-- CREATE TABLE `repaircontractdetail`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `billno` varchar(50) COMMENT '单据号',
--   `serialno` bigint COMMENT '序号',
--   `goodsid` bigint COMMENT '设备:combo:goods:id:name', 
--   `price` decimal(19,4) COMMENT '维修单价',-- 一    
--   `goodsqty` decimal(19,4) COMMENT '数量',-- 一 
--   `total` decimal(19,4) COMMENT '维修费用',-- 
--    `uptdate` datetime COMMENT '更新时间',  
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机械维修合同明细';



-- -- 仓储合同
-- DROP TABLE IF EXISTS `storecontractmain`;
-- CREATE TABLE `storecontractmain`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `billno` varchar(50) COMMENT '单据号',
--   `partyaid` bigint COMMENT '甲方:dialogtree:organization:id:name',
--   `partybid` bigint COMMENT '乙方:dialogtree:organization:id:name',
--   `billtype` int COMMENT '收付款类型:enum:1011:enumvalueid:enumvaluename',-- :0：收款 1：付款,
--   `paytype` bigint COMMENT '付款方式:combo:paytype:id:name',
--   `paytime` int COMMENT '结算周期:enum:1010:enumvalueid:enumvaluename',
--   `boctid` bigint COMMENT '币别:combo:boctype:id:boctypename',
--   `takeboxfee` decimal(19,4) COMMENT '放箱单价',
--   `bgndate` datetime COMMENT '生效日期',--  
--   `enddate` datetime COMMENT '失效日期',
--   `remark` varchar(1000) COMMENT '备注',
--   `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',-- :0：新增 1：审核 2：作废',
--   `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
--   `makedate` datetime COMMENT '制单日期',
--   `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
--   `accdate` datetime COMMENT '审核日期',
--   `uptdate` datetime COMMENT '更新时间', 
--   `pocessinstanceid` varchar(100) COMMENT '流程ID',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓储合同';

-- -- 仓储合同明细
-- DROP TABLE IF EXISTS `storecontractdetail`;
-- CREATE TABLE `storecontractdetail`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `billno` varchar(50) COMMENT '单据号',
--   `serialno` bigint COMMENT '序号',
--   `lineid` bigint COMMENT '线路:combo:transline:id:name',
--   `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
--   `weighttype` bigint COMMENT '空重类型:enum:1009:enumvalueid:enumvaluename',-- ：0-空箱 1-重箱',
--   `boxprice` decimal(19,4) COMMENT '应收单价',-- 一个箱子的应收费用
--   `uptdate` datetime COMMENT '更新时间',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓储合同明细';

-- -- 运输合同
-- DROP TABLE IF EXISTS `transcontractmain`;
-- CREATE TABLE `transcontractmain`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `billno` varchar(50) COMMENT '单据号',
--   `partyaid` bigint COMMENT '甲方:dialogtree:organization:id:name',
--   `partybid` bigint COMMENT '乙方:dialogtree:organization:id:name',
--   `billtype` int COMMENT '收付款类型:enum:1011:enumvalueid:enumvaluename',-- :0：收款 1：付款,
--   `paytype` varchar(10) COMMENT '付款方式:combo:paytype:id:name',
--   `boctid` bigint COMMENT '币别:combo:boctype:id:boctypename',
--   `rate` decimal(19,4) COMMENT '汇率',
--   `taxrate` decimal(19,4) COMMENT '税率',
--   `bgndate` datetime COMMENT '生效日期',--  
--   `enddate` datetime COMMENT '失效日期',
--   `remark` varchar(1000) COMMENT '备注',
--   `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',-- :0：新增 1：审核 2：作废',
--   `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
--   `makedate` datetime COMMENT '制单日期',
--   `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
--   `accdate` datetime COMMENT '审核日期',
--   `uptdate` datetime COMMENT '更新时间', 
--   `pocessinstanceid` varchar(100) COMMENT '流程ID',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输合同';

-- -- 运输合同明细
-- DROP TABLE IF EXISTS `transcontractdetail`;
-- CREATE TABLE `transcontractdetail`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `billno` varchar(50) COMMENT '单据号',
--   `serialno` bigint COMMENT '序号',
--   `lineid` bigint COMMENT '线路:combo:transline:id:name',
--   `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
--   `weighttype` varchar(50) COMMENT '空重类型:enum:1009:enumvalueid:enumvaluename',
--   `boxprice` decimal(19,4) COMMENT '应付单价',-- 一个箱子的应付费用
--   `boxpricetax` decimal(19,4) COMMENT '含税应付单价',-- 一个箱子的应付费用
--   `cartype` varchar(20) COMMENT '车型:combo:cartype:id:cartypename',
--   `uptdate` datetime COMMENT '更新时间',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输合同明细';



-- -- 采购合同
-- DROP TABLE IF EXISTS `buycontractmain`;
-- CREATE TABLE `buycontractmain`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `billno` varchar(50) COMMENT '单据号',
--   `partyaid` bigint COMMENT '甲方:dialogtree:organization:id:name',
--   `partybid` bigint COMMENT '乙方:dialogtree:organization:id:name',
--   `billtype` int COMMENT '收付款类型:enum:1011:enumvalueid:enumvaluename',-- :0：收款 1：付款,
--   `deptid` bigint COMMENT '部门:dialogtree:sys_dept:id:name',
--   `paytype` bigint COMMENT '付款方式:combo:paytype:id:name',
--   `boctid` bigint COMMENT '币别:combo:boctype:id:boctypename',
--   `rate` decimal(19,4) COMMENT '汇率',
--   `taxrate` decimal(19,4) COMMENT '税率',
--   `total` decimal(19,4) COMMENT '总金额',
--   `bgndate` datetime COMMENT '生效日期',--  
--   `enddate` datetime COMMENT '失效日期',
--   `remark` varchar(1000) COMMENT '备注',
--   `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',-- :0：新增 1：审核 2：作废',
--   `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
--   `makedate` datetime COMMENT '制单日期',
--   `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
--   `accdate` datetime COMMENT '审核日期',
--   `uptdate` datetime COMMENT '更新时间', 
--   `pocessinstanceid` varchar(100) COMMENT '流程ID',
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购合同';

-- -- 采购合同明细
-- DROP TABLE IF EXISTS `buycontractdetail`;
-- CREATE TABLE `buycontractdetail`(
--   `id` bigint NOT NULL AUTO_INCREMENT,
--   `billno` varchar(50) COMMENT '单据号',
--   `serialno` bigint COMMENT '序号',
--   `goodsid` bigint COMMENT '品名:combo:goods:id:name', 
--   `spec` varchar(50) COMMENT '规格',
--   `unit` varchar(50) COMMENT '单位',
--   `price` decimal(19,4) COMMENT '单价',-- 一    
--   `goodsqty` decimal(19,4) COMMENT '数量',-- 一 
--   `total` decimal(19,4) COMMENT '金额',-- 
--    `uptdate` datetime COMMENT '更新时间',  
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购合同明细';


CREATE TABLE `leaveworkmain` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `name` varchar(50) COMMENT '申请人',
  `starttime` datetime COMMENT '开始时间',
  `endtime` datetime COMMENT '结束时间',
  `leavetype` int COMMENT '类型:enum:1005:enumvalueid:enumvaluename', --   0：生病   1：结婚   2：其他',
  `reason` varchar(1000) COMMENT '请假原因',
  `createtime` datetime COMMENT '创建时间',
  `realendtime` datetime COMMENT '完结时间',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `uptdate` datetime COMMENT '更新时间', 
   `pocessinstanceid` varchar(64) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假单';


-- 请购单
DROP TABLE IF EXISTS `requisitionmain`;
CREATE TABLE `requisitionmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `requser` varchar(50) COMMENT '请购人:combo:sys_user:id:fullname',
  `deptid` bigint COMMENT '所属部门:combo:sys_dept:id:name',
  `reqtype` int COMMENT '请购类别:enum:1002:enumvalueid:enumvaluename', --  预算内  预算外  
  `budgetmainid` bigint null COMMENT '预算计划:dialog:budgetmain:id:billno',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `remark` text COMMENT '备注', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请购单';

-- 请购明细表
DROP TABLE IF EXISTS `requisitiondetail`;
CREATE TABLE `requisitiondetail`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `goodsid` bigint COMMENT '商品:combo:goods:id:name',
  `goodscount` int COMMENT '数量',
  `goodsspec` varchar(500) COMMENT '规格',
  `goodsunit` varchar(500) COMMENT '单位',
  `goodsuse` varchar(500) COMMENT '用途',  --  请购用途原因
  `enddate` datetime COMMENT '需用日期',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请购明细表';


-- 订购单
DROP TABLE IF EXISTS `ordermain`;
CREATE TABLE `ordermain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `supplyid` bigint COMMENT '供应商',
  `reqbillno` varchar(50) COMMENT '请购单据号',
  `requser` varchar(50) COMMENT '请购人:combo:sys_user:id:fullname',
  `deptid` bigint COMMENT '请购部门:combo:sys_dept:id:name',
  `reqdate` datetime COMMENT '请购日期',
  `ordersource` int COMMENT '订购单来源:enum:1001:enumvalueid:enumvaluename', -- 订购单来源，1.请购单转入。2.手动
  `ordertype` int COMMENT '订购类别:enum:1002:enumvalueid:enumvaluename', --  不同的订购类别对应到不同的协办部门
  `budgetmainid` bigint null COMMENT '预算计划:dialog:budgetmain:id:billno',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订购单';

-- 订购明细表
DROP TABLE IF EXISTS `orderdetail`;
CREATE TABLE `orderdetail`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `goodsid` bigint COMMENT '商品:combo:goods:id:name',
  `goodscount` int COMMENT '数量',
  `goodsspec` varchar(500) COMMENT '规格',
  `goodsuse` varchar(500) COMMENT '用途',  --  订购用途原因
  `goodsprice` decimal(19,4) COMMENT '单价',
  `goodscost` decimal(19,4) COMMENT '金额',
  `enddate` datetime COMMENT '需用日期',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订购明细表';


-- 付款单
DROP TABLE IF EXISTS `paymentmain`;
CREATE TABLE `paymentmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `reqbillno` varchar(50) COMMENT '请购单据号',
  `requser` varchar(50) COMMENT '请购人:combo:sys_user:id:fullname',
  `deptid` varchar(50) COMMENT '请购部门:combo:sys_dept:id:name',
  `reqdate` varchar(50) COMMENT '请购日期', --  关联请购表制表日期
  `orderbillno` varchar(50) COMMENT '订购单据号',
  `percent` decimal(19,4) COMMENT '付款比例',
  `paytotal` decimal(19,4) COMMENT '付款金额',
  `paysource` int COMMENT '付款来源:enum:1004:enumvalueid:enumvaluename', -- 付款单来源，1.订购单转入。2.新增。3.合同转入
  `payee` varchar(50) COMMENT '收款人',
  `payeeaccount` bigint COMMENT '收款人账号',
  `paytype` bigint COMMENT '付款方式:combo:paytype:id:name',
  `payreason` varchar(500) COMMENT '说明',
  `ordertype` int COMMENT '物品类别:enum:1002:enumvalueid:enumvaluename', --  不同的订购类别对应到不同的协办部门
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='付款单';

-- 订购付款明细表
DROP TABLE IF EXISTS `paymentdetail`;
CREATE TABLE `paymentdetail`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `goodsid` bigint COMMENT '商品:combo:goods:id:name',
  `goodscount` int COMMENT '数量',
  `goodsprice` decimal(19,4) COMMENT '单价',
  `goodscost` decimal(19,4) COMMENT '金额',
  `goodsspec` varchar(1000) COMMENT '规格',
  `goodsuse` varchar(500) COMMENT '用途',  --  订购用途原因
  `enddate` datetime COMMENT '需用日期',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='付款明细表';


-- 运输成本
DROP TABLE IF EXISTS `transcosting`;
CREATE TABLE `transcosting`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bgndate` datetime COMMENT '生效日期',--  
  `enddate` datetime COMMENT '失效日期',
  `lineid` bigint COMMENT '线路:combo:transline:id:name',
  `boxtype` bigint COMMENT '箱型:combo:boxs:id:boxsize',
  `boxprice` decimal(19,4) COMMENT '最低成本',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='运输成本';


-- 单据审批备注
DROP TABLE IF EXISTS `billcomments`;
CREATE TABLE `billcomments`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `refbilltype` int COMMENT '参照单据类型:enum:1006:enumvalueid:enumvaluename', -- :0:无参照  1-空箱计划  2:重箱计划  3:门点计划 4:司机预约',
  `serialno` int COMMENT '序号',
  `auditstatus` int COMMENT '审批:enum:1013:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单据审批备注';


-- 预算科目
DROP TABLE IF EXISTS `accountcategory`;
create table `accountcategory`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '上级科目',
  `code` varchar(50) COMMENT '科目编码',
  `name` varchar(20) COMMENT '科目名称',
  `remark` varchar(50) COMMENT '备注',
  `status` bigint COMMENT '状态',
  `order_num` int COMMENT '排序',
  `uptdate` datetime COMMENT '更新时间',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预算科目';

-- 预算计划单
DROP TABLE IF EXISTS `budgetmain`;
CREATE TABLE `budgetmain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `begindate` varchar(20) COMMENT '计划开始日期',
  `enddate` varchar(50) COMMENT '计划结束日期',
  `deptid` bigint COMMENT '部门:dialogtree:sys_dept:id:name',
  `billtype` varchar(50) COMMENT '预算类型',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `remark` varchar(1000) COMMENT '备注',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期',
  `rzuser` varchar(20) COMMENT '签批人:combo:sys_user:id:fullname',
  `rzdate` datetime COMMENT '签批日期',
  `uptdate` datetime COMMENT '更新时间',
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预算计划单';


-- 预算计划明细
DROP TABLE IF EXISTS `budgetdetail`;
CREATE TABLE `budgetdetail`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` int COMMENT '序号',
  `accountid` bigint COMMENT '预算科目:combo:accountcategory:id:name',
  `name` varchar(200) COMMENT '名称',
  `usage` varchar(50) COMMENT '用途',
  `remark` varchar(20) COMMENT '说明',
  `planmoney` decimal(19,4) COMMENT '预算金额',
  `usagemoney` varchar(20) COMMENT '已用预算',
  `leftmoney` datetime COMMENT '剩余预算',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预算明细表';

-- ------------------------------------------
 

-- 报销单
DROP TABLE IF EXISTS `expensemain`;
CREATE TABLE `expensemain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '报销单号',
  `deptid` bigint COMMENT '部门:dialogtree:sys_dept:id:name',
  `applydate` datetime COMMENT '申请日期',
  `costcategoryid` bigint COMMENT '费用项目:enum:2007:enumvalueid:enumvaluename',
  `expensemoney` double COMMENT '报销金额',
  `title` varchar(500) COMMENT '报销标题',
  `remark` varchar(1000) COMMENT '详情',
  `receiver` bigint COMMENT '收款人:combo:sys_user:id:fullname',
  `paytype` varchar(50) COMMENT '支付方式:enum:1014:enumvalueid:enumvaluename',
  `bankaccount` varchar(30) COMMENT '银行账户',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `makeuser` bigint COMMENT '申请人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期', 
  `uptdate` datetime COMMENT '更新时间',
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报销单';

 
 -- 公司费用
DROP TABLE IF EXISTS `expensecompanymain`;
CREATE TABLE `expensecompanymain`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '报销单号',
  `deptid` bigint COMMENT '部门:dialogtree:sys_dept:id:name',
  `applydate` datetime COMMENT '申请日期',
  `costcategoryid` bigint COMMENT '费用项目:enum:2008:enumvalueid:enumvaluename',
  `expensemoney` double COMMENT '报销金额',
  `title` varchar(500) COMMENT '报销标题',
  `remark` varchar(1000) COMMENT '详情',
  `receiver` bigint COMMENT '收款人:combo:sys_user:id:fullname',
  `paytype` varchar(50) COMMENT '支付方式:enum:1014:enumvalueid:enumvaluename',
  `bankaccount` varchar(30) COMMENT '银行账户',
  `billstatus` int COMMENT '单据状态:enum:1003:enumvalueid:enumvaluename',
  `makeuser` bigint COMMENT '申请人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `accuser` bigint COMMENT '审核人:combo:sys_user:id:fullname',
  `accdate` datetime COMMENT '审核日期', 
  `uptdate` datetime COMMENT '更新时间',
  `pocessinstanceid` varchar(100) COMMENT '流程ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='公司费用';



-- 附件表
DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `name` varchar(200) COMMENT '文件名',
  `filename` varchar(200) COMMENT '文件名',
  `fileurl` varchar(1000) COMMENT '地址',
  `makeuser` bigint COMMENT '制单人:combo:sys_user:id:fullname',
  `makedate` datetime COMMENT '制单日期',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表';

 


--   quartz相关表结构
CREATE TABLE QRTZ_JOB_DETAILS(
SCHED_NAME VARCHAR(120) NOT NULL,
JOB_NAME VARCHAR(200) NOT NULL,
JOB_GROUP VARCHAR(200) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
JOB_CLASS_NAME VARCHAR(250) NOT NULL,
IS_DURABLE VARCHAR(1) NOT NULL,
IS_NONCONCURRENT VARCHAR(1) NOT NULL,
IS_UPDATE_DATA VARCHAR(1) NOT NULL,
REQUESTS_RECOVERY VARCHAR(1) NOT NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,JOB_NAME,JOB_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
JOB_NAME VARCHAR(200) NOT NULL,
JOB_GROUP VARCHAR(200) NOT NULL,
DESCRIPTION VARCHAR(250) NULL,
NEXT_FIRE_TIME BIGINT(13) NULL,
PREV_FIRE_TIME BIGINT(13) NULL,
PRIORITY INTEGER NULL,
TRIGGER_STATE VARCHAR(16) NOT NULL,
TRIGGER_TYPE VARCHAR(8) NOT NULL,
START_TIME BIGINT(13) NOT NULL,
END_TIME BIGINT(13) NULL,
CALENDAR_NAME VARCHAR(200) NULL,
MISFIRE_INSTR SMALLINT(2) NULL,
JOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,JOB_NAME,JOB_GROUP)
REFERENCES QRTZ_JOB_DETAILS(SCHED_NAME,JOB_NAME,JOB_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_SIMPLE_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
REPEAT_COUNT BIGINT(7) NOT NULL,
REPEAT_INTERVAL BIGINT(12) NOT NULL,
TIMES_TRIGGERED BIGINT(10) NOT NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_CRON_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
CRON_EXPRESSION VARCHAR(120) NOT NULL,
TIME_ZONE_ID VARCHAR(80),
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_SIMPROP_TRIGGERS
  (          
    SCHED_NAME VARCHAR(120) NOT NULL,
    TRIGGER_NAME VARCHAR(200) NOT NULL,
    TRIGGER_GROUP VARCHAR(200) NOT NULL,
    STR_PROP_1 VARCHAR(512) NULL,
    STR_PROP_2 VARCHAR(512) NULL,
    STR_PROP_3 VARCHAR(512) NULL,
    INT_PROP_1 INT NULL,
    INT_PROP_2 INT NULL,
    LONG_PROP_1 BIGINT NULL,
    LONG_PROP_2 BIGINT NULL,
    DEC_PROP_1 NUMERIC(13,4) NULL,
    DEC_PROP_2 NUMERIC(13,4) NULL,
    BOOL_PROP_1 VARCHAR(1) NULL,
    BOOL_PROP_2 VARCHAR(1) NULL,
    PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
    FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP) 
    REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_BLOB_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
BLOB_DATA BLOB NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP),
INDEX (SCHED_NAME,TRIGGER_NAME, TRIGGER_GROUP),
FOREIGN KEY (SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP)
REFERENCES QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_CALENDARS (
SCHED_NAME VARCHAR(120) NOT NULL,
CALENDAR_NAME VARCHAR(200) NOT NULL,
CALENDAR BLOB NOT NULL,
PRIMARY KEY (SCHED_NAME,CALENDAR_NAME))
ENGINE=InnoDB;

CREATE TABLE QRTZ_PAUSED_TRIGGER_GRPS (
SCHED_NAME VARCHAR(120) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
PRIMARY KEY (SCHED_NAME,TRIGGER_GROUP))
ENGINE=InnoDB;

CREATE TABLE QRTZ_FIRED_TRIGGERS (
SCHED_NAME VARCHAR(120) NOT NULL,
ENTRY_ID VARCHAR(95) NOT NULL,
TRIGGER_NAME VARCHAR(200) NOT NULL,
TRIGGER_GROUP VARCHAR(200) NOT NULL,
INSTANCE_NAME VARCHAR(200) NOT NULL,
FIRED_TIME BIGINT(13) NOT NULL,
SCHED_TIME BIGINT(13) NOT NULL,
PRIORITY INTEGER NOT NULL,
STATE VARCHAR(16) NOT NULL,
JOB_NAME VARCHAR(200) NULL,
JOB_GROUP VARCHAR(200) NULL,
IS_NONCONCURRENT VARCHAR(1) NULL,
REQUESTS_RECOVERY VARCHAR(1) NULL,
PRIMARY KEY (SCHED_NAME,ENTRY_ID))
ENGINE=InnoDB;

CREATE TABLE QRTZ_SCHEDULER_STATE (
SCHED_NAME VARCHAR(120) NOT NULL,
INSTANCE_NAME VARCHAR(200) NOT NULL,
LAST_CHECKIN_TIME BIGINT(13) NOT NULL,
CHECKIN_INTERVAL BIGINT(13) NOT NULL,
PRIMARY KEY (SCHED_NAME,INSTANCE_NAME))
ENGINE=InnoDB;

CREATE TABLE QRTZ_LOCKS (
SCHED_NAME VARCHAR(120) NOT NULL,
LOCK_NAME VARCHAR(40) NOT NULL,
PRIMARY KEY (SCHED_NAME,LOCK_NAME))
ENGINE=InnoDB;

CREATE INDEX IDX_QRTZ_J_REQ_RECOVERY ON QRTZ_JOB_DETAILS(SCHED_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_J_GRP ON QRTZ_JOB_DETAILS(SCHED_NAME,JOB_GROUP);

CREATE INDEX IDX_QRTZ_T_J ON QRTZ_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_JG ON QRTZ_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_T_C ON QRTZ_TRIGGERS(SCHED_NAME,CALENDAR_NAME);
CREATE INDEX IDX_QRTZ_T_G ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_T_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_N_G_STATE ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_GROUP,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NEXT_FIRE_TIME ON QRTZ_TRIGGERS(SCHED_NAME,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST ON QRTZ_TRIGGERS(SCHED_NAME,TRIGGER_STATE,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_STATE);
CREATE INDEX IDX_QRTZ_T_NFT_ST_MISFIRE_GRP ON QRTZ_TRIGGERS(SCHED_NAME,MISFIRE_INSTR,NEXT_FIRE_TIME,TRIGGER_GROUP,TRIGGER_STATE);

CREATE INDEX IDX_QRTZ_FT_TRIG_INST_NAME ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME);
CREATE INDEX IDX_QRTZ_FT_INST_JOB_REQ_RCVRY ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,INSTANCE_NAME,REQUESTS_RECOVERY);
CREATE INDEX IDX_QRTZ_FT_J_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_JG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,JOB_GROUP);
CREATE INDEX IDX_QRTZ_FT_T_G ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_NAME,TRIGGER_GROUP);
CREATE INDEX IDX_QRTZ_FT_TG ON QRTZ_FIRED_TRIGGERS(SCHED_NAME,TRIGGER_GROUP);



create view V_IDENTITYLINK as 
                    SELECT TASK_ID_,  USER_ID_ 
                    FROM ACT_RU_IDENTITYLINK I, ACT_RU_TASK T
                      WHERE TASK_ID_ IS NOT NULL
                        AND USER_ID_ IS NOT NULL
                        AND I.TASK_ID_ = T.ID_
                        AND T.ASSIGNEE_ IS NULL
                        AND TYPE_ = 'candidate'
                     UNION
                     SELECT TASK_ID_, R.USER_ID
                       FROM ACT_RU_IDENTITYLINK I,SYS_USER_ROLE R,ACT_RU_TASK T
                      WHERE I.TASK_ID_ IS NOT NULL
                        AND I.GROUP_ID_ IS NOT NULL
                        AND I.TASK_ID_ = T.ID_
                        AND T.ASSIGNEE_ IS NULL
                        AND TYPE_ = 'candidate'
                        AND I.GROUP_ID_ = R.ROLE_ID;
                        
create view V_DIST_IDENTITYLINK as
select distinct * from    V_IDENTITYLINK ;                    
                        
CREATE VIEW V_TASKLIST AS
SELECT A.ID_ AS TASK_ID,
       A.PROC_INST_ID_ PROC_INST_ID,
       A.TASK_DEF_KEY_ AS ACT_ID,
       A.NAME_ AS ACT_NAME,
       A.ASSIGNEE_ AS ASSIGNEE,
       A.DELEGATION_ AS DELEGATION_ID,
       A.DESCRIPTION_ AS DESCRIPTION,
       A.CREATE_TIME_,  
       A.DUE_DATE_, 
       I.USER_ID_ CANDIDATE,
       P.BUSINESS_KEY_
  FROM ACT_RU_TASK A
  LEFT JOIN ACT_RU_EXECUTION P
  ON A.PROC_INST_ID_=P.PROC_INST_ID_
  LEFT JOIN  V_DIST_IDENTITYLINK I 
    ON A.ID_ = I.TASK_ID_
 
 
