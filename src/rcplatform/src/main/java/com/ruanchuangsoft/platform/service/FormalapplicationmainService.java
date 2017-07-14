package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.FormalapplicationmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 转正申请
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-14 13:36:29
 */
public interface FormalapplicationmainService {
	
	FormalapplicationmainEntity queryObject(Long id);
	
	List<FormalapplicationmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(FormalapplicationmainEntity formalapplicationmain);
	
	void update(FormalapplicationmainEntity formalapplicationmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
