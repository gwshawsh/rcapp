package com.ruanchuangsoft.platform.service.impl;

import com.ruanchuangsoft.platform.dao.TransboxdetailDao;
import com.ruanchuangsoft.platform.entity.TransboxdetailEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TransboxmainDao;
import com.ruanchuangsoft.platform.entity.TransboxmainEntity;
import com.ruanchuangsoft.platform.service.TransboxmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("transboxmainService")
public class TransboxmainServiceImpl implements TransboxmainService {
	@Autowired
	private TransboxmainDao transboxmainDao;
	@Autowired
	private TransboxdetailDao transboxdetailDao;
	
	@Override
	public TransboxmainEntity queryObject(Long id){
		return transboxmainDao.queryObject(id);
	}
	
	@Override
	public List<TransboxmainEntity> queryList(Map<String, Object> map){
		return transboxmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return transboxmainDao.queryTotal(map);
	}
	
	@Override
	public void save(TransboxmainEntity transboxmain){
		transboxmainDao.save(transboxmain);
		for(TransboxdetailEntity item:transboxmain.getDetails()){
			transboxdetailDao.save(item);
		}
	}
	
	@Override
	public void update(TransboxmainEntity transboxmain){
		transboxmainDao.update(transboxmain);

	}
	
	@Override
	public void delete(Long id){
		transboxmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		transboxmainDao.deleteBatch(ids);
	}
	
}
