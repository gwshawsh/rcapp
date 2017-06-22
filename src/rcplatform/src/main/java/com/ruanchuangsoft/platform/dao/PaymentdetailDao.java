package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.PaymentdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 付款明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:54:18
 */
@Mapper
public interface PaymentdetailDao extends BaseDao<PaymentdetailEntity> {
    int deleteByBillNo(String billno);
}
