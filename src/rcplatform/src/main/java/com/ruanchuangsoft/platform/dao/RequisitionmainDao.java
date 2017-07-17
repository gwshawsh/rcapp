package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.RequisitionmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 请购单
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-17 15:16:21
 */
@Mapper
public interface RequisitionmainDao extends BaseDao<RequisitionmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
