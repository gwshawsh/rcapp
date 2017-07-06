
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('renewapplicationmain', 'member', '续签申请', 'renewapplicationmain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_view', 'renewapplicationmain', '查看', NULL, 'renewapplicationmain:list,renewapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_add', 'renewapplicationmain', '新增', NULL, 'renewapplicationmain:save,renewapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_edit', 'renewapplicationmain', '修改', NULL, 'renewapplicationmain:update,renewapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_copy', 'renewapplicationmain', '复制', NULL, 'renewapplicationmain:copybill,renewapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_cancel', 'renewapplicationmain', '作废', NULL, 'renewapplicationmain:update,renewapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_delete', 'renewapplicationmain', '删除', NULL, 'renewapplicationmain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_claim', 'renewapplicationmain', '签收', NULL, 'renewapplicationmain:claim,renewapplicationmain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_audit', 'renewapplicationmain', '审核', NULL, 'renewapplicationmain:audit,renewapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_unaudit', 'renewapplicationmain', '反审核', NULL, 'renewapplicationmain:unaudit,renewapplicationmain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('renewapplicationmain_detail', 'renewapplicationmain', '明细', NULL, 'renewapplicationmain:list,renewapplicationmain:info', '2', NULL, '0');
