
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`)
VALUES ('expensecompanymain', 'oa', '公司费用', 'expensecompanymain/index', NULL, '1', 'fa fa-circle-o', '1');


INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_view', 'expensecompanymain', '查看', NULL, 'expensecompanymain:list,expensecompanymain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_add', 'expensecompanymain', '新增', NULL, 'expensecompanymain:save,expensecompanymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_edit', 'expensecompanymain', '修改', NULL, 'expensecompanymain:update,expensecompanymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_copy', 'expensecompanymain', '复制', NULL, 'expensecompanymain:copybill,expensecompanymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_cancel', 'expensecompanymain', '作废', NULL, 'expensecompanymain:update,expensecompanymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_delete', 'expensecompanymain', '删除', NULL, 'expensecompanymain:delete', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_claim', 'expensecompanymain', '签收', NULL, 'expensecompanymain:claim,expensecompanymain:info', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_audit', 'expensecompanymain', '审核', NULL, 'expensecompanymain:audit,expensecompanymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_unaudit', 'expensecompanymain', '反审核', NULL, 'expensecompanymain:unaudit,expensecompanymain:select', '2', NULL, '0');
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES ('expensecompanymain_detail', 'expensecompanymain', '明细', NULL, 'expensecompanymain:list,expensecompanymain:info', '2', NULL, '0');
