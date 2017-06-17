package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BankaccountDao;
import com.ruanchuangsoft.platform.entity.BankaccountEntity;
import com.ruanchuangsoft.platform.service.BankaccountService;
import org.springframework.transaction.annotation.Transactional;


@Service("bankaccountService")
public class BankaccountServiceImpl implements BankaccountService {
	@Autowired
	private BankaccountDao bankaccountDao;
	
	@Override
	public BankaccountEntity queryObject(Long id){
		return bankaccountDao.queryObject(id);
	}
	
	@Override
	public List<BankaccountEntity> queryList(Map<String, Object> map){
		return bankaccountDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return bankaccountDao.queryTotal(map);
	}
	
	@Override
	public void save(BankaccountEntity bankaccount){
		bankaccountDao.save(bankaccount);
	}
	
	@Override
	public void update(BankaccountEntity bankaccount){
		bankaccountDao.update(bankaccount);
	}
	
	@Override
	public void delete(Long id){
		bankaccountDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		bankaccountDao.deleteBatch(ids);
	}
	
}
