package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.FactorymainEntity;

import java.util.List;
import java.util.Map;

/**
 * 门点计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 23:21:01
 */
public interface FactorymainService {
	
	FactorymainEntity queryObject(Long id);
	
	List<FactorymainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(FactorymainEntity factorymain);
	
	void update(FactorymainEntity factorymain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
