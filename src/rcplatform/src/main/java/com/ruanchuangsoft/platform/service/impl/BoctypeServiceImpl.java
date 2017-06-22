package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.BoctypeDao;
import com.ruanchuangsoft.platform.entity.BoctypeEntity;
import com.ruanchuangsoft.platform.service.BoctypeService;
import org.springframework.transaction.annotation.Transactional;


@Service("boctypeService")
public class BoctypeServiceImpl implements BoctypeService {
	@Autowired
	private BoctypeDao boctypeDao;
	
	@Override
	public BoctypeEntity queryObject(Long id){
		return boctypeDao.queryObject(id);
	}
	
	@Override
	public List<BoctypeEntity> queryList(Map<String, Object> map){
		return boctypeDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return boctypeDao.queryTotal(map);
	}
	
	@Override
	public void save(BoctypeEntity boctype){
		boctypeDao.save(boctype);
	}
	
	@Override
	public void update(BoctypeEntity boctype){
		boctypeDao.update(boctype);
	}
	
	@Override
	public void delete(Long id){
		boctypeDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		boctypeDao.deleteBatch(ids);
	}
	
}
