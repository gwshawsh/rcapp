package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TranscostingEntity;

import java.util.List;
import java.util.Map;

/**
 * 运输成本
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 16:20:06
 */
public interface TranscostingService {
	
	TranscostingEntity queryObject(Long id);
	
	List<TranscostingEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TranscostingEntity transcosting);
	
	void update(TranscostingEntity transcosting);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
