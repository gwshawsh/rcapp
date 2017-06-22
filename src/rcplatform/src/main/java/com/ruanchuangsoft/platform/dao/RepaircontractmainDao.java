package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.RepaircontractmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 机械维修合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:07:53
 */
@Mapper
public interface RepaircontractmainDao extends BaseDao<RepaircontractmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
