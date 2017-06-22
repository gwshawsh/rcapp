package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.RepaircontractdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 机械维修合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:07:53
 */
@Mapper
public interface RepaircontractdetailDao extends BaseDao<RepaircontractdetailEntity> {
    int deleteByBillNo(String billno);
}
