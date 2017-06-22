package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.PaymentmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 付款主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:54:18
 */
@Mapper
public interface PaymentmainDao extends BaseDao<PaymentmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
