package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.BudgetdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 预算明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:45:16
 */
@Mapper
public interface BudgetdetailDao extends BaseDao<BudgetdetailEntity> {
    int deleteByBillNo(String billno);
}
