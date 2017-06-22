package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.ContaineryardEntity;

import java.util.List;
import java.util.Map;

/**
 * 堆场管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
public interface ContaineryardService {
	
	ContaineryardEntity queryObject(Long id);
	
	List<ContaineryardEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ContaineryardEntity containeryard);
	
	void update(ContaineryardEntity containeryard);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
