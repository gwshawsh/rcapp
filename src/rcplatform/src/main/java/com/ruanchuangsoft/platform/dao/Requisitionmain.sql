
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('requisitionmain', 'oa', '请购单', 'requisitionmain/index', NULL, '1', 'fa fa-circle-o', '1');


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
