package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.ContractmainEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 合同管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 16:29:12
 */
@Mapper
public interface ContractmainDao extends BaseDao<ContractmainEntity> {
    int auditBatch(Object[] id);
    int unauditBatch(Object[] id);
}
