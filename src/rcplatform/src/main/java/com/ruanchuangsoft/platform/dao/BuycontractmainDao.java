package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.BuycontractmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 采购合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:05:05
 */
@Mapper
public interface BuycontractmainDao extends BaseDao<BuycontractmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
