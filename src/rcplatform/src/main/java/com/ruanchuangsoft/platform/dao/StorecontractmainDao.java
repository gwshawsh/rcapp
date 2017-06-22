package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.StorecontractmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 仓储合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 12:07:01
 */
@Mapper
public interface StorecontractmainDao extends BaseDao<StorecontractmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
