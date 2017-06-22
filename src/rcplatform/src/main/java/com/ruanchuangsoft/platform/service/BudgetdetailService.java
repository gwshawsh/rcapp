package com.ruanchuangsoft.platform.service;

import com.ruanchuangsoft.platform.entity.BudgetdetailEntity;

import java.util.List;
import java.util.Map;

/**
 * 预算明细表
 * 
 * @author lidongfeng
 * @email lidongfeng78@qq.com
 * @date 2017-06-22 15:45:16
 */
public interface BudgetdetailService {
	
	BudgetdetailEntity queryObject(Long id);
	
	List<BudgetdetailEntity> queryList(Map<String, Object> map);
	
	int queryTotal(Map<String, Object> map);
	
	void save(BudgetdetailEntity budgetdetail);
	
	void update(BudgetdetailEntity budgetdetail);
	
	void delete(Long id);
	
	void deleteBatch(Long[] ids);
}
