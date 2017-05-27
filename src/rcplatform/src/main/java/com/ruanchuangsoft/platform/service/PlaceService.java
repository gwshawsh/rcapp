package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.PlaceEntity;

import java.util.List;
import java.util.Map;

/**
 * 港口基础信息表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-27 20:02:48
 */
public interface PlaceService {
	
	PlaceEntity queryObject(Long id);
	
	List<PlaceEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PlaceEntity place);
	
	void update(PlaceEntity place);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
