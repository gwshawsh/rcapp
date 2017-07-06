
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('formalapplicationmain', 'member', '转正申请', 'formalapplicationmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_view', 'formalapplicationmain', '查看', NULL, 'formalapplicationmain:list,formalapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_add', 'formalapplicationmain', '新增', NULL, 'formalapplicationmain:save,formalapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_edit', 'formalapplicationmain', '修改', NULL, 'formalapplicationmain:update,formalapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_copy', 'formalapplicationmain', '复制', NULL, 'formalapplicationmain:copybill,formalapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_cancel', 'formalapplicationmain', '作废', NULL, 'formalapplicationmain:update,formalapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_delete', 'formalapplicationmain', '删除', NULL, 'formalapplicationmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_claim', 'formalapplicationmain', '签收', NULL, 'formalapplicationmain:claim,formalapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_audit', 'formalapplicationmain', '审核', NULL, 'formalapplicationmain:audit,formalapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_unaudit', 'formalapplicationmain', '反审核', NULL, 'formalapplicationmain:unaudit,formalapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('formalapplicationmain_detail', 'formalapplicationmain', '明细', NULL, 'formalapplicationmain:list,formalapplicationmain:info', '2', NULL, '0');
