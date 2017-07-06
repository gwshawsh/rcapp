package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.DepatureapplicationmainDao;
import com.ruanchuangsoft.platform.entity.DepatureapplicationmainEntity;
import com.ruanchuangsoft.platform.service.DepatureapplicationmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("depatureapplicationmainService")
public class DepatureapplicationmainServiceImpl implements DepatureapplicationmainService {
	@Autowired
	private DepatureapplicationmainDao depatureapplicationmainDao;
	
	@Override
	public DepatureapplicationmainEntity queryObject(Long id){
		return depatureapplicationmainDao.queryObject(id);
	}
	
	@Override
	public List<DepatureapplicationmainEntity> queryList(Map<String, Object> map){
		return depatureapplicationmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return depatureapplicationmainDao.queryTotal(map);
	}
	
	@Override
	public void save(DepatureapplicationmainEntity depatureapplicationmain){
		depatureapplicationmainDao.save(depatureapplicationmain);
	}
	
	@Override
	public void update(DepatureapplicationmainEntity depatureapplicationmain){
		depatureapplicationmainDao.update(depatureapplicationmain);
	}
	
	@Override
	public void delete(Long id){
		depatureapplicationmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		depatureapplicationmainDao.deleteBatch(ids);
	}
	
}
