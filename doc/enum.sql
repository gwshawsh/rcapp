delete from enumtable;


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('0001', '0', '否', '是否');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('0001', '1', '是', '是否');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1001', '0', '请购单转入', '采购单来源');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1001', '1', '手工', '采购单来源');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1002', '0', '预算内', '预算类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1002', '1', '预算外', '预算类型');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1003', '0', '新增', '单据状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1003', '1', '审核', '单据状态');


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1004', '0', '订购单转入', '付款单来源');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1004', '1', '手工', '付款单来源');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1004', '2', '合同', '付款单来源');


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1005', '0', '病假', '请假类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1005', '1', '婚假', '请假类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1005', '2', '事假', '请假类型');


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1006', '0', '无参照', '放箱参照');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1006', '1', '空箱计划', '放箱参照');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1006', '2', '放箱计划', '放箱参照');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1006', '3', '重箱计划', '放箱参照');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1006', '4', '门点计划', '放箱参照');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1006', '5', '疏港计划', '放箱参照');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1007', '0', '五轴车', '车辆类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1007', '1', '六轴车', '车辆类型');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1008', '0', '燃油', '汽车油耗类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1008', '1', '燃气', '汽车油耗类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1008', '2', '电动', '汽车油耗类型');


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1009', '0', '空箱', '空重');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1009', '1', '重箱', '空重');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1010', '0', '月结', '结算方式');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1010', '1', '季度', '结算方式');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1010', '1', '半年', '结算方式');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1010', '1', '年度', '结算方式');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1011', '0', '收款', '收付款类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1011', '1', '付款', '收付款类型');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1012', '0', '新增', '单据状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1012', '1', '已提交', '单据状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1012', '2', '已签收', '单据状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1012', '3', '审核中', '单据状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1012', '4', '已完成', '单据状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1012', '9', '作废', '单据状态');


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1013', '0', '同意', '审批状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1013', '1', '不同意', '审批状态');


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1014', '0', '现金付款', '付款方式');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1014', '1', '银行付款', '付款方式');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1014', '1', '冲借款', '付款方式');


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '0', '目录', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '1', '港口', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '2', '仓库', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '3', '堆场', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '4', '工厂', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '5', '船公司', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '6', '放箱公司', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '7', '运输公司', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '8', '供应商', '组织类型');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '0', '新增', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '1', '开始放单', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '2', '放单结束', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '3', '放单异常', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '4', '发送运输', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '5', '已派车', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '6', '已提箱', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '7', '已到仓库', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '8', '已进港', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '9', '暂落箱', '箱子状态');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2002', '10', '已到堆场', '箱子状态');



 
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2003', '0', '自有', '车队类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2003', '1', '挂靠', '车队类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2003', '2', '外协', '车队类型');