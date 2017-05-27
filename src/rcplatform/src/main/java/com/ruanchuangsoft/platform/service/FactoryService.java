package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.FactoryEntity;

import java.util.List;
import java.util.Map;

/**
 * 工厂管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:02:48
 */
public interface FactoryService {
	
	FactoryEntity queryObject(Long id);
	
	List<FactoryEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(FactoryEntity factory);
	
	void update(FactoryEntity factory);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
