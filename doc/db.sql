CREATE TABLE `goods` (
  `goods_id` bigint NOT NULL AUTO_INCREMENT,
  `class_id` bigint COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) COMMENT '菜单名称',
  `price` decimal COMMENT '菜单URL',
  `gcount` int COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) COMMENT '菜单图标',
  `order_num` int COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

CREATE TABLE `leavework` (
  `leave_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `name` varchar(50) COMMENT '申请人',
  `start_time` datetime COMMENT '开始时间',
  `end_time` datetime COMMENT '结束时间',
  `leavetype` int COMMENT '类型   0：生病   1：结婚   2：其他',
  `reason` varchar(1000) COMMENT '请假原因',
  `create_time` datetime COMMENT '创建时间',
  `realend_time` datetime COMMENT '完结时间',
   `pocess_instanceid` varchar(64) COMMENT '流程ID',
  PRIMARY KEY (`leave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假表';



--  菜单
CREATE TABLE `sys_menu` (
  `menu_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) COMMENT '菜单名称',
  `url` varchar(200) COMMENT '菜单URL',
  `perms` varchar(500) COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) COMMENT '菜单图标',
  `order_num` int COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单管理';


--  部门
CREATE TABLE `sys_dept` (
  `dept_id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint COMMENT '上级部门ID，一级部门为0',
  `name` varchar(50) COMMENT '部门名称',
  `type` int COMMENT '类型   0：目录   1：菜单   ', 
  `order_num` int COMMENT '排序',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门管理';


--  系统用户
CREATE TABLE `sys_user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) COMMENT '密码',
  `email` varchar(100) COMMENT '邮箱',
  `mobile` varchar(100) COMMENT '手机号',
  `status` tinyint COMMENT '状态  0：禁用   1：正常',
  `org_id` bigint NULL COMMENT '所属组织',
  `dept_id` bigint NULL COMMENT '所属部门',
  `create_time` datetime COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户';

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
  `menu_id` bigint COMMENT '菜单ID',
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



--  初始数据  
-- 初始数据 
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `email`, `mobile`, `status`, `create_time`) VALUES ('1', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'root@renren.io', '13612345678', '1', '2016-11-11 11:11:11');

delete from sys_menu; 
-- 系统管理
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('1', '0', '系统管理', NULL, NULL, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('2', '1', '人员管理', 'sys/user.html', NULL, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('3', '1', '角色管理', 'sys/role.html', NULL, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('4', '1', '菜单管理', 'sys/menu.html', NULL, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('5', '1', '部门管理', 'sys/dept/index', NULL, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('6', '1', 'SQL监控', 'druid/sql.html', NULL, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('7', '1', '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('8', '1', '系统日志', 'sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('9', '1', '文件上传', 'sys/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('10', '1', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '7');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('11', '2', '查看', NULL, 'sys:user:list,sys:user:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('12', '2', '新增', NULL, 'sys:user:save,sys:role:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('13', '2', '修改', NULL, 'sys:user:update,sys:role:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('14', '2', '删除', NULL, 'sys:user:delete', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('15', '3', '查看', NULL, 'sys:role:list,sys:role:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('16', '3', '新增', NULL, 'sys:role:save,sys:menu:perms', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('17', '3', '修改', NULL, 'sys:role:update,sys:menu:perms', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('18', '3', '删除', NULL, 'sys:role:delete', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('19', '4', '查看', NULL, 'sys:menu:list,sys:menu:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('20', '4', '新增', NULL, 'sys:menu:save,sys:menu:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('21', '4', '修改', NULL, 'sys:menu:update,sys:menu:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('22', '4', '删除', NULL, 'sys:menu:delete', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('23', '5', '查看', NULL, 'sys:dept:list,sys:dept:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('24', '5', '新增', NULL, 'sys:dept:save,sys:dept:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('25', '5', '修改', NULL, 'sys:dept:update,sys:dept:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('26', '5', '删除', NULL, 'sys:dept:delete', '2', NULL, '0');

-- 基础资料
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('27', '0', '基础资料', NULL, NULL, '0', 'fa fa-folder', '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('28', '27', '组织管理', 'organization/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('29', '27', '区域管理', 'region/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('30', '27', '车队管理', 'transteam/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('31', '27', '船舶管理', 'ship/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('32', '27', '船舶计划', 'shipplan/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('33', '27', '线路管理', 'transline/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('34', '27', '司机管理', 'drivers/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('35', '27', '箱型管理', 'boxs/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('36', '29', '查看', NULL, 'region:list,region:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('37', '29', '新增', NULL, 'region:save,region:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('38', '29', '修改', NULL, 'region:update,region:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('39', '29', '删除', NULL, 'region:delete', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('40', '28', '查看', NULL, 'organization:list,organization:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('41', '28', '新增', NULL, 'organization:save,organization:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('42', '28', '修改', NULL, 'organization:update,organization:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('43', '28', '删除', NULL, 'organization:delete', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('44', '30', '查看', NULL, 'transteam:list,transteam:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('45', '30', '新增', NULL, 'transteam:save,transteam:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('46', '30', '修改', NULL, 'transteam:update,transteam:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('47', '30', '删除', NULL, 'transteam:delete', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('48', '31', '查看', NULL, 'ship:list,ship:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('49', '31', '新增', NULL, 'ship:save,ship:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('50', '31', '修改', NULL, 'ship:update,ship:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('51', '31', '删除', NULL, 'ship:delete', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('52', '32', '查看', NULL, 'shipplan:list,shipplan:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('53', '32', '新增', NULL, 'shipplan:save,shipplan:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('54', '32', '修改', NULL, 'shipplan:update,shipplan:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('55', '32', '删除', NULL, 'shipplan:delete', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('56', '33', '查看', NULL, 'transline:list,transline:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('57', '33', '新增', NULL, 'transline:save,transline:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('58', '33', '修改', NULL, 'transline:update,transline:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('59', '33', '删除', NULL, 'transline:delete', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('60', '34', '查看', NULL, 'drivers:list,drivers:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('61', '34', '新增', NULL, 'drivers:save,drivers:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('62', '34', '修改', NULL, 'drivers:update,drivers:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('63', '34', '删除', NULL, 'drivers:delete', '2', NULL, '0');
 

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('64', '35', '查看', NULL, 'boxs:list,boxs:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('65', '35', '新增', NULL, 'boxs:save,boxs:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('66', '35', '修改', NULL, 'boxs:update,boxs:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('67', '35', '删除', NULL, 'boxs:delete', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('68', '0', '业务管理', NULL, NULL, '0', 'fa fa-folder', '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('69', '68', '空箱计划', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('70', '68', '重箱计划', 'heavyplan/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('71', '68', '预配计划', 'preemptyplan/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('72', '68', '疏港计划', 'portplan/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('73', '68', '运输管理', 'transplan/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('74', '68', '预约提箱', 'transbill/index', NULL, '1', 'fa fa-circle-o', '1');
 
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('75', '69', '查看', NULL, 'plankongxiangmain:list,plankongxiangmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('76', '69', '新增', NULL, 'plankongxiangmain:save,plankongxiangmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('77', '69', '修改', NULL, 'plankongxiangmain:update,plankongxiangmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('78', '69', '删除', NULL, 'plankongxiangmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('79', '69', '审核', NULL, 'plankongxiangmain:shenhe,plankongxiangmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('80', '69', '放箱', NULL, 'plankongxiangmain:fangxiang,plankongxiangmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('81', '69', '入账', NULL, 'plankongxiangmain:ruzhang,plankongxiangmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('82', '69', '明细', NULL, 'plankongxiangmain:list,plankongxiangmain:info', '2', NULL, '0');


-- 业务管理
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('83', '0', '财务管理', NULL, NULL, '0', 'fa fa-folder', '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('84', '83', '预算科目', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('85', '83', '预算计划', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('86', '83', '费用申请', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('87', '83', '报销管理', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('84', '83', '请购单', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('85', '83', '订购单', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('86', '83', '费用申请', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('87', '83', '报销管理', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('88', '0', '日常工作', NULL, NULL, '0', 'fa fa-folder', '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('89', '88', '待办事项', 'todulist/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('90', '88', '考勤管理', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');


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

--  组织管理
CREATE TABLE `organization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(50) COMMENT '名称',
  `parent_id` bigint COMMENT '上级组织', 
  `phone` varchar(20) COMMENT '联系电话',
  `address` varchar(200) COMMENT '地址',
  `longitude` varchar(50) COMMENT '经度',
  `latitude` varchar(50) COMMENT '纬度',
  `type` int COMMENT '类型 0：目录  1：港口  2：仓库   3：堆场 4：船公司  5：放箱公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织管理';

-- 区域管理
CREATE TABLE `region` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(50) COMMENT '名称',
  `regionalcode` varchar(50) COMMENT '上级区域编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域管理表';

-- 车队管理
CREATE TABLE `transteam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(50) COMMENT '名称',
  `address` varchar(200) COMMENT '地址',
  `contact` varchar(20) COMMENT '联系人',
  `contact_number` varchar(20) COMMENT '联系电话',
  `vehicle_type` varchar(20) COMMENT '车辆类型（挂靠、自营、外协）',
  `billing_information` varchar(1000) COMMENT '开票信息',
  `account_information` varchar(1000) COMMENT '账户信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车队管理';

 

--  船舶管理
CREATE TABLE `ship` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(20) COMMENT '中文名称',
  `enname` varchar(20) COMMENT '英文名称',
  `region` bigint COMMENT '所属区域',
  `uncode` varchar(50) COMMENT 'UN代码',
  `type` varchar(50) COMMENT '类型',
  `company` bigint COMMENT '所属船公司',
  `coscode` varchar(50) COMMENT 'COS代码',
  `cosshipenname` varchar(20) COMMENT 'COS船英文名',
  `country` varchar(20) COMMENT '所属国家',
  `contact` varchar(20) COMMENT '联系人 ',
  `address` varchar(200) COMMENT '地址',
  `phone` varchar(20) COMMENT '电话',
  `route` varchar(100) COMMENT '航线',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='船公司';

--  船舶计划
CREATE TABLE `shipplan` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `enshipname` varchar(20) COMMENT '英文船名',
  `chshipname` varchar(20) COMMENT '中文船名',
  `expvoyage` varchar(50) COMMENT '出口航次',
  `Impvoyage` varchar(50) COMMENT '进口航次',
  `arrivalstate` varchar(50) COMMENT '到港状态',
  `arrivaldate` datetime COMMENT '预计到港日期',
  `shipid` varchar(20) COMMENT '船舶呼号',
  `imono` varchar(50) COMMENT 'IMO编号',
  `dockcode` varchar(50) COMMENT '码头代码',
  `dockname` varchar(50) COMMENT '码头名称',
  `dockunit` varchar(50) COMMENT '靠泊单位', 
  `route` varchar(50) COMMENT '航线',
  `arrivaltime` datetime COMMENT '预计到港时间',
  `leavetime` datetime COMMENT '预计离港时间',
  `shipment` varchar(20) COMMENT '船期',
  `remark` varchar(50) COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='船舶计划表';

-- 线路管理
CREATE TABLE `transline` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `startlocation` varchar(200) COMMENT '起始区域地点',
  `endlocation` varchar(200) COMMENT '结束区域地点',
  `distance` double COMMENT '距离',
  `freight` double COMMENT '运费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='线路基础信息表';

-- 司机管理
CREATE TABLE `drivers` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `name` varchar(20) COMMENT '姓名',
  `phone` varchar(20) COMMENT '电话',
  `fleet` varchar(50) COMMENT '所属车队',
  `documentno` varchar(50) COMMENT '证件号',
  `driveage` int COMMENT '驾龄',
  `type` varchar(20) COMMENT '类型（有、无车）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='司机基础信息表';

-- 箱型管理
CREATE TABLE `boxs` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(50) COMMENT '编码',
  `box_size` varchar(50) COMMENT '箱型尺寸',
  `weight` varchar(10) COMMENT '重量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='箱型基础信息表';

-- 待办事项
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


-- 空箱计划用箱单主表
CREATE TABLE `plan_kongxiang_main`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `org_id` int COMMENT '组织id',
  `orgcode` varchar(50) COMMENT '组织编码',
  `lazingno` varchar(50) COMMENT '提单号',
  `shipname` varchar(20) COMMENT '船名',
  `voyage` varchar(50) COMMENT '航次', 
  `portid` bigint COMMENT '港口',
  `boxqty` bigint COMMENT '箱量',
  `boxtype` varchar(50) COMMENT '箱型',
  `startplace_id` bigint COMMENT '提箱场站',
  `endplace_id` bigint COMMENT '放箱地点',  
  `closedate` datetime COMMENT '截港时间',
  `client` varchar(200) COMMENT '客户',
  `clerk` varchar(20) COMMENT '业务员',
  `bgnplanarrtime` datetime COMMENT '最早到场时间',
  `endplanarrtime` datetime COMMENT '最晚到场时间',
  `trancompanyid` bigint COMMENT '运输公司',
  `remark` varchar(500) COMMENT '备注',
  `billstate` varchar(50) COMMENT '单据状态:0：新增 1：审核 2：已放箱 3：已提箱 4:已到场 5：已完成',
  `billuser` varchar(20) COMMENT '制单人',
  `billdate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间', 
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='空箱计划用箱单主表';

-- 空箱计划用箱单明细表
CREATE TABLE `plan_kongxiang_detailed`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `risiboxplace` varchar(200) COMMENT '提箱点',
  `boxno` varchar(50) COMMENT '箱号',
  `plantaketime` datetime COMMENT '计划提箱时间',
  `realarrtime` datetime COMMENT '实际到场时间',  
  `carno` varchar(20) COMMENT '车牌号',
  `cartype` varchar(20) COMMENT '车型',
  `driversid` varchar(20) COMMENT '司机编码',
  `driversname` varchar(20) COMMENT '司机姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='空箱计划用箱单明细表';

-- 重箱计划主表
CREATE TABLE `plan_chongxiang_main`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `ladingno` varchar(50) COMMENT '提单号',
  `boxqty` bigint COMMENT '箱量',
  `boxtype` varchar(50) COMMENT '箱型',
  `termini_id` bigint COMMENT '目的地',
  `departure_id` bigint COMMENT '起运地',
  `planarrporttime` datetime COMMENT '预计到港时间',
  `port` varchar(50) COMMENT '港口',
  `shipname` varchar(20) COMMENT '船名',
  `voyage` varchar(50) COMMENT '航次',
  `client` varchar(50) COMMENT '客户',
  `billuser` varchar(20) COMMENT '制单人',
  `billdate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='重箱计划主表';

-- 重箱计划明细表
CREATE TABLE `plan_chongxiang_detailed`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `plateno` varchar(20) COMMENT '车牌号',
  `drivers` varchar(20) COMMENT '司机',
  `realarrporttime` datetime COMMENT '实际到港时间',
  `boxno` varchar(50) COMMENT '箱号',
  `goods` varchar(50) COMMENT '货品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='重箱计划明细表';

-- 预约用箱单主表
CREATE TABLE `plan_yuyue_main`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `useboxtime` datetime COMMENT '用箱时间',
  `shipcompany` varchar(50) COMMENT '船公司',
  `boxqty` bigint COMMENT '箱量',
  `boxtype` varchar(50) COMMENT '箱型',
  `risiboxplace` varchar(200) COMMENT '提箱点',
  `planarrtime` datetime COMMENT '计划到场时间',
  `clientinfo` varchar(200) COMMENT '客户信息',
  `losedate` datetime COMMENT '失效日期',
  `billstate` int COMMENT '单据状态    0：新增   1：审核   2：预约中  3：完成   4：失效',
  `billuser` varchar(20) COMMENT '制单人',
  `billdate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约用箱单主表';

-- 预约用箱单明细表
CREATE TABLE `plan_yuyue_detailed`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `risiboxplace` varchar(200) COMMENT '提箱点',
  `returnboxplace` varchar(200) COMMENT '还箱点',
  `dockplace` varchar(200) COMMENT '装卸地',
  `plateno` varchar(20) COMMENT '车牌号',    
  `drivers` varchar(20) COMMENT '司机',
  `realarrtime` datetime COMMENT '实际到场时间',
  `shipname` varchar(20) COMMENT '船名',
  `voyage` varchar(50) COMMENT '航次',
  `ladingno` varchar(50) COMMENT '提单号',
  `boxno` varchar(50) COMMENT '箱号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预约用箱单明细表';

-- 疏港计划主表
CREATE TABLE `plan_shugang_main`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `port` varchar(50) COMMENT '港口',
  `shipcompany` varchar(50) COMMENT '船公司',
  `boxqty` bigint COMMENT '箱量',
  `boxtype` varchar(50) COMMENT '箱型',
  `placecode` varchar(50) COMMENT '场站编码',
  `planarrporttime` datetime COMMENT '预计到港时间',
  `planarrtime` datetime COMMENT '预计到场时间',
  `billuser` varchar(20) COMMENT '制单人',
  `billdate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人',
  `accdate` datetime COMMENT '审核日期',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疏港计划主表';
 

-- 疏港计划明细表
CREATE TABLE `plan_shugang_detailed`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` bigint COMMENT '序号',
  `boxno` bigint COMMENT '箱号',
  `trancompanycode` varchar(50) COMMENT '运输公司编码',
  `plateno` varchar(20) COMMENT '车牌号',
  `drivers` varchar(20) COMMENT '司机',
  `realarrporttime` datetime COMMENT '实际到港时间',
  `realarrtime` datetime COMMENT '实际到场时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='疏港计划明细表';

-- 预算科目
create table `accountcategory`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NOT NULL COMMENT '上级科目',
  `code` varchar(50) COMMENT '科目编号',
  `name` varchar(20) COMMENT '科目名称',
  `remark` varchar(50) COMMENT '备注',
  `status` bigint COMMENT '状态',
  `order_num` int COMMENT '排序',
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预算科目';

-- 预算计划主表
CREATE TABLE `budgetform`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `begindate` varchar(20) COMMENT '计划开始日期',
  `enddate` varchar(50) COMMENT '计划结束日期',
  `dept_id` bigint COMMENT '部门',
  `billtype` varchar(50) COMMENT '预算类型',
  `mkuser` varchar(20) COMMENT '制单人',
  `mkdate` datetime COMMENT '制单日期',
  `accuser` varchar(20) COMMENT '审核人',
  `accdate` datetime COMMENT '审核日期',
  `rzuser` varchar(20) COMMENT '签批人',
  `rzdate` datetime COMMENT '签批日期',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预算计划主表';


-- 预算计划主表
CREATE TABLE `budgetdetail`(
  `id` bigint NOT NULL AUTO_INCREMENT,
  `billno` varchar(50) COMMENT '单据号',
  `serialno` int COMMENT '序号',
  `accountid` bigint COMMENT '预算科目',
  `name` varchar(200) COMMENT '名称',
  `usage` varchar(50) COMMENT '用途',
  `remark` varchar(20) COMMENT '说明',
  `planmoney` double COMMENT '预算金额',
  `usagemoney` varchar(20) COMMENT '已用预算',
  `leftmoney` datetime COMMENT '剩余预算',
  `uptdate` datetime COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='预算明细表';



 

