package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.ContractdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 合同明细
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-25 20:40:35
 */
@Mapper
public interface ContractdetailDao extends BaseDao<ContractdetailEntity> {
    int deleteByBillNo(String billno);
}
