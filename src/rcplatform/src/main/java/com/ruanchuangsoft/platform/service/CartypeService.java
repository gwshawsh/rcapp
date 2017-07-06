package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.CartypeEntity;

import java.util.List;
import java.util.Map;

/**
 * 车辆类型
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 15:52:19
 */
public interface CartypeService {
	
	CartypeEntity queryObject(Long id);
	
	List<CartypeEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CartypeEntity cartype);
	
	void update(CartypeEntity cartype);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
