package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TransboxmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 运输计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-30 23:44:01
 */
public interface TransboxmainService {
	
	TransboxmainEntity queryObject(Long id);
	
	List<TransboxmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TransboxmainEntity transboxmain);
	
	void update(TransboxmainEntity transboxmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
