package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.DriversDao;
import com.ruanchuangsoft.platform.entity.DriversEntity;
import com.ruanchuangsoft.platform.service.DriversService;
import org.springframework.transaction.annotation.Transactional;


@Service("driversService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class DriversServiceImpl implements DriversService {
	@Autowired
	private DriversDao driversDao;
	
	@Override
	public DriversEntity queryObject(Long id){
		return driversDao.queryObject(id);
	}
	
	@Override
	public List<DriversEntity> queryList(Map<String, Object> map){
		return driversDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return driversDao.queryTotal(map);
	}
	
	@Override
	public void save(DriversEntity drivers){
		driversDao.save(drivers);
	}
	
	@Override
	public void update(DriversEntity drivers){
		driversDao.update(drivers);
	}
	
	@Override
	public void delete(Long id){
		driversDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		driversDao.deleteBatch(ids);
	}
	
}
