package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.OrdermainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 订购主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:51:59
 */
@Mapper
public interface OrdermainDao extends BaseDao<OrdermainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
