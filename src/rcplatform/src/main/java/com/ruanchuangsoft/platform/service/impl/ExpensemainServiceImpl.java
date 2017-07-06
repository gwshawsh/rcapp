package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.ExpensemainDao;
import com.ruanchuangsoft.platform.entity.ExpensemainEntity;
import com.ruanchuangsoft.platform.service.ExpensemainService;
import org.springframework.transaction.annotation.Transactional;


@Service("expensemainService")
public class ExpensemainServiceImpl implements ExpensemainService {
	@Autowired
	private ExpensemainDao expensemainDao;
	
	@Override
	public ExpensemainEntity queryObject(Long id){
		return expensemainDao.queryObject(id);
	}
	
	@Override
	public List<ExpensemainEntity> queryList(Map<String, Object> map){
		return expensemainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return expensemainDao.queryTotal(map);
	}
	
	@Override
	public void save(ExpensemainEntity expensemain){
		expensemainDao.save(expensemain);
	}
	
	@Override
	public void update(ExpensemainEntity expensemain){
		expensemainDao.update(expensemain);
	}
	
	@Override
	public void delete(Long id){
		expensemainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		expensemainDao.deleteBatch(ids);
	}
	
}
