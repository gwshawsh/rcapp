package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.StorecontractdetailDao;
import com.ruanchuangsoft.platform.entity.StorecontractdetailEntity;
import com.ruanchuangsoft.platform.service.StorecontractdetailService;
import org.springframework.transaction.annotation.Transactional;


@Service("storecontractdetailService")
public class StorecontractdetailServiceImpl implements StorecontractdetailService {
	@Autowired
	private StorecontractdetailDao storecontractdetailDao;
	
	@Override
	public StorecontractdetailEntity queryObject(Long id){
		return storecontractdetailDao.queryObject(id);
	}
	
	@Override
	public List<StorecontractdetailEntity> queryList(Map<String, Object> map){
		return storecontractdetailDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return storecontractdetailDao.queryTotal(map);
	}
	
	@Override
	public void save(StorecontractdetailEntity storecontractdetail){
		storecontractdetailDao.save(storecontractdetail);
	}
	
	@Override
	public void update(StorecontractdetailEntity storecontractdetail){
		storecontractdetailDao.update(storecontractdetail);
	}
	
	@Override
	public void delete(Long id){
		storecontractdetailDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		storecontractdetailDao.deleteBatch(ids);
	}
	
}
