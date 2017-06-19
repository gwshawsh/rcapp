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
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1006', '2', '门点计划', '放箱参照');


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1008', '0', '燃油', '汽车油耗类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1008', '1', '燃气', '汽车油耗类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1008', '2', '电动', '汽车油耗类型');


INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1009', '0', '空箱', '空重');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('1009', '1', '重箱', '空重');

INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '0', '目录', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '1', '港口', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '2', '仓库', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '3', '堆场', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '4', '工厂', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '5', '船公司', '组织类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2001', '6', '放箱公司', '组织类型');


 
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2003', '0', '自有', '车队类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2003', '1', '挂靠', '车队类型');
INSERT INTO `enumtable` (`enumtype`, `enumvalueid`, `enumvaluename`, `remark`) VALUES ('2003', '2', '外协', '车队类型');