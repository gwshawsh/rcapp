package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.ExpenseDao;
import com.ruanchuangsoft.platform.entity.ExpenseEntity;
import com.ruanchuangsoft.platform.service.ExpenseService;
import org.springframework.transaction.annotation.Transactional;


@Service("expenseService")
public class ExpenseServiceImpl implements ExpenseService {
	@Autowired
	private ExpenseDao expenseDao;
	
	@Override
	public ExpenseEntity queryObject(Long id){
		return expenseDao.queryObject(id);
	}
	
	@Override
	public List<ExpenseEntity> queryList(Map<String, Object> map){
		return expenseDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return expenseDao.queryTotal(map);
	}
	
	@Override
	public void save(ExpenseEntity expense){
		expenseDao.save(expense);
	}
	
	@Override
	public void update(ExpenseEntity expense){
		expenseDao.update(expense);
	}
	
	@Override
	public void delete(Long id){
		expenseDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		expenseDao.deleteBatch(ids);
	}
	
}
