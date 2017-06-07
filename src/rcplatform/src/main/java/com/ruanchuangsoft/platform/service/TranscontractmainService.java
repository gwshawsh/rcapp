package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.TranscontractmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 运输合同
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-07 15:52:16
 */
public interface TranscontractmainService {
	
	TranscontractmainEntity queryObject(Long id);
	
	List<TranscontractmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(TranscontractmainEntity transcontractmain);
	
	void update(TranscontractmainEntity transcontractmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
