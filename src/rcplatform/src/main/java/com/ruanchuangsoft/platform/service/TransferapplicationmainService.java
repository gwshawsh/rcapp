package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TransferapplicationmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 调岗申请
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
public interface TransferapplicationmainService {
	
	TransferapplicationmainEntity queryObject(Long id);
	
	List<TransferapplicationmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TransferapplicationmainEntity transferapplicationmain);
	
	void update(TransferapplicationmainEntity transferapplicationmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
