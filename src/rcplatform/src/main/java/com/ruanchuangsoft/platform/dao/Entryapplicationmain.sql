
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('entryapplicationmain', 'member', '入职申请', 'entryapplicationmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_view', 'entryapplicationmain', '查看', NULL, 'entryapplicationmain:list,entryapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_add', 'entryapplicationmain', '新增', NULL, 'entryapplicationmain:save,entryapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_edit', 'entryapplicationmain', '修改', NULL, 'entryapplicationmain:update,entryapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_copy', 'entryapplicationmain', '复制', NULL, 'entryapplicationmain:copybill,entryapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_cancel', 'entryapplicationmain', '作废', NULL, 'entryapplicationmain:update,entryapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_delete', 'entryapplicationmain', '删除', NULL, 'entryapplicationmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_claim', 'entryapplicationmain', '签收', NULL, 'entryapplicationmain:claim,entryapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_audit', 'entryapplicationmain', '审核', NULL, 'entryapplicationmain:audit,entryapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_unaudit', 'entryapplicationmain', '反审核', NULL, 'entryapplicationmain:unaudit,entryapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('entryapplicationmain_detail', 'entryapplicationmain', '明细', NULL, 'entryapplicationmain:list,entryapplicationmain:info', '2', NULL, '0');
