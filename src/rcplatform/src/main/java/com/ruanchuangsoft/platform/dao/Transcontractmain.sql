
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('transcontractmain', 'contract', '运输合同', 'transcontractmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_view', 'transcontractmain', '查看', NULL, 'transcontractmain:list,transcontractmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_add', 'transcontractmain', '新增', NULL, 'transcontractmain:save,transcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_edit', 'transcontractmain', '修改', NULL, 'transcontractmain:update,transcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_delete', 'transcontractmain', '删除', NULL, 'transcontractmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_audit', 'transcontractmain', '审核', NULL, 'transcontractmain:audit,transcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_unaudit', 'transcontractmain', '反审核', NULL, 'transcontractmain:unaudit,transcontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transcontractmain_detail', 'transcontractmain', '明细', NULL, 'transcontractmain:list,transcontractmain:info', '2', NULL, '0');
