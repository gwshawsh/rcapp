package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TranscostingDao;
import com.ruanchuangsoft.platform.entity.TranscostingEntity;
import com.ruanchuangsoft.platform.service.TranscostingService;
import org.springframework.transaction.annotation.Transactional;


@Service("transcostingService")
public class TranscostingServiceImpl implements TranscostingService {
	@Autowired
	private TranscostingDao transcostingDao;
	
	@Override
	public TranscostingEntity queryObject(Long id){
		return transcostingDao.queryObject(id);
	}
	
	@Override
	public List<TranscostingEntity> queryList(Map<String, Object> map){
		return transcostingDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return transcostingDao.queryTotal(map);
	}
	
	@Override
	public void save(TranscostingEntity transcosting){
		transcostingDao.save(transcosting);
	}
	
	@Override
	public void update(TranscostingEntity transcosting){
		transcostingDao.update(transcosting);
	}
	
	@Override
	public void delete(Long id){
		transcostingDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		transcostingDao.deleteBatch(ids);
	}
	
}
