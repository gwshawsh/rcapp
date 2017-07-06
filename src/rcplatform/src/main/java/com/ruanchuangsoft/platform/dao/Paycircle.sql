
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('paycircle', 'finance', '结算周期', 'paycircle/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_view', 'paycircle', '查看', NULL, 'paycircle:list,paycircle:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_add', 'paycircle', '新增', NULL, 'paycircle:save,paycircle:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_edit', 'paycircle', '修改', NULL, 'paycircle:update,paycircle:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_copy', 'paycircle', '复制', NULL, 'paycircle:copybill,paycircle:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_cancel', 'paycircle', '作废', NULL, 'paycircle:update,paycircle:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_delete', 'paycircle', '删除', NULL, 'paycircle:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_claim', 'paycircle', '签收', NULL, 'paycircle:claim,paycircle:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_audit', 'paycircle', '审核', NULL, 'paycircle:audit,paycircle:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_unaudit', 'paycircle', '反审核', NULL, 'paycircle:unaudit,paycircle:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('paycircle_detail', 'paycircle', '明细', NULL, 'paycircle:list,paycircle:info', '2', NULL, '0');
