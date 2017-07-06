package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.ExpensemainEntity;

import java.util.List;
import java.util.Map;

/**
 * 报销单
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 13:56:56
 */
public interface ExpensemainService {
	
	ExpensemainEntity queryObject(Long id);
	
	List<ExpensemainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ExpensemainEntity expensemain);
	
	void update(ExpensemainEntity expensemain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
