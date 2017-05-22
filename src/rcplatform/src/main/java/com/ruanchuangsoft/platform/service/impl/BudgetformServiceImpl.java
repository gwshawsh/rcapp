package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BudgetformDao;
import com.ruanchuangsoft.platform.entity.BudgetformEntity;
import com.ruanchuangsoft.platform.service.BudgetformService;



@Service("budgetformService")
public class BudgetformServiceImpl implements BudgetformService {
	@Autowired
	private BudgetformDao budgetformDao;
	
	@Override
	public BudgetformEntity queryObject(Long id){
		return budgetformDao.queryObject(id);
	}
	
	@Override
	public List<BudgetformEntity> queryList(Map<String, Object> map){
		return budgetformDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return budgetformDao.queryTotal(map);
	}
	
	@Override
	public void save(BudgetformEntity budgetform){
		budgetformDao.save(budgetform);
	}
	
	@Override
	public void update(BudgetformEntity budgetform){
		budgetformDao.update(budgetform);
	}
	
	@Override
	public void delete(Long id){
		budgetformDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		budgetformDao.deleteBatch(ids);
	}
	
}
