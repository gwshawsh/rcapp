package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BudgetformEntity;

import java.util.List;
import java.util.Map;

/**
 * 预算计划主表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-05-22 16:37:43
 */
public interface BudgetformService {
	
	BudgetformEntity queryObject(Long id);
	
	List<BudgetformEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BudgetformEntity budgetform) throws Exception;
	
	void update(BudgetformEntity budgetform);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
