package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.LeaveportmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 疏港计划
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:03:59
 */
public interface LeaveportmainService {
	
	LeaveportmainEntity queryObject(Long id);
	
	List<LeaveportmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(LeaveportmainEntity leaveportmain);
	
	void update(LeaveportmainEntity leaveportmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
