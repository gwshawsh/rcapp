package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.OrderdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 订购明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-16 19:17:49
 */
@Mapper
public interface OrderdetailDao extends BaseDao<OrderdetailEntity> {
    int deleteByBillNo(String billno);
}
