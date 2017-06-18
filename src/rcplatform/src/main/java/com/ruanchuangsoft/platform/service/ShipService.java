package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.ShipEntity;

import java.util.List;
import java.util.Map;

/**
 * 船舶管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 00:18:30
 */
public interface ShipService {
	
	ShipEntity queryObject(Long id);
	
	List<ShipEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ShipEntity ship);
	
	void update(ShipEntity ship);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
