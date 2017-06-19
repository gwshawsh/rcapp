
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('transboxmain', 'buss', '运输计划', 'transboxmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_view', 'transboxmain', '查看', NULL, 'transboxmain:list,transboxmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_add', 'transboxmain', '新增', NULL, 'transboxmain:save,transboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_edit', 'transboxmain', '修改', NULL, 'transboxmain:update,transboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_delete', 'transboxmain', '删除', NULL, 'transboxmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_audit', 'transboxmain', '审核', NULL, 'transboxmain:audit,transboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_unaudit', 'transboxmain', '反审核', NULL, 'transboxmain:unaudit,transboxmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transboxmain_detail', 'transboxmain', '明细', NULL, 'transboxmain:list,transboxmain:info', '2', NULL, '0');
