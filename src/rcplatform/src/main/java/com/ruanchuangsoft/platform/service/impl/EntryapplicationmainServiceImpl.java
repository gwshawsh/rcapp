package com.ruanchuangsoft.platform.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

import com.ruanchuangsoft.platform.dao.EntryapplicationmainDao;
import com.ruanchuangsoft.platform.entity.EntryapplicationmainEntity;
import com.ruanchuangsoft.platform.service.EntryapplicationmainService;
import org.springframework.transaction.annotation.Transactional;


@Service("entryapplicationmainService")
public class EntryapplicationmainServiceImpl implements EntryapplicationmainService {
	@Autowired
	private EntryapplicationmainDao entryapplicationmainDao;
	
	@Override
	public EntryapplicationmainEntity queryObject(Long id){
		return entryapplicationmainDao.queryObject(id);
	}
	
	@Override
	public List<EntryapplicationmainEntity> queryList(Map<String, Object> map){
		return entryapplicationmainDao.queryList(map);
	}
	
	@Override
	public int queryTotal(Map<String, Object> map){
		return entryapplicationmainDao.queryTotal(map);
	}
	
	@Override
	public void save(EntryapplicationmainEntity entryapplicationmain){
		entryapplicationmainDao.save(entryapplicationmain);
	}
	
	@Override
	public void update(EntryapplicationmainEntity entryapplicationmain){
		entryapplicationmainDao.update(entryapplicationmain);
	}
	
	@Override
	public void delete(Long id){
		entryapplicationmainDao.delete(id);
	}
	
	@Override
	public void deleteBatch(Long[] ids){
		entryapplicationmainDao.deleteBatch(ids);
	}
	
}
