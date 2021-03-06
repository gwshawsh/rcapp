package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.CheckinmainDao;
import com.ruanchuangsoft.platform.entity.CheckinmainEntity;
import com.ruanchuangsoft.platform.service.CheckinmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("checkinmainService")
public class CheckinmainServiceImpl implements CheckinmainService {
	@Autowired
	private CheckinmainDao checkinmainDao;
	
	@Override
	public CheckinmainEntity queryObject(Long id){
		return checkinmainDao.queryObject(id);
	}
	
	@Override
	public List<CheckinmainEntity> queryList(Map<String, Object> map){
		return checkinmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return checkinmainDao.queryTotal(map);
	}
	
	@Override
	public void save(CheckinmainEntity checkinmain){
		checkinmainDao.save(checkinmain);
	}
	
	@Override
	public void update(CheckinmainEntity checkinmain){
		checkinmainDao.update(checkinmain);
	}
	
	@Override
	public void delete(Long id){
		checkinmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		checkinmainDao.deleteBatch(ids);
	}
	
}
