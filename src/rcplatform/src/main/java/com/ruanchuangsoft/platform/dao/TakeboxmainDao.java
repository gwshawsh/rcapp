package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.TakeboxmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 放箱计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-21 19:55:19
 */
@Mapper
public interface TakeboxmainDao extends BaseDao<TakeboxmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
