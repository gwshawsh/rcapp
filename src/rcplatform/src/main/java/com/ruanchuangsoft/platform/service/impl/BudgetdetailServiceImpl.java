package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BudgetdetailDao;
import com.ruanchuangsoft.platform.entity.BudgetdetailEntity;
import com.ruanchuangsoft.platform.service.BudgetdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("budgetdetailService")
public class BudgetdetailServiceImpl implements BudgetdetailService {
	@Autowired
	private BudgetdetailDao budgetdetailDao;
	
	@Override
	public BudgetdetailEntity queryObject(Long id){
		return budgetdetailDao.queryObject(id);
	}
	
	@Override
	public List<BudgetdetailEntity> queryList(Map<String, Object> map){
		return budgetdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return budgetdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(BudgetdetailEntity budgetdetail){
		budgetdetailDao.save(budgetdetail);
	}
	
	@Override
	public void update(BudgetdetailEntity budgetdetail){
		budgetdetailDao.update(budgetdetail);
	}
	
	@Override
	public void delete(Long id){
		budgetdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		budgetdetailDao.deleteBatch(ids);
	}
	
}
