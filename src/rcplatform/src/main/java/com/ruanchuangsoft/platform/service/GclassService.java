package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.GclassEntity;

import java.util.List;
import java.util.Map;

/**
 * 品类表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-09 18:39:54
 */
public interface GclassService {
	
	GclassEntity queryObject(Long id);
	
	List<GclassEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(GclassEntity gclass);
	
	void update(GclassEntity gclass);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
