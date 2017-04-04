package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.LeaveworkEntity;

import java.util.List;
import java.util.Map;

/**
 * 请假表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-03-26 17:42:15
 */
public interface LeaveworkService {
	
	LeaveworkEntity queryObject(Long leaveId);
	
	List<LeaveworkEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(LeaveworkEntity leavework);
	
	void update(LeaveworkEntity leavework);
	
	void delete(Long leaveId);
	
	void deleteBatch(Long[] leaveIds);
}
