package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.DriversEntity;

import java.util.List;
import java.util.Map;

/**
 * 司机管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-17 16:28:44
 */
public interface DriversService {
	
	DriversEntity queryObject(Long id);
	
	List<DriversEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(DriversEntity drivers);
	
	void update(DriversEntity drivers);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
