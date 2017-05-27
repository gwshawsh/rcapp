package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.StoreDao;
import com.ruanchuangsoft.platform.entity.StoreEntity;
import com.ruanchuangsoft.platform.service.StoreService;
import org.springframework.transaction.annotation.Transactional;


@Service("storeService")
@Transactional(rollbackFor = {RuntimeException.class,Exception.class})
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreDao storeDao;
	
	@Override
	public StoreEntity queryObject(Long id){
		return storeDao.queryObject(id);
	}
	
	@Override
	public List<StoreEntity> queryList(Map<String, Object> map){
		return storeDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return storeDao.queryTotal(map);
	}
	
	@Override
	public void save(StoreEntity store){
		storeDao.save(store);
	}
	
	@Override
	public void update(StoreEntity store){
		storeDao.update(store);
	}
	
	@Override
	public void delete(Long id){
		storeDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		storeDao.deleteBatch(ids);
	}
	
}
