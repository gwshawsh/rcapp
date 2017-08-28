package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.LeaveworkmainDao;
import com.ruanchuangsoft.platform.entity.LeaveworkmainEntity;
import com.ruanchuangsoft.platform.service.LeaveworkmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("leaveworkmainService")
public class LeaveworkmainServiceImpl implements LeaveworkmainService {
	@Autowired
	private LeaveworkmainDao leaveworkmainDao;
	
	@Override
	public LeaveworkmainEntity queryObject(Long id){
		return leaveworkmainDao.queryObject(id);
	}
	
	@Override
	public List<LeaveworkmainEntity> queryList(Map<String, Object> map){
		return leaveworkmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return leaveworkmainDao.queryTotal(map);
	}
	
	@Override
	public void save(LeaveworkmainEntity leaveworkmain){
		leaveworkmainDao.save(leaveworkmain);
	}
	
	@Override
	public void update(LeaveworkmainEntity leaveworkmain){
		leaveworkmainDao.update(leaveworkmain);
	}
	
	@Override
	public void delete(Long id){
		leaveworkmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		leaveworkmainDao.deleteBatch(ids);
	}
	
}
