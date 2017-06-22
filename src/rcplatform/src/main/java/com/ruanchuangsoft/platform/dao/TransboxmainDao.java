package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.TransboxmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 运输计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:37:11
 */
@Mapper
public interface TransboxmainDao extends BaseDao<TransboxmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
