
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('storecontractmain', 'contract', '仓储合同', 'storecontractmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_view', 'storecontractmain', '查看', NULL, 'storecontractmain:list,storecontractmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_add', 'storecontractmain', '新增', NULL, 'storecontractmain:save,storecontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_edit', 'storecontractmain', '修改', NULL, 'storecontractmain:update,storecontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_delete', 'storecontractmain', '删除', NULL, 'storecontractmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_audit', 'storecontractmain', '审核', NULL, 'storecontractmain:audit,storecontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_unaudit', 'storecontractmain', '反审核', NULL, 'storecontractmain:unaudit,storecontractmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('storecontractmain_detail', 'storecontractmain', '明细', NULL, 'storecontractmain:list,storecontractmain:info', '2', NULL, '0');
