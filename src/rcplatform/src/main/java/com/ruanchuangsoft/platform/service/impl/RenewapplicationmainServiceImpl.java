package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.RenewapplicationmainDao;
import com.ruanchuangsoft.platform.entity.RenewapplicationmainEntity;
import com.ruanchuangsoft.platform.service.RenewapplicationmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("renewapplicationmainService")
public class RenewapplicationmainServiceImpl implements RenewapplicationmainService {
	@Autowired
	private RenewapplicationmainDao renewapplicationmainDao;
	
	@Override
	public RenewapplicationmainEntity queryObject(Long id){
		return renewapplicationmainDao.queryObject(id);
	}
	
	@Override
	public List<RenewapplicationmainEntity> queryList(Map<String, Object> map){
		return renewapplicationmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return renewapplicationmainDao.queryTotal(map);
	}
	
	@Override
	public void save(RenewapplicationmainEntity renewapplicationmain){
		renewapplicationmainDao.save(renewapplicationmain);
	}
	
	@Override
	public void update(RenewapplicationmainEntity renewapplicationmain){
		renewapplicationmainDao.update(renewapplicationmain);
	}
	
	@Override
	public void delete(Long id){
		renewapplicationmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		renewapplicationmainDao.deleteBatch(ids);
	}
	
}
