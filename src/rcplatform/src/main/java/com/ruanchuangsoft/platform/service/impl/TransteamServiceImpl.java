package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.TransteamDao;
import com.ruanchuangsoft.platform.entity.TransteamEntity;
import com.ruanchuangsoft.platform.service.TransteamService;



@Service("transteamService")
public class TransteamServiceImpl implements TransteamService {
	@Autowired
	private TransteamDao transteamDao;
	
	@Override
	public TransteamEntity queryObject(Long id){
		return transteamDao.queryObject(id);
	}
	
	@Override
	public List<TransteamEntity> queryList(Map<String, Object> map){
		return transteamDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return transteamDao.queryTotal(map);
	}
	
	@Override
	public void save(TransteamEntity transteam){
		transteamDao.save(transteam);
	}
	
	@Override
	public void update(TransteamEntity transteam){
		transteamDao.update(transteam);
	}
	
	@Override
	public void delete(Long id){
		transteamDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		transteamDao.deleteBatch(ids);
	}
	
}
