package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.EmptymainEntity;

import java.util.List;
import java.util.Map;

/**
 * 空箱计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-20 23:21:01
 */
public interface EmptymainService {
	
	EmptymainEntity queryObject(Long id);
	
	List<EmptymainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(EmptymainEntity emptymain);
	
	void update(EmptymainEntity emptymain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
