
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('depatureapplicationmain', 'member', '离职申请', 'depatureapplicationmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_view', 'depatureapplicationmain', '查看', NULL, 'depatureapplicationmain:list,depatureapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_add', 'depatureapplicationmain', '新增', NULL, 'depatureapplicationmain:save,depatureapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_edit', 'depatureapplicationmain', '修改', NULL, 'depatureapplicationmain:update,depatureapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_copy', 'depatureapplicationmain', '复制', NULL, 'depatureapplicationmain:copybill,depatureapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_cancel', 'depatureapplicationmain', '作废', NULL, 'depatureapplicationmain:update,depatureapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_delete', 'depatureapplicationmain', '删除', NULL, 'depatureapplicationmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_claim', 'depatureapplicationmain', '签收', NULL, 'depatureapplicationmain:claim,depatureapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_audit', 'depatureapplicationmain', '审核', NULL, 'depatureapplicationmain:audit,depatureapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_unaudit', 'depatureapplicationmain', '反审核', NULL, 'depatureapplicationmain:unaudit,depatureapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('depatureapplicationmain_detail', 'depatureapplicationmain', '明细', NULL, 'depatureapplicationmain:list,depatureapplicationmain:info', '2', NULL, '0');
