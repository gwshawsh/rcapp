package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.ExpenseEntity;

import java.util.List;
import java.util.Map;

/**
 * 报销单
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 17:01:14
 */
public interface ExpenseService {
	
	ExpenseEntity queryObject(Long id);
	
	List<ExpenseEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(ExpenseEntity expense);
	
	void update(ExpenseEntity expense);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
