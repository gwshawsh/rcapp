package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.OrdermainEntity;

import java.util.List;
import java.util.Map;

/**
 * 订购主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-16 19:17:49
 */
public interface OrdermainService {
	
	OrdermainEntity queryObject(Long id);
	
	List<OrdermainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(OrdermainEntity ordermain);
	
	void update(OrdermainEntity ordermain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

    void auditBatch(Long[] ids);

    void unauditBatch(Long[] ids);
}
