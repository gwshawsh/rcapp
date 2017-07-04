

delete from sys_menu; 
-- 系统管理
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('system', '0', '系统管理', NULL, NULL, '0', 'fa fa-cog', '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('user', 'system', '人员管理', 'sys_user/index', NULL, '1', 'fa fa-user', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('role', 'system', '角色管理', 'sys/role.html', NULL, '1', 'fa fa-user-secret', '2');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('menu', 'system', '菜单管理', 'sys/menu.html', NULL, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('dept', 'system', '部门管理', 'sys_dept/index', NULL, '1', 'fa fa-th-list', '3');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('druid', 'system', 'SQL监控', 'druid/sql.html', NULL, '1', 'fa fa-bug', '4');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('config', 'system', '参数管理', 'sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', '1', 'fa fa-sun-o', '6');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('log', 'system', '系统日志', 'sys/log.html', 'sys:log:list', '1', 'fa fa-file-text-o', '7');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('oss', 'system', '文件上传', 'sys/oss.html', 'sys:oss:all', '1', 'fa fa-file-image-o', '6');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('generator', 'system', '代码生成器', 'sys/generator.html', 'sys:generator:list,sys:generator:code', '1', 'fa fa-rocket', '7');
 
 INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('user_view', 'user', '查看', NULL, 'sys:user:list,sys:user:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('user_add', 'user', '新增', NULL, 'sys:user:save,sys:role:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('user_edit', 'user', '修改', NULL, 'sys:user:update,sys:role:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('user_delete', 'user', '删除', NULL, 'sys:user:delete', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('role_view', 'role', '查看', NULL, 'sys:role:list,sys:role:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('role_add', 'role', '新增', NULL, 'sys:role:save,sys:menu:perms', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('role_edit', 'role', '修改', NULL, 'sys:role:update,sys:menu:perms', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('role_delete', 'role', '删除', NULL, 'sys:role:delete', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('menu_view', 'menu', '查看', NULL, 'sys:menu:list,sys:menu:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('menu_add', 'menu', '新增', NULL, 'sys:menu:save,sys:menu:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('menu_edit', 'menu', '修改', NULL, 'sys:menu:update,sys:menu:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('menu_delete', 'menu', '删除', NULL, 'sys:menu:delete', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('dept_view', 'dept', '查看', NULL, 'sys:dept:list,sys:dept:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('dept_add', 'dept', '新增', NULL, 'sys:dept:save,sys:dept:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('dept_edit', 'dept', '修改', NULL, 'sys:dept:update,sys:dept:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('dept_delete', 'dept', '删除', NULL, 'sys:dept:delete', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('enumtable', 'system', '枚举表', 'enumtable/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('enumtable_view', 'enumtable', '查看', NULL, 'enumtable:list,enumtable:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('enumtable_add', 'enumtable', '新增', NULL, 'enumtable:save,enumtable:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('enumtable_edit', 'enumtable', '修改', NULL, 'enumtable:update,enumtable:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('enumtable_delete', 'enumtable', '删除', NULL, 'enumtable:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('enumtable_audit', 'enumtable', '审核', NULL, 'enumtable:audit,enumtable:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('enumtable_unaudit', 'enumtable', '反审核', NULL, 'enumtable:unaudit,enumtable:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('enumtable_detail', 'enumtable', '明细', NULL, 'enumtable:list,enumtable:info', '2', NULL, '0');


-- 基础资料
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('base', '0', '基础资料', NULL, NULL, '0', 'fa fa-folder', '0');
 

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('organization', 'base', '组织管理', 'organization/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_view', 'organization', '查看', NULL, 'organization:list,organization:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_add', 'organization', '新增', NULL, 'organization:save,organization:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_edit', 'organization', '修改', NULL, 'organization:update,organization:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_copy', 'organization', '复制', NULL, 'organization:copybill,organization:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_cancel', 'organization', '作废', NULL, 'organization:update,organization:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_delete', 'organization', '删除', NULL, 'organization:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_claim', 'organization', '签收', NULL, 'organization:claim,organization:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_audit', 'organization', '审核', NULL, 'organization:audit,organization:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_unaudit', 'organization', '反审核', NULL, 'organization:unaudit,organization:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('organization_detail', 'organization', '明细', NULL, 'organization:list,organization:info', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('bank', 'base', '银行管理', 'bank/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bank_view', 'bank', '查看', NULL, 'bank:list,bank:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bank_add', 'bank', '新增', NULL, 'bank:save,bank:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bank_edit', 'bank', '修改', NULL, 'bank:update,bank:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bank_delete', 'bank', '删除', NULL, 'bank:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bank_audit', 'bank', '审核', NULL, 'bank:audit,bank:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bank_unaudit', 'bank', '反审核', NULL, 'bank:unaudit,bank:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bank_detail', 'bank', '明细', NULL, 'bank:list,bank:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('bankaccount', 'base', '银行账户表', 'bankaccount/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bankaccount_view', 'bankaccount', '查看', NULL, 'bankaccount:list,bankaccount:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bankaccount_add', 'bankaccount', '新增', NULL, 'bankaccount:save,bankaccount:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bankaccount_edit', 'bankaccount', '修改', NULL, 'bankaccount:update,bankaccount:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bankaccount_delete', 'bankaccount', '删除', NULL, 'bankaccount:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bankaccount_audit', 'bankaccount', '审核', NULL, 'bankaccount:audit,bankaccount:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bankaccount_unaudit', 'bankaccount', '反审核', NULL, 'bankaccount:unaudit,bankaccount:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('bankaccount_detail', 'bankaccount', '明细', NULL, 'bankaccount:list,bankaccount:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('boctype', 'base', '币别', 'boctype/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boctype_view', 'boctype', '查看', NULL, 'boctype:list,boctype:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boctype_add', 'boctype', '新增', NULL, 'boctype:save,boctype:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boctype_edit', 'boctype', '修改', NULL, 'boctype:update,boctype:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boctype_delete', 'boctype', '删除', NULL, 'boctype:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boctype_audit', 'boctype', '审核', NULL, 'boctype:audit,boctype:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boctype_unaudit', 'boctype', '反审核', NULL, 'boctype:unaudit,boctype:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boctype_detail', 'boctype', '明细', NULL, 'boctype:list,boctype:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('boxs', 'base', '箱型管理', 'boxs/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boxs_view', 'boxs', '查看', NULL, 'boxs:list,boxs:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boxs_add', 'boxs', '新增', NULL, 'boxs:save,boxs:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boxs_edit', 'boxs', '修改', NULL, 'boxs:update,boxs:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boxs_delete', 'boxs', '删除', NULL, 'boxs:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boxs_audit', 'boxs', '审核', NULL, 'boxs:audit,boxs:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boxs_unaudit', 'boxs', '反审核', NULL, 'boxs:unaudit,boxs:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('boxs_detail', 'boxs', '明细', NULL, 'boxs:list,boxs:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('car', 'base', '车辆管理', 'car/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('car_view', 'car', '查看', NULL, 'car:list,car:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('car_add', 'car', '新增', NULL, 'car:save,car:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('car_edit', 'car', '修改', NULL, 'car:update,car:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('car_delete', 'car', '删除', NULL, 'car:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('car_audit', 'car', '审核', NULL, 'car:audit,car:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('car_unaudit', 'car', '反审核', NULL, 'car:unaudit,car:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('car_detail', 'car', '明细', NULL, 'car:list,car:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('cartype', 'base', '车辆类型', 'cartype/index', NULL, '1', 'fa fa-circle-o', '1');
 
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('baseopbank', 'base', '银行表', 'baseopbank/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('baseopbank_view', 'baseopbank', '查看', NULL, 'baseopbank:list,baseopbank:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('baseopbank_add', 'baseopbank', '新增', NULL, 'baseopbank:save,baseopbank:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('baseopbank_edit', 'baseopbank', '修改', NULL, 'baseopbank:update,baseopbank:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('baseopbank_delete', 'baseopbank', '删除', NULL, 'baseopbank:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('baseopbank_audit', 'baseopbank', '审核', NULL, 'baseopbank:audit,baseopbank:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('baseopbank_unaudit', 'baseopbank', '反审核', NULL, 'baseopbank:unaudit,baseopbank:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('baseopbank_detail', 'baseopbank', '明细', NULL, 'baseopbank:list,baseopbank:info', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('cartype_view', 'cartype', '查看', NULL, 'cartype:list,cartype:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('cartype_add', 'cartype', '新增', NULL, 'cartype:save,cartype:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('cartype_edit', 'cartype', '修改', NULL, 'cartype:update,cartype:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('cartype_delete', 'cartype', '删除', NULL, 'cartype:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('cartype_audit', 'cartype', '审核', NULL, 'cartype:audit,cartype:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('cartype_unaudit', 'cartype', '反审核', NULL, 'cartype:unaudit,cartype:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('cartype_detail', 'cartype', '明细', NULL, 'cartype:list,cartype:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('drivers', 'base', '司机管理', 'drivers/index', NULL, '1', 'fa fa-circle-o', '1');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('gclass', 'base', '品类表', 'gclass/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('gclass_view', 'gclass', '查看', NULL, 'gclass:list,gclass:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('gclass_add', 'gclass', '新增', NULL, 'gclass:save,gclass:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('gclass_edit', 'gclass', '修改', NULL, 'gclass:update,gclass:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('gclass_delete', 'gclass', '删除', NULL, 'gclass:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('gclass_audit', 'gclass', '审核', NULL, 'gclass:audit,gclass:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('gclass_unaudit', 'gclass', '反审核', NULL, 'gclass:unaudit,gclass:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('gclass_detail', 'gclass', '明细', NULL, 'gclass:list,gclass:info', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('drivers_view', 'drivers', '查看', NULL, 'drivers:list,drivers:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('drivers_add', 'drivers', '新增', NULL, 'drivers:save,drivers:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('drivers_edit', 'drivers', '修改', NULL, 'drivers:update,drivers:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('drivers_delete', 'drivers', '删除', NULL, 'drivers:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('drivers_audit', 'drivers', '审核', NULL, 'drivers:audit,drivers:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('drivers_unaudit', 'drivers', '反审核', NULL, 'drivers:unaudit,drivers:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('drivers_detail', 'drivers', '明细', NULL, 'drivers:list,drivers:info', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('goods', 'base', '商品表', 'goods/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('goods_view', 'goods', '查看', NULL, 'goods:list,goods:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('goods_add', 'goods', '新增', NULL, 'goods:save,goods:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('goods_edit', 'goods', '修改', NULL, 'goods:update,goods:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('goods_delete', 'goods', '删除', NULL, 'goods:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('goods_audit', 'goods', '审核', NULL, 'goods:audit,goods:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('goods_unaudit', 'goods', '反审核', NULL, 'goods:unaudit,goods:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('goods_detail', 'goods', '明细', NULL, 'goods:list,goods:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('place', 'base', '地点管理', 'place/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('place_view', 'place', '查看', NULL, 'place:list,place:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('place_add', 'place', '新增', NULL, 'place:save,place:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('place_edit', 'place', '修改', NULL, 'place:update,place:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('place_delete', 'place', '删除', NULL, 'place:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('place_audit', 'place', '审核', NULL, 'place:audit,place:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('place_unaudit', 'place', '反审核', NULL, 'place:unaudit,place:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('place_detail', 'place', '明细', NULL, 'place:list,place:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('region', 'base', '区域管理', 'region/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('region_view', 'region', '查看', NULL, 'region:list,region:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('region_add', 'region', '新增', NULL, 'region:save,region:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('region_edit', 'region', '修改', NULL, 'region:update,region:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('region_delete', 'region', '删除', NULL, 'region:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('region_audit', 'region', '审核', NULL, 'region:audit,region:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('region_unaudit', 'region', '反审核', NULL, 'region:unaudit,region:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('region_detail', 'region', '明细', NULL, 'region:list,region:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('ship', 'base', '船舶管理', 'ship/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ship_view', 'ship', '查看', NULL, 'ship:list,ship:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ship_add', 'ship', '新增', NULL, 'ship:save,ship:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ship_edit', 'ship', '修改', NULL, 'ship:update,ship:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ship_delete', 'ship', '删除', NULL, 'ship:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ship_audit', 'ship', '审核', NULL, 'ship:audit,ship:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ship_unaudit', 'ship', '反审核', NULL, 'ship:unaudit,ship:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ship_detail', 'ship', '明细', NULL, 'ship:list,ship:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('shipplan', 'base', '船舶计划', 'shipplan/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('shipplan_view', 'shipplan', '查看', NULL, 'shipplan:list,shipplan:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('shipplan_add', 'shipplan', '新增', NULL, 'shipplan:save,shipplan:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('shipplan_edit', 'shipplan', '修改', NULL, 'shipplan:update,shipplan:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('shipplan_delete', 'shipplan', '删除', NULL, 'shipplan:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('shipplan_audit', 'shipplan', '审核', NULL, 'shipplan:audit,shipplan:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('shipplan_unaudit', 'shipplan', '反审核', NULL, 'shipplan:unaudit,shipplan:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('shipplan_detail', 'shipplan', '明细', NULL, 'shipplan:list,shipplan:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('transline', 'base', '线路管理', 'transline/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transline_view', 'transline', '查看', NULL, 'transline:list,transline:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transline_add', 'transline', '新增', NULL, 'transline:save,transline:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transline_edit', 'transline', '修改', NULL, 'transline:update,transline:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transline_delete', 'transline', '删除', NULL, 'transline:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transline_audit', 'transline', '审核', NULL, 'transline:audit,transline:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transline_unaudit', 'transline', '反审核', NULL, 'transline:unaudit,transline:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transline_detail', 'transline', '明细', NULL, 'transline:list,transline:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('transteam', 'base', '车队管理', 'transteam/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transteam_view', 'transteam', '查看', NULL, 'transteam:list,transteam:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transteam_add', 'transteam', '新增', NULL, 'transteam:save,transteam:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transteam_edit', 'transteam', '修改', NULL, 'transteam:update,transteam:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transteam_delete', 'transteam', '删除', NULL, 'transteam:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transteam_audit', 'transteam', '审核', NULL, 'transteam:audit,transteam:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transteam_unaudit', 'transteam', '反审核', NULL, 'transteam:unaudit,transteam:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transteam_detail', 'transteam', '明细', NULL, 'transteam:list,transteam:info', '2', NULL, '0');

 
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('attachments', 'base', '附件表', 'attachments/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_view', 'attachments', '查看', NULL, 'attachments:list,attachments:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_add', 'attachments', '新增', NULL, 'attachments:save,attachments:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_edit', 'attachments', '修改', NULL, 'attachments:update,attachments:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_copy', 'attachments', '复制', NULL, 'attachments:copybill,attachments:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_cancel', 'attachments', '作废', NULL, 'attachments:update,attachments:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_delete', 'attachments', '删除', NULL, 'attachments:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_claim', 'attachments', '签收', NULL, 'attachments:claim,attachments:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_audit', 'attachments', '审核', NULL, 'attachments:audit,attachments:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_unaudit', 'attachments', '反审核', NULL, 'attachments:unaudit,attachments:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('attachments_detail', 'attachments', '明细', NULL, 'attachments:list,attachments:info', '2', NULL, '0');


-- 业务管理
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buss', '0', '业务管理', NULL, NULL, '0', 'fa fa-folder', '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('emptymain', 'buss', '空箱计划', 'emptymain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('emptymain_view', 'emptymain', '查看', NULL, 'emptymain:list,emptymain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('emptymain_add', 'emptymain', '新增', NULL, 'emptymain:save,emptymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('emptymain_edit', 'emptymain', '修改', NULL, 'emptymain:update,emptymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('emptymain_delete', 'emptymain', '删除', NULL, 'emptymain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('emptymain_takebox', 'emptymain', '放箱', NULL, 'emptymain:takebox,emptymain:update,emptymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('emptymain_audit', 'emptymain', '审核', NULL, 'emptymain:audit,emptymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('emptymain_detail', 'emptymain', '明细', NULL, 'emptymain:list,emptymain:info', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('factorymain', 'buss', '门点计划', 'factorymain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('factorymain_view', 'factorymain', '查看', NULL, 'factorymain:list,factorymain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('factorymain_add', 'factorymain', '新增', NULL, 'factorymain:save,factorymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('factorymain_edit', 'factorymain', '修改', NULL, 'factorymain:update,factorymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('factorymain_delete', 'factorymain', '删除', NULL, 'factorymain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('factorymain_audit', 'factorymain', '审核', NULL, 'factorymain:audit,factorymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('factorymain_detail', 'factorymain', '明细', NULL, 'factorymain:list,factorymain:info', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('heavymain', 'buss', '重箱计划', 'heavymain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('heavymain_view', 'heavymain', '查看', NULL, 'heavymain:list,heavymain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('heavymain_add', 'heavymain', '新增', NULL, 'heavymain:save,heavymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('heavymain_edit', 'heavymain', '修改', NULL, 'heavymain:update,heavymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('heavymain_delete', 'heavymain', '删除', NULL, 'heavymain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('heavymain_audit', 'heavymain', '审核', NULL, 'heavymain:audit,heavymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('heavymain_detail', 'heavymain', '明细', NULL, 'heavymain:list,heavymain:info', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('preemptymain', 'preemptymain', '预约用箱', 'preemptymain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('preemptymain_view', 'preemptymain', '查看', NULL, 'preemptymain:list,preemptymain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('preemptymain_add', 'preemptymain', '新增', NULL, 'preemptymain:save,preemptymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('preemptymain_edit', 'preemptymain', '修改', NULL, 'preemptymain:update,preemptymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('preemptymain_delete', 'preemptymain', '删除', NULL, 'preemptymain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('preemptymain_audit', 'preemptymain', '审核', NULL, 'preemptymain:audit,preemptymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('preemptymain_detail', 'preemptymain', '明细', NULL, 'preemptymain:list,preemptymain:info', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('leaveportmain', 'buss', '疏港计划', 'leaveportmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('leaveportmain_view', 'leaveportmain', '查看', NULL, 'leaveportmain:list,leaveportmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('leaveportmain_add', 'leaveportmain', '新增', NULL, 'leaveportmain:save,leaveportmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('leaveportmain_edit', 'leaveportmain', '修改', NULL, 'leaveportmain:update,leaveportmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('leaveportmain_delete', 'leaveportmain', '删除', NULL, 'leaveportmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('leaveportmain_audit', 'leaveportmain', '审核', NULL, 'leaveportmain:audit,leaveportmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('leaveportmain_detail', 'leaveportmain', '明细', NULL, 'leaveportmain:list,leaveportmain:info', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('takeboxmain', 'buss', '放箱计划', 'takeboxmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('takeboxmain_view', 'takeboxmain', '查看', NULL, 'takeboxmain:list,takeboxmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('takeboxmain_add', 'takeboxmain', '新增', NULL, 'takeboxmain:save,takeboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('takeboxmain_edit', 'takeboxmain', '修改', NULL, 'takeboxmain:update,takeboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('takeboxmain_delete', 'takeboxmain', '删除', NULL, 'takeboxmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('takeboxmain_audit', 'takeboxmain', '审核', NULL, 'takeboxmain:audit,takeboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('takeboxmain_detail', 'takeboxmain', '明细', NULL, 'takeboxmain:list,takeboxmain:info', '2', NULL, '0');

 

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('transboxmain', 'buss', '运输计划', 'transboxmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_view', 'transboxmain', '查看', NULL, 'transboxmain:list,transboxmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_add', 'transboxmain', '新增', NULL, 'transboxmain:save,transboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_edit', 'transboxmain', '修改', NULL, 'transboxmain:update,transboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_delete', 'transboxmain', '删除', NULL, 'transboxmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_audit', 'transboxmain', '审核', NULL, 'transboxmain:audit,transboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_detail', 'transboxmain', '明细', NULL, 'transboxmain:list,transboxmain:info', '2', NULL, '0');

-- 财务管理
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('finance', '0', '财务管理', NULL, NULL, '0', 'fa fa-folder', '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('accountcategory', 'finance', '预算科目', 'accountcategory/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('costcategory', 'finance', '费用科目', 'costcategory/index', NULL, '1', 'fa fa-circle-o', '1');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('costrequest', 'finance', '费用申请', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('transcosting', 'finance', '运输成本', 'transcosting/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcosting_view', 'transcosting', '查看', NULL, 'transcosting:list,transcosting:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcosting_add', 'transcosting', '新增', NULL, 'transcosting:save,transcosting:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcosting_edit', 'transcosting', '修改', NULL, 'transcosting:update,transcosting:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcosting_delete', 'transcosting', '删除', NULL, 'transcosting:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcosting_audit', 'transcosting', '审核', NULL, 'transcosting:audit,transcosting:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcosting_unaudit', 'transcosting', '反审核', NULL, 'transcosting:unaudit,transcosting:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcosting_detail', 'transcosting', '明细', NULL, 'transcosting:list,transcosting:info', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('budgetmain', 'finance', '预算管理', 'budgetmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('budgetmain_view', 'budgetmain', '查看', NULL, 'budgetmain:list,budgetmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('budgetmain_add', 'budgetmain', '新增', NULL, 'budgetmain:save,budgetmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('budgetmain_edit', 'budgetmain', '修改', NULL, 'budgetmain:update,budgetmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('budgetmain_delete', 'budgetmain', '删除', NULL, 'budgetmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('budgetmain_audit', 'budgetmain', '审核', NULL, 'budgetmain:audit,budgetmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('budgetmain_unaudit', 'budgetmain', '反审核', NULL, 'budgetmain:unaudit,budgetmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('budgetmain_detail', 'budgetmain', '明细', NULL, 'budgetmain:list,budgetmain:info', '2', NULL, '0');
   

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('expense', 'finance', '报销单', 'expense/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expense_view', 'expense', '查看', NULL, 'expense:list,expense:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expense_add', 'expense', '新增', NULL, 'expense:save,expense:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expense_edit', 'expense', '修改', NULL, 'expense:update,expense:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expense_delete', 'expense', '删除', NULL, 'expense:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expense_audit', 'expense', '审核', NULL, 'expense:audit,expense:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expense_unaudit', 'expense', '反审核', NULL, 'expense:unaudit,expense:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expense_detail', 'expense', '明细', NULL, 'expense:list,expense:info', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('requisitionmain', 'finance', '请购主表', 'requisitionmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_view', 'requisitionmain', '查看', NULL, 'requisitionmain:list,requisitionmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_add', 'requisitionmain', '新增', NULL, 'requisitionmain:save,requisitionmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_edit', 'requisitionmain', '修改', NULL, 'requisitionmain:update,requisitionmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_copy', 'requisitionmain', '复制', NULL, 'requisitionmain:copybill,requisitionmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_cancel', 'requisitionmain', '作废', NULL, 'requisitionmain:update,requisitionmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_delete', 'requisitionmain', '删除', NULL, 'requisitionmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_claim', 'requisitionmain', '签收', NULL, 'requisitionmain:claim,requisitionmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_audit', 'requisitionmain', '审核', NULL, 'requisitionmain:audit,requisitionmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_unaudit', 'requisitionmain', '反审核', NULL, 'requisitionmain:unaudit,requisitionmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('requisitionmain_detail', 'requisitionmain', '明细', NULL, 'requisitionmain:list,requisitionmain:info', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('ordermain', 'finance', '订购主表', 'ordermain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_view', 'ordermain', '查看', NULL, 'ordermain:list,ordermain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_add', 'ordermain', '新增', NULL, 'ordermain:save,ordermain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_edit', 'ordermain', '修改', NULL, 'ordermain:update,ordermain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_copy', 'ordermain', '复制', NULL, 'ordermain:copybill,ordermain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_cancel', 'ordermain', '作废', NULL, 'ordermain:update,ordermain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_delete', 'ordermain', '删除', NULL, 'ordermain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_claim', 'ordermain', '签收', NULL, 'ordermain:claim,ordermain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_audit', 'ordermain', '审核', NULL, 'ordermain:audit,ordermain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_unaudit', 'ordermain', '反审核', NULL, 'ordermain:unaudit,ordermain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('ordermain_detail', 'ordermain', '明细', NULL, 'ordermain:list,ordermain:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('paymentmain', 'finance', '付款主表', 'paymentmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paymentmain_view', 'paymentmain', '查看', NULL, 'paymentmain:list,paymentmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paymentmain_add', 'paymentmain', '新增', NULL, 'paymentmain:save,paymentmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paymentmain_edit', 'paymentmain', '修改', NULL, 'paymentmain:update,paymentmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paymentmain_delete', 'paymentmain', '删除', NULL, 'paymentmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paymentmain_audit', 'paymentmain', '审核', NULL, 'paymentmain:audit,paymentmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paymentmain_unaudit', 'paymentmain', '反审核', NULL, 'paymentmain:unaudit,paymentmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paymentmain_detail', 'paymentmain', '明细', NULL, 'paymentmain:list,paymentmain:info', '2', NULL, '0');



-- INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('askbill', 'finance', '请购单', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
-- INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paybill', 'finance', '付款单', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
 
-- INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('askbill_view', 'askbill', '查看', NULL, 'plankongxiangmain:list,plankongxiangmain:info', '2', NULL, '0');
-- INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('askbill_add', 'askbill', '新增', NULL, 'plankongxiangmain:save,plankongxiangmain:select', '2', NULL, '0');
-- INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('askbill_edit', 'askbill', '修改', NULL, 'plankongxiangmain:update,plankongxiangmain:select', '2', NULL, '0');
-- INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('askbill_delete', 'askbill', '删除', NULL, 'plankongxiangmain:delete', '2', NULL, '0');
-- INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('askbill_audit', 'askbill', '审核', NULL, 'plankongxiangmain:shenhe,plankongxiangmain:select', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buybill_view', 'buybill', '查看', NULL, 'plankongxiangmain:list,plankongxiangmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buybill_add', 'buybill', '新增', NULL, 'plankongxiangmain:save,plankongxiangmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buybill_edit', 'buybill', '修改', NULL, 'plankongxiangmain:update,plankongxiangmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buybill_delete', 'buybill', '删除', NULL, 'plankongxiangmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buybill_audit', 'buybill', '审核', NULL, 'plankongxiangmain:audit,plankongxiangmain:select', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paybill_view', 'paybill', '查看', NULL, 'plankongxiangmain:list,plankongxiangmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paybill_add', 'paybill', '新增', NULL, 'plankongxiangmain:save,plankongxiangmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paybill_edit', 'paybill', '修改', NULL, 'plankongxiangmain:update,plankongxiangmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paybill_delete', 'paybill', '删除', NULL, 'plankongxiangmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paybill_audit', 'paybill', '审核', NULL, 'plankongxiangmain:audit,plankongxiangmain:select', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('contract', '0', '合同管理', NULL, NULL, '0', 'fa fa-folder', '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('buycontractmain', 'contract', '采购合同', 'buycontractmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buycontractmain_view', 'buycontractmain', '查看', NULL, 'buycontractmain:list,buycontractmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buycontractmain_add', 'buycontractmain', '新增', NULL, 'buycontractmain:save,buycontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buycontractmain_edit', 'buycontractmain', '修改', NULL, 'buycontractmain:update,buycontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buycontractmain_delete', 'buycontractmain', '删除', NULL, 'buycontractmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buycontractmain_audit', 'buycontractmain', '审核', NULL, 'buycontractmain:audit,buycontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buycontractmain_unaudit', 'buycontractmain', '反审核', NULL, 'buycontractmain:unaudit,buycontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('buycontractmain_detail', 'buycontractmain', '明细', NULL, 'buycontractmain:list,buycontractmain:info', '2', NULL, '0');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('rentcontractmain', 'contract', '租赁合同', 'rentcontractmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('rentcontractmain_view', 'rentcontractmain', '查看', NULL, 'rentcontractmain:list,rentcontractmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('rentcontractmain_add', 'rentcontractmain', '新增', NULL, 'rentcontractmain:save,rentcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('rentcontractmain_edit', 'rentcontractmain', '修改', NULL, 'rentcontractmain:update,rentcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('rentcontractmain_delete', 'rentcontractmain', '删除', NULL, 'rentcontractmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('rentcontractmain_audit', 'rentcontractmain', '审核', NULL, 'rentcontractmain:audit,rentcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('rentcontractmain_unaudit', 'rentcontractmain', '反审核', NULL, 'rentcontractmain:unaudit,rentcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('rentcontractmain_detail', 'rentcontractmain', '明细', NULL, 'rentcontractmain:list,rentcontractmain:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('repaircontractmain', 'contract', '机械维修合同', 'repaircontractmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('repaircontractmain_view', 'repaircontractmain', '查看', NULL, 'repaircontractmain:list,repaircontractmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('repaircontractmain_add', 'repaircontractmain', '新增', NULL, 'repaircontractmain:save,repaircontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('repaircontractmain_edit', 'repaircontractmain', '修改', NULL, 'repaircontractmain:update,repaircontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('repaircontractmain_delete', 'repaircontractmain', '删除', NULL, 'repaircontractmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('repaircontractmain_audit', 'repaircontractmain', '审核', NULL, 'repaircontractmain:audit,repaircontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('repaircontractmain_unaudit', 'repaircontractmain', '反审核', NULL, 'repaircontractmain:unaudit,repaircontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('repaircontractmain_detail', 'repaircontractmain', '明细', NULL, 'repaircontractmain:list,repaircontractmain:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('storecontractmain', 'contract', '仓储合同', 'storecontractmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_view', 'storecontractmain', '查看', NULL, 'storecontractmain:list,storecontractmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_add', 'storecontractmain', '新增', NULL, 'storecontractmain:save,storecontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_edit', 'storecontractmain', '修改', NULL, 'storecontractmain:update,storecontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_delete', 'storecontractmain', '删除', NULL, 'storecontractmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_audit', 'storecontractmain', '审核', NULL, 'storecontractmain:audit,storecontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_unaudit', 'storecontractmain', '反审核', NULL, 'storecontractmain:unaudit,storecontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_detail', 'storecontractmain', '明细', NULL, 'storecontractmain:list,storecontractmain:info', '2', NULL, '0');

INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('transcontractmain', 'contract', '运输合同', 'transcontractmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_view', 'transcontractmain', '查看', NULL, 'transcontractmain:list,transcontractmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_add', 'transcontractmain', '新增', NULL, 'transcontractmain:save,transcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_edit', 'transcontractmain', '修改', NULL, 'transcontractmain:update,transcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_delete', 'transcontractmain', '删除', NULL, 'transcontractmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_audit', 'transcontractmain', '审核', NULL, 'transcontractmain:audit,transcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_unaudit', 'transcontractmain', '反审核', NULL, 'transcontractmain:unaudit,transcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_detail', 'transcontractmain', '明细', NULL, 'transcontractmain:list,transcontractmain:info', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('oa', '0', '日常工作', NULL, NULL, '0', 'fa fa-folder', '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('todolist', 'oa', '待办事项', 'todolist/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_view', 'todolist', '查看', NULL, 'todolist:list,todolist:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_add', 'todolist', '新增', NULL, 'todolist:save,todolist:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_edit', 'todolist', '修改', NULL, 'todolist:update,todolist:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_copy', 'todolist', '复制', NULL, 'todolist:copybill,todolist:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_cancel', 'todolist', '作废', NULL, 'todolist:update,todolist:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_delete', 'todolist', '删除', NULL, 'todolist:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_claim', 'todolist', '签收', NULL, 'todolist:claim,todolist:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_audit', 'todolist', '审核', NULL, 'todolist:audit,todolist:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_unaudit', 'todolist', '反审核', NULL, 'todolist:unaudit,todolist:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('todolist_detail', 'todolist', '明细', NULL, 'todolist:list,todolist:info', '2', NULL, '0');



INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('90', '88', '考勤管理', 'plankongxiangmain/index', NULL, '1', 'fa fa-circle-o', '1');
