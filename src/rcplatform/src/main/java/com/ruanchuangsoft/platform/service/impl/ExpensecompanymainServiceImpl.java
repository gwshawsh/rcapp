package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.ExpensecompanymainDao;
import com.ruanchuangsoft.platform.entity.ExpensecompanymainEntity;
import com.ruanchuangsoft.platform.service.ExpensecompanymainService;
import org.springframework.transaction.annotation.Transactional;


@Service("expensecompanymainService")
public class ExpensecompanymainServiceImpl implements ExpensecompanymainService {
	@Autowired
	private ExpensecompanymainDao expensecompanymainDao;
	
	@Override
	public ExpensecompanymainEntity queryObject(Long id){
		return expensecompanymainDao.queryObject(id);
	}
	
	@Override
	public List<ExpensecompanymainEntity> queryList(Map<String, Object> map){
		return expensecompanymainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return expensecompanymainDao.queryTotal(map);
	}
	
	@Override
	public void save(ExpensecompanymainEntity expensecompanymain){
		expensecompanymainDao.save(expensecompanymain);
	}
	
	@Override
	public void update(ExpensecompanymainEntity expensecompanymain){
		expensecompanymainDao.update(expensecompanymain);
	}
	
	@Override
	public void delete(Long id){
		expensecompanymainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		expensecompanymainDao.deleteBatch(ids);
	}
	
}
