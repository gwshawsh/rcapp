package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.PreemptymainEntity;

import java.util.List;
import java.util.Map;

/**
 * 预约用箱
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 09:03:59
 */
public interface PreemptymainService {
	
	PreemptymainEntity queryObject(Long id);
	
	List<PreemptymainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(PreemptymainEntity preemptymain);
	
	void update(PreemptymainEntity preemptymain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
