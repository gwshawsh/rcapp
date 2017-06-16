package com.ruanchuangsoft.platform.dao;

import com.ruanchuangsoft.platform.entity.PaymentdetailEntity;
import org.apache.ibatis.annotations.Mapper;
/**
 * 付款明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-15 10:53:56
 */
@Mapper
public interface PaymentdetailDao extends BaseDao<PaymentdetailEntity> {
    int deleteByBillNo(String billno);
}
