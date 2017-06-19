package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.HeavymainEntity;

import java.util.List;
import java.util.Map;

/**
 * 重箱计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-19 23:53:29
 */
public interface HeavymainService {
	
	HeavymainEntity queryObject(Long id);
	
	List<HeavymainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(HeavymainEntity heavymain);
	
	void update(HeavymainEntity heavymain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
