package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.FactoryDao;
import com.ruanchuangsoft.platform.entity.FactoryEntity;
import com.ruanchuangsoft.platform.service.FactoryService;
import org.springframework.transaction.annotation.Transactional;


@Service("factoryService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class FactoryServiceImpl implements FactoryService {
	@Autowired
	private FactoryDao factoryDao;
	
	@Override
	public FactoryEntity queryObject(Long id){
		return factoryDao.queryObject(id);
	}
	
	@Override
	public List<FactoryEntity> queryList(Map<String, Object> map){
		return factoryDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return factoryDao.queryTotal(map);
	}
	
	@Override
	public void save(FactoryEntity factory){
		factoryDao.save(factory);
	}
	
	@Override
	public void update(FactoryEntity factory){
		factoryDao.update(factory);
	}
	
	@Override
	public void delete(Long id){
		factoryDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		factoryDao.deleteBatch(ids);
	}
	
}
