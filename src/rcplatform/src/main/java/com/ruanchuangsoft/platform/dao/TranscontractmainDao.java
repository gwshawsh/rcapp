package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.TranscontractmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 运输合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 12:08:04
 */
@Mapper
public interface TranscontractmainDao extends BaseDao<TranscontractmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
