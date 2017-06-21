package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.RegionEntity;

import java.util.List;
import java.util.Map;

/**
 * 区域管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 19:02:25
 */
public interface RegionService {
	
	RegionEntity queryObject(Long id);
	
	List<RegionEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RegionEntity region);
	
	void update(RegionEntity region);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
