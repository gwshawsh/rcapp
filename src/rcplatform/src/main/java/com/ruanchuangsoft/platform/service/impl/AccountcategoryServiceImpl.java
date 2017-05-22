package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.AccountcategoryDao;
import com.ruanchuangsoft.platform.entity.AccountcategoryEntity;
import com.ruanchuangsoft.platform.service.AccountcategoryService;



@Service("accountcategoryService")
public class AccountcategoryServiceImpl implements AccountcategoryService {
	@Autowired
	private AccountcategoryDao accountcategoryDao;
	
	@Override
	public AccountcategoryEntity queryObject(Long id){
		return accountcategoryDao.queryObject(id);
	}
	
	@Override
	public List<AccountcategoryEntity> queryList(Map<String, Object> map){
		return accountcategoryDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return accountcategoryDao.queryTotal(map);
	}
	
	@Override
	public void save(AccountcategoryEntity accountcategory){
		accountcategoryDao.save(accountcategory);
	}
	
	@Override
	public void update(AccountcategoryEntity accountcategory){
		accountcategoryDao.update(accountcategory);
	}
	
	@Override
	public void delete(Long id){
		accountcategoryDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		accountcategoryDao.deleteBatch(ids);
	}
	
}
