
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('ordermain', 'oa', '订购单', 'ordermain/index', NULL, '1', 'fa fa-circle-o', '1');


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
