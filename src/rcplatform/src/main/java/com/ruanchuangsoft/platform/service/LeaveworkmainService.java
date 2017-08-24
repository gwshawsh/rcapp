package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.LeaveworkmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 请假单
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-08-24 09:00:21
 */
public interface LeaveworkmainService {
	
	LeaveworkmainEntity queryObject(Long id);
	
	List<LeaveworkmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(LeaveworkmainEntity leaveworkmain);
	
	void update(LeaveworkmainEntity leaveworkmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
