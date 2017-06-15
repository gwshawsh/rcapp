package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.PaymentmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 付款主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-15 10:53:56
 */
public interface PaymentmainService {
	
	PaymentmainEntity queryObject(Long id);
	
	List<PaymentmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PaymentmainEntity paymentmain);
	
	void update(PaymentmainEntity paymentmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
