package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TransferapplicationmainDao;
import com.ruanchuangsoft.platform.entity.TransferapplicationmainEntity;
import com.ruanchuangsoft.platform.service.TransferapplicationmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("transferapplicationmainService")
public class TransferapplicationmainServiceImpl implements TransferapplicationmainService {
	@Autowired
	private TransferapplicationmainDao transferapplicationmainDao;
	
	@Override
	public TransferapplicationmainEntity queryObject(Long id){
		return transferapplicationmainDao.queryObject(id);
	}
	
	@Override
	public List<TransferapplicationmainEntity> queryList(Map<String, Object> map){
		return transferapplicationmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return transferapplicationmainDao.queryTotal(map);
	}
	
	@Override
	public void save(TransferapplicationmainEntity transferapplicationmain){
		transferapplicationmainDao.save(transferapplicationmain);
	}
	
	@Override
	public void update(TransferapplicationmainEntity transferapplicationmain){
		transferapplicationmainDao.update(transferapplicationmain);
	}
	
	@Override
	public void delete(Long id){
		transferapplicationmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		transferapplicationmainDao.deleteBatch(ids);
	}
	
}
