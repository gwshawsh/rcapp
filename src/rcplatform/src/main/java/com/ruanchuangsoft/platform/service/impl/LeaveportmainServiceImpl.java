package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.LeaveportmainDao;
import com.ruanchuangsoft.platform.entity.LeaveportmainEntity;
import com.ruanchuangsoft.platform.service.LeaveportmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("leaveportmainService")
public class LeaveportmainServiceImpl implements LeaveportmainService {
	@Autowired
	private LeaveportmainDao leaveportmainDao;
	
	@Override
	public LeaveportmainEntity queryObject(Long id){
		return leaveportmainDao.queryObject(id);
	}
	
	@Override
	public List<LeaveportmainEntity> queryList(Map<String, Object> map){
		return leaveportmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return leaveportmainDao.queryTotal(map);
	}
	
	@Override
	public void save(LeaveportmainEntity leaveportmain){
		leaveportmainDao.save(leaveportmain);
	}
	
	@Override
	public void update(LeaveportmainEntity leaveportmain){
		leaveportmainDao.update(leaveportmain);
	}
	
	@Override
	public void delete(Long id){
		leaveportmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		leaveportmainDao.deleteBatch(ids);
	}
	
}
