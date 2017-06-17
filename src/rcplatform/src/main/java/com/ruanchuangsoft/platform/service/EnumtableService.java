package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.EnumtableEntity;

import java.util.List;
import java.util.Map;

/**
 * 枚举表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-16 19:00:00
 */
public interface EnumtableService {
	
	EnumtableEntity queryObject(Long id);
	
	List<EnumtableEntity> queryList(Map<String, Object> map);


	int queryTotal(Map<String, Object> map);
	
	void save(EnumtableEntity enumtable);
	
	void update(EnumtableEntity enumtable);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
