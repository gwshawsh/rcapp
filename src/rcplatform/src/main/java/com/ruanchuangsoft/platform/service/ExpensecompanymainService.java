package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.ExpensecompanymainEntity;

import java.util.List;
import java.util.Map;

/**
 * 公司费用
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-07-06 12:31:44
 */
public interface ExpensecompanymainService {
	
	ExpensecompanymainEntity queryObject(Long id);
	
	List<ExpensecompanymainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ExpensecompanymainEntity expensecompanymain);
	
	void update(ExpensecompanymainEntity expensecompanymain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
