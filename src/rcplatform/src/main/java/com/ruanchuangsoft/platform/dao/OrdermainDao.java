package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.OrdermainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 订购单
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-23 17:35:42
 */
@Mapper
public interface OrdermainDao extends BaseDao<OrdermainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
