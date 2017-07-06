
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('transferapplicationmain', 'member', '调岗申请', 'transferapplicationmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_view', 'transferapplicationmain', '查看', NULL, 'transferapplicationmain:list,transferapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_add', 'transferapplicationmain', '新增', NULL, 'transferapplicationmain:save,transferapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_edit', 'transferapplicationmain', '修改', NULL, 'transferapplicationmain:update,transferapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_copy', 'transferapplicationmain', '复制', NULL, 'transferapplicationmain:copybill,transferapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_cancel', 'transferapplicationmain', '作废', NULL, 'transferapplicationmain:update,transferapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_delete', 'transferapplicationmain', '删除', NULL, 'transferapplicationmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_claim', 'transferapplicationmain', '签收', NULL, 'transferapplicationmain:claim,transferapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_audit', 'transferapplicationmain', '审核', NULL, 'transferapplicationmain:audit,transferapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_unaudit', 'transferapplicationmain', '反审核', NULL, 'transferapplicationmain:unaudit,transferapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('transferapplicationmain_detail', 'transferapplicationmain', '明细', NULL, 'transferapplicationmain:list,transferapplicationmain:info', '2', NULL, '0');
