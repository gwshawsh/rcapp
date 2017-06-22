package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.BudgetmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 预算计划主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:45:16
 */
@Mapper
public interface BudgetmainDao extends BaseDao<BudgetmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
