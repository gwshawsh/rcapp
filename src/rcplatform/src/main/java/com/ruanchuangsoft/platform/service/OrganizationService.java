package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.OrganizationEntity;

import java.util.List;
import java.util.Map;

/**
 * 组织管理
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-30 13:33:00
 */
public interface OrganizationService {
	
	OrganizationEntity queryObject(Long id);
	
	List<OrganizationEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(OrganizationEntity organization);
	
	void update(OrganizationEntity organization);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
