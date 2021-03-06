package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.StoreEntity;

import java.util.List;
import java.util.Map;

/**
 * 仓库管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
public interface StoreService {
	
	StoreEntity queryObject(Long id);
	
	List<StoreEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(StoreEntity store);
	
	void update(StoreEntity store);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
