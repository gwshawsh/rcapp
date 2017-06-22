package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.BuycontractdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 采购合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 14:05:05
 */
@Mapper
public interface BuycontractdetailDao extends BaseDao<BuycontractdetailEntity> {
    int deleteByBillNo(String billno);
}
