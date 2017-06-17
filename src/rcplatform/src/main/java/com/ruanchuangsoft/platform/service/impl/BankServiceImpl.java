package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BankDao;
import com.ruanchuangsoft.platform.entity.BankEntity;
import com.ruanchuangsoft.platform.service.BankService;
import org.springframework.transaction.annotation.Transactional;


@Service("bankService")
public class BankServiceImpl implements BankService {
	@Autowired
	private BankDao bankDao;
	
	@Override
	public BankEntity queryObject(Long id){
		return bankDao.queryObject(id);
	}
	
	@Override
	public List<BankEntity> queryList(Map<String, Object> map){
		return bankDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return bankDao.queryTotal(map);
	}
	
	@Override
	public void save(BankEntity bank){
		bankDao.save(bank);
	}
	
	@Override
	public void update(BankEntity bank){
		bankDao.update(bank);
	}
	
	@Override
	public void delete(Long id){
		bankDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		bankDao.deleteBatch(ids);
	}
	
}
