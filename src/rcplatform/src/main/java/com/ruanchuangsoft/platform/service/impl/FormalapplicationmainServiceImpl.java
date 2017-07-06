package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.FormalapplicationmainDao;
import com.ruanchuangsoft.platform.entity.FormalapplicationmainEntity;
import com.ruanchuangsoft.platform.service.FormalapplicationmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("formalapplicationmainService")
public class FormalapplicationmainServiceImpl implements FormalapplicationmainService {
	@Autowired
	private FormalapplicationmainDao formalapplicationmainDao;
	
	@Override
	public FormalapplicationmainEntity queryObject(Long id){
		return formalapplicationmainDao.queryObject(id);
	}
	
	@Override
	public List<FormalapplicationmainEntity> queryList(Map<String, Object> map){
		return formalapplicationmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return formalapplicationmainDao.queryTotal(map);
	}
	
	@Override
	public void save(FormalapplicationmainEntity formalapplicationmain){
		formalapplicationmainDao.save(formalapplicationmain);
	}
	
	@Override
	public void update(FormalapplicationmainEntity formalapplicationmain){
		formalapplicationmainDao.update(formalapplicationmain);
	}
	
	@Override
	public void delete(Long id){
		formalapplicationmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		formalapplicationmainDao.deleteBatch(ids);
	}
	
}
