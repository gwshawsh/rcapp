package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.CheckinmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 考勤表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-08-21 11:41:41
 */
public interface CheckinmainService {
	
	CheckinmainEntity queryObject(Long id);
	
	List<CheckinmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(CheckinmainEntity checkinmain);
	
	void update(CheckinmainEntity checkinmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
