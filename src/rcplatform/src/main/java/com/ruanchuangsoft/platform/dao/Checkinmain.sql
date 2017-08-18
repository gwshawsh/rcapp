
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('checkinmain', 'abc', '签到表', 'checkinmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_view', 'checkinmain', '查看', NULL, 'checkinmain:list,checkinmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_add', 'checkinmain', '新增', NULL, 'checkinmain:save,checkinmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_edit', 'checkinmain', '修改', NULL, 'checkinmain:update,checkinmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_copy', 'checkinmain', '复制', NULL, 'checkinmain:copybill,checkinmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_cancel', 'checkinmain', '作废', NULL, 'checkinmain:update,checkinmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_delete', 'checkinmain', '删除', NULL, 'checkinmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_claim', 'checkinmain', '签收', NULL, 'checkinmain:claim,checkinmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_audit', 'checkinmain', '审核', NULL, 'checkinmain:audit,checkinmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_unaudit', 'checkinmain', '反审核', NULL, 'checkinmain:unaudit,checkinmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('checkinmain_detail', 'checkinmain', '明细', NULL, 'checkinmain:list,checkinmain:info', '2', NULL, '0');
