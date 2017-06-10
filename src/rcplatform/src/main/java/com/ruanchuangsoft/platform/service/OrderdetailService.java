package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.OrderdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 订购明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-10 19:20:37
 */
public interface OrderdetailService {
	
	OrderdetailEntity queryObject(Long id);
	
	List<OrderdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(OrderdetailEntity orderdetail);
	
	void update(OrderdetailEntity orderdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
