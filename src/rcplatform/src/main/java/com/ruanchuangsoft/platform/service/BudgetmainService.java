package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BudgetmainEntity;

import java.util.List;
import java.util.Map;

/**
 * 预算计划主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:45:16
 */
public interface BudgetmainService {
	
	BudgetmainEntity queryObject(Long id);
	
	List<BudgetmainEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BudgetmainEntity budgetmain);
	
	void update(BudgetmainEntity budgetmain);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);

    void auditBatch(Long[] ids);

    void unauditBatch(Long[] ids);
}
