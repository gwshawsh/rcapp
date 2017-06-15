package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.PaymentdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 付款明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-15 10:53:56
 */
public interface PaymentdetailService {
	
	PaymentdetailEntity queryObject(Long id);
	
	List<PaymentdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PaymentdetailEntity paymentdetail);
	
	void update(PaymentdetailEntity paymentdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
