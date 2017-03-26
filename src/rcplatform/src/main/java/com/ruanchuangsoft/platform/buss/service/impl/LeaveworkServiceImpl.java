package com.ruanchuangsoft.platform.buss.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.system.dao.LeaveworkDao;
import com.ruanchuangsoft.platform.system.entity.LeaveworkEntity;
import com.ruanchuangsoft.platform.buss.service.LeaveworkService;



@Service("leaveworkService")
public class LeaveworkServiceImpl implements LeaveworkService {
	@Autowired
	private LeaveworkDao leaveworkDao;
	
	@Override
	public LeaveworkEntity queryObject(Long leaveId){
		return leaveworkDao.queryObject(leaveId);
	}
	
	@Override
	public List<LeaveworkEntity> queryList(Map<String, Object> map){
		return leaveworkDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return leaveworkDao.queryTotal(map);
	}
	
	@Override
	public void save(LeaveworkEntity leavework){
		leaveworkDao.save(leavework);
	}
	
	@Override
	public void update(LeaveworkEntity leavework){
		leaveworkDao.update(leavework);
	}
	
	@Override
	public void delete(Long leaveId){
		leaveworkDao.delete(leaveId);
	}
	
	@Override
	public void deleteBatch(Long[] leaveIds){
		leaveworkDao.deleteBatch(leaveIds);
	}
	
}
