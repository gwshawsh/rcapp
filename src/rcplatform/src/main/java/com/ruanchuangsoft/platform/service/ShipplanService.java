package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.ShipplanEntity;

import java.util.List;
import java.util.Map;

/**
 * 船舶计划表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:14:30
 */
public interface ShipplanService {
	
	ShipplanEntity queryObject(Long id);
	
	List<ShipplanEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ShipplanEntity shipplan);
	
	void update(ShipplanEntity shipplan);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
