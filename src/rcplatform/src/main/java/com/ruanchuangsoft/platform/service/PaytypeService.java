package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.PaytypeEntity;

import java.util.List;
import java.util.Map;

/**
 * 付款方式
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:28:44
 */
public interface PaytypeService {
	
	PaytypeEntity queryObject(Long id);
	
	List<PaytypeEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PaytypeEntity paytype);
	
	void update(PaytypeEntity paytype);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
