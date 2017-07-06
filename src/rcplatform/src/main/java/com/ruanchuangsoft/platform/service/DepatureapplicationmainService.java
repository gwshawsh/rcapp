package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.DepatureapplicationmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 离职申请
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
public interface DepatureapplicationmainService {
	
	DepatureapplicationmainEntity queryObject(Long id);
	
	List<DepatureapplicationmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(DepatureapplicationmainEntity depatureapplicationmain);
	
	void update(DepatureapplicationmainEntity depatureapplicationmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
