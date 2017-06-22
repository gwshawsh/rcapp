package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.StorecontractdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 仓储合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 12:07:01
 */
@Mapper
public interface StorecontractdetailDao extends BaseDao<StorecontractdetailEntity> {
    int deleteByBillNo(String billno);
}
