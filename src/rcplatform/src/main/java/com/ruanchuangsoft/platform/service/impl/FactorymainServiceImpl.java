package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.FactorymainDao;
import com.ruanchuangsoft.platform.entity.FactorymainEntity;
import com.ruanchuangsoft.platform.service.FactorymainService;
import org.springframework.transaction.annotation.Transactional;


@Service("factorymainService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class FactorymainServiceImpl implements FactorymainService {
	@Autowired
	private FactorymainDao factorymainDao;
	
	@Override
	public FactorymainEntity queryObject(Long id){
		return factorymainDao.queryObject(id);
	}
	
	@Override
	public List<FactorymainEntity> queryList(Map<String, Object> map){
		return factorymainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return factorymainDao.queryTotal(map);
	}
	
	@Override
	public void save(FactorymainEntity factorymain){
		factorymainDao.save(factorymain);
	}
	
	@Override
	public void update(FactorymainEntity factorymain){
		factorymainDao.update(factorymain);
	}
	
	@Override
	public void delete(Long id){
		factorymainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		factorymainDao.deleteBatch(ids);
	}
	
}
