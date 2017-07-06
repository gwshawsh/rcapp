package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.EntryapplicationmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 入职申请
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 17:23:20
 */
public interface EntryapplicationmainService {
	
	EntryapplicationmainEntity queryObject(Long id);
	
	List<EntryapplicationmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(EntryapplicationmainEntity entryapplicationmain);
	
	void update(EntryapplicationmainEntity entryapplicationmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
