package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.RenewapplicationmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 续签申请
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
public interface RenewapplicationmainService {
	
	RenewapplicationmainEntity queryObject(Long id);
	
	List<RenewapplicationmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(RenewapplicationmainEntity renewapplicationmain);
	
	void update(RenewapplicationmainEntity renewapplicationmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
