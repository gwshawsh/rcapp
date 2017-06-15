package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.StorecontractmainDao;
import com.ruanchuangsoft.platform.entity.StorecontractmainEntity;
import com.ruanchuangsoft.platform.service.StorecontractmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("storecontractmainService")
public class StorecontractmainServiceImpl implements StorecontractmainService {
	@Autowired
	private StorecontractmainDao storecontractmainDao;
	
	@Override
	public StorecontractmainEntity queryObject(Long id){
		return storecontractmainDao.queryObject(id);
	}
	
	@Override
	public List<StorecontractmainEntity> queryList(Map<String, Object> map){
		return storecontractmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return storecontractmainDao.queryTotal(map);
	}
	
	@Override
	public void save(StorecontractmainEntity storecontractmain){
		storecontractmainDao.save(storecontractmain);
	}
	
	@Override
	public void update(StorecontractmainEntity storecontractmain){
		storecontractmainDao.update(storecontractmain);
	}
	
	@Override
	public void delete(Long id){
		storecontractmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		storecontractmainDao.deleteBatch(ids);
	}
	
}
