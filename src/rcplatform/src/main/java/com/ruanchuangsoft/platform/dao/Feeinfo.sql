
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('feeinfo', 'finance', '费用项目', 'feeinfo/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_view', 'feeinfo', '查看', NULL, 'feeinfo:list,feeinfo:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_add', 'feeinfo', '新增', NULL, 'feeinfo:save,feeinfo:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_edit', 'feeinfo', '修改', NULL, 'feeinfo:update,feeinfo:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_copy', 'feeinfo', '复制', NULL, 'feeinfo:copybill,feeinfo:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_cancel', 'feeinfo', '作废', NULL, 'feeinfo:update,feeinfo:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_delete', 'feeinfo', '删除', NULL, 'feeinfo:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_claim', 'feeinfo', '签收', NULL, 'feeinfo:claim,feeinfo:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_audit', 'feeinfo', '审核', NULL, 'feeinfo:audit,feeinfo:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_unaudit', 'feeinfo', '反审核', NULL, 'feeinfo:unaudit,feeinfo:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('feeinfo_detail', 'feeinfo', '明细', NULL, 'feeinfo:list,feeinfo:info', '2', NULL, '0');
